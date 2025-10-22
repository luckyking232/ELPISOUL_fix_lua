require("ActivityDungeon1003_MiniStart_CountdownWindowByName")
local Activity4MiniGameCountdownWindow = {}
local uis, contentPane

function Activity4MiniGameCountdownWindow.ReInitData()
end

function Activity4MiniGameCountdownWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity4MiniGameCountdownWindow.package, WinResConfig.Activity4MiniGameCountdownWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1003_MiniStart_CountdownWindowUis(contentPane)
    Activity4MiniGameCountdownWindow.UpdateInfo()
    Activity4MiniGameCountdownWindow.InitBtn()
  end)
end

local one_sound, two_sound, three_sound, start_sound

function Activity4MiniGameCountdownWindow.UpdateInfo()
  uis.root.opaque = false
  uis.Main.root.opaque = false
  one_sound = false
  two_sound = false
  three_sound = false
  start_sound = false
  local root = uis.Main.root
  local three = root:GetChild("n5")
  local two = root:GetChild("n6")
  local one = root:GetChild("n7")
  local start = root:GetChild("n9")
  start.alpha = 0
  PlayUITrans(uis.Main.root, "in1", function()
    UIMgr:CloseWindow(WinResConfig.Activity4MiniGameCountdownWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity4MiniGameWindow.name, WindowMsgEnum.Activity4_MiniGame.PAUSE)
  end, 0.2, 1, nil, nil, false, false, function()
    if three.alpha >= 0.8 and not three_sound then
      three_sound = true
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_count")
      return
    end
    if two.alpha >= 0.8 and not two_sound then
      two_sound = true
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_count")
      return
    end
    if one.alpha >= 0.8 and not one_sound then
      one_sound = true
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_count")
      return
    end
    if start.alpha >= 0.8 and three_sound and two_sound and one_sound and not start_sound then
      start_sound = true
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_gather_notif")
    end
  end)
end

function Activity4MiniGameCountdownWindow.InitBtn()
end

function Activity4MiniGameCountdownWindow.OnClose()
  uis = nil
  contentPane = nil
  UIMgr:SendWindowMessage(WinResConfig.Activity4MiniGameWindow.name, WindowMsgEnum.Activity4_MiniGame.START_GAME)
end

function Activity4MiniGameCountdownWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity4_MiniGame.PAUSE then
    uis.Main.root:GetTransition("in"):SetPaused(para)
  end
end

return Activity4MiniGameCountdownWindow
