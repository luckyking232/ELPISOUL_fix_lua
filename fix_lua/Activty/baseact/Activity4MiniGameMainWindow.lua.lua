require("ActivityDungeon1003_MiniGameWindowByName")
ld("Activity4_MiniGame")
local Activity4MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local info = Activity4_MiniGameData.GetMiniGameInfo()
  local conf = ActivityDungeonData.GetActivityData()
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(1679)
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1675, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1690), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity4_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity4MiniGameMainWindow.ReInitData()
end

function Activity4MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity4MiniGameMainWindow.package, WinResConfig.Activity4MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1003_MiniGameWindowUis(contentPane)
    Activity4MiniGameMainWindow.UpdateInfo()
    Activity4MiniGameMainWindow.InitBtn()
  end)
end

function Activity4MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1003/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity4MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame4_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity4MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame4_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity4_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity4MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity4MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity4MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity4MiniGameTaskWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    local info = Activity4_MiniGameData.GetMiniGameInfo()
    local records = info.records
    if not records or not _G.next(records) then
      FloatTipsUtil.ShowWarnTips(T(1676))
      return
    end
    OpenWindow(WinResConfig.Activity4MiniGameRecordWindow.name)
  end)
end

function Activity4MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity4MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity4_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity4MiniGameMainWindow
