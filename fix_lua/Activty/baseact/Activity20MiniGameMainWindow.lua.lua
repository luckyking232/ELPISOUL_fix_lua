require("ActivityDungeon1020_MiniGameWindowByName")
ld("Activity20_MiniGame")
local Activity20MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local info = Activity20_MiniGameData.GetMiniGameInfo()
  local conf = TableData.GetConfig(Activity20_MiniGameData.gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(20862)
  uis.Main.Top.Integral.NumberTxt.text = info and info.extraCount[2] or 0
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(2132, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(2118), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity20_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity20MiniGameMainWindow.ReInitData()
end

function Activity20MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity20MiniGameMainWindow.package, WinResConfig.Activity20MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1020_MiniGameWindowUis(contentPane)
    Activity20MiniGameMainWindow.UpdateInfo()
    Activity20MiniGameMainWindow.InitBtn()
  end)
end

function Activity20MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1020/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity20MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame20_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity20MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame20_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity20_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity20MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity20MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity20MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity20MiniGameTaskWindow.name)
  end)
end

function Activity20MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity20MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity20_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity20MiniGameMainWindow
