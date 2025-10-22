require("ActivityDungeon1014_MiniGameWindowByName")
local Activity14MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441018
ld("Activity14_MiniGame")
local RefreshPanelInfo = function()
  local info = Activity14_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(20764)
  uis.Main.Top.Integral.NumberTxt.text = T(20765, info.miniHighScore)
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20766, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20767), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity14_MiniGameService.MiniGameGetDailyRewardReq(gameId)
    end
  end)
end

function Activity14MiniGameMainWindow.ReInitData()
end

function Activity14MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity14MiniGameMainWindow.package, WinResConfig.Activity14MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1014_MiniGameWindowUis(contentPane)
    Activity14MiniGameMainWindow.UpdateInfo()
    Activity14MiniGameMainWindow.InitBtn()
  end)
end

function Activity14MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://e1uy2fpxo7hn9o"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity14MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame14_DailyTaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity14MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame14_TaskRewardable()
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity14_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity14MiniGameMainWindow.InitBtn()
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity14MiniGameWindow.name)
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity14MiniGameMainWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity14MiniGameTaskWindow.name)
  end)
end

function Activity14MiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity14MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity14_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity14MiniGameMainWindow
