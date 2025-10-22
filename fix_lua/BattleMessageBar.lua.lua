BattleMessageBar = {}
local min = math.min
local ceil = math.ceil

function BattleMessageBar.BindInfo(unit)
  require("CommonResource_PlayerHPByName")
  require("CommonResource_PlayerBuffByName")
  local headInfo = {
    buffListInfo = {},
    headObject = nil,
    curProgressBar = nil,
    rageProgressBar = nil,
    defenseProgressBar = nil,
    firmProgressBar = nil,
    soulProgressBar = nil,
    buildingScale = nil,
    uiPanel = nil,
    percentageTxt = nil,
    rageTxt = nil,
    defenseTxt = nil,
    buffList = nil,
    headInfoObj = nil,
    originParent = nil,
    c1Ctr = nil,
    c2Ctr = nil,
    c3Ctr = nil,
    monsterCtr = nil,
    barWidth = nil
  }
  
  function headInfo:Init(bindUnit)
    self.originParent = bindUnit.model or bindUnit.effectModel
    local headInfoUI = self.originParent.transform:Find("HeadInfo")
    if nil == headInfoUI then
      self.originParent = nil
      return
    end
    self.headInfoObj = headInfoUI.gameObject
    if self.headInfoObj then
      self.headInfoObj:SetActiveSafe(true)
      self.uiPanel = self.headInfoObj.transform:GetComponent(typeof(FairyGUI.UIPanel))
      self.headObject = self.uiPanel.ui
      local unitScale = bindUnit.fashionScale
      self.headObject.scaleX = 5.25 / unitScale
      self.headObject.scaleY = 5.25 / unitScale
      if bindUnit.camp == BATTLE_CAMP_FLAG.LEFT and bindUnit.isBuilding == false and nil == bindUnit.summonId then
        bindUnit.showHeadInList = true
        UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_ADD_HEAD, {unit = bindUnit})
      end
      self.lastHp = bindUnit:GetHp()
      self.lastShield = bindUnit:GetAttr(ATTR_ENUM.shield)
      self.lastTenacity = bindUnit:GetAttr(ATTR_ENUM.tenacity)
      self.lastShieldSpecial = bindUnit:GetAttr(ATTR_ENUM.shield_special)
      self.haveRage = bindUnit.haveRage
      local uis = GetCommonResource_PlayerHPUis(self.headObject)
      self.c1Ctr = uis.c1Ctr
      self.c2Ctr = uis.c2Ctr
      self.c3Ctr = uis.c3Ctr
      self.monsterCtr = uis.monsterCtr
      self.rageProgressBar = uis.RageProgressBar
      self.defenseProgressBar = uis.DefenseProgressBar
      self.defenseProgressBar.visible = false
      self.rageTxt = uis.RageTxt
      self.defenseTxt = uis.DefenseTxt
      self.percentageTxt = uis.PercentageTxt
      self.buffList = uis.BuffList
      self:UpdateVisible()
      self:UpdateBuffVisible()
      if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
        self.c1Ctr.selectedIndex = 1
      else
        self.c1Ctr.selectedIndex = 0
      end
      if bindUnit.isMonster then
        self.c2Ctr.selectedIndex = 1
        local monsterRank = bindUnit.monsterRank
        if monsterRank == BATTLE_MONSTER_RANK.NORMAL or monsterRank == BATTLE_MONSTER_RANK.ELITE then
          self.curProgressBar = uis.HpMonsterProgressBar
        elseif monsterRank == BATTLE_MONSTER_RANK.BOSS then
          self.curProgressBar = uis.HpEliteProgressBar
        elseif monsterRank == BATTLE_MONSTER_RANK.LORD or monsterRank == BATTLE_MONSTER_RANK.DISASTER then
          self.curProgressBar = uis.HpBossProgressBar
        end
        self.monsterCtr.selectedIndex = bindUnit.monsterRank
      elseif bindUnit.isBuilding then
        self.curProgressBar = uis.HpBuildProgressBar
        self.buildingScale = self.curProgressBar:GetChild("ScaleStrip")
        self.c2Ctr.selectedIndex = 2
        self.monsterCtr.selectedIndex = 0
      else
        if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT then
          self.c2Ctr.selectedIndex = 1
          self.curProgressBar = uis.HpMonsterProgressBar
        else
          self.c2Ctr.selectedIndex = 0
          self.curProgressBar = uis.HpProgressBar
        end
        self.monsterCtr.selectedIndex = 0
      end
      self.curProgressBar.value = 100
      self.barWidth = self.curProgressBar:GetChild("bar").width
      self.firmProgressBar = self.curProgressBar:GetChild("FirmProgressBar")
      self.soulProgressBar = self.curProgressBar:GetChild("SoulProgressBar")
      uis.BuffList.isReverse = true
      self:UpdateHp(bindUnit, true)
      if true == self.haveRage then
        self.rageProgressBar.visible = true
        self:UpdateRage(bindUnit)
        self.rageTxt.visible = true
      else
        self.rageProgressBar.visible = false
        self.rageTxt.visible = false
      end
      if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer then
        self.rageTxt.visible = false
        self.percentageTxt.visible = false
        self.defenseTxt.visible = false
      elseif true == BattleMgr.showCardUidTest and uis.UIDTxt then
        uis.UIDTxt.visible = true
        uis.UIDTxt.text = bindUnit.uid
      end
      if bindUnit.isBuilding == true and nil ~= self.buildingScale then
        self.buildingScale:RemoveChildren(0, -1, true)
        local maxHp = bindUnit:GetAttr(ATTR_ENUM.max_hp)
        if maxHp > 1 then
          local startX = 0
          local intervalX = self.buildingScale.width / maxHp
          for i = 1, maxHp - 1 do
            local scale = UIMgr:CreateObject("CommonResource", "Scale")
            self.buildingScale:AddChild(scale)
            scale.x = startX + i * intervalX
          end
        end
      end
      self.c3Ctr.selectedIndex = 1
    end
  end
  
  function headInfo:UpdateHp(bindUnit, isInit)
    local lastHp = self.lastHp
    local nowHp = bindUnit:GetHp()
    local maxHp = bindUnit:GetAttr(ATTR_ENUM.max_hp)
    if bindUnit.camp == BATTLE_CAMP_FLAG.RIGHT and BattleData.stageType == ProtoEnum.SCENE_TYPE.BOSS_CHALLENGE and RaidBossMgr.IsHardestLevel(BattleData.stageId) then
      nowHp = maxHp
    end
    local lastShield = self.lastShield
    local lastTenacity = self.lastTenacity
    local lastShieldSpecial = self.lastShieldSpecial
    local nowShield = bindUnit:GetAttr(ATTR_ENUM.shield)
    local nowTenacity = bindUnit:GetAttr(ATTR_ENUM.tenacity)
    local nowShieldSpecial = bindUnit:GetAttr(ATTR_ENUM.shield_special)
    local nowValue = nowHp + nowShield
    local lastValue = lastHp + lastShield
    local targetValue = 100 * nowValue / maxHp
    if targetValue < 0 then
      targetValue = 0
    elseif targetValue > 100 then
      targetValue = 100
    end
    if nowShield > 0 then
      self.defenseProgressBar.visible = true
    else
      self.defenseProgressBar.visible = false
    end
    local tenacityPer
    if nowTenacity > 0 then
      self.firmProgressBar.visible = true
      tenacityPer = nowTenacity / bindUnit.tenacityMax
      self.firmProgressBar.value = 100 * tenacityPer
    else
      tenacityPer = 0
      self.firmProgressBar.visible = false
    end
    local shieldSpecialPer
    if self.soulProgressBar then
      if nowShieldSpecial > 0 then
        self.soulProgressBar.visible = true
        shieldSpecialPer = nowShieldSpecial / bindUnit.shieldSpecialMax
        self.soulProgressBar.value = 100 * shieldSpecialPer
      else
        shieldSpecialPer = 0
        self.soulProgressBar.visible = false
      end
    end
    local hpPer
    local defenseValue = 0
    if maxHp <= nowValue then
      hpPer = nowHp / nowValue
      local value = 100 * hpPer
      if isInit then
        self.curProgressBar:SetValue(value)
      else
        self.curProgressBar.value = value
      end
      local hpWidth = math.floor(self.barWidth * value / 100)
      self.defenseProgressBar.x = self.curProgressBar.x + hpWidth
      defenseValue = 100 * (self.barWidth - hpWidth) / self.barWidth
      self.defenseProgressBar.value = defenseValue
    else
      hpPer = nowHp / maxHp
      local value = 100 * hpPer
      if isInit then
        self.curProgressBar:SetValue(value)
      else
        self.curProgressBar.value = value
      end
      local hpWidth = math.floor(self.barWidth * value / 100)
      self.defenseProgressBar.x = self.curProgressBar.x + hpWidth
      defenseValue = 100 * nowShield / maxHp
      self.defenseProgressBar.value = defenseValue
    end
    if nowShield > 0 then
      self.defenseTxt.text = nowShield
    else
      self.defenseTxt.text = ""
    end
    local num = ceil(100 * nowHp / maxHp)
    self.percentageTxt.text = num .. "%"
    self.lastHp = nowHp
    self.lastShield = nowShield
    self.lastTenacity = nowTenacity
    self.lastShieldSpecial = nowShieldSpecial
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_HP_CHANGE, {
        hpValue = targetValue,
        defenseValue = defenseValue,
        hpPer = hpPer,
        tenacityPer = tenacityPer,
        shieldSpecialPer = shieldSpecialPer
      })
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {
          defenseValue = defenseValue,
          hpPer = hpPer,
          tenacityPer = tenacityPer,
          shieldSpecialPer = shieldSpecialPer
        }
      })
    end
  end
  
  function headInfo:UpdateRage(bindUnit)
    local nowRage = bindUnit:GetRage()
    local maxRage = bindUnit:GetAttr(ATTR_ENUM.max_rage)
    local value = min(100 * nowRage / maxRage, 100)
    if self.headObject and self.headObject.visible then
      if 100 == value or 0 == value then
        self.rageProgressBar:TweenValue(value, 0.3)
      else
        self.rageProgressBar:TweenValue(value, 0.5)
      end
      self.lastRage = nowRage
      self.rageTxt.text = nowRage
    end
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_RAGE_CHANGE, value)
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {rageValue = value}
      })
    end
  end
  
  function headInfo:UpdateBuffList(bindUnit)
    local buffDataList = bindUnit:GetBuffIconList()
    if self.headObject and self.headObject.visible and self.buffList then
      local maxCount = math.max(#self.buffListInfo, #buffDataList)
      for i = 1, maxCount do
        self:CreateOneBuff(buffDataList[i], i)
      end
    end
    if bindUnit.showBossMessage then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_BOSS_BUFF_CHANGE, {
        barInfo = {buffDataList = buffDataList}
      })
    end
    if bindUnit.showHeadInList then
      UIMgr:SendWindowMessage(WinResConfig.BattleUIWindow.name, WindowMsgEnum.BattleUIWindow.E_MSG_UPDATE_HEAD, {
        unit = bindUnit,
        barInfo = {buffDataList = buffDataList}
      })
    end
  end
  
  function headInfo:CreateOneBuff(data, index)
    local item, buffLoader, buffIconProgressBar, numberTxt
    local info = self.buffListInfo[index]
    if nil == info then
      item = self.buffList:AddItemFromPool()
      local uis = GetCommonResource_PlayerBuffUis(item)
      buffLoader = uis.BuffLoader
      buffIconProgressBar = uis.BuffIconProgressBar
      numberTxt = uis.NumberTxt
      self.buffListInfo[index] = {
        item = item,
        buffLoader = buffLoader,
        buffIconProgressBar = buffIconProgressBar,
        numberTxt = numberTxt
      }
      item.alpha = 1
    else
      item = info.item
      if nil == data then
        item.alpha = 0
        return
      end
      item.alpha = 1
      buffLoader = info.buffLoader
      buffIconProgressBar = info.buffIconProgressBar
      numberTxt = info.numberTxt
    end
    if data.count > 1 then
      numberTxt.text = data.count
    else
      numberTxt.text = ""
    end
    buffLoader.url = UIUtil.GetResUrl(data.iconPath)
    if data.remainFrames and data.remainMaxFrames then
      buffIconProgressBar.visible = true
      buffIconProgressBar.value = 100 * (data.remainMaxFrames - data.remainFrames) / data.remainMaxFrames
    else
      buffIconProgressBar.visible = false
    end
  end
  
  function headInfo:Hide()
    if self.headInfoObj then
      self.headInfoObj:SetActiveSafe(false)
    end
  end
  
  function headInfo:UpdateVisible()
    local visible = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BLOOD_ENABLE)
    if self.headObject and self.headObject.visible ~= visible then
      self.headObject.visible = visible
    end
  end
  
  function headInfo:UpdateBuffVisible()
    local visible = 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.BATTLE_BUFF_ENABLE)
    if self.buffList and self.buffList.visible ~= visible then
      self.buffList.visible = visible
    end
  end
  
  function headInfo:UpdateSortingOrder(sortingOrder)
    if self.headObject then
    end
  end
  
  function headInfo:SetAlpha(alpha)
    if self.headObject then
      self.headObject.alpha = alpha
    end
  end
  
  function headInfo:Destroy()
    self.c1Ctr = nil
    self.c2Ctr = nil
    self.c3Ctr = nil
    self.monsterCtr = nil
    self:SetAlpha(1)
    self.uiPanel = nil
    self.headObject = nil
    self.curProgressBar = nil
    self.rageProgressBar = nil
    self.percentageTxt = nil
    self.defenseProgressBar = nil
    self.originParent = nil
    self.buildingScale = nil
    self.rageTxt = nil
    self.defenseTxt = nil
    if self.headInfoObj then
      self.headInfoObj:SetActiveSafe(false)
    end
    self.headInfoObj = nil
    if self.buffList then
      self.buffList:RemoveChildrenToPool()
      self.buffList:ClearPool()
    end
    self.buffList = nil
    self.buffListInfo = {}
    self.lastHp = nil
    self.lastRage = nil
    self.lastShield = nil
    self.lastShieldSpecial = nil
    self.lastTenacity = nil
    self = nil
  end
  
  headInfo:Init(unit)
  return headInfo
end
