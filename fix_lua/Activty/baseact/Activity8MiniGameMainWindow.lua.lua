require("ActivityDungeon1007_MiniGameWindowByName")
ld("Activity8_MiniGame")
local Activity8MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441009
local RefreshPanelInfo = function()
  local info = Activity8_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20635, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity8_MiniGameService.MiniGameGetDailyRewardReq()
    end
  end)
  UIUtil.SetText(uis.Main.StartBtn, T(20639), "WordTxt")
  uis.Main.Top.Integral.WordTxt.text = T(20638)
  uis.Main.Top.Integral.NumberTxt.text = T(20649, info.miniHighScore)
end

function Activity8MiniGameMainWindow.ReInitData()
end

function Activity8MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameMainWindow.package, WinResConfig.Activity8MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_MiniGameWindowUis(contentPane)
    Activity8MiniGameMainWindow.UpdateInfo()
    Activity8MiniGameMainWindow.InitBtn()
  end)
end

function Activity8MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1007/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity8MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame8_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity8MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame8_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity8_MiniGameService.MiniGameInfoReq()
end

function Activity8MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity8MiniGameMainWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity8_MiniGameData.GetMiniGameInfo(gameId)
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(20619))
      return
    end
    OpenWindow(WinResConfig.Activity8MiniGameRecordWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity8MiniGameTaskWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity8MiniGameWindow.name)
  end)
end

function Activity8MiniGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity8MiniGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function Activity8MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity8_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity8MiniGameMainWindow
