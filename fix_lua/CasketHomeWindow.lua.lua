require("ActivityCasketHome_CasketHomeWindowByName")
local CasketHomeWindow = {}
local uis, contentPane

function CasketHomeWindow.ReInitData()
end

function CasketHomeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CasketHomeWindow.package, WinResConfig.CasketHomeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityCasketHome_CasketHomeWindowUis(contentPane)
    CardService.GetAllCardFashionReq(function()
      if uis then
        CasketHomeWindow.UpdateInfo()
      end
    end)
    CasketHomeWindow.InitBtn()
  end)
end

function CasketHomeWindow.ShowState(info, list)
  if info and list then
    if info.turnNum < 1 and RedDotSign.CanFreeNum(info) then
      local com = UIMgr:CreateObject("ActivityCasketHome", "Sign1")
      UIUtil.SetText(com, T(1879), "WordTxt")
      list:AddChild(com)
    end
    if 0 == info.freeGet and RedDotSign.CanFreeBuy(info.baseInfo.activityId) then
      local com = UIMgr:CreateObject("ActivityCasketHome", "Sign2")
      UIUtil.SetText(com, T(1877), "WordTxt")
      list:AddChild(com)
    end
  end
end

function CasketHomeWindow.UpdateInfo()
  local list = uis.Main.Tips.CardList
  local len = #SignData.turnAct
  
  function list.itemRenderer(i, item)
    local data = TableData.GetConfig(SignData.turnAct[i + 1].baseInfo.activityId, "BaseActivity")
    if data and data.parameter then
      local turntableData = TableData.GetConfig(tonumber(data.parameter), "BaseActivityTurntable")
      item:GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(turntableData.icon)
      local have = CardData.FashionIsContain(turntableData.fashion_id)
      local stateCom = item:GetChild("State")
      ChangeUIController(stateCom, "c1", have and 1 or 0)
      UIUtil.SetText(stateCom, have and T(698) or T(2089), "WordTxt")
      CasketHomeWindow.ShowState(SignData.turnAct[i + 1], item:GetChild("SignList"))
      item.onClick:Set(function()
        if have and SignData.turnAct and 0 == SignData.turnAct[i + 1].turnNum then
          FloatTipsUtil.ShowWarnTips(T(2116))
          return
        end
        if turntableData.ui_name and WinResConfig[turntableData.ui_name] then
          OpenWindow(turntableData.ui_name, nil, data.id)
        end
      end)
    end
    ChangeUIController(item, "c1", math.min(len - 1, 2))
    UIUtil.SetText(item:GetChild("Time"), TimeUtil.FormatEnTime(SignData.turnAct[i + 1].baseInfo.endStamp - LoginData.GetCurServerTime()), "TimeTxt")
  end
  
  list.numItems = len
end

function CasketHomeWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CasketHomeWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CasketHomeWindow.name)
  end)
end

function CasketHomeWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CasketHomeWindow
