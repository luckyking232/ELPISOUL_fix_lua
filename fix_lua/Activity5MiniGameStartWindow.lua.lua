require("ActivityDungeon1004_MiniStart_WinTargetWindowByName")
local Activity5MiniGameStartWindow = {}
local uis, contentPane
local ITEM_URL_LOOKUP = {
  [1] = "ui://wyxy0raasxc4b9",
  [2] = "ui://wyxy0raasxc4bf",
  [3] = "ui://wyxy0raasxc4bz",
  [4] = "ui://wyxy0raasxc4bj",
  [5] = "ui://wyxy0raasxc4bb",
  [6] = "ui://wyxy0raasxc4bv",
  [7] = "ui://wyxy0raasxc4br",
  [8] = "ui://wyxy0raasxc4c0"
}
local items

function Activity5MiniGameStartWindow.ReInitData()
end

function Activity5MiniGameStartWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameStartWindow.package, WinResConfig.Activity5MiniGameStartWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    items = bridgeObj.argTable[1]
    uis = GetActivityDungeon1004_MiniStart_WinTargetWindowUis(contentPane)
    Activity5MiniGameStartWindow.UpdateInfo()
    Activity5MiniGameStartWindow.InitBtn()
  end)
end

function Activity5MiniGameStartWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(20621)
  
  function uis.Main.ItemList.itemRenderer(i, gcmp)
    local info = items[i + 1]
    UIUtil.SetText(gcmp, info.count, "NumberTxt")
    local conf = TableData.GetConfig(info.id, "BaseActivityGameItem")
    gcmp:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  end
  
  uis.Main.ItemList.numItems = items and #items or 0
  PlayUITrans(uis.Main.root, "in", function()
    LeanTween.delayedCall(1, function()
      UIMgr:CloseWindow(WinResConfig.Activity5MiniGameStartWindow.name)
    end)
  end)
end

function Activity5MiniGameStartWindow.InitBtn()
end

function Activity5MiniGameStartWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5MiniGameStartWindow
