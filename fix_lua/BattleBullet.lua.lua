BattleBullet = {}
local pairs = pairs
local BATTLE_CONFIG_ENUM = BATTLE_CONFIG_ENUM

function BattleBullet.InitLocalVar()
end

local BULLET_TYPE_ENUM = {NORMAL = 1, DIRECT_MOVE = 2}

function BattleBullet.NewBullet(showDisplayConfig, fromUnit, defUnit, fromPos, toPos, subSkillId, skillId, speed, bulletExtraParams)
  if nil == bulletExtraParams then
    bulletExtraParams = {}
  end
  local bullet = {
    inited = false,
    speed = 0,
    speedConfig = 0,
    speedV3 = nil,
    position = nil,
    targetPosition = nil,
    startPosition = nil,
    endPosition = nil,
    displayPosition = nil,
    useOffY = true,
    offY = 0,
    defaultBendAngle = 30,
    maxAngle = 0,
    maxEulerZ = 30,
    eulerZ = 0,
    scaleX = 1,
    mapX = nil,
    mapY = nil,
    id = nil,
    uid = nil,
    camp = nil,
    fromUid = nil,
    fromUidForCal = nil,
    fromUnitForCal = nil,
    targetUid = nil,
    bulletType = nil,
    hurtUidList = {},
    coverRadiusR = 0,
    buffFromAtk = {},
    model = nil,
    isDestroy = false,
    buffUidList = {},
    cachedBuffEffect = {},
    delayFrame = 0,
    damageRate = nil,
    beAffectedWithEffects = nil,
    visible = true,
    bulletEffect = nil,
    bulletScale = 1,
    sound = nil,
    hitSound = nil,
    isLine = nil,
    startPointName = "bullet_1",
    endPointName = "hit",
    startPointPositionOff = nil,
    alreadyHurt = false,
    finalDamageAddPer = 0,
    finalDamageReduceBuffPer = 0,
    finalDamageRatioPer_loop = 10000,
    finalDamageUpRatio = nil,
    totalMove = 0
  }
  
  function bullet:Init()
    self.subSkillId = subSkillId
    self.skillId = skillId
    self.skillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    self.fromUid = fromUnit.uid
    self.camp = fromUnit.camp
    self.enemyCamp = fromUnit.enemyCamp
    self.fromUidForCal = bulletExtraParams.fromUnitUid or self.fromUid
    self.targetUid = defUnit and defUnit.uid
    self.fromUnitForCal = BattleScene.GetUnitByUid(self.fromUidForCal)
    self.sound = nil
    self.hitSound = nil
    self.totalMove = 0
    self.totalNeedMove = bulletExtraParams.totalNeedMove
    if nil == self.defUnit and toPos then
      self.bulletType = BULLET_TYPE_ENUM.DIRECT_MOVE
      self.coverRadiusR = bulletExtraParams.coverRadiusR
    else
      self.bulletType = BULLET_TYPE_ENUM.NORMAL
    end
    if self.fromUnitForCal:IsAlive() == false then
      self:Destroy()
      return
    end
    if defUnit and defUnit:IsAlive() == false then
      self:TriggerTargetDeadBuff()
      self:Destroy()
      return
    end
    if showDisplayConfig and false == BattleMgr.isBattleServer then
      local hurtIndex = bulletExtraParams.hurtIndex or 1
      if showDisplayConfig.bullet_effect_list then
        self.bulletEffect = EffectUtil.GetFullPath(showDisplayConfig.bullet_effect_list[hurtIndex] or showDisplayConfig.bullet_effect_list[#showDisplayConfig.bullet_effect_list])
      else
        local splitEffect = Split(showDisplayConfig.bullet_effect, ":")
        if #splitEffect > 1 then
          if bulletExtraParams and bulletExtraParams.effectIndex then
            self.bulletEffect = EffectUtil.GetFullPath(splitEffect[bulletExtraParams.effectIndex])
          else
            self.bulletEffect = EffectUtil.GetFullPath(splitEffect[1])
          end
        else
          self.bulletEffect = EffectUtil.GetFullPath(showDisplayConfig.bullet_effect)
        end
      end
      self.bulletScale = MathUtil.TruncateFloat((showDisplayConfig.bullet_scale or 10000) / 10000)
      local bulletSound = showDisplayConfig.bullet_sound
      if bulletSound then
        self.sound = bulletSound[hurtIndex] or bulletSound[#bulletSound]
      end
      local bulletHitSound = showDisplayConfig.bullet_hit_sound
      if bulletHitSound then
        self.hitSound = bulletHitSound[hurtIndex] or bulletHitSound[#bulletHitSound]
      end
      if self.bulletType == BULLET_TYPE_ENUM.DIRECT_MOVE then
        self.maxAngle = 0
        self.isLine = true
      else
        local bend_scale = showDisplayConfig.bend_scale
        local bend_scale_random = showDisplayConfig.bend_scale_random
        if bend_scale_random then
          local curScale = math.random(bend_scale_random[1] * 10000, bend_scale_random[2] * 10000)
          if curScale then
            self.maxAngle = self.defaultBendAngle * curScale / 10000
            if bulletExtraParams.bendScale then
              self.maxAngle = self.maxAngle * bulletExtraParams.bendScale
            end
          end
          if 0 == self.maxAngle then
            self.isLine = true
          end
        elseif bend_scale then
          local curScale = bend_scale[hurtIndex]
          if curScale then
            self.maxAngle = self.defaultBendAngle * curScale
            if bulletExtraParams.bendScale then
              self.maxAngle = self.maxAngle * bulletExtraParams.bendScale
            end
          end
          if 0 == self.maxAngle then
            self.isLine = true
          end
        else
          self.maxAngle = 0
          self.isLine = true
        end
      end
      local startPoints = showDisplayConfig.start_points
      if startPoints and startPoints[hurtIndex] then
        self.startPointName = startPoints[hurtIndex]
      end
      if bulletExtraParams.startPointName then
        self.startPointName = bulletExtraParams.startPointName
      end
      local endPoints = showDisplayConfig.end_points
      if endPoints and endPoints[hurtIndex] then
        self.endPointName = endPoints[hurtIndex]
      end
    end
    if self.isLine then
      self.useOffY = false
    end
    if BattleMgr.isBattleServer ~= true then
      self:CreateModel()
    end
    if fromPos then
      local startPointPositionOff = bulletExtraParams and bulletExtraParams.startPointPositionOff
      if startPointPositionOff then
        self.startPointPositionOff = startPointPositionOff
        self.position = {
          x = fromPos.x,
          y = fromPos.y,
          z = fromPos.z
        }
      else
        self.position = {
          x = fromPos.x,
          y = fromPos.y,
          z = fromPos.z
        }
      end
    else
      local position = fromUnit.position
      if showDisplayConfig and false == BattleMgr.isBattleServer then
        local pos = fromUnit:GetPointPositionOffBySlotName(self.startPointName)
        if pos then
          self.startPointPositionOff = {
            x = pos.x,
            y = pos.y * BattleMgr.rotationCos,
            z = pos.y * BattleMgr.rotationSin
          }
        end
      end
      self.position = {
        x = position.x,
        y = position.y,
        z = position.z
      }
    end
    self.startPosition = {
      x = self.position.x,
      y = self.position.y,
      z = self.position.z
    }
    if toPos then
      self.endPosition = {
        x = toPos.x,
        y = toPos.y,
        z = toPos.z
      }
    end
    if showDisplayConfig and showDisplayConfig.bullet_speed then
      self.speedConfig = showDisplayConfig.bullet_speed
      self.speed = MathUtil.TruncateFloat(showDisplayConfig.bullet_speed / BATTLE_CONFIG_ENUM.FIXED_FPS)
    else
      self.speedConfig = speed
      self.speed = MathUtil.TruncateFloat(speed / BATTLE_CONFIG_ENUM.FIXED_FPS)
    end
    self.inited = true
    self:SetPosition()
    if self.sound then
      local soundPathConfig = TableData.GetConfig(self.sound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
      end
    end
  end
  
  function bullet:CreateModel()
    self.model = ResourceManager.Instantiate(self.bulletEffect)
    local scale = self.bulletScale
    BattleResourceManager:AddGameObject(self.model, 0, 0, 0, scale, scale, scale)
  end
  
  function bullet:IsTargetInRange()
    local targetPosition = self.endPosition or defUnit.position
    local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(targetPosition, self.position)) * BattleScene.pixelsPerUnit
    return dis <= (defUnit and defUnit.coverRadiusR or 1), dis
  end
  
  function bullet:IsTargetInMoveRange(unit)
    local targetPosition = unit.position
    if unit.coverRadiusR then
      local dis = MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(targetPosition, self.position)) * BattleScene.pixelsPerUnit
      return dis <= unit.coverRadiusR + self.coverRadiusR
    else
      return math.abs(self.position.x - targetPosition.x) * BattleScene.pixelsPerUnit - unit.coverRadiusHalfW <= self.coverRadiusR and math.abs(self.position.z - targetPosition.z) * BattleScene.pixelsPerUnit - unit.coverRadiusHalfH <= self.coverRadiusR
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
  
  function bullet:DealMove()
    if defUnit and defUnit:IsAlive() == false and false == defUnit:IsRevive() then
      self:TriggerTargetDeadBuff()
      self:Destroy(true)
      return
    end
    self.targetPosition = self.endPosition or defUnit.position
    self.speedV3 = BattleScene.GetSpeed(self.position, self.targetPosition, self.speed)
    self.position = MathUtil.GetVector3Add(self.position, self.speedV3)
    if self.bulletType == BULLET_TYPE_ENUM.DIRECT_MOVE then
      self.totalMove = self.totalMove + self.speed
      local unitList = BattleChoose.GetBulletHurtUnitList(self)
      if #unitList > 0 then
        local isBattleServer = BattleMgr.isBattleServer
        for _, unit in ipairs(unitList) do
          if self.hurtUidList[unit.uid] == nil then
            if false == isBattleServer then
              local model = unit.model or unit.effectModel
              if self.hitSound and model then
                local soundPathConfig = TableData.GetConfig(self.hitSound, "BaseSoundPath")
                if soundPathConfig then
                  BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, model)
                end
              end
            end
            self.hurtUidList[unit.uid] = 1
            self:DealHurt(unit)
          end
        end
      end
      if self.totalMove >= self.totalNeedMove then
        if false == BattleMgr.isBattleServer then
          BulletEffectHelper.ArriveTarget(self.model, self.uid)
        end
        self:Destroy(true)
      end
    elseif self:IsTargetInRange() == true then
      local isBattleServer = BattleMgr.isBattleServer
      if false == isBattleServer and defUnit then
        local model = defUnit.model or defUnit.effectModel
        if self.hitSound and model then
          local soundPathConfig = TableData.GetConfig(self.hitSound, "BaseSoundPath")
          if soundPathConfig then
            BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, model)
          end
        end
      end
      local result = self:DealHurt()
      if false == result then
        self:Destroy(true)
      else
        if false == isBattleServer then
          BulletEffectHelper.ArriveTarget(self.model, self.uid)
        end
        self:Destroy()
      end
    end
  end
  
  function bullet:TriggerTargetDeadBuff()
    if BattleBuffMgr.ContainEffectId(nil, BUFF_EFFECT_ID.BULLET_BOUNCE, self) then
      BattleBuffMgr.TriggerBulletListener(self, BUFF_DEDUCE_TYPE.BULLET_REMOVE_WITH_164)
    end
  end
  
  function bullet:DealHurt(hurtUnit)
    hurtUnit = hurtUnit or defUnit
    if nil == hurtUnit then
      return false
    end
    if hurtUnit:IsAlive() == false then
      self:TriggerTargetDeadBuff()
      return false
    end
    if self.alreadyHurt == true then
      return false
    end
    BattleBuffMgr.TriggerBulletListener(self, BUFF_DEDUCE_TYPE.BEFORE_BULLET_HURT, {
      hurtUnitUid = hurtUnit.uid
    })
    local buff, effect, effectList
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(self.buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, uid in ipairs(buffUidArray) do
      buff = savedBuffList[uid]
      if buff then
        effectList = buff.effectList
        for i = 1, #effectList do
          effect = effectList[i]
          if true == effect.updateValueBeforeHurt then
            effect:UpdateValue()
          end
        end
      end
    end
    local attackUnit = self.fromUnitForCal
    local hurtNum, hurtExtraParams
    if self.skillId and self.subSkillId then
      local extraParams = {
        effectId = self.effectId,
        effectUnitUid = self.effectUnitUid,
        effectCalType = self.effectCalType,
        effectCalValue = self.effectCalValue,
        effectCalAttrId = self.effectCalAttrId,
        effectCalAttrCalType = self.effectCalAttrCalType,
        bulletUid = self.uid,
        bulletDamageRate = self.damageRate,
        beAffectedWithEffects = self.beAffectedWithEffects,
        finalValue = self.finalValue,
        skillDamageRate = self.skillDamageRate
      }
      local params
      if self.finalDamageUpRatio then
        params = {
          finalDamageUpRatio = self.finalDamageUpRatio
        }
      end
      hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(self.skillId, self.subSkillId, attackUnit, hurtUnit, extraParams, 1, params)
      if hurtNum then
        if hurtNum >= 0 and hurtUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
          BattleAction.DealMoveToAttack(attackUnit, hurtUnit)
        elseif hurtNum < 0 then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
            treatUnitUid = hurtUnit.uid,
            treatNum = -hurtNum
          })
        end
        local hurtEffectParams = {
          showDisplayConfig = showDisplayConfig,
          fromUid = self.fromUid,
          isBullet = true,
          hurtIndex = bulletExtraParams.hurtIndex or 1
        }
        local realNum = 0
        if skillId and subSkillId then
          realNum = BattleAction.DealHurt(attackUnit, hurtUnit, hurtNum, nil, hurtExtraParams, hurtEffectParams, self.speedV3.x < 0)
        else
        end
        local absorbHurt = hurtExtraParams.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          attackUnit:SaveSkillDamageForTestBalance(num, self.skillConfig.type)
          attackUnit:SaveDamage(num)
          hurtUnit:SaveDamaged(num, attackUnit.uid ~= hurtUnit.uid)
          if attackUnit.camp == hurtUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(hurtUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == attackUnit.isBuilding and attackUnit.uid ~= hurtUnit.uid then
            BattleBuffMgr.TriggerUnitListener(hurtUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = attackUnit.uid
            })
          end
        end
        if hurtNum >= 0 and attackUnit.camp == hurtUnit.enemyCamp then
          if self.skillConfig then
            if self.skillConfig.type == SKILL_TYPE_ENUM.NORMAL then
              BattleBuffMgr.TriggerUnitListener(hurtUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY_NORMAL)
            end
            BattleBuffMgr.TriggerUnitListener(hurtUnit, BUFF_DEDUCE_TYPE.SKILL_HURT)
          end
          BattleBuffMgr.TriggerUnitListener(hurtUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = attackUnit.uid
          })
        end
        if true == bulletExtraParams.rageHit and hurtUnit.haveRage then
          BattleAction.DealRageChange(hurtUnit, hurtUnit:GetAttr(ATTR_ENUM.rage_hit))
        end
      end
    elseif bulletExtraParams.hpValue and 0 ~= bulletExtraParams.hpValue and false == BattleBuffMgr.IsUnitUntreatable(hurtUnit) then
      hurtNum = bulletExtraParams.hpValue
      local realNum = BattleAction.DealHurt(attackUnit, hurtUnit, hurtNum)
    end
    BattleBuffMgr.TriggerBulletListener(self, BUFF_DEDUCE_TYPE.BULLET_HURT, {
      hurtUnitUid = hurtUnit.uid
    })
    if self.skillId and self.subSkillId then
      if hurtExtraParams.counter then
        local counterValue = hurtExtraParams.counter.counterValue
        if counterValue and true == attackUnit:CanTargetChosen() then
          local counterEffectParams
          if hurtExtraParams.counter.counterEffectPath then
            counterEffectParams = {
              effectPath = hurtExtraParams.counter.counterEffectPath
            }
          end
          local realNum = BattleAction.DealHurt(hurtUnit, attackUnit, counterValue, nil, nil, counterEffectParams)
          local absorbHurt = hurtExtraParams.counter.absorbHurt or 0
          local num = realNum + absorbHurt
          if 0 ~= num then
            hurtUnit:SaveSkillDamageForTestBalance(num)
            hurtUnit:SaveDamage(num)
            attackUnit:SaveDamaged(num)
            if hurtUnit.camp == attackUnit.enemyCamp then
              BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
            end
            if false == hurtUnit.isBuilding and hurtUnit.uid ~= attackUnit.uid then
              BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
                hurtFromUnitUid = hurtUnit.uid
              })
            end
          end
          if hurtUnit.camp == attackUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
              hurtFromUnitUid = hurtUnit.uid
            })
          end
        end
      end
      local isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddTargetUid(hurtUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(hurtUnit, true, nil, nil, nil, nil, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.GROW_CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddTargetUid(hurtUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(hurtUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nil == nextUnit then
          nextUnit = nearUnitList[1]
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          local finalDamageAddPer = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.GROW_CATAPULT_DAMAGE)
          if finalDamageAddPer then
            nextBullet.finalDamageAddPer = nextBullet.finalDamageAddPer + finalDamageAddPer
          end
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddTargetUid(hurtUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(hurtUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nil == nextUnit then
          nextUnit = nearUnitList[1]
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          local finalDamageReducePer = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.REDUCE_CATAPULT_DAMAGE)
          if finalDamageReducePer then
            nextBullet.finalDamageReduceBuffPer = nextBullet.finalDamageReduceBuffPer + finalDamageReducePer
          end
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.CATAPULT_DAMAGE_LOOP_RATIO, self, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddTargetUid(hurtUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(hurtUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit
        for i = 1, #nearUnitList do
          if false == tempBuff:IsAlreadyInTarget(nearUnitList[i].uid) then
            nextUnit = nearUnitList[i]
            break
          end
        end
        if nil == nextUnit then
          local firstUid = tempBuff.cachedTargetArray[1]
          if firstUid then
            local firstUnit = BattleScene.GetUnitByUid(firstUid)
            if firstUnit and firstUnit:CanTargetChosen() then
              nextUnit = firstUnit
            end
          end
          if nil == nextUnit and #nearUnitList > 0 then
            nextUnit = nearUnitList[#nearUnitList]
          end
          tempBuff:ClearAlreadyInTarget()
        end
        if nextUnit then
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          local finalDamageRatioPer_loop = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.CATAPULT_DAMAGE_LOOP_RATIO)
          if finalDamageRatioPer_loop and 10000 ~= finalDamageRatioPer_loop then
            nextBullet.finalDamageRatioPer_loop = math.floor(nextBullet.finalDamageRatioPer_loop * finalDamageRatioPer_loop / 10000)
          end
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.CATAPULT_TAG, self, true)
      if isContain then
        local nearUnitList = BattleChoose.GetNearestUnit(hurtUnit, true, nil, nil, nil, true, nil, true)
        local nextUnit = nearUnitList[1]
        if nextUnit then
          local tempBuff = buffs[1]
          local buffConfig = tempBuff.buffConfig
          if buffConfig.extra_param then
            local param = Split(buffConfig.extra_param, ":")
            if #param < 2 then
              printError("参数错误：", buffConfig.extra_param)
            else
              local extra_showDisplayId = BattleData.GetSkillShowIdFromGroup(tonumber(param[1]), attackUnit.fashionId)
              local extra_showDisplayConfig, _speed
              if 0 == extra_showDisplayId then
                extra_showDisplayConfig = showDisplayConfig
                _speed = speed
              else
                extra_showDisplayConfig = TableData.GetConfig(extra_showDisplayId, "BaseSkillShowDisplay")
                _speed = extra_showDisplayConfig.bullet_speed
              end
              if extra_showDisplayConfig then
                local bulletSubSkillId
                local bulletHurtPoint = extra_showDisplayConfig.hurt_point
                if bulletHurtPoint then
                  bulletSubSkillId = tonumber(Split(bulletHurtPoint[1], ":")[2])
                end
                if bulletSubSkillId then
                  bulletExtraParams.fromUnitUid = self.fromUidForCal
                  local nextBullet = BattleBullet.NewBullet(extra_showDisplayConfig, hurtUnit, nextUnit, nil, nil, bulletSubSkillId, skillId, _speed, bulletExtraParams)
                  BattleScene.AddBullet(nextBullet)
                  BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
                  local buffId = tonumber(param[2])
                  local newBuff = BattleBuffMgr.NewBuff(buffId, {
                    unitUid = fromUnit.uid
                  }, {
                    bulletUid = nextBullet.uid
                  }, true)
                  newBuff:AddTargetUid(hurtUnit.uid)
                end
              end
            end
          end
        end
      end
      isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.BULLET_SPLIT, self, true)
      if isContain then
        local tempBuff = buffs[1]
        local buffConfig = tempBuff.buffConfig
        if buffConfig.extra_param then
          local params = Split(buffConfig.extra_param, ":")
          local splitUnitList = BattleChoose.GetTargetUnitList(tonumber(params[1]), {
            unitUid = hurtUnit.uid
          }, {})
          if #splitUnitList > 0 then
            local nextBuffList = Split(params[2], ",")
            for _, nextUnit in ipairs(splitUnitList) do
              bulletExtraParams.fromUnitUid = self.fromUidForCal
              bulletExtraParams.skillDamageRate = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.BULLET_SPLIT)
              local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
              BattleScene.AddBullet(nextBullet)
              BattleBuffMgr.DealBulletFinalDamageAdd(nil, self, nextBullet)
              for _, buffIdStr in ipairs(nextBuffList) do
                local nextBuffId = tonumber(buffIdStr)
                BattleBuffMgr.NewBuff(nextBuffId, {
                  unitUid = fromUnit.uid
                }, {
                  bulletUid = nextBullet.uid
                }, true)
              end
            end
          end
        end
      end
    end
    local isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.BULLET_BOUNCE, self, true)
    if isContain then
      local tempBuff = buffs[1]
      local deduceCount = tempBuff.deduceCount
      local buffFromUnit = BattleScene.GetUnitByUid(tempBuff.fromUnitUid)
      if buffFromUnit then
        local nextUnit
        if 1 == deduceCount % 2 then
          nextUnit = BattleChoose.GetUnitListForUnit10064(buffFromUnit.camp)
        else
          nextUnit = BattleChoose.GetUnitListForUnit10064(buffFromUnit.enemyCamp)
        end
        if nextUnit then
          self:RemoveBuff(tempBuff.uid)
          bulletExtraParams.fromUnitUid = self.fromUidForCal
          bulletExtraParams.effectIndex = deduceCount % 2 + 1
          local nextBullet = BattleBullet.NewBullet(showDisplayConfig, hurtUnit, nextUnit.unit, nil, nil, subSkillId, skillId, speed, bulletExtraParams)
          BattleScene.AddBullet(nextBullet)
          tempBuff.toBulletUid = nextBullet.uid
          nextBullet:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
          isContain, _, buffs = BattleBuffMgr.GetContainedEffect(nil, BUFF_EFFECT_ID.TRANS_TO_NEXT_BULLET, self, true)
          if isContain then
            for _, v in ipairs(buffs) do
              self:RemoveBuff(v.uid)
              v.toBulletUid = nextBullet.uid
              nextBullet:AddBuff(v.uid)
              BattleBuffMgr.RefreshRegisterDeduceListener(v)
            end
          end
        else
          self:TriggerTargetDeadBuff()
        end
      end
    end
    if self.bulletType == BULLET_TYPE_ENUM.NORMAL then
      self.alreadyHurt = true
    end
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
    local savedBuffList = BattleBuffMgr.savedBuffList
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
  
  function bullet:SetPosition()
    if BattleMgr.isBattleServer == true then
      return
    end
    local displayStartPosition
    if self.startPointPositionOff then
      displayStartPosition = MathUtil.GetVector3Add(self.startPosition, self.startPointPositionOff)
    else
      displayStartPosition = self.startPosition
    end
    local startModel = fromUnit.model
    if fromUnit.summonFromUnitId == SPECIAL_CARD_OR_MONSTER.LASITE then
      startModel = BattleScene.GetUnitByUid(fromUnit.summonFromUnit).model
    elseif nil == startModel then
      local effect = fromUnit.effectModel
      local trans = LuaUtil.FindChild(effect.transform, "bullet", true)
      if trans then
        local localPosition = trans.localPosition
        displayStartPosition.x = displayStartPosition.x + localPosition.x
        displayStartPosition.y = displayStartPosition.y + localPosition.y
        displayStartPosition.z = displayStartPosition.z + localPosition.z
      end
      startModel = effect
    end
    LuaUtil.SetLocalPos(self.model, displayStartPosition.x, displayStartPosition.y, displayStartPosition.z)
    if defUnit then
      BulletEffectHelper.SetBulletHelper(self.model, startModel, defUnit.model or defUnit.effectModel, MathUtil.TruncateFloat(self.speedConfig / BattleScene.pixelsPerUnit), self.endPointName, self.maxAngle)
    else
      BulletEffectHelper.SetBulletHelper(self.model, startModel, Vector3(self.endPosition.x, self.endPosition.y, self.endPosition.z), MathUtil.TruncateFloat(self.speedConfig / BattleScene.pixelsPerUnit), self.endPointName, self.maxAngle)
    end
    BulletEffectHelper.SetBulletUid(self.model, self.uid)
    if showDisplayConfig and showDisplayConfig.attack_point_effect then
      ResourceManager.InstantiateAsync(EffectUtil.GetFullPath(showDisplayConfig.attack_point_effect), function(eff)
        if BattleControl.isOver == true then
          ResourceManager.DestroyGameObject(eff)
          return
        end
        BattleResourceManager:AddGameObject(eff)
        LuaUtil.SetLocalPos(eff, displayStartPosition.x, displayStartPosition.y, displayStartPosition.z)
        EffectUtil.SetAutoDestroyCallback(eff, function()
          if BattleControl.isOver == true then
            return
          end
          if eff then
            BattleResourceManager:DestroyGameObject(eff)
          end
        end)
      end)
    end
  end
  
  function bullet:UpdateSortingOrder()
  end
  
  function bullet:Destroy(inBattleClear, battleOverClear)
    if true ~= battleOverClear then
      self:RemoveAllBuff()
      BattleScene.RemoveBullet(self.uid)
    end
    self.isDestroy = true
    if self.model then
      if inBattleClear or battleOverClear then
        BulletEffectHelper.ResetBulletHelper(self.model)
        BattleResourceManager:DestroyGameObject(self.model)
      end
      self.model = nil
    end
    self = nil
  end
  
  function bullet:RemoveAllBuff()
    local buff
    local savedBuffList = BattleBuffMgr.savedBuffList
    local buffUidArray = table.mapKey2Array(self.buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    for _, buffUid in ipairs(buffUidArray) do
      buff = savedBuffList[buffUid]
      if buff then
        buff:Remove()
      end
    end
    self.buffUidList = {}
  end
  
  bullet.uid = BattleScene.GetBulletGlobalIndex()
  bullet.delayFrame = bulletExtraParams.delayFrame or 0
  local effectList = bulletExtraParams.effectList
  if effectList and effectList[1] then
    bullet.effectId = effectList[1].effectId
    bullet.effectUnitUid = effectList[1].fromUnitUid
    bullet.effectCalType = effectList[1].effectCalType
    bullet.effectCalValue = effectList[1].effectCalValue
    bullet.effectCalAttrId = effectList[1].effectCalAttrId
    bullet.effectCalAttrCalType = effectList[1].effectCalAttrCalType
    bullet.finalValue = effectList[1].finalValue
  end
  bullet.beAffectedWithEffects = bulletExtraParams.beAffectedWithEffects
  bullet.damageRate = bulletExtraParams.mainDamageRate or bulletExtraParams.transferDamageRate
  bullet.skillDamageRate = bulletExtraParams.skillDamageRate
  if 0 == bullet.delayFrame then
    bullet:Init()
  end
  return bullet
end
