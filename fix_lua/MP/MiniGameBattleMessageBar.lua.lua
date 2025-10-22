MiniGameBattleMessageBar = {}

function MiniGameBattleMessageBar.BindInfo(unit)
  require("CommonResource_Activity17_MonsterHPByName")
  local headInfo = {
    headObject = nil,
    curProgressBar = nil,
    uiPanel = nil,
    headInfoObj = nil,
    originParent = nil
  }
  
  function headInfo:Init(bindUnit)
    self.originParent = bindUnit.model
    local headInfoUI = bindUnit.childModel.transform:Find("HeadInfo")
    if nil == headInfoUI then
      self.originParent = nil
      return
    end
    self.headInfoObj = headInfoUI.gameObject
    if self.headInfoObj then
      self.headInfoObj:SetActiveSafe(true)
      self.uiPanel = self.headInfoObj.transform:GetComponent(typeof(FairyGUI.UIPanel))
      self.headObject = self.uiPanel.ui
      local scale = math.abs(self.originParent.transform.localScale.x)
      self.headObject.scaleX = -1 / scale
      self.headObject.scaleY = 1 / scale
      self.lastHp = bindUnit:GetHp()
      local uis = GetCommonResource_Activity17_MonsterHPUis(self.headObject)
      if bindUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY then
        uis.c1Ctr.selectedIndex = 1
        self.curProgressBar = uis.HpEliteProgressBar
      elseif bindUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY then
        uis.c1Ctr.selectedIndex = 2
        self.curProgressBar = uis.HpBossProgressBar
      end
      self.curProgressBar.value = 100
      self:UpdateHp(bindUnit, true)
    end
  end
  
  function headInfo:UpdateHp(bindUnit, isInit)
    local lastHp = self.lastHp
    local nowHp = bindUnit:GetHp()
    local maxHp = bindUnit:GetAttr(ATTR_ENUM.max_hp)
    if isInit then
      self.curProgressBar:SetValue(100 * nowHp / maxHp)
    else
      self.curProgressBar:TweenValue(100 * nowHp / maxHp, 0.1)
    end
    self.lastHp = nowHp
  end
  
  function headInfo:Destroy()
    self.uiPanel = nil
    self.headObject = nil
    self.curProgressBar = nil
    self.originParent = nil
    if self.headInfoObj then
      self.headInfoObj:SetActiveSafe(false)
    end
    self.headInfoObj = nil
    self.lastHp = nil
    self = nil
  end
  
  headInfo:Init(unit)
  return headInfo
end
