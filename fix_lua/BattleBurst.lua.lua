BattleBurst = {}
local tonumber = tonumber
local min = math.min
local max = math.max
local BATTLE_CAMP_FLAG = BATTLE_CAMP_FLAG
local BUFF_EFFECT_ID = BUFF_EFFECT_ID

function BattleBurst.InitLocalVar()
end

function BattleBurst.NewBurst(burstId, camp)
  local burst = {
    id = nil,
    skillListById = {},
    camp = nil,
    enemyCamp = nil,
    curEnergy = nil,
    maxEnergy = nil,
    energyAdd = nil,
    energyAddByBuff = nil,
    energySkillLastFrame = nil,
    energySkillRemainFrame = nil,
    energySkillStartFrame = nil,
    energySkillLastChooseFrame = nil,
    burstConfig = nil,
    energyNeedJobs = nil,
    energySkillId = nil,
    energySkill = nil,
    nextEnergyChange = nil,
    energyChangeInterval = nil,
    lastActiveSkill = nil,
    buffUidList = {},
    cardBurstSkillInterval = nil,
    chooseCardIndex = nil,
    waitDealCardBurstSkillList = {},
    nextCardBurstWaitFrame = nil,
    directChoose = false,
    burstOrderSetting = nil,
    activeCount = 0,
    autoManuallySkillCache = {},
    triggerChooseAgainUnitUid = nil,
    nextChooseUnitUid = nil,
    cardBurstStartFrame = nil
  }
  
  function burst:AddBuff(uid)
    self.buffUidList[uid] = 1
  end
  
  function burst:RemoveBuff(uid)
    self.buffUidList[uid] = nil
  end
  
  function burst:Init()
    self.id = burstId
    self.camp = camp
    if camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
      self.burstOrderSetting = BattleData.burstOrderSettingLeft
    else
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
      self.burstOrderSetting = BattleData.burstOrderSettingRight
    end
    self.energyChangeInterval = 1
    self.nextEnergyChange = self.energyChangeInterval
    local burstConfig = TableData.GetConfig(self.id, "BaseBurst")
    self.burstConfig = burstConfig
    self.curEnergy = burstConfig.energy
    self.maxEnergy = burstConfig.energy_max
    self.energyAdd = burstConfig.energy_time
    self.energyAddByBuff = 0
    self.energySkillId = burstConfig.energy_skill
    self.energySkillLastFrame = burstConfig.energy_cycle * BATTLE_CONFIG_ENUM.FIXED_FPS
    self.energyNeedJobs = burstConfig.energy_need_jobs or {}
    self.energySkill = BattleBurstSkill.NewSkill(self.energySkillId, self.camp, self.id)
    self.cardBurstSkillInterval = burstConfig.energy_gap
  end
  
  function burst:GetSkill()
    return self.energySkill
  end
  
  function burst:GetEnergySkillState()
    if self.energySkillRemainFrame ~= nil then
      return BATTLE_BURST_STATE.ACTIVATED
    end
    if self.curEnergy < self.maxEnergy then
      return BATTLE_BURST_STATE.NOT_ACTIVATED
    end
    local needJobs = self.energyNeedJobs
    if 0 == #needJobs then
      return BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE
    else
      local aliveCards = BattleScene.GetAliveCardByCamp(self.camp)
      for _, v in ipairs(aliveCards) do
        if v.burstSkillWaitFrame <= 0 then
          return BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE
        end
      end
      return BATTLE_BURST_STATE.TO_BE_ACTIVATED_DISABLE
    end
    return BATTLE_BURST_STATE.TO_BE_ACTIVATED_ENABLE
  end
  
  function burst:ChangeEnergy(changeValue, changeValuePer)
    local value = 0
    if changeValue then
      value = value + changeValue
    end
    if changeValuePer then
      value = value + math.ceil(self.burstConfig.energy * changeValuePer / 10000)
    end
    if 0 ~= value then
      self:UpdateEnergy(value)
    end
  end
  
  function burst:ChangeEnergyAdd(changeValue)
    self.energyAddByBuff = self.energyAddByBuff + changeValue
  end
  
  function burst:UpdateEnergyPerFrame()
    self:UpdateEnergy(self.energyAdd + self.energyAddByBuff)
  end
  
  function burst:GetEffectValue(effectId, skillLevelUpId)
    local buffUidList = self.buffUidList
    local buff
    local value = 0
    local savedBuffList = BattleBuffMgr.savedBuffList
    local effectList
    for uid in pairs(buffUidList) do
      buff = savedBuffList[uid]
      if buff then
        effectList = buff:GetEffectListById(effectId)
        if #effectList > 0 then
          for _, effect in ipairs(effectList) do
            if effect:IsEffectiveForSkill(skillLevelUpId) == true then
              value = value + effect.finalValue
            end
          end
        end
      end
    end
    return value
  end
  
  function burst:ContainBuffId(buffId)
    local buffUidList = self.buffUidList
    local buff
    local savedBuffList = BattleBuffMgr.savedBuffList
    for uid, enbale in pairs(buffUidList) do
      buff = savedBuffList[uid]
      if buff and buff.id == buffId then
        return true
      end
    end
    return false
  end
  
  function burst:UpdateEnergy(changeValue)
    self.curEnergy = max(0, min(self.maxEnergy, self.curEnergy + changeValue))
    if self.curEnergy >= self.maxEnergy then
      self.nextEnergyChange = nil
      BattleBuffMgr.TriggerCampListener(self.camp, BUFF_DEDUCE_TYPE.ENERGY_FULL)
    end
  end
  
  function burst:SaveLastActiveSkill(skillId)
    self.lastActiveSkill = skillId
  end
  
  function burst:DealCardBurstStart()
    if self.cardBurstStartFrame == BattleControl.curFixedFrame then
      self:DealCardBurst(true)
    end
  end
  
  function burst:Update()
    local frame = self.energySkillRemainFrame
    if frame and frame > 0 then
      frame = frame - 1
      if frame <= 0 then
        self:StopEnergySkill()
      else
        self.energySkillRemainFrame = frame
        local waitFrame = self.nextCardBurstWaitFrame
        if waitFrame and waitFrame > 0 then
          waitFrame = waitFrame - 1
          self.nextCardBurstWaitFrame = waitFrame
          if waitFrame <= 0 then
            self:DealCardBurst()
          end
        end
        self:DealChooseCardProcess()
      end
    end
  end
  
  function burst:DealChooseCardProcess()
    local curFixedFrame = BattleControl.curFixedFrame
    local savedBurstChooseCardInfos = BattleData.savedBurstChooseCardInfos[self.camp]
    if BattleMgr.isBattleServer == true and savedBurstChooseCardInfos then
      for _, info in ipairs(savedBurstChooseCardInfos) do
        if info.chooseCostFrame == curFixedFrame then
          local chooseCard = BattleScene.GetUnitByUid(info.unitUid)
          if chooseCard.id == SPECIAL_CARD_OR_MONSTER.LASITE then
            self.nextChooseUnitUid = info.unitUid
          end
          self:AddEnergySkillCard(chooseCard, info.chooseCostFrame)
          BattleScene.UpdateSkillInfo({
            camp = self.camp,
            skillId = self.energySkillId,
            frame = self.energySkillStartFrame,
            burstId = self.id,
            burstChooseCardInfos = SimpleCopy(self.waitDealCardBurstSkillList)
          })
          self.nextChooseUnitUid = nil
        end
      end
      if BattleData.savedBurstCardSkillStartFrame[self.camp] == curFixedFrame then
        self.cardBurstStartFrame = curFixedFrame
      end
    elseif self.chooseCardConfig then
      local curChooseCardConfig = self.chooseCardConfig[self.chooseCardIndex]
      if curChooseCardConfig and curChooseCardConfig.alreadyChoose == false then
        if BattleMgr.isBattleServer == false and self.camp == BATTLE_CAMP_FLAG.LEFT then
          if self.energySkillLastChooseFrame + curChooseCardConfig.updateListDelayFrame + self.nextCardChooseDelay == curFixedFrame then
            local allCannotChoose = self:IsAllCardCannotChooseByJob(curChooseCardConfig.unitType)
            if true == allCannotChoose then
              if curChooseCardConfig.unitType == BATTLE_UNIT_TYPE.RANGED_ATTACK and BattleScene.GetAliveUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp) then
                self.nextChooseUnitUid = BattleScene.GetAliveUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp).uid
                BattleControl.SlowTime(BATTLE_CONFIG_ENUM.BURST_SLOW_TIMESCALE_RATIO)
                UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_CHOOSE_CARD_LIST)
              else
                curChooseCardConfig.alreadyChoose = true
                if self.chooseCardIndex >= #self.chooseCardConfig then
                  UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BURST_CARD_CHOOSE_END)
                else
                  self.nextCardChooseDelay = BATTLE_CONFIG_ENUM.BURST_CHOOSE_CARD_ANIMATION_OUT_FRAME
                  self.chooseCardIndex = self.chooseCardIndex + 1
                  self:DealChooseCardProcess()
                end
              end
            else
              BattleControl.SlowTime(BATTLE_CONFIG_ENUM.BURST_SLOW_TIMESCALE_RATIO)
              UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_CHOOSE_CARD_LIST)
            end
          elseif self.energySkillLastChooseFrame + curChooseCardConfig.delayFrame + self.nextCardChooseDelay == curFixedFrame then
            local allCannotChoose = self:IsAllCardCannotChooseByJob(curChooseCardConfig.unitType)
            if true == allCannotChoose then
              curChooseCardConfig.alreadyChoose = true
              self:AddEnergySkillCard(nil, curFixedFrame, nil, curChooseCardConfig.unitType)
              BattleScene.UpdateSkillInfo({
                camp = self.camp,
                skillId = self.energySkillId,
                frame = self.energySkillStartFrame,
                burstId = self.id,
                burstChooseCardInfos = SimpleCopy(self.waitDealCardBurstSkillList)
              })
              if self.chooseCardIndex > #self.chooseCardConfig then
                UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BURST_CARD_CHOOSE_END)
              else
                self:DealChooseCardProcess()
              end
            else
              UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_START_CHOOSE_CARD_TIMER)
              if BattleData.isAuto or self.nextChooseUnitUid then
                curChooseCardConfig.alreadyChoose = true
                local chooseCard
                local clearNextChooseUnitUid = false
                if self.nextChooseUnitUid then
                  chooseCard = BattleScene.GetUnitByUid(self.nextChooseUnitUid)
                  clearNextChooseUnitUid = true
                else
                  chooseCard = self:ChooseEnergySkillCard(curChooseCardConfig.unitType)
                end
                UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_AUTO_CHOOSE_CARD, {card = chooseCard, frame = curFixedFrame})
                if clearNextChooseUnitUid then
                  self.nextChooseUnitUid = nil
                end
              end
            end
          end
        elseif BattleData.isAuto or IsBattleTest and self.camp == BATTLE_CAMP_FLAG.RIGHT then
          if self.energySkillLastChooseFrame + curChooseCardConfig.updateListDelayFrame + self.nextCardChooseDelay == curFixedFrame then
            local allCannotChoose = self:IsAllCardCannotChooseByJob(curChooseCardConfig.unitType)
            if true == allCannotChoose then
              if curChooseCardConfig.unitType == BATTLE_UNIT_TYPE.RANGED_ATTACK and BattleScene.GetAliveUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp) then
                self.nextChooseUnitUid = BattleScene.GetAliveUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp).uid
              else
                curChooseCardConfig.alreadyChoose = true
                if self.chooseCardIndex >= #self.chooseCardConfig then
                  self.cardBurstStartFrame = curFixedFrame
                else
                  self.nextCardChooseDelay = BATTLE_CONFIG_ENUM.BURST_CHOOSE_CARD_ANIMATION_OUT_FRAME
                  self.chooseCardIndex = self.chooseCardIndex + 1
                  self:DealChooseCardProcess()
                end
              end
            end
          end
          if self.energySkillLastChooseFrame + curChooseCardConfig.delayFrame + self.nextCardChooseDelay == curFixedFrame then
            curChooseCardConfig.alreadyChoose = true
            local chooseCard = self:ChooseEnergySkillCard(curChooseCardConfig.unitType)
            self:AddEnergySkillCard(chooseCard, curFixedFrame, nil, curChooseCardConfig.unitType)
            BattleScene.UpdateSkillInfo({
              camp = self.camp,
              skillId = self.energySkillId,
              frame = self.energySkillStartFrame,
              burstId = self.id,
              burstChooseCardInfos = SimpleCopy(self.waitDealCardBurstSkillList)
            })
            if self.chooseCardIndex > #self.chooseCardConfig then
              self.cardBurstStartFrame = curFixedFrame
            end
          end
        end
      end
    end
  end
  
  local type_defense = BATTLE_UNIT_TYPE.DEFENSE
  local type_melee_attack = BATTLE_UNIT_TYPE.MELEE_ATTACK
  local type_range_attack = BATTLE_UNIT_TYPE.RANGED_ATTACK
  local type_support = BATTLE_UNIT_TYPE.SUPPORT
  
  function burst:AddEnergySkillCard(battleUnit, chooseCostFrame, forceForTest, unitType)
    if battleUnit then
      for i, v in ipairs(self.waitDealCardBurstSkillList) do
        if v.unitUid == battleUnit.uid then
          return false
        end
        local unit = BattleScene.GetUnitByUid(v.unitUid)
        if unit and self.triggerChooseAgainUnitUid == nil and unit.battleUnitType == battleUnit.battleUnitType then
          if self.nextChooseUnitUid then
            if self.nextChooseUnitUid == unit.uid then
              return false
            end
          else
            return false
          end
        end
      end
    end
    local chooseCardIndexChange = false
    self.energySkillLastChooseFrame = chooseCostFrame
    self.nextCardChooseDelay = BATTLE_CONFIG_ENUM.BURST_CHOOSE_CARD_ANIMATION_OUT_FRAME
    if true ~= forceForTest and BattleBuffMgr.ContainEffectId(battleUnit, BUFF_EFFECT_ID.BURST_CHOOSE_AGAIN) and self:IsAllCardCannotChooseByJob(battleUnit.battleUnitType) == false then
      self.triggerChooseAgainUnitUid = battleUnit.uid
      local config = self.chooseCardConfig[self.chooseCardIndex]
      config.alreadyChoose = false
    else
      self.triggerChooseAgainUnitUid = nil
      self.chooseCardIndex = self.chooseCardIndex + 1
      chooseCardIndexChange = true
    end
    if battleUnit then
      table.insert(self.waitDealCardBurstSkillList, {
        unitUid = battleUnit.uid,
        skillId = battleUnit.burstSkill,
        alreadyDeal = false,
        chooseCostFrame = chooseCostFrame
      })
    else
      table.insert(self.waitDealCardBurstSkillList, {
        unitUid = 0,
        skillId = 0,
        alreadyDeal = false,
        chooseCostFrame = chooseCostFrame
      })
    end
    if unitType == BATTLE_UNIT_TYPE.RANGED_ATTACK and true == chooseCardIndexChange and nil == self.nextChooseUnitUid then
      local lasiteUnit = BattleScene.GetAliveUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp)
      if lasiteUnit then
        self.chooseCardIndex = self.chooseCardIndex - 1
        self.nextChooseUnitUid = lasiteUnit.uid
        local config = self.chooseCardConfig[self.chooseCardIndex]
        config.alreadyChoose = false
      end
    end
  end
  
  function burst:SaveAutoManuallySkill(manuallySkillId)
    if table.contain(self.autoManuallySkillCache, manuallySkillId) == false then
      table.insert(self.autoManuallySkillCache, manuallySkillId)
    end
  end
  
  function burst:GetCurUnitType()
    if self.chooseCardConfig then
      local curChooseCardConfig = self.chooseCardConfig[self.chooseCardIndex]
      if curChooseCardConfig then
        return curChooseCardConfig.unitType
      end
    end
  end
  
  function burst:StartEnergySkill()
    if self.energySkillRemainFrame == nil then
      self.autoManuallySkillCache = {}
      self.energySkillRemainFrame = self.energySkillLastFrame
      self.energySkillStartFrame = BattleControl.curFixedFrame
      self.energySkillLastChooseFrame = self.energySkillStartFrame
      self.chooseCardIndex = 1
      self.activeCount = self.activeCount + 1
      if 1 == self.activeCount % 2 then
        local unitList = BattleScene.GetUnitListByCamp(self.camp)
        for _, unit in ipairs(unitList) do
          if unit.id == SPECIAL_CARD_OR_MONSTER.MENG_NA then
            unit:DealTriggerSkillAll(TRIGGER_CONDITION.BURST_ODD_NUMBER)
          end
        end
      end
      self.triggerChooseAgainUnitUid = nil
      self.nextChooseUnitUid = nil
      self:UpdateEnergy(-self.maxEnergy)
      self.energySkill:TriggerSkillBuff()
      local unitList = BattleScene.GetUnitListByCampDirect(self.camp)
      for i, v in ipairs(unitList) do
        if v:IsAlive() then
          BattleBuffMgr.TriggerUnitListener(v, BUFF_DEDUCE_TYPE.SELF_BURST_START)
        end
      end
      local sameCampUnit = BattleScene.GetUnitListByCampDirect(self.camp)
      for _, v in ipairs(sameCampUnit) do
        v:DealTriggerPassiveSkill(TRIGGER_CONDITION.BURST_START)
      end
      self.waitDealCardBurstSkillList = {}
      self.nextCardChooseDelay = 0
      if 0 ~= #self.energyNeedJobs then
        local animationInFrame = BATTLE_CONFIG_ENUM.BURST_CHOOSE_CARD_ANIMATION_IN_FRAME
        self.chooseCardConfig = {
          {
            updateListDelayFrame = 0,
            delayFrame = animationInFrame,
            unitType = type_defense,
            alreadyChoose = false,
            chooseUid = nil
          },
          {
            updateListDelayFrame = 0,
            delayFrame = animationInFrame,
            unitType = type_melee_attack,
            alreadyChoose = false,
            chooseUid = nil
          },
          {
            updateListDelayFrame = 0,
            delayFrame = animationInFrame,
            unitType = type_support,
            alreadyChoose = false,
            chooseUid = nil
          },
          {
            updateListDelayFrame = 0,
            delayFrame = animationInFrame,
            unitType = type_range_attack,
            alreadyChoose = false,
            chooseUid = nil
          }
        }
      else
        local campCards = BattleScene.GetUnitListByCamp(self.camp)
        for _, v in ipairs(campCards) do
          if nil ~= v.burstSkill and v.burstHaveTrigger ~= true and v.burstSkillWaitFrame <= 0 and false == v:IsDead() and false == v:IsDestroy() then
            self:AddEnergySkillCard(v, 1, true)
          end
        end
      end
      BattleScene.AddSkillInfo({
        camp = self.camp,
        skillId = self.energySkillId,
        frame = BattleControl.curFixedFrame,
        burstId = self.id,
        burstChooseCardInfos = {}
      })
      if false == BattleMgr.isBattleServer and self.camp == BATTLE_CAMP_FLAG.LEFT then
        BattleScene.PlayBoomShow(true)
      end
      if 0 == #self.energyNeedJobs and (BattleMgr.isTestBalance or IsBattleTest and self.camp == BATTLE_CAMP_FLAG.RIGHT) then
        self.cardBurstStartFrame = BattleControl.curFixedFrame
      end
    end
  end
  
  function burst:ChooseEnergySkillCard(unitType)
    if self.nextChooseUnitUid then
      return BattleScene.GetUnitByUid(self.nextChooseUnitUid)
    end
    local campCards = BattleScene.GetAliveCardByCamp(self.camp)
    local orderSetting
    if self.burstOrderSetting then
      for _, v in ipairs(self.burstOrderSetting) do
        if v.job == unitType then
          orderSetting = v.cardList
          break
        end
      end
    end
    local chooseCardAlive, tempCard
    if orderSetting and #orderSetting > 0 then
      local curIndex = self.activeCount % #orderSetting
      if 0 == curIndex then
        curIndex = #orderSetting
      end
      for i = curIndex, curIndex + #orderSetting - 1 do
        local uid = orderSetting[i]
        if nil == uid then
          uid = orderSetting[i - #orderSetting]
        end
        local unit = BattleScene.GetUnitByUid(uid)
        if unit and nil ~= unit.burstSkill and unit.burstHaveTrigger ~= true and unit.burstSkillWaitFrame <= 0 and unit.battleUnitType == unitType and uid ~= self.triggerChooseAgainUnitUid and unit:IsDead() == false and false == unit:IsDestroy() then
          chooseCardAlive = unit
          break
        end
      end
    end
    if chooseCardAlive then
      return chooseCardAlive
    end
    for _, v in ipairs(campCards) do
      if nil ~= v.burstSkill and v.burstHaveTrigger ~= true and v.burstSkillWaitFrame <= 0 and v.battleUnitType == unitType and v.uid ~= self.triggerChooseAgainUnitUid then
        if v:IsDead() == false and false == v:IsDestroy() then
          chooseCardAlive = v
          break
        elseif nil == tempCard then
          tempCard = v
        end
      end
    end
    if chooseCardAlive then
      return chooseCardAlive
    end
    return tempCard
  end
  
  function burst:IsAllCardCannotChooseByJob(unitType)
    if self.nextChooseUnitUid then
      local unit = BattleScene.GetUnitByUid(self.nextChooseUnitUid)
      if unit and unit:IsAlive() then
        return false, {unit}
      else
        return true
      end
    end
    local tempCardForChoose = {}
    local allCards = BattleScene.GetAllUnit()
    local notIncludeUnit
    if self.triggerChooseAgainUnitUid then
      notIncludeUnit = BattleScene.GetUnitByUid(self.triggerChooseAgainUnitUid)
    end
    for i, v in ipairs(allCards) do
      if v.camp == self.camp and v.battleUnitType == unitType and v.burstSkill ~= nil and v.burstHaveTrigger ~= true and (nil == notIncludeUnit or notIncludeUnit.uid ~= v.uid) then
        table.insert(tempCardForChoose, v)
      end
    end
    local isAllDead = true
    local isAllBurstSkillCD = true
    for i, v in ipairs(tempCardForChoose) do
      if v:IsAlive() then
        isAllDead = false
        if v.burstSkillWaitFrame <= 0 then
          isAllBurstSkillCD = false
        end
      end
    end
    local allCannotChoose = isAllDead or isAllBurstSkillCD
    if true == allCannotChoose then
    end
    return allCannotChoose, tempCardForChoose
  end
  
  function burst:ChooseAutoBurstSkillUnit(unitType)
    if unitType == BATTLE_UNIT_TYPE.RANGED_ATTACK then
      local lasiteUnit = BattleScene.GetUnitById(SPECIAL_CARD_OR_MONSTER.LASITE, self.camp)
      if lasiteUnit and lasiteUnit:IsAlive() then
        self:AddEnergySkillCard(lasiteUnit, BattleControl.curFixedFrame)
        BattleScene.UpdateSkillInfo({
          camp = self.camp,
          skillId = self.energySkillId,
          frame = self.energySkillStartFrame,
          burstId = self.id,
          burstChooseCardInfos = SimpleCopy(self.waitDealCardBurstSkillList)
        })
      end
    end
  end
  
  function burst:IsAllCardSkillDeal()
    local waitList = self.waitDealCardBurstSkillList
    local result = true
    for i, v in ipairs(waitList) do
      if v.alreadyDeal == false then
        result = false
        break
      end
    end
    return result
  end
  
  function burst:DealCardBurst(triggerChooseComplete)
    if true == triggerChooseComplete then
      self.cardBurstStartFrame = nil
      local waitList = self.waitDealCardBurstSkillList
      BattleScene.UpdateSkillStartFrameInfo(self.camp, self.energySkillStartFrame, BattleControl.curFixedFrame)
      for _, v in ipairs(waitList) do
        local uid = v.unitUid
        local unit = BattleScene.GetUnitByUid(uid)
        if unit then
          unit:ResetBurstSkillFrame()
        end
      end
      for _, v in ipairs(waitList) do
        local uid = v.unitUid
        local unit = BattleScene.GetUnitByUid(uid)
        if unit then
          unit:DealTriggerSkillAll(TRIGGER_CONDITION.BURST_CHOOSE_CARD_COMPLETE)
        end
      end
      if BattleMgr.isBattleServer == false and self.camp == BATTLE_CAMP_FLAG.LEFT then
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_BURST)
      end
    end
    if nil == self.nextCardBurstWaitFrame or self.nextCardBurstWaitFrame <= 0 then
      local waitList = self.waitDealCardBurstSkillList
      local curNeedDealBurstSkillInfo
      for _, v in ipairs(waitList) do
        if false == v.alreadyDeal or true == BattleSkillWait.IsSkillWait(v.unitUid, v.skillId) then
          curNeedDealBurstSkillInfo = v
          break
        end
      end
      if curNeedDealBurstSkillInfo then
        local unitUid = curNeedDealBurstSkillInfo.unitUid
        local unit = BattleScene.GetUnitByUid(unitUid)
        if nil == unit or true == unit:IsDead() or true == unit:IsDestroy() then
          BattleSkillWait.RemoveSkillWait(unitUid, curNeedDealBurstSkillInfo.skillId)
          curNeedDealBurstSkillInfo.alreadyDeal = true
          self:DealCardBurst()
        elseif false == curNeedDealBurstSkillInfo.alreadyDeal then
          BattleAction.DealTriggerBurstSkill(unit)
          curNeedDealBurstSkillInfo.alreadyDeal = true
        end
      end
    end
  end
  
  function burst:ResetCardBurstWaitFrame()
    self.nextCardBurstWaitFrame = self.cardBurstSkillInterval
  end
  
  function burst:StopEnergySkill()
    self.nextCardBurstWaitFrame = nil
    self:ClearCardBurstSkill()
    self.energySkillRemainFrame = nil
    self.energySkillStartFrame = nil
    self.autoManuallySkillCache = {}
    local sameCampUnit = BattleScene.GetUnitListByCampDirect(self.camp)
    for _, v in ipairs(sameCampUnit) do
      BattleBuffMgr.TriggerUnitListener(v, BUFF_DEDUCE_TYPE.ENERGY_SKILL_END)
    end
    local enemyCampUnit = BattleScene.GetUnitListByCampDirect(self.enemyCamp)
    for _, v in ipairs(enemyCampUnit) do
      BattleBuffMgr.TriggerUnitListener(v, BUFF_DEDUCE_TYPE.ENEMY_ENERGY_SKILL_END)
    end
    self.nextEnergyChange = self.energyChangeInterval + 1
    if BattleMgr.isBattleServer == false and self.camp == BATTLE_CAMP_FLAG.LEFT then
      BattleScene.PlayBoomShow(false)
    end
  end
  
  function burst:ClearCardBurstSkill()
    local list = self.waitDealCardBurstSkillList
    for i, v in ipairs(list) do
      if v.alreadyDeal == true and BattleSkillWait.IsSkillWait(v.unitUid, v.skillId) then
        BattleSkillWait.RemoveSkillWait(v.unitUid, v.skillId)
      end
    end
    self.waitDealCardBurstSkillList = {}
  end
  
  function burst:UpdateEnergyFrameEnd()
    if self.nextEnergyChange then
      self.nextEnergyChange = self.nextEnergyChange - 1
      if self.nextEnergyChange <= 0 then
        self.nextEnergyChange = self.energyChangeInterval
        self:UpdateEnergyPerFrame()
      end
    end
  end
  
  function burst:ClearData()
    self.energySkill = nil
    self.chooseCardConfig = nil
  end
  
  function burst:DestroySkills()
    if self.energySkill then
      self.energySkill:Destroy()
    end
  end
  
  function burst:Destroy()
    self:DestroySkills()
    self.burstConfig = nil
    self:ClearData()
    self = nil
  end
  
  burst:Init()
  return burst
end
