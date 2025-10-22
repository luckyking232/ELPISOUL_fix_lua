require("ActivityDungeon1007_MiniStart_EndRewardWindowByName")
local Activity8MiniGameSubmitWindow = {}
local uis, contentPane, succeed, score, consumeSeconds
local gameId = 70441009

function Activity8MiniGameSubmitWindow.ReInitData()
end

function Activity8MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameSubmitWindow.package, WinResConfig.Activity8MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    succeed = bridgeObj.argTable[1]
    score = bridgeObj.argTable[2]
    consumeSeconds = bridgeObj.argTable[3]
    uis = GetActivityDungeon1007_MiniStart_EndRewardWindowUis(contentPane)
    Activity8MiniGameSubmitWindow.UpdateInfo()
    Activity8MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity8MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20637)
  local failureTitleTxt = T(20638)
  local content = T(20642, score)
  local info = Activity8_MiniGameData.GetMiniGameInfo(gameId)
  if score > math.floor(info.miniHighScore) then
    content = T(20641, score)
  end
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = succeed and succeedTitleTxt or failureTitleTxt
  uis.Main.WordTxt.text = content
  local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
  holder:Center()
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
  UIUtil.SetObjectToUI(effect, holder)
  LuaUtil.PlayEffect(effect)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
end

function Activity8MiniGameSubmitWindow.InitBtn()
  local map = {}
  if succeed then
  end
  uis.Main.CloseBtn.onClick:Set(function()
    Activity8_MiniGameService.MiniGameSubmitReq(map, score, consumeSeconds, function()
      UIMgr:CloseToWindow(WinResConfig.Activity8MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity8_MiniGameService.MiniGameSubmitReq(map, score, consumeSeconds, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity8MiniGameWindow.name, WindowMsgEnum.Activity8_MiniGame.RESET)
      UIMgr:CloseWindow(WinResConfig.Activity8MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity8MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity8MiniGameSubmitWindow
