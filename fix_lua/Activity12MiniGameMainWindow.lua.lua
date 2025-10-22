require("ActivityDungeon1012_MiniGameWindowByName")
local Activity12MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441014
ld("Activity12_MiniGame")
local RefreshPanelInfo = function()
  local highestScoreTxt = T(1921)
  local info = Activity12_MiniGameData.GetMiniGameInfo()
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = highestScoreTxt
  local num = 0
  if info.extraCount and info.extraCount[1] then
    num = info.extraCount[1]
  end
  uis.Main.Top.Integral.NumberTxt.text = num
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1923, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1924), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity12_MiniGameService.MiniGameGetDailyRewardReq()
    end
  end)
end

function Activity12MiniGameMainWindow.ReInitData()
end

function Activity12MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity12MiniGameMainWindow.package, WinResConfig.Activity12MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1012_MiniGameWindowUis(contentPane)
    Activity12MiniGameMainWindow.UpdateInfo()
    Activity12MiniGameMainWindow.InitBtn()
  end)
end

function Activity12MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1012/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity12MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame12_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity12MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame12_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity12_MiniGameService.MiniGameInfoReq()
end

function Activity12MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity12MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity12MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity12MiniGameTaskWindow.name)
  end)
end

function Activity12MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity12MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity12_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity12MiniGameMainWindow
