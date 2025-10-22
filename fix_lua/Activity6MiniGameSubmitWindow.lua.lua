require("ActivityDungeon1005_MiniStart_EndRewardWindowByName")
local Activity6MiniGameSubmitWindow = {}
local uis, contentPane, succeed, score, consumeSeconds
local gameId = 70441007
local mapConfig

function Activity6MiniGameSubmitWindow.ReInitData()
end

function Activity6MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity6MiniGameSubmitWindow.package, WinResConfig.Activity6MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    succeed = bridgeObj.argTable[1]
    score = bridgeObj.argTable[2]
    consumeSeconds = bridgeObj.argTable[3]
    mapConfig = bridgeObj.argTable[4]
    uis = GetActivityDungeon1005_MiniStart_EndRewardWindowUis(contentPane)
    Activity6MiniGameSubmitWindow.UpdateInfo()
    Activity6MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity6MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20624)
  local failureTitleTxt = T(20625)
  local scoreTxt = T(20532)
  local failureTxt = T(20626)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = succeed and succeedTitleTxt or failureTitleTxt
  uis.Main.NumberWordTxt.text = scoreTxt
  uis.Main.NumberTxt.text = score
  uis.Main.WordTxt.text = failureTxt
  ChangeUIController(uis.Main.root, "c1", succeed and 0 or 1)
  if succeed then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_vic")
    local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
    holder:Center()
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
    UIUtil.SetObjectToUI(effect, holder)
    LuaUtil.PlayEffect(effect)
  else
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_default")
  end
end

function Activity6MiniGameSubmitWindow.InitBtn()
  local map = {}
  if succeed then
    map[mapConfig.id] = 1
  end
  uis.Main.CloseBtn.onClick:Set(function()
    Activity6_MiniGameService.MiniGameSubmitReq(gameId, map, score, consumeSeconds, function()
      UIMgr:CloseToWindow(WinResConfig.Activity6MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity6_MiniGameService.MiniGameSubmitReq(gameId, map, score, consumeSeconds, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity6MiniGameWindow.name, WindowMsgEnum.Activity6_MiniGame.RESET)
      UIMgr:CloseWindow(WinResConfig.Activity6MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity6MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity6MiniGameSubmitWindow
