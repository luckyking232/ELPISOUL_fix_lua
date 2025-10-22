require("ActivityDungeon1004_MiniStart2_End1WindowByName")
local Activity5FishEndWindow = {}
local uis, contentPane, fishId, v2

function Activity5FishEndWindow.ReInitData()
end

function Activity5FishEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishEndWindow.package, WinResConfig.Activity5FishEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniStart2_End1WindowUis(contentPane)
    fishId = bridgeObj.argTable[1]
    v2 = bridgeObj.argTable[2]
    Activity5FishEndWindow.UpdateInfo()
    Activity5FishEndWindow.InitBtn()
  end)
end

function Activity5FishEndWindow.UpdateInfo()
  local data = TableData.GetConfig(fishId, "BaseActivityGameItem")
  if data then
    uis.Main.PicLoader.url = UIUtil.GetResUrl(data.icon)
    uis.Main.NameTxt.text = data.name()
    if 2 == data.type then
      uis.Main.WordTxt.text = T(1715, data.name())
    else
      uis.Main.WordTxt.text = T(1706, data.name())
    end
  end
  LeanTween.delayedCall(2, function()
    UIMgr:CloseWindow(WinResConfig.Activity5FishEndWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity5FishWindow.name, WindowMsgEnum.Activity5_MiniGame.RESET)
  end)
end

function Activity5FishEndWindow.InitBtn()
end

function Activity5FishEndWindow.OnClose()
  uis = nil
  contentPane = nil
  fishId = nil
  v2 = nil
end

return Activity5FishEndWindow
