require("ActivityDungeon1017_MiniGame2WindowByName")
local Activity17MiniGame2MainWindow = {}
local uis, contentPane
local RefreshPanelInfo = function()
  local gameId = 70441022
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(1981)
  local highStage = info.miniHighScore
  uis.Main.Top.Integral.NumberTxt.text = highStage % 100
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1982, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(11918), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity17_MiniGameService.MiniGameGetDailyRewardReq(gameId)
    end
  end)
end

function Activity17MiniGame2MainWindow.ReInitData()
end

function Activity17MiniGame2MainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17MiniGame2MainWindow.package, WinResConfig.Activity17MiniGame2MainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniGame2WindowUis(contentPane)
    Activity17MiniGame2MainWindow.UpdateInfo()
    Activity17MiniGame2MainWindow.InitBtn()
  end)
end

function Activity17MiniGame2MainWindow.UpdateInfo()
  local gameId = 70441022
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1017", "MiniGame1_1000")
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17MiniGame2MainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame17_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17MiniGame2MainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame17_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity17_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity17MiniGame2MainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Add(Activity17MiniGame2MainWindow.TouchClose)
  uis.Main.StartBtn.onClick:Add(Activity17MiniGame2MainWindow.TouchStart)
  uis.Main.Botton.TaskBtn.onClick:Add(Activity17MiniGame2MainWindow.TouchTask)
end

function Activity17MiniGame2MainWindow.TouchTask()
  OpenWindow(WinResConfig.Activity17MiniTask2Window.name)
end

function Activity17MiniGame2MainWindow.TouchStart()
  OpenWindow(WinResConfig.Activity17MiniGameChoice2Window.name)
end

function Activity17MiniGame2MainWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.Activity17MiniGame2MainWindow.name)
end

function Activity17MiniGame2MainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity17MiniGame2MainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity17_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity17MiniGame2MainWindow
