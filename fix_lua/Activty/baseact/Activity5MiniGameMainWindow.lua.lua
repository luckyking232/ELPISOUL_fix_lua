require("ActivityDungeon1004_MiniGameWindowByName")
local Activity5MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441005
ld("Activity5_MiniGame")
local RefreshPanelInfo = function()
  local highestScoreTxt = T(20620)
  local dailyScoreTxt = T(20485)
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(70441005, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = highestScoreTxt
  uis.Main.Top.Integral.NumberTxt.text = info and info.miniHighScore or 0
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20612, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1950), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity5_MiniGameService.MiniGameGetDailyRewardReq(gameId)
    end
  end)
end

function Activity5MiniGameMainWindow.ReInitData()
end

function Activity5MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameMainWindow.package, WinResConfig.Activity5MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniGameWindowUis(contentPane)
    Activity5MiniGameMainWindow.UpdateInfo()
    Activity5MiniGameMainWindow.InitBtn()
  end)
end

function Activity5MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://wyxy0raau4qxab"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity5MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame5_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity5MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame5_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity5_MiniGameService.MiniGameInfoReq(gameId)
end

function Activity5MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity5MiniGameWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(20619))
      return
    end
    OpenWindow(WinResConfig.Activity5MiniGameRecordWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity5MiniGameTaskWindow.name)
  end)
end

function Activity5MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity5MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity5_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity5MiniGameMainWindow
