require("ActivityDungeon1022_MiniStart_EndRewardWindowByName")
local Activity22MiniGameSubmitWindow = {}
local uis, contentPane, stageId

function Activity22MiniGameSubmitWindow.ReInitData()
end

function Activity22MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity22MiniGameSubmitWindow.package, WinResConfig.Activity22MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1022_MiniStart_EndRewardWindowUis(contentPane)
    stageId = bridgeObj.argTable[1]
    Activity22MiniGameSubmitWindow.UpdateInfo()
    Activity22MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_keyin_damo")
  end)
end

function Activity22MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(2200)
  uis.Main.Win.WordTxt.text = T(2201)
  local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
  holder:Center()
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
  UIUtil.SetObjectToUI(effect, holder)
  LuaUtil.PlayEffect(effect)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
end

function Activity22MiniGameSubmitWindow.InitBtn()
  local map = {}
  map[stageId] = 1
  uis.Main.CloseBtn.onClick:Set(function()
    Activity22_MiniGameService.MiniGameSubmitReq(map, 0, nil, nil, function()
      UIMgr:CloseToWindow(WinResConfig.Activity22MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity22_MiniGameService.MiniGameSubmitReq(map, 0, nil, nil, function()
      UIMgr:CloseWindow(WinResConfig.Activity22MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity22MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  stageId = nil
end

return Activity22MiniGameSubmitWindow
