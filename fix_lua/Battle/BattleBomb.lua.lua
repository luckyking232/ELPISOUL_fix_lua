BattleBomb = {}

function BattleBomb.InitLocalVar()
end

function BattleBomb.NewBomb(showDisplayConfig, fromUnit, targetUnit, skillId, subSkillId, bombExtraParams)
  local bomb = {
    inited = false,
    id = nil,
    uid = nil,
    fromUid = nil,
    fromUidForCal = nil,
    fromUnitForCal = nil,
    targetUid = nil,
    showDisplayConfig = nil,
    fromUnit = nil,
    targetUnit = nil,
    model = nil,
    lineEffect = nil,
    needUpdateDisplay = false,
    hurtIndex = 0,
    bombHurtIndex = 0,
    maxBombHurtIndex = 0,
    splitHurtSubSkillId = nil,
    splitHurtDelayFrame = nil,
    isDestroy = false,
    buffUidList = {},
    cachedBuffEffect = {},
    initDelayFrame = 0,
    bombDelayFrame = 0,
    hitSameTargetCount = nil,
    damageRate = nil,
    bombEffect = nil,
    bombSound = nil,
    bombHitSound = nil,
    hitSound = nil,
    finalDamageUpRatio = nil,
    finalDamageUpPer = nil,
    finalDamageRatioPer_loop = 10000
  }
  
  function bomb:Init()
    self.skillConfig = TableData.GetConfig(self.skillId, "BaseSkill")
    self.fromUid = self.fromUnit.uid
    self.fromUidForCal = bombExtraParams.fromUnitUid or self.fromUid
    self.targetUid = self.targetUnit.uid
    self.fromUnitForCal = BattleScene.GetUnitByUid(self.fromUidForCal)
    if self.fromUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    if self.targetUnit:IsAlive() == false then
      self:Destroy()
      return
    end
    if false == BattleMgr.isBattleServer then
      self.bombSound = self.showDisplayConfig.bomb_sound_target
      self.bombHitSound = self.showDisplayConfig.bomb_sound_target_hit
      self:CreateModel()
    end
    self.inited = true
    self.bombHurtIndex = 1
    self.maxBombHurtIndex = 1
    self:ResetSplitHurtInfo()
  end
  
  function bomb:ResetSplitHurtInfo()
    if self.subSkillId then
      local subSkillConfig = TableData.GetConfig(self.subSkillId, "BaseSubSkill")
      if subSkillConfig and subSkillConfig.hurt_point then
        self.maxBombHurtIndex = math.max(#subSkillConfig.hurt_point, 1)
        local curHurt = Split(subSkillConfig.hurt_point[self.bombHurtIndex], ":")
        self.splitHurtDelayFrame = tonumber(curHurt[1])
        self.splitHurtSubSkillId = tonumber(curHurt[2])
      end
    end
  end
  
  function bomb:CreateModel()
    local displayConfig = self.showDisplayConfig
    local configPath = displayConfig.bomb_effect_target
    if configPath then
      local splitPath = Split(configPath, ":")
      for _, path in ipairs(splitPath) do
        local effectPath = EffectUtil.GetFullPath(path)
        local effect = ResourceManager.Instantiate(effectPath)
        self.model = effect
        BattleResourceManager:AddGameObject(effect)
        SkillEffectsHelper.BindObject(effect, nil, self.targetUnit.model)
        EffectUtil.Overturn(effect, self.fromUnit.isFlip)
        EffectUtil.SetAutoDestroyCallback(effect, function()
          if BattleControl.isOver == true then
            return
          end
          if effect then
            BattleResourceManager:DestroyGameObject(effect)
          end
        end)
        if self.model and self.bombSound then
          local soundPathConfig = TableData.GetConfig(self.bombSound, "BaseSoundPath")
          if soundPathConfig then
            BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
          end
        end
      end
    end
    configPath = displayConfig.bomb_effect_line
    if configPath then
      local effectPath = EffectUtil.GetFullPath(configPath)
      local effect = ResourceManager.Instantiate(effectPath)
      BattleResourceManager:AddGameObject(effect)
      self.lineEffect = effect
      self.needUpdateDisplay = true
      self:UpdateEffectLine()
      EffectUtil.SetEffectSpeed(effect, self.fromUnit.modelTimeScale)
      EffectUtil.SetAutoDestroyCallback(effect, function()
        if BattleControl.isOver == true then
          return
        end
        if effect then
          BattleResourceManager:DestroyGameObject(effect)
        end
        self.lineEffect = nil
      end)
      if effect and self.bombSound then
        local soundPathConfig = TableData.GetConfig(self.bombSound, "BaseSoundPath")
        if soundPathConfig then
          BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, effect)
        end
      end
    end
  end
  
  function bomb:UpdateDisplay()
    if self.needUpdateDisplay ~= true then
      return
    end
    if self.lineEffect then
      self:UpdateEffectLine()
    end
  end
  
  function bomb:UpdateEffectLine()
    if self.fromUnit == nil or nil == self.targetUnit or nil == self.lineEffect then
      return
    end
    local displayConfig = self.showDisplayConfig
    local startPoints = displayConfig.bomb_start_points
    local startPoint
    if self.fromUid ~= self.fromUidForCal then
      startPoint = "hit"
    else
      startPoint = startPoints and startPoints[1]
    end
    local startPosition = self.fromUnit:GetPointPositionBySlotName(startPoint) or self.fromUnit.position
    local targetPosition = self.targetUnit:GetPointPositionBySlotName("hit") or self.targetUnit.position
    local effect = self.lineEffect
    LuaUtil.SetLocalPositionAndRotation(effect, startPosition.x, startPosition.y, startPosition.z, 0, 0, 0)
    effect.transform.right = Vector3(targetPosition.x - startPosition.x, targetPosition.y - startPosition.y, targetPosition.z - startPosition.z)
    LuaUtil.SetScale(effect, MathUtil.GetVector3Module(MathUtil.GetVector3Subtract(startPosition, targetPosition)) / 10, 1, 1)
  end
  
  function bomb:AddBuff(uid)
    self.buffUidList[uid] = 1
    self:UpdateCachedBuffEffect()
  end
  
  function bomb:RemoveBuff(uid)
    self.buffUidList[uid] = nil
    self:UpdateCachedBuffEffect()
  end
  
  function bomb:UpdateCachedBuffEffect()
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
  
  function bomb:Update()
    if self.inited == false then
      if self.initDelayFrame then
        self.initDelayFrame = self.initDelayFrame - 1
        if self.initDelayFrame > 0 then
          return
        end
      end
      self:Init()
    end
    if self.isDestroy == true then
      return
    end
    if self.bombDelayFrame then
      self.bombDelayFrame = self.bombDelayFrame - 1
      if self.bombDelayFrame > 0 then
        return
      end
    end
    if self.splitHurtDelayFrame then
      self.splitHurtDelayFrame = self.splitHurtDelayFrame - 1
      if self.splitHurtDelayFrame > 0 then
        return
      end
      self.splitHurtDelayFrame = nil
    end
    self:DealHurt()
    if self.bombHurtIndex > self.maxBombHurtIndex then
      self:Destroy(true)
    else
      self:ResetSplitHurtInfo()
    end
  end
  
  function bomb:SetVisible(visible)
    if BattleMgr.isBattleServer == true then
      return
    end
    if self.visible ~= visible and self.model then
      self.model:SetActive(visible)
    end
    self.visible = visible
  end
  
  function bomb:DealHurt()
    local defUnit = self.targetUnit
    if nil == defUnit then
      return false
    end
    if defUnit:IsAlive() == false then
      return false
    end
    if self.bombHurtIndex > self.maxBombHurtIndex then
      return false
    end
    local attackUnit = self.fromUnitForCal
    if self.skillId and self.subSkillId then
      local curSkillType = self.skillConfig.type
      local realNum = 0
      local params = {
        bombUid = self.uid
      }
      if self.finalDamageUpRatio then
        params.finalDamageUpRatio = self.finalDamageUpRatio
      end
      local _count, _buffList = BattleBuffMgr.GetSettledBuffByUnitAndEffectID(attackUnit, BUFF_EFFECT_ID.DAMAGE_REDUCE_BY_SAME_TARGET)
      if _count > 0 then
        local buff = _buffList[1]
        if buff then
          local buffConfig = buff.buffConfig
          local _param = Split(buffConfig.extra_param, ":")
          if #_param > 0 then
            local _index = self.hitSameTargetCount
            params.finalDamageUpPer = tonumber(_param[_index] or _param[#_param])
          end
        end
      end
      local hurtNum, hurtExtraParams = BattleDataCount.GetSkillHurt(self.skillId, self.splitHurtSubSkillId or self.subSkillId, attackUnit, defUnit, nil, self.hurtIndex, params)
      if hurtNum then
        if hurtNum >= 0 and defUnit.battleUnitType == BATTLE_UNIT_TYPE.MELEE_ATTACK then
          BattleAction.DealMoveToAttack(attackUnit, defUnit)
        elseif hurtNum < 0 and 1 == self.hurtIndex and 1 == self.bombHurtIndex then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.TREAT_PARTNER, nil, {
            treatUnitUid = defUnit.uid,
            treatNum = -hurtNum
          })
        end
        local hurtEffectParams = {
          showDisplayConfig = attackUnit.curSkillShowDisplayConfig,
          fromUid = attackUnit.uid,
          hurtIndex = self.hurtIndex,
          hitSound = self.hitSound
        }
        realNum = BattleAction.DealHurt(attackUnit, defUnit, hurtNum, nil, hurtExtraParams, hurtEffectParams, attackUnit.position.x > defUnit.position.x)
        local absorbHurt = hurtExtraParams.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          attackUnit:SaveSkillDamageForTestBalance(num, curSkillType)
          attackUnit:SaveDamage(num)
          defUnit:SaveDamaged(num, attackUnit.uid ~= defUnit.uid)
          if attackUnit.camp == defUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == attackUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = attackUnit.uid
            })
          end
        end
        if hurtNum >= 0 and attackUnit.camp == defUnit.enemyCamp then
          if self.skillConfig then
            if self.skillConfig.type == SKILL_TYPE_ENUM.NORMAL then
              BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY_NORMAL)
            end
            BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.SKILL_HURT)
          end
          BattleBuffMgr.TriggerUnitListener(defUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = attackUnit.uid
          })
        end
        if 1 == self.hurtIndex and defUnit.haveRage and 1 == self.bombHurtIndex then
          BattleAction.DealRageChange(defUnit, defUnit:GetAttr(ATTR_ENUM.rage_hit))
        end
      end
      if 1 == self.bombHurtIndex then
        BattleBuffMgr.TriggerBombListener(self, BUFF_DEDUCE_TYPE.BOMB_HURT_1)
      end
      BattleBuffMgr.TriggerBombListener(self, BUFF_DEDUCE_TYPE.BOMB_HURT)
      if hurtExtraParams.counter then
        local counterEffectParams
        if hurtExtraParams.counter.counterEffectPath then
          counterEffectParams = {
            effectPath = hurtExtraParams.counter.counterEffectPath
          }
        end
        realNum = BattleAction.DealHurt(defUnit, attackUnit, hurtExtraParams.counter.counterValue, nil, nil, counterEffectParams)
        local absorbHurt = hurtExtraParams.counter.absorbHurt or 0
        local num = realNum + absorbHurt
        if 0 ~= num then
          defUnit:SaveSkillDamageForTestBalance(num)
          defUnit:SaveDamage(num)
          attackUnit:SaveDamaged(num)
          if defUnit.camp == attackUnit.enemyCamp then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ENEMY)
          end
          if false == defUnit.isBuilding and attackUnit.uid ~= defUnit.uid then
            BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HURT_BY_ANYONE, nil, {
              hurtFromUnitUid = defUnit.uid
            })
          end
        end
        if attackUnit.camp == defUnit.enemyCamp then
          BattleBuffMgr.TriggerUnitListener(attackUnit, BUFF_DEDUCE_TYPE.HIT_BY_ENEMY, nil, {
            hurtFromUnitUid = defUnit.uid
          })
        end
      end
      local isContain, _, buffs = BattleBuffMgr.GetBombContainedEffect(self, BUFF_EFFECT_ID.CATAPULT_DAMAGE_LOOP_RATIO, true)
      if isContain then
        local tempBuff = buffs[1]
        tempBuff:AddTargetUid(defUnit.uid)
        self:RemoveBuff(tempBuff.uid)
        local nearUnitList = BattleChoose.GetNearestUnit(defUnit, true, nil, nil, nil, true, nil, true)
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
          bombExtraParams.fromUnitUid = self.fromUidForCal
          local newBomb = BattleBomb.NewBomb(showDisplayConfig, defUnit, nextUnit, skillId, subSkillId, bombExtraParams)
          BattleScene.AddBomb(newBomb)
          tempBuff.toBombUid = newBomb.uid
          local finalDamageRatioPer_loop = tempBuff:GetEffectTotalValue(BUFF_EFFECT_ID.CATAPULT_DAMAGE_LOOP_RATIO)
          if finalDamageRatioPer_loop and 10000 ~= finalDamageRatioPer_loop then
            newBomb.finalDamageRatioPer_loop = math.floor(self.finalDamageRatioPer_loop * finalDamageRatioPer_loop / 10000)
          end
          newBomb:AddBuff(tempBuff.uid)
          BattleBuffMgr.RefreshRegisterDeduceListener(tempBuff)
        end
      end
    end
    if self.model and self.bombHitSound then
      local soundPathConfig = TableData.GetConfig(self.bombHitSound, "BaseSoundPath")
      if soundPathConfig then
        BattleActionDisplay.AddWaitDealSound(soundPathConfig.path, soundPathConfig.bank, self.model)
      end
    end
    self.bombHurtIndex = self.bombHurtIndex + 1
  end
  
  function bomb:UpdateSortingOrder()
  end
  
  function bomb:Destroy(inBattleClear, battleOverClear)
    if true ~= battleOverClear then
      self:RemoveAllBuff()
      BattleScene.RemoveBomb(self.uid)
    end
    self.lineEffect = nil
    self.isDestroy = true
    if self.model then
      self.model = nil
    end
    self = nil
  end
  
  function bomb:RemoveAllBuff()
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
  
  bomb.uid = BattleScene.GetBombGlobalIndex()
  bomb.hurtIndex = bombExtraParams.hurtIndex
  bomb.hitSound = bombExtraParams.hitSound
  bomb.initDelayFrame = bombExtraParams.initDelayFrame or 0
  bomb.bombDelayFrame = bombExtraParams.bombDelayFrame or 0
  bomb.hitSameTargetCount = bombExtraParams.hitSameTargetCount or 1
  bomb.fromUnit = fromUnit
  bomb.targetUnit = targetUnit
  bomb.skillId = skillId
  bomb.subSkillId = subSkillId
  bomb.showDisplayConfig = showDisplayConfig
  if 0 == bomb.delayFrame then
    bomb:Init()
  end
  return bomb
end
