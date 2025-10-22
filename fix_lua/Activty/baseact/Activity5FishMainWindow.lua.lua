require("ActivityDungeon1004_MiniGame2WindowByName")
local Activity5FishMainWindow = {}
local uis, contentPane
local gameId = 70441006
ld("Activity5_MiniGame")
local RefreshPanelInfo = function()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1708, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1949), "WordTxt")
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

function Activity5FishMainWindow.ReInitData()
end

function Activity5FishMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishMainWindow.package, WinResConfig.Activity5FishMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniGame2WindowUis(contentPane)
    Activity5FishMainWindow.UpdateInfo()
    Activity5FishMainWindow.InitBtn()
  end)
end

function Activity5FishMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://wyxy0raajpsce1"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity5FishMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame5_FishDailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity5FishMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame5_FishTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity5FishMainWindow.name,
    com = uis.Main.Top.BookBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame5_FishBookRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity5_MiniGameService.MiniGameInfoReq(gameId)
end

function Activity5FishMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5FishMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity5FishWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(1717))
      return
    end
    OpenWindow(WinResConfig.Activity5FishRecordWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity5FishTaskWindow.name)
  end)
  UIUtil.SetText(uis.Main.Top.BookBtn, T(1705), "WordTxt")
  uis.Main.Top.BookBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity5FishBookWindow.name)
  end)
end

function Activity5FishMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity5FishMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity5_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity5FishMainWindow
