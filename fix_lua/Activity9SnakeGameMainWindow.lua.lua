require("ActivityDungeon1008_MiniGame2WindowByName")
local Activity9SnakeGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local gameId = Activity9_MiniGameData.snakeGameId
  local info = Activity9_MiniGameData.GetOneMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(11807)
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1851, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1849), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity9_MiniGameService.MiniGameGetDailyRewardReq(gameId, RefreshPanelInfo)
    end
  end)
end

function Activity9SnakeGameMainWindow.ReInitData()
end

function Activity9SnakeGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9SnakeGameMainWindow.package, WinResConfig.Activity9SnakeGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniGame2WindowUis(contentPane)
    Activity9SnakeGameMainWindow.UpdateInfo()
    Activity9SnakeGameMainWindow.InitBtn()
  end)
end

function Activity9SnakeGameMainWindow.UpdateInfo()
  local gameId = Activity9_MiniGameData.snakeGameId
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1008", "MiniGame1_1000")
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity9SnakeGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame9_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity9SnakeGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame9_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity9_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity9SnakeGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9SnakeGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9SnakeGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9SnakeGameTaskWindow.name)
  end)
  local operateBtn = uis.Main.OperateBtn
  UIUtil.SetBtnText(operateBtn, T(11812))
  operateBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9MiniOperateChoiceWindow.name, nil, WinResConfig.Activity9SnakeGameMainWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity9_MiniGameData.GetOneMiniGameInfo(Activity9_MiniGameData.snakeGameId)
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(1848))
      return
    end
    OpenWindow(WinResConfig.Activity9SnakeGameRecordWindow.name)
  end)
end

function Activity9SnakeGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity9SnakeGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity9_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity9SnakeGameMainWindow
