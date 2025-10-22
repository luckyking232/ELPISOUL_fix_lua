require("ActivityDungeon1016_MiniGameWindowByName")
local Activity16MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441020
ld("Activity16_MiniGame")
local RefreshPanelInfo = function()
  local info = Activity16_MiniGameData.GetMiniGameInfo()
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20778, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity16_MiniGameService.MiniGameGetDailyRewardReq()
    end
  end)
  UIUtil.SetText(uis.Main.StartBtn, T(20639), "WordTxt")
  uis.Main.Top.Integral.WordTxt.text = T(20620)
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
end

function Activity16MiniGameMainWindow.ReInitData()
end

function Activity16MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity16MiniGameMainWindow.package, WinResConfig.Activity16MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1016_MiniGameWindowUis(contentPane)
    Activity16MiniGameMainWindow.UpdateInfo()
    Activity16MiniGameMainWindow.InitBtn()
  end)
end

function Activity16MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1016/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity16MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame16_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity16MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame16_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity16_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity16MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity16MiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity16MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity16MiniGameTaskWindow.name)
  end)
end

function Activity16MiniGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity16MiniGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function Activity16MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity16_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity16MiniGameMainWindow
