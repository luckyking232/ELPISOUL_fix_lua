require("ActivityDungeon1010_MiniRankWindowByName")
local Activity10MiniRankWindow = {}
local uis, contentPane

function Activity10MiniRankWindow.ReInitData()
end

function Activity10MiniRankWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity10MiniRankWindow.package, WinResConfig.Activity10MiniRankWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1010_MiniRankWindowUis(contentPane)
    Activity10MiniRankWindow.UpdateInfo()
    Activity10MiniRankWindow.InitBtn()
  end)
end

function Activity10MiniRankWindow.UpdateInfo()
  local IntegralCom = UIMgr:CreateObject("ActivityDungeon1010", "MiniRank_Integral1")
  UIUtil.SetText(IntegralCom, T(1907), "WordTxt")
  UIUtil.SetText(IntegralCom, 0 ~= Activity10_MiniGameData.rankInfo.rank and Activity10_MiniGameData.rankInfo.rank or T(1908), "NumberTxt")
  uis.Main.IntegralList:AddChild(IntegralCom)
  local IntegralCom2 = UIMgr:CreateObject("ActivityDungeon1010", "MiniRank_Integral")
  UIUtil.SetText(IntegralCom2, T(1894), "WordTxt")
  UIUtil.SetText(IntegralCom2, T(1895, Activity10_MiniGameData.rankInfo.score), "NumberTxt")
  uis.Main.IntegralList:AddChild(IntegralCom2)
  if #Activity10_MiniGameData.rankInfo.rankList > 1 then
    table.sort(Activity10_MiniGameData.rankInfo.rankList, function(a, b)
      return a.rank < b.rank
    end)
  end
  local curTime = LoginData.GetCurServerTime()
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, item)
    local data = Activity10_MiniGameData.rankInfo.rankList[i + 1]
    local tips = item:GetChild("Tips")
    if i > 3 then
      ChangeUIController(tips, "c1", 3)
    else
      ChangeUIController(tips, "c1", i)
    end
    ChangeUIController(tips, "c2", data.uin == ActorData.GetUin() and 1 or 0)
    ChangeUIController(tips, "c3", data.rank > 9 and 1 or 0)
    UIUtil.SetText(tips, data.rank, "RankTxt")
    UIUtil.SetText(tips, data.guildName, "GuildTxt")
    UIUtil.SetText(tips, data.name, "NameTxt")
    UIUtil.SetText(tips, TimeUtil.FormatOfflineTime(curTime - data.stamp), "LevelTxt")
    UIUtil.SetText(tips, T(1895, data.score), "LengthTxt")
    UIUtil.ShowPlayerHead(data, tips:GetChild("Head"))
    if i < 7 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.05)
    end
  end
  
  list.numItems = #Activity10_MiniGameData.rankInfo.rankList
end

function Activity10MiniRankWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity10MiniRankWindow.ClosWindow)
  uis.Main.TouchScreenBtn.onClick:Set(Activity10MiniRankWindow.ClosWindow)
end

function Activity10MiniRankWindow.ClosWindow()
  UIMgr:CloseWindow(WinResConfig.Activity10MiniRankWindow.name)
end

function Activity10MiniRankWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity10MiniRankWindow
