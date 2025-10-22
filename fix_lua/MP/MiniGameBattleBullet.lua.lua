MiniGameBattleBullet = {}
local pairs = pairs

function MiniGameBattleBullet.InitLocalVar()
end

local BULLET_TYPE_ENUM = {NORMAL = 1, DIRECT_MOVE = 2}

function MiniGameBattleBullet.NewBullet(attackUnit, fromPos, toPos, bulletExtraParams)
  local bullet = {
    buffUidList = {}
  }
  
  function bullet:Init()
    self.skillId = bulletExtraParams.skillId
    self.skillConfig = TableData.GetConfig(self.skillId, "BaseShootSkill")
    self.camp = attackUnit.camp
    self.enemyCamp = attackUnit.enemyCamp
    self.totalMove = 0
    self.totalNeedMove = 2000
    self.bulletType = BULLET_TYPE_ENUM.DIRECT_MOVE
    self.coverRadiusR = bulletExtraParams and bulletExtraParams.range or 10
    self.buffUidList = {}
    self.cachedBuffEffect = {}
    if attackUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    self.hitSound = bulletExtraParams and bulletExtraParams.hitSound
    self.hurtBuffIdList = {}
    self.bulletEffect = self.skillConfig.bullet_effect
    self.bulletScale = (bulletExtraParams and bulletExtraParams.scale or 1) * (self.skillConfig.bullet_scale or 10000) / 10000
    self.bulletHitEffect = self.skillConfig.bullet_hit_effect
    self:CreateModel()
    self.position = SimpleCopy(fromPos)
    self.startPosition = fromPos
    self.endPosition = toPos
    self.hurtIndex = 0
    self.speed = self.skillConfig.bullet_speed // BATTLE_CONFIG_ENUM.FIXED_FPS
    self.speedV3 = {
      x = 0,
      y = 0,
      z = 0
    }
    if attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
      local dis = MathUtil.GetVector3Subtract(self.endPosition, self.position)
      local module = MathUtil.GetVector3Module(dis)
      if module > 0 then
        local ratio = self.speed / module
        self.speedV3 = {
          x = dis.x * ratio,
          y = dis.y * ratio,
          z = dis.z
        }
      end
    end
    self.hurtUidList = {}
    self.hurtCountMax = bulletExtraParams and bulletExtraParams.hurtMaxCount or 1
    self.inited = true
    self:UpdateModelPosition()
    self:UpdateDirection()
  end
  
  function bullet:UpdateDirection()
    if self.model then
      local direction = MathUtil.GetVector3Subtract(self.endPosition, self.startPosition)
      local transform = self.model.transform
      transform.right = Vector3(direction.x, direction.y, 0)
    end
  end
  
  function bullet:SetHurtBuff(idList)
    self.hurtBuffIdList = idList
  end
  
  function bullet:CreateModel()
    self.model = ResourceManager.Instantiate(self.bulletEffect)
    local scale = self.bulletScale
    BattleResourceManager:AddGameObject(self.model, 0, 0, 0, scale, scale, scale)
  end
  
  function bullet:IsTargetHit(unit)
    local targetPosition = unit.position
    if unit.coverRadiusR then
      local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(targetPosition, self.position))
      return dis <= unit.coverRadiusR + self.coverRadiusR
    end
    return false
  end
  
  function bullet:Update()
    if self.inited == false then
      if self.delayFrame then
        self.delayFrame = self.delayFrame - 1
        if self.delayFrame > 0 then
          return
        end
      end
      self:Init()
    end
    if self.isDestroy == true then
      return
    end
    self:DealMove()
  end
  
  function bullet:SetVisible(visible)
    if BattleMgr.isBattleServer == true then
      return
    end
    if self.visible ~= visible and self.model then
      self.model:SetActive(visible)
    end
    self.visible = visible
  end
  
  function bullet:GetHurtMonsterList()
    local unitList = {}
    local monsterList = MiniGameBattleScene.aliveMonsterList
    local monster
    for i = #monsterList, 1, -1 do
      monster = monsterList[i]
      if self.hurtUidList[monster.uid] == nil and self:IsTargetHit(monster) then
        table.insert(unitList, monster)
      end
    end
    return unitList
  end
  
  function bullet:DealMove()
    if attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
      self.position = MathUtil.GetVector3Add(self.position, self.speedV3)
      self.totalMove = self.totalMove + self.speed
      local attackUnitId = attackUnit.id
      local skillId = self.skillId
      local unitList = self:GetHurtMonsterList()
      if #unitList > 0 then
        for _, unit in ipairs(unitList) do
          self.hurtUidList[unit.uid] = 1
          self:DealHurt(unit)
          if unit:IsAlive() then
            for _, buffId in ipairs(self.hurtBuffIdList) do
              MiniGameBattleBuff.NewBuff(buffId, {
                unitUid = attackUnit.uid
              }, {
                unitUid = unit.uid
              }, true)
            end
          end
          if attackUnitId == MINI_GAME_SPECIAL_CARD.ANNISI and skillId == attackUnit.normalSkillId then
            local splitCount = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_PASSIVE_BULLET_SPLIT) + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_PASSIVE_BULLET_SPLIT_NUM)
            if splitCount > 0 then
              MiniGameBattleActionDisplay.PlaySound(70940053, unit.model)
              local angle = 180 / (splitCount + 1)
              for i = 1, splitCount do
                local position = {
                  x = 1,
                  y = math.tan((90 - angle * i) * math.pi / 180),
                  z = 0
                }
                local count = 1 + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_PASSIVE_BULLET_SPLIT_HIT_CROSS)
                local fromPosition = MathUtil.GetVector3Add(unit.position, unit.hitPosition)
                local splitBullet = MiniGameBattleSceneMgr.AddBullet(attackUnit, fromPosition, MathUtil.GetVector3Add(fromPosition, position), {
                  hitSound = self.hitSound,
                  hurtMaxCount = count,
                  skillId = attackUnit.passiveSkillId
                })
                splitBullet.hurtUidList[unit.uid] = 1
                splitBullet.hurtCountMax = splitBullet.hurtCountMax + 1
                local buffId = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_PASSIVE_BULLET_SPLIT_HURT_BUFF)
                if buffId > 0 then
                  splitBullet:SetHurtBuff({buffId})
                end
              end
            end
          elseif attackUnitId == MINI_GAME_SPECIAL_CARD.DINA and skillId == attackUnit.talentSkillId then
            MiniGameBattleActionDisplay.PlaySound(70940045, unit.model)
          elseif attackUnitId == MINI_GAME_SPECIAL_CARD.DINA and skillId == attackUnit.normalSkillId then
            local summonCardId = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_SUMMON)
            if summonCardId > 0 then
              local baseConfig = TableData.GetConfig(summonCardId, "BaseShootCard")
              local range = baseConfig.range + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_RANGE_ADD)
              local summonUnit = MiniGameBattleSceneMgr.AddUnit({
                id = summonCardId,
                position = unit.position,
                camp = BATTLE_CAMP_FLAG.LEFT,
                state = BATTLE_STATE_ENUM.START,
                summonFromUnitUid = attackUnit.uid,
                summonFromUnitId = attackUnit.id,
                range = range
              })
              table.insert(MiniGameBattleScene.cardSummonList, 1, summonUnit)
              MiniGameBattleBuff.NewBuff(78040212, {
                unitUid = attackUnit.uid
              }, {
                unitUid = summonUnit.uid
              }, true, {range = range})
            end
          elseif attackUnitId == MINI_GAME_SPECIAL_CARD.NILISHA and skillId == attackUnit.normalSkillId then
            if 1 == self.hurtIndex then
              local splitCount = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_PASSIVE_BULLET_SPLIT) + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_PASSIVE_BULLET_SPLIT_NUM)
              if splitCount > 0 then
                MiniGameBattleActionDisplay.PlaySound(70940033, unit.model)
                local angle
                local targetRangeAngle = {}
                if 0 == self.speedV3.y then
                  angle = 90
                  targetRangeAngle = {60, 120}
                else
                  angle = MathUtil.GetVector3Angle({
                    x = 0,
                    y = 1,
                    z = 0
                  }, self.speedV3)
                  if angle > 90 then
                    targetRangeAngle = {
                      angle - 30,
                      angle
                    }
                  else
                    targetRangeAngle = {
                      angle,
                      angle + 30
                    }
                  end
                end
                for i = 1, splitCount do
                  local position = {
                    x = 1,
                    y = math.tan((90 - MiniGameBattleMgr.GetRandomNum(targetRangeAngle[1], targetRangeAngle[2])) * math.pi / 180),
                    z = 0
                  }
                  local count = 9999
                  local fromPosition = MathUtil.GetVector3Add(unit.position, unit.hitPosition)
                  local splitBullet = MiniGameBattleSceneMgr.AddBullet(attackUnit, fromPosition, MathUtil.GetVector3Add(fromPosition, position), {
                    hitSound = self.hitSound,
                    hurtMaxCount = count,
                    skillId = attackUnit.passiveSkillId
                  })
                  splitBullet.hurtUidList[unit.uid] = 1
                  splitBullet.hurtCountMax = splitBullet.hurtCountMax + 1
                end
              end
            end
          elseif attackUnitId == MINI_GAME_SPECIAL_CARD.FEINISI and skillId == attackUnit.normalSkillId then
            local isContain, _, buffs = MiniGameBattleBuffMgr.GetBulletContainedEffect(self, MINI_GAME_BUFF_EFFECT_ID.FEINISI_NORMAL_CATAPULT, true)
            if isContain then
              local tempBuff = buffs[1]
              tempBuff:AddTargetUid(unit.uid)
              self:RemoveBuff(tempBuff.uid)
              local nearUnitList = MiniGameBattleChoose.GetNearestMonsterForCenterUnit(unit, 20)
              local nextUnit
              for i = 1, #nearUnitList do
                if tempBuff:IsAlreadyInTarget(nearUnitList[i].uid) == false then
                  nextUnit = nearUnitList[i]
                  break
                end
              end
              if nextUnit then
                MiniGameBattleActionDisplay.PlaySound(70940023, unit.model)
                local fromPosition = MathUtil.GetVector3Add(unit.position, unit.hitPosition)
                local nextBullet = MiniGameBattleSceneMgr.AddBullet(attackUnit, fromPosition, MathUtil.GetVector3Add(nextUnit.position, nextUnit.hitPosition), {
                  hitSound = self.hitSound,
                  hurtMaxCount = 1,
                  skillId = self.skillId
                })
                nextBullet.hurtUidList[unit.uid] = 1
                nextBullet.hurtCountMax = nextBullet.hurtCountMax + 1
                tempBuff.toBulletUid = nextBullet.uid
                nextBullet:AddBuff(tempBuff.uid)
                MiniGameBattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
              end
            end
          end
          if table.getLen(self.hurtUidList) >= self.hurtCountMax then
            self:Destroy()
            return
          end
        end
      end
      if self.totalMove >= self.totalNeedMove then
        self:Destroy()
      end
    else
      local wallUnit = MiniGameBattleScene.wallUnit
      local dis = self.position.x - wallUnit.position.x
      if dis > self.speed then
        self.position.x = self.position.x - self.speed
      else
        self.position = wallUnit.position
        self:DealHurt(wallUnit)
        self:Destroy()
      end
    end
  end
  
  function bullet:DealHurt(hurtUnit)
    if hurtUnit:IsAlive() == false then
      return false
    end
    MiniGameBattleActionDisplay.PlaySound(self.hitSound, hurtUnit.model)
    self.hurtIndex = self.hurtIndex + 1
    local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(attackUnit, hurtUnit, self.skillConfig)
    if hurt > 0 then
      if attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
        local realNum = MiniGameBattleAction.DealHurt(attackUnit, hurtUnit, hurt, nil, hurtExtraParams, self.bulletHitEffect)
      else
        local realNum = MiniGameBattleAction.DealHurt(attackUnit, hurtUnit, hurt, nil, hurtExtraParams)
      end
    end
    MiniGameBattleBuffMgr.TriggerBulletListener(self, MINI_GAME_BUFF_DEDUCE_TYPE.BULLET_HURT, {
      hurtUnitUid = hurtUnit.uid
    })
    if hurtUnit:IsAlive() == true and self.skillId == attackUnit.normalSkillId then
      attackUnit:DealTriggerSkill(MINI_GAME_TRIGGER_CONDITION.NORMAL_HURT, hurtUnit.uid)
    end
  end
  
  function bullet:UpdateDisplay()
    if self.inited == false or self.isDestroy == true then
      return
    end
    self:UpdateModelPosition()
  end
  
  function bullet:AddBuff(uid)
    self.buffUidList[uid] = 1
    self:UpdateCachedBuffEffect()
  end
  
  function bullet:RemoveBuff(uid)
    self.buffUidList[uid] = nil
    self:UpdateCachedBuffEffect()
  end
  
  function bullet:UpdateCachedBuffEffect()
    local buffUidList = self.buffUidList
    local effectId, buff, effect, effectList
    local cachedList = {}
    local cachedEffectList
    local savedBuffList = MiniGameBattleBuffMgr.savedBuffList
    for buffUid, enable in pairs(buffUidList) do
      buff = savedBuffList[buffUid]
      effectList = buff.effectList
      for i = 1, #effectList do
        effect = effectList[i]
        effectId = effect.effectId
        cachedEffectList = cachedList[effectId] or {}
        cachedEffectList[#cachedEffectList + 1] = effect
        cachedList[effectId] = cachedEffectList
      end
    end
    self.cachedBuffEffect = cachedList
  end
  
  function bullet:UpdateModelPosition()
    if self.model then
      local position = self.position
      local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
      LuaUtil.SetLocalPos(self.model, position.x / pixelsPerUnit, position.y / pixelsPerUnit, position.z / pixelsPerUnit)
      self:UpdateSortingOrder()
    end
  end
  
  function bullet:UpdateSortingOrder()
  end
  
  function bullet:Destroy()
    MiniGameBattleSceneMgr.RemoveBullet(self)
    self.isDestroy = true
    if self.model then
      BattleResourceManager:DestroyGameObject(self.model)
      self.model = nil
    end
    self = nil
  end
  
  bullet.uid = MiniGameBattleScene.unitGlobalIndex
  bullet.delayFrame = bulletExtraParams.delayFrame or 0
  bullet.inited = false
  if 0 == bullet.delayFrame then
    bullet:Init()
  end
  return bullet
end
