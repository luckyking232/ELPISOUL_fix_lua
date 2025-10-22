require("ActivityDungeon1008_MiniOperateChoiceWindowByName")
local Activity9MiniOperateChoiceWindow = {}
local uis, contentPane, fromWindowName

function Activity9MiniOperateChoiceWindow.ReInitData()
end

function Activity9MiniOperateChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniOperateChoiceWindow.package, WinResConfig.Activity9MiniOperateChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniOperateChoiceWindowUis(contentPane)
    fromWindowName = bridgeObj.argTable[1]
    Activity9MiniOperateChoiceWindow.UpdateInfo()
    Activity9MiniOperateChoiceWindow.InitBtn()
  end)
end

function Activity9MiniOperateChoiceWindow.UpdateInfo()
  local selectedNum
  if fromWindowName == WinResConfig.Activity9SnakeGameWindow.name or fromWindowName == WinResConfig.Activity9SnakeGameMainWindow.name then
    selectedNum = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_SNAKE_SETTER_INDEX)
    
    function uis.Main.TipsList.itemRenderer(i, item)
      ChangeUIController(item, "joystick", i)
      item.onClick:Set(function()
        if uis.Main.TipsList.selectedIndex ~= i then
          uis.Main.TipsList.selectedIndex = i
          PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY09_SNAKE_SETTER_INDEX, i)
        end
      end)
    end
  else
    selectedNum = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_SETTER_INDEX)
    
    function uis.Main.TipsList.itemRenderer(i, item)
      ChangeUIController(item, "joystick", i)
      item.onClick:Set(function()
        if uis.Main.TipsList.selectedIndex ~= i then
          uis.Main.TipsList.selectedIndex = i
          PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY09_SETTER_INDEX, i)
        end
      end)
    end
  end
  uis.Main.TipsList.numItems = 4
  uis.Main.TipsList.selectedIndex = selectedNum
end

function Activity9MiniOperateChoiceWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(Activity9MiniOperateChoiceWindow.CloseWindow)
  uis.Main.TouchScreenBtn.onClick:Set(Activity9MiniOperateChoiceWindow.CloseWindow)
end

function Activity9MiniOperateChoiceWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity9MiniOperateChoiceWindow.name)
  if fromWindowName == WinResConfig.Activity9SnakeGameWindow.name then
    UIMgr:SendWindowMessage(WinResConfig.Activity9SnakeGameWindow.name, WindowMsgEnum.Activity9_MiniGame.REFRESH_JOYSTICK)
  else
    UIMgr:SendWindowMessage(WinResConfig.Activity9MiniGameWindow.name, WindowMsgEnum.Activity9_MiniGame.REFRESH_JOYSTICK)
  end
end

function Activity9MiniOperateChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity9MiniOperateChoiceWindow
