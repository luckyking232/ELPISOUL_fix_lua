require("ActivityDungeon1008_MiniGameWindowByName")
ld("Activity9_MiniGame")
local Activity9MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
  local conf = TableData.GetConfig(Activity9_MiniGameData.gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(1850)
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
      Activity9_MiniGameService.MiniGameGetDailyRewardReq(Activity9_MiniGameData.gameId, RefreshPanelInfo)
    end
  end)
end

function Activity9MiniGameMainWindow.ReInitData()
end

function Activity9MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniGameMainWindow.package, WinResConfig.Activity9MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniGameWindowUis(contentPane)
    Activity9MiniGameMainWindow.UpdateInfo()
    Activity9MiniGameMainWindow.InitBtn()
  end)
end

function Activity9MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1008/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity9MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame9_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity9MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame9_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity9_MiniGameService.MiniGameInfoReq(Activity9_MiniGameData.gameId, RefreshPanelInfo)
end

function Activity9MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9MiniGameChoiceWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9MiniGameTaskWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity9_MiniGameData.GetOneMiniGameInfo()
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(1848))
      return
    end
    OpenWindow(WinResConfig.Activity9MiniGameRecordWindow.name)
  end)
end

function Activity9MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity9MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity9_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity9MiniGameMainWindow
