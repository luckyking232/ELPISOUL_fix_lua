require("ActivityDungeon1021_MiniGameWindowByName")
local Activity21MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441026
ld("Activity21_MiniGame")
local RefreshPanel = function()
  local info = Activity21_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20880, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity21_MiniGameService.MiniGameGetDailyRewardReq()
    end
  end)
  UIUtil.SetText(uis.Main.StartBtn, T(20639), "WordTxt")
  uis.Main.Top.Integral.WordTxt.text = T(20875)
  uis.Main.Top.Integral.NumberTxt.text = T(20876, info.miniHighScore)
end

function Activity21MiniGameMainWindow.ReInitData()
end

function Activity21MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21MiniGameMainWindow.package, WinResConfig.Activity21MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1021_MiniGameWindowUis(contentPane)
    Activity21MiniGameMainWindow.UpdateInfo()
    Activity21MiniGameMainWindow.InitBtn()
  end)
end

function Activity21MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1021/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame21_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame21_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity21_MiniGameService.MiniGameInfoReq(RefreshPanel)
end

function Activity21MiniGameMainWindow.InitBtn()
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21MiniGameWindow.name)
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity21MiniGameMainWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21MiniGameTaskWindow.name)
  end)
end

function Activity21MiniGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity21MiniGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function Activity21MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity21_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanel()
  end
end

return Activity21MiniGameMainWindow
