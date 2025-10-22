require("ActivityDungeon1011_MiniStart_EndRewardWindowByName")
local Activity11MiniGameSubmitWindow = {}
local uis, contentPane
local gameId = 70441013
local succeed, score, consumeSeconds, levelId, lastLevel
local LevelIsReachedUnlockTime = function(levelIndex)
  local levelConfigs = Activity11_MiniGameData.GetOrLoadLevelConfigs()
  local config = levelConfigs[levelIndex]
  local unlockDay = config and config.unlockDay or 0
  local info = ActivityDungeonData.GetActivityInfo()
  local diff = LoginData.GetCurServerTime() - info.baseInfo.startStamp
  local unlockSeconds = unlockDay * 86400
  local result = unlockSeconds - diff
  return result <= 0, result
end

function Activity11MiniGameSubmitWindow.ReInitData()
end

function Activity11MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity11MiniGameSubmitWindow.package, WinResConfig.Activity11MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    succeed = bridgeObj.argTable[1]
    score = bridgeObj.argTable[2]
    consumeSeconds = bridgeObj.argTable[3]
    levelId = bridgeObj.argTable[4]
    lastLevel = bridgeObj.argTable[5]
    uis = GetActivityDungeon1011_MiniStart_EndRewardWindowUis(contentPane)
    Activity11MiniGameSubmitWindow.UpdateInfo()
    Activity11MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity11MiniGameSubmitWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20680)
  local failureTitleTxt = T(20681)
  local succeedTxt = lastLevel and T(20689) or T(20682, levelId)
  local failureTxt = lastLevel and T(20690) or T(20683, levelId)
  local nextLevelText = T(20684)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  if not succeed or lastLevel then
    UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  else
    UIUtil.SetText(uis.Main.AgainBtn, nextLevelText, "WordTxt")
  end
  uis.Main.TitleTxt.text = succeed and succeedTitleTxt or failureTitleTxt
  uis.Main.WordTxt.text = succeed and succeedTxt or failureTxt
  if succeed then
    local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
    holder:Center()
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
    UIUtil.SetObjectToUI(effect, holder)
    LuaUtil.PlayEffect(effect)
  end
end

function Activity11MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity11MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    if succeed and not lastLevel then
      local unlock, remainTime = LevelIsReachedUnlockTime(levelId + 1)
      if unlock then
        UIMgr:SendWindowMessage(WinResConfig.Activity11MiniGameWindow.name, WindowMsgEnum.Activity11_MiniGame.RESET, levelId)
        UIMgr:CloseWindow(WinResConfig.Activity11MiniGameSubmitWindow.name)
      else
        FloatTipsUtil.ShowWarnTips(T(20687, TimeUtil.FormatRemainTimeRough(remainTime)))
      end
      return
    end
    UIMgr:SendWindowMessage(WinResConfig.Activity11MiniGameWindow.name, WindowMsgEnum.Activity11_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity11MiniGameSubmitWindow.name)
  end)
end

function Activity11MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity11MiniGameSubmitWindow
