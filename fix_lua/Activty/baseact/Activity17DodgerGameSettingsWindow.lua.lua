require("ActivityDungeon1017_MiniOperateChoiceWindowByName")
local Activity17DodgerGameSettingsWindow = {}
local uis, contentPane

function Activity17DodgerGameSettingsWindow.ReInitData()
end

function Activity17DodgerGameSettingsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17DodgerGameSettingsWindow.package, WinResConfig.Activity17DodgerGameSettingsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniOperateChoiceWindowUis(contentPane)
    Activity17DodgerGameSettingsWindow.UpdateInfo()
    Activity17DodgerGameSettingsWindow.InitBtn()
  end)
end

function Activity17DodgerGameSettingsWindow.UpdateInfo()
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, gcmp)
    local value = PlayerPrefsUtil.GetInt("ACTIVITY17_DODGER_GAME_JOYSTICK", 0)
    ChangeUIController(gcmp, "joystick", i)
    if value > 0 then
      ChangeUIController(gcmp, "button", i > 0 and 1 or 0)
    else
      ChangeUIController(gcmp, "button", i > 0 and 0 or 1)
    end
    gcmp.onClick:Set(function()
      PlayerPrefsUtil.SetInt("ACTIVITY17_DODGER_GAME_JOYSTICK", i)
      list.numItems = 2
    end)
  end
  
  list.numItems = 2
end

function Activity17DodgerGameSettingsWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity17DodgerGameSettingsWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity17DodgerGameSettingsWindow.name)
  end)
end

function Activity17DodgerGameSettingsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity17DodgerGameSettingsWindow
