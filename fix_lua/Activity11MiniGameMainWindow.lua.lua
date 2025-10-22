require("ActivityDungeon1011_MiniGameWindowByName")
local Activity11MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441013
ld("Activity11_MiniGame")
local RefreshPanelInfo = function()
  local highestScoreTxt = T(20679)
  local dailyScoreTxt = T(20485)
  local info = Activity11_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = highestScoreTxt
  local remoteMap = info.extraCount
  local latestLevel = remoteMap and remoteMap[1] or 0
  uis.Main.Top.Integral.NumberTxt.text = latestLevel
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20657, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20658), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity11_MiniGameService.MiniGameGetDailyRewardReq(gameId)
    end
  end)
end

function Activity11MiniGameMainWindow.ReInitData()
end

function Activity11MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity11MiniGameMainWindow.package, WinResConfig.Activity11MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1011_MiniGameWindowUis(contentPane)
    Activity11MiniGameMainWindow.UpdateInfo()
    Activity11MiniGameMainWindow.InitBtn()
  end)
end

function Activity11MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1011/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity11MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame11_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity11MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame11_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity11_MiniGameService.MiniGameInfoReq()
end

function Activity11MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity11MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity11MiniGameChoiceWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity11MiniGameTaskWindow.name)
  end)
end

function Activity11MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity11MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity11_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity11MiniGameMainWindow
