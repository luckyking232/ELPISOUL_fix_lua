require("ActivityDungeon1013_MiniRankWindowByName")
local Activity13BounceMiniGameRankWindow = {}
local uis, contentPane

function Activity13BounceMiniGameRankWindow.ReInitData()
end

function Activity13BounceMiniGameRankWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13BounceMiniGameRankWindow.package, WinResConfig.Activity13BounceMiniGameRankWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniRankWindowUis(contentPane)
    Activity13BounceMiniGameRankWindow.UpdateInfo()
    Activity13BounceMiniGameRankWindow.InitBtn()
  end)
end

function Activity13BounceMiniGameRankWindow.UpdateInfo()
  local rankInfo = Activity13_MiniGameData.GetRankInfo()
  local IntegralCom = UIMgr:CreateObject("ActivityDungeon1013", "MiniRank_Integral1")
  UIUtil.SetText(IntegralCom, T(1907), "WordTxt")
  UIUtil.SetText(IntegralCom, 0 ~= rankInfo.rank and rankInfo.rank or T(1908), "NumberTxt")
  uis.Main.IntegralList:AddChild(IntegralCom)
  local IntegralCom2 = UIMgr:CreateObject("ActivityDungeon1013", "MiniRank_Integral")
  UIUtil.SetText(IntegralCom2, T(20527), "WordTxt")
  UIUtil.SetText(IntegralCom2, rankInfo.score, "NumberTxt")
  uis.Main.IntegralList:AddChild(IntegralCom2)
  if #rankInfo.rankList > 1 then
    table.sort(rankInfo.rankList, function(a, b)
      return a.rank < b.rank
    end)
  end
  local curTime = LoginData.GetCurServerTime()
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, item)
    local data = rankInfo.rankList[i + 1]
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
    UIUtil.SetText(tips, data.score, "LengthTxt")
    UIUtil.ShowPlayerHead(data, tips:GetChild("Head"))
    if i < 7 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.05)
    end
  end
  
  list.numItems = #rankInfo.rankList
end

function Activity13BounceMiniGameRankWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameRankWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameRankWindow.name)
  end)
end

function Activity13BounceMiniGameRankWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity13BounceMiniGameRankWindow
