require("ActivityDungeon1015_MiniGameWindowByName")
ld("Activity15_MiniGame")
local Activity15MiniGameMainWindow = {}
local uis, contentPane

local function RefreshPanelInfo()
  local info = Activity15_MiniGameData.GetMiniGameInfo()
  local conf = TableData.GetConfig(Activity15_MiniGameData.gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(2041)
  uis.Main.Top.Integral.NumberTxt.text = T(2042, info.miniHighScore)
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1896, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(2043), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity15_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity15MiniGameMainWindow.ReInitData()
end

function Activity15MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15MiniGameMainWindow.package, WinResConfig.Activity15MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_MiniGameWindowUis(contentPane)
    Activity15MiniGameMainWindow.UpdateInfo()
    Activity15MiniGameMainWindow.InitBtn()
  end)
end

function Activity15MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1015/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame15_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame15_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity15_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity15MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity15MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15MiniGameTaskWindow.name)
  end)
  UIUtil.SetText(uis.Main.OperateBtn, T(2040))
  uis.Main.OperateBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15MiniSetWindow.name)
  end)
end

function Activity15MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity15MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity15_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity15MiniGameMainWindow
