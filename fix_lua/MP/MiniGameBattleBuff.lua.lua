MiniGameBattleBuff = {}

function MiniGameBattleBuff.InitLocalVar()
end

function MiniGameBattleBuff.NewBuff(buffId, from, to, settleNow, extraParams)
  local buff = {}
  
  function buff:Init()
    self:Clear()
    self.id = buffId
    self.fromUnitUid = from.unitUid
    self.toUnitUid = to.unitUid
    self.toBulletUid = to.bulletUid
    self.uid = MiniGameBattleBuffMgr.GetBuffGlobalIndex()
    local buffConfig = TableData.GetConfig(buffId, "BaseShootSkillBuff")
    self.buffConfig = buffConfig
    self.settleType = buffConfig.settle_type
    self.deduceType = buffConfig.deduce_type
    self.deduceTypeParam = buffConfig.deduce_type_param
    self.deduceCD = buffConfig.deduce_cd
    self.removeType = buffConfig.remove_type
    self.destroyUnitWhenRemove = 1 == buffConfig.remove_destroy_unit
    self.skillId = extraParams and extraParams.skillId
    if self.deduceType == MINI_GAME_BUFF_DEDUCE_TYPE.NONE or 1 == buffConfig.singleton then
      self.overlayNum = extraParams and extraParams.overlayNum or 1
    end
    if self.deduceType == MINI_GAME_BUFF_DEDUCE_TYPE.NONE then
      self.deduceType = nil
    end
    self.deduceMaxCount = buffConfig.deduce_cnt
    if self:ContainEffectIdBeforeSettle(MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_RANGE_HURT) then
      local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
      self.deduceMaxCount = self.deduceMaxCount + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_BUFF_TIME_ADD)
    elseif self:ContainEffectIdBeforeSettle(MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_RANGE_HURT) then
      local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
      self.deduceMaxCount = self.deduceMaxCount + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_TIME_ADD)
    elseif self:ContainEffectIdBeforeSettle(MINI_GAME_BUFF_EFFECT_ID.FEINISI_NORMAL_CATAPULT) then
      local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
      self.deduceMaxCount = self.deduceMaxCount + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_NORMAL_CATAPULT_COUNT)
    elseif self:ContainEffectIdBeforeSettle(MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING) then
      local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
      self.deduceMaxCount = self.deduceMaxCount + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING_TIME_ADD)
    end
    self.deduceSettled = 1 == buffConfig.deduce_settled
    if self.deduceType == MINI_GAME_BUFF_DEDUCE_TYPE.PER_TIME then
      self.deducePerFrames = buffConfig.deduce_value * BATTLE_CONFIG_ENUM.FIXED_FPS
      if self.deduceMaxCount and self.deduceMaxCount >= 0 then
        self.remainMaxFrames = self.deducePerFrames * self.deduceMaxCount
        self.remainFrames = self.remainMaxFrames
      end
    end
    self.activeForever = buffConfig.active_forever
    local canSettle
    if true == settleNow or self.settleType == MINI_GAME_BUFF_SETTLE_TYPE.NOW then
      canSettle = self:CanSettle()
      if false == canSettle then
        self:Clear()
        return
      end
    end
    self:SetState(BUFF_STATE_ENUM.TEMP)
    MiniGameBattleBuffMgr.AddToBuffList(self)
    print("释放buff BuffId", buffId, "BuffUid", self.uid, "是否立即挂载", settleNow)
    if true == settleNow or self.settleType == MINI_GAME_BUFF_SETTLE_TYPE.NOW then
      self:Settle(canSettle)
    else
      MiniGameBattleBuffMgr.RegisterSettleListener(self)
    end
  end
  
  function buff:Clear()
    self.id = nil
    self.uid = nil
    self.triggerFromBuffUid = nil
    self.fromUnitUid = nil
    self.fromCamp = nil
    self.fromSkillCamp = nil
    self.fromManuallySkillId = nil
    self.fromSkillId = nil
    self.fromCardSkillId = nil
    self.lastBuffToUnitUid = nil
    self.toUnitUid = nil
    self.toBulletUid = nil
    self.toBombUid = nil
    self.toCamp = nil
    self.alreadyMove = 0
    self.effectModel = nil
    self.position = {x = 0, y = 0}
    self.effectList = {}
    self.effectTagList = {}
    self.needShowBuffIcon = nil
    self.containEffect = {}
    self.containAttributeIdMap = {}
    self.activeCount = nil
    self.curState = nil
    self.lastDeduceFrame = nil
    self.nextUpdateFrame = nil
    self.settleFrame = nil
    self.settleType = nil
    self.deduceType = nil
    self.deduceSettled = nil
    self.deduceCount = 0
    self.deduceMaxCount = 0
    self.deducePerFrames = nil
    self.remainFrames = nil
    self.remainMaxFrames = nil
    self.deduceTriggerUnitUid = nil
    self.waitSettle = nil
    self.delayFrameSettle = nil
    self.waitDeduce = nil
    self.delayFrameDeduce = nil
    self.curDeduceWaitCount = nil
    self.maxDeduceWaitCount = nil
    self.cachedTargetUid = {}
    self.cachedTargetArray = {}
    self.beAffectedWithEffects = nil
    self.settleEffectPath = nil
    self.settleFullscreenEffectPath = nil
    self.settleEffectBindSlot = nil
    self.deduceEffectPath = nil
    self.deduceEffectBindSlot = nil
    self.effectLoop = false
    self.settleEffect = nil
    self.overlayNum = nil
    self.attackWarningEffectList = nil
    self.pause = false
    self.triggerFromTreatNum = nil
    self.triggerFromHurtNum = nil
    self.destroyUnitWhenRemove = false
  end
  
  function buff:SetDeduceTriggerUnitUid(uid)
    self.deduceTriggerUnitUid = uid
  end
  
  function buff:AddTargetUid(uid)
    self.cachedTargetUid[uid] = 1
    if table.contain(self.cachedTargetArray, uid) == false then
      table.insert(self.cachedTargetArray, uid)
    end
  end
  
  function buff:IsAlreadyInTarget(uid)
    return 1 == self.cachedTargetUid[uid]
  end
  
  function buff:ClearAlreadyInTarget()
    self.cachedTargetUid = {}
    self.cachedTargetArray = {}
  end
  
  function buff:ContainEffectIdBeforeSettle(effectId)
    local effectStrTable = self.buffConfig.value
    if effectStrTable then
      local strList
      for _, v in ipairs(effectStrTable) do
        strList = Split(v, ":")
        if strList and strList[1] == tostring(effectId) then
          return true
        end
      end
    end
    return false
  end
  
  function buff:ContainEffectTagBeforeSettle(effectTag)
    local effectStrTable = self.buffConfig.value
    if effectStrTable then
      local strList, effectId, effectConfig
      for _, v in ipairs(effectStrTable) do
        strList = Split(v, ":")
        if strList[1] then
          effectId = tonumber(strList[1])
          effectConfig = TableData.GetConfig(effectId, "BaseSkillBuffEffect")
          if effectConfig and effectConfig.effect_tag and table.contain(effectConfig.effect_tag, effectTag) then
            return true
          end
        end
      end
    end
    return false
  end
  
  function buff:Settle(canSettle, param)
    local settleUnit, settleBullet
    if self.toUnitUid then
      settleUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.toUnitUid)
    elseif self.toBulletUid then
      settleBullet = MiniGameBattleSceneMgr.GetBulletByUid(self.toBulletUid)
    end
    if settleUnit and settleUnit:IsAlive() == false then
      self:Remove()
      return
    end
    if settleUnit then
      if nil == canSettle then
        canSettle = self:CanSettle()
      end
      if false == canSettle then
        print("buff挂载条件不足：", self.id)
        self:Remove()
        return
      end
    end
    self.settleFrame = MiniGameBattleControl.curFixedFrame
    self.lastDeduceFrame = self.settleFrame
    local effectStrTable = self.buffConfig.value
    local effect
    for i = 1, #effectStrTable do
      effect = MiniGameBattleBuffEffect.NewEffect(effectStrTable[i], self.uid)
      self.containEffect[effect.effectId] = true
      self.effectList[#self.effectList + 1] = effect
      if effect.attributeId then
        self.containAttributeIdMap[effect.attributeId] = 1
      end
    end
    self:SetState(BUFF_STATE_ENUM.SETTLED)
    MiniGameBattleBuffMgr.UnRegisterSettleListener(self.uid, self.settleType)
    MiniGameBattleBuffMgr.RegisterDeduceListener(self)
    MiniGameBattleBuffMgr.RegisterRemoveListener(self)
    if settleUnit then
      settleUnit:AddBuff(self.uid, self.needShowBuffIcon)
      self:TriggerUnitAttrChanged(settleUnit, true)
      if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.TIME_PAUSE) then
        settleUnit:SetTimePause(true)
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) then
        settleUnit:SetFreeze(true)
      end
      if self.buffConfig.settle_effect_path then
        self.settleEffect = settleUnit:CreateEffect(self.buffConfig.settle_effect_path, 1)
      end
      print("buff成功挂载，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
      if self.id == 78040521 then
        MiniGameBattleActionDisplay.PlaySound(70940014, settleUnit.model)
      end
    elseif settleBullet then
      settleBullet:AddBuff(self.uid)
      print("buff成功挂载，buffId:", self.id, " 挂载子弹:", self.toBulletUid, " buffUid:", self.uid)
    end
    local settleBuffList = self.buffConfig.settle_buff_list
    if settleBuffList and #settleBuffList > 0 then
      MiniGameBattleBuffMgr.AnalysisBuffList(settleBuffList, self.from, {
        self.to
      }, true, {
        triggerFromBuffUid = self.uid
      })
    end
    if self.deduceType == MINI_GAME_BUFF_DEDUCE_TYPE.NOW or true == self.deduceSettled then
      self:Deduce()
    end
  end
  
  function buff:CanDeduce(settleUnit, param)
    if self.deduceType == MINI_GAME_BUFF_DEDUCE_TYPE.SETTLE_HP_LESS and settleUnit and settleUnit.tempHpPer and settleUnit.tempHpPer * 10000 >= tonumber(self.deduceTypeParam) then
      return false
    end
    if self.deduceCD and self.lastDeduceFrame > self.settleFrame and MiniGameBattleControl.curFixedFrame - self.lastDeduceFrame < self.deduceCD then
      return false
    end
    return true
  end
  
  function buff:Deduce(param)
    local settleUnit
    if self.toUnitUid then
      settleUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.toUnitUid)
    end
    if self:CanDeduce(settleUnit, param) == false then
      return
    end
    if settleUnit then
      if 1 == self.activeForever then
        self:DealActiveForeverEffect(settleUnit, param)
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.BEAT_BACK) == true then
        MiniGameBattleAction.InitBeatBackUnitData(settleUnit, self.fromUnitUid)
        MiniGameBattleAction.ForceChangeState(settleUnit, BATTLE_STATE_ENUM.BEAT_BACK, true)
      end
      self:TriggerUnitAttrChanged(settleUnit)
      print("buff 生效，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
    end
    if param and param.deduceCount then
      self.deduceCount = self.deduceCount + param.deduceCount
    else
      self.deduceCount = self.deduceCount + 1
    end
    self.lastDeduceFrame = MiniGameBattleControl.curFixedFrame
    local deduceBuffList = self.buffConfig.deduce_buff_list
    if deduceBuffList and #deduceBuffList > 0 then
      MiniGameBattleBuffMgr.AnalysisBuffList(deduceBuffList, from, {to}, true, {
        triggerFromBuffUid = self.uid,
        overlayNum = param and param.deduceCount,
        targetUnitList = param and param.targetUnitList
      })
    end
    if settleUnit then
      if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_RANGE_HURT) then
        local range = settleUnit.range
        local fromUnit
        if self.fromUnitUid then
          fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
        end
        local skillConfig = TableData.GetConfig(fromUnit.passiveSkillId, "BaseShootSkill")
        local inRangeMonsterList = MiniGameBattleChoose.GetInRangeMonster(settleUnit, 1, range, range)
        for _, monster in ipairs(inRangeMonsterList) do
          if monster:IsAlive() then
            local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(fromUnit, monster, skillConfig)
            if hurt > 0 then
              local realNum = MiniGameBattleAction.DealHurt(fromUnit, monster, hurt, nil, hurtExtraParams)
            end
          end
        end
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_RANGE_HURT) then
        local fromUnit
        if self.fromUnitUid then
          fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
        end
        local widthAddRatio = MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_RANGE_ADD)
        local range_y = settleUnit.coverRadiusR * 2 * (10000 + widthAddRatio) / 10000
        local range_x = 3000
        local targetPosition = settleUnit.targetPosition
        local skillConfig = TableData.GetConfig(fromUnit.talentSkillId, "BaseShootSkill")
        local monsterList = MiniGameBattleChoose.GetInRangeMonsterByPosition(settleUnit.position, 3, range_x, range_y, targetPosition)
        for _, monster in ipairs(monsterList) do
          if monster:IsAlive() then
            local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(fromUnit, monster, skillConfig)
            if hurt > 0 then
              local realNum = MiniGameBattleAction.DealHurt(fromUnit, monster, hurt, nil, hurtExtraParams)
            end
          end
        end
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING) then
        local fromUnit
        if self.fromUnitUid then
          fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
        end
        if settleUnit:IsAlive() then
          local skillConfig = TableData.GetConfig(fromUnit.passiveSkillId, "BaseShootSkill")
          local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(fromUnit, settleUnit, skillConfig)
          if hurt > 0 then
            local realNum = MiniGameBattleAction.DealHurt(fromUnit, settleUnit, hurt, nil, hurtExtraParams)
          end
        end
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_RANGE_HURT) then
        local fromUnit
        if self.fromUnitUid then
          fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
        end
        local range_y = settleUnit.coverRadiusR
        local range_x = range_y
        local skillConfig = TableData.GetConfig(fromUnit.talentSkillId, "BaseShootSkill")
        local monsterList = MiniGameBattleChoose.GetInRangeMonsterByPosition(settleUnit.position, 1, range_x, range_y)
        for _, monster in ipairs(monsterList) do
          if monster:IsAlive() then
            local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(fromUnit, monster, skillConfig)
            if hurt > 0 then
              local realNum = MiniGameBattleAction.DealHurt(fromUnit, monster, hurt, nil, hurtExtraParams)
            end
          end
        end
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_PASSIVE_RANGE_HURT) then
        local fromUnit
        if self.fromUnitUid then
          fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
        end
        local rangeAdd = MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_PASSIVE_RANGE_ADD)
        local skillConfig = TableData.GetConfig(fromUnit.passiveSkillId, "BaseShootSkill")
        local range = skillConfig.range_x + rangeAdd
        MiniGameBattleActionDisplay.PlaySound(70940013, settleUnit.model)
        local inRangeMonsterList = MiniGameBattleChoose.GetInRangeMonster(settleUnit, skillConfig.range_type, range, range)
        for _, monster in ipairs(inRangeMonsterList) do
          if monster:IsAlive() then
            local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(fromUnit, monster, skillConfig)
            if hurt > 0 then
              local realNum = MiniGameBattleAction.DealHurt(fromUnit, monster, hurt, nil, hurtExtraParams)
            end
          end
        end
        MiniGameBattleActionDisplay.PlayEffect(skillConfig.effect, settleUnit.position, range / skillConfig.range_x)
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_TALENT_WALL_HP_ADD) then
        MiniGameBattleActionDisplay.PlaySound(70940015, MiniGameBattleScene.wallUnit.model)
        local value = self:GetEffectTotalValue(MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_TALENT_WALL_HP_ADD)
        MiniGameBattleAction.DealHurt(nil, settleUnit, -math.ceil(settleUnit:GetAttr(ATTR_ENUM.max_hp) * value / 10000))
      elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.BOSS_SUMMON) then
        local summonList = settleUnit.baseConfig.summon_list
        local range = settleUnit.baseConfig.summon_range
        for i = 1, 5 do
          local cardId = summonList[MiniGameBattleMgr.GetRandomNum(1, #summonList)]
          local randomAngle = MiniGameBattleMgr.GetRandomNum(0, 360)
          local dis = MiniGameBattleMgr.GetRandomNum(range / 2, range)
          local position = {
            x = settleUnit.position.x + dis * math.sin(randomAngle * math.pi / 180),
            y = settleUnit.position.y + dis * math.cos(randomAngle * math.pi / 180),
            z = 0
          }
          local summonUnit = MiniGameBattleSceneMgr.AddUnit({
            id = cardId,
            position = position,
            camp = settleUnit.camp,
            state = BATTLE_STATE_ENUM.START,
            summonFromUnitUid = settleUnit.uid,
            summonFromUnitId = settleUnit.id
          })
          table.insert(MiniGameBattleScene.aliveMonsterList, 1, summonUnit)
        end
      end
      if self.buffConfig.deduce_effect_path then
        MiniGameBattleActionDisplay.PlayEffect(self.buffConfig.deduce_effect_path, settleUnit.position, 1)
      end
    end
    if self:NeedRemove() then
      self:Remove()
    end
  end
  
  function buff:DealActiveForeverEffect(settleUnit)
    local hpValue = self:GetAttributeValue(ProtoEnum.ATTR_ID.HP)
    if settleUnit then
      print("buff 生效，触发属性的永久变化 buffId:", self.id, " 挂载方:", self.toUnitUid, hpValue)
    end
    if settleUnit and 0 ~= hpValue then
      local fromUnit
      if self.fromUnitUid then
        fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.fromUnitUid)
      end
      local realNum = MiniGameBattleAction.DealHurt(fromUnit, settleUnit, hpValue)
      fromUnit:SaveDamage(realNum)
      settleUnit:SaveDamaged(realNum, fromUnit and fromUnit.uid ~= settleUnit.uid)
      print("buff 生效改变血量：", hpValue, "buffId：", self.id, settleUnit.id)
    end
    return hpValue
  end
  
  function buff:ContainEffectId(effectId)
    if self.curState == BUFF_STATE_ENUM.SETTLED then
      return self.containEffect[effectId] or false
    else
      return self:ContainEffectIdBeforeSettle(effectId)
    end
  end
  
  function buff:GetEffectTotalValue(effectId)
    if self:ContainEffectId(effectId) == false then
      return
    end
    local effectList = self.effectList
    local v
    local totalValue = 0
    for i = 1, #effectList do
      v = effectList[i]
      if v.effectId == effectId then
        totalValue = totalValue + v.finalValue
      end
    end
    return totalValue
  end
  
  function buff:GetAttributeValue(attributeId)
    if self:ContainAttributeId(attributeId) ~= true then
      return 0, 0
    end
    local value = 0
    local valueMax = 0
    local v
    for i = 1, #self.effectList do
      v = self.effectList[i]
      if v.attributeId == attributeId then
        value = value + v.finalValue
      end
    end
    return value, valueMax
  end
  
  function buff:ContainAttributeId(attributeId)
    return 1 == self.containAttributeIdMap[attributeId]
  end
  
  function buff:Remove(isClear)
    if self.id == nil then
      return
    end
    if self.settleEffect then
      BattleResourceManager:DestroyGameObject(self.settleEffect)
      self.settleEffect = nil
    end
    if true ~= isClear then
      if self.toUnitUid then
        print("buff 移除，buffId:", self.id, " 挂载方:", self.toUnitUid, " buffUid:", self.uid)
      end
      if self.curState == BUFF_STATE_ENUM.TEMP then
        MiniGameBattleBuffMgr.UnRegisterSettleListener(self.uid, self.settleType)
      elseif self.curState == BUFF_STATE_ENUM.SETTLED then
        MiniGameBattleBuffMgr.UnRegisterDeduceListener(self.uid, self.deduceType)
        MiniGameBattleBuffMgr.UnRegisterRemoveListener(self.uid, self.removeType)
      end
      if self.curState == BUFF_STATE_ENUM.SETTLED and self.toUnitUid then
        local settleUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.toUnitUid)
        if settleUnit then
          settleUnit:RemoveBuff(self.uid, self.needShowBuffIcon)
          self:TriggerUnitAttrChanged(settleUnit, true)
          if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.TIME_PAUSE) and MiniGameBattleBuffMgr.GetContainedEffect(settleUnit, MINI_GAME_BUFF_EFFECT_ID.TIME_PAUSE) == false then
            settleUnit:SetTimePause(false)
          elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) and false == MiniGameBattleBuffMgr.GetContainedEffect(settleUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) then
            settleUnit:SetFreeze(false)
          end
          if true == self.destroyUnitWhenRemove then
            settleUnit:SetStateToDead()
          end
        end
      elseif self.toBulletUid then
        local settleBullet = MiniGameBattleSceneMgr.GetBulletByUid(self.toBulletUid)
        if settleBullet then
          settleBullet:RemoveBuff(self.uid)
        end
      end
      self:SetState(BUFF_STATE_ENUM.REMOVE)
      MiniGameBattleBuffMgr.RemoveFromBuffList(self.uid)
    end
    self:Destroy()
  end
  
  function buff:TriggerUnitAttrChanged(settleUnit, updateAttrCache)
    for i = 1, #self.effectList do
      local effect = self.effectList[i]
      if effect.attributeId and 0 ~= effect.attributeId then
        if true == updateAttrCache then
          settleUnit:UpdateAttrCacheFromBuff(effect.attributeId)
        end
        settleUnit:OnBuffAttrChanged(effect.attributeId, effect.finalValue)
      end
    end
  end
  
  function buff:NeedRemove()
    if self.deduceMaxCount < 0 then
      return false
    end
    if self.deduceCount < self.deduceMaxCount then
      return false
    end
    return true
  end
  
  function buff:Update(curFixedFrame)
    local isSettled = self.curState == BUFF_STATE_ENUM.SETTLED
    if isSettled then
      if self.deduceType == nil then
        return
      end
      local deducePerFrames = self.deducePerFrames
      if nil ~= deducePerFrames then
        local remove
        if curFixedFrame >= deducePerFrames + self.lastDeduceFrame then
          remove = self:Deduce()
        end
      end
    end
  end
  
  function buff:CanSettle()
    if self.toUnitUid then
      local toUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.toUnitUid)
      local overlayNum = self.buffConfig.overlay_num
      if overlayNum then
        local getSameBuffCount = MiniGameBattleBuffMgr.GetSettledBuffByUnitAndId(toUnit, self.id)
        if overlayNum <= getSameBuffCount then
          print("buff挂载时判断已经超过最大挂载数量限制，buffId:", self.id)
          return false
        end
      end
      if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) and MiniGameBattleBuffMgr.GetContainedEffect(toUnit, MINI_GAME_BUFF_EFFECT_ID.IMMUNE_FREEZE) or self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.BEAT_BACK) and MiniGameBattleBuffMgr.GetContainedEffect(toUnit, MINI_GAME_BUFF_EFFECT_ID.IMMUNE_BEAT_BACK) or self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.TIME_PAUSE) and MiniGameBattleBuffMgr.GetContainedEffect(toUnit, MINI_GAME_BUFF_EFFECT_ID.IMMUNE_TIME_PAUSE) then
        return false
      end
    end
    return true
  end
  
  function buff:SetState(state)
    self.curState = state
  end
  
  function buff:UpdateDisplay()
  end
  
  function buff:Destroy()
    if self.effectList then
      for i = 1, #self.effectList do
        self.effectList[i]:Destroy()
      end
    end
    self:Clear()
    self = nil
  end
  
  buff:Init()
  return buff
end
