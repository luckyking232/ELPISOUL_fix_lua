require("ActivityDungeon1012_MiniStart_EndRewardWindowByName")
local Activity12MiniGameSubmitWindow = {}
local uis, contentPane, succeed, stageId, fail

function Activity12MiniGameSubmitWindow.ReInitData()
end

function Activity12MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity12MiniGameSubmitWindow.package, WinResConfig.Activity12MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    succeed = bridgeObj.argTable[1]
    stageId = bridgeObj.argTable[2]
    fail = bridgeObj.argTable[3]
    uis = GetActivityDungeon1012_MiniStart_EndRewardWindowUis(contentPane)
    Activity12MiniGameSubmitWindow.UpdateInfo()
    Activity12MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity12MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  if fail then
    uis.Main.TitleTxt.text = T(1954)
    uis.Main.WordTxt.text = T(1955)
  else
    uis.Main.TitleTxt.text = T(1943)
    uis.Main.WordTxt.text = T(1944, Activity12MiniGameSubmitWindow.GetGameTime(succeed))
    local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
    holder:Center()
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
    UIUtil.SetObjectToUI(effect, holder)
    LuaUtil.PlayEffect(effect)
  end
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
end

function Activity12MiniGameSubmitWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return ""
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  return T(1788, minutes, t % 60)
end

function Activity12MiniGameSubmitWindow.InitBtn()
  local map = {}
  map[stageId] = 1
  if fail then
    map = {}
  end
  uis.Main.CloseBtn.onClick:Set(function()
    Activity12_MiniGameService.MiniGameSubmitReq(map, 1, nil, function()
      UIMgr:CloseToWindow(WinResConfig.Activity12MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity12_MiniGameService.MiniGameSubmitReq(map, 1, nil, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity12MiniGameWindow.name, WindowMsgEnum.Activity12_MiniGame.RESET)
      UIMgr:CloseWindow(WinResConfig.Activity12MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity12MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  fail = nil
end

return Activity12MiniGameSubmitWindow
