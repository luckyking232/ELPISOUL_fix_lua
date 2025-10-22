require("Shop_PactPassTipsWindowByName")
local PactPassTipsWindow = {}
local uis, contentPane

function PactPassTipsWindow.ReInitData()
end

function PactPassTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PactPassTipsWindow.package, WinResConfig.PactPassTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetShop_PactPassTipsWindowUis(contentPane)
    PactPassTipsWindow.UpdateInfo()
    PactPassTipsWindow.InitBtn()
  end)
end

function PactPassTipsWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(1512)
  uis.Main.NameTxt.text = T(80670015)
end

function PactPassTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(PactPassTipsWindow.CloseWindow)
end

function PactPassTipsWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.PactPassTipsWindow.name)
end

function PactPassTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return PactPassTipsWindow
