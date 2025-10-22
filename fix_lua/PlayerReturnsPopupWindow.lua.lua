require("PlayerReturns_PopupWindowByName")
local PlayerReturnsPopupWindow = {}
local uis, contentPane

function PlayerReturnsPopupWindow.ReInitData()
end

function PlayerReturnsPopupWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlayerReturnsPopupWindow.package, WinResConfig.PlayerReturnsPopupWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetPlayerReturns_PopupWindowUis(contentPane)
    PlayerReturnsPopupWindow.UpdateInfo()
    PlayerReturnsPopupWindow.InitBtn()
  end)
end

function PlayerReturnsPopupWindow.UpdateInfo()
  local btnTxt = T(20817)
  local titleTxt = T(20815)
  local descTxt = T(20816)
  uis.Main.Tips.TitleTxt.text = titleTxt
  
  function uis.Main.Tips.WordList.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, descTxt, "WordTxt")
  end
  
  uis.Main.Tips.WordList.numItems = 1
  UIUtil.SetBtnText(uis.Main.Tips.GoBtn, btnTxt)
end

function PlayerReturnsPopupWindow.InitBtn()
  uis.Main.Tips.GoBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.PlayerReturnsPopupWindow.name)
    OpenWindow(WinResConfig.PlayerReturnsWindow.name, nil, true)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.PlayerReturnsPopupWindow.name)
    local key = PLAYER_PREF_ENUM.ACTIVITY_PLAYER_RETURN_POPUP
    FunctionQueueUtil.SetFunEnd(key)
  end)
end

function PlayerReturnsPopupWindow.OnClose()
  uis = nil
  contentPane = nil
end

return PlayerReturnsPopupWindow
