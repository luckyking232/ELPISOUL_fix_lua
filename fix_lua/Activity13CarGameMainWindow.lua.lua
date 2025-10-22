require("ActivityDungeon1013_MiniGame2WindowByName")
local Activity13CarGameMainWindow = {}
local uis, contentPane
local RefreshPanelInfo = function()
  local gameId = 70441017
  local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(1981)
  local num = 0
  if info.extraCount and info.extraCount[1] then
    num = info.extraCount[1]
  end
  uis.Main.Top.Integral.NumberTxt.text = num
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(1982, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(1983), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity13_MiniGameService.MiniGameGetDailyRewardReq(gameId)
    end
  end)
end

function Activity13CarGameMainWindow.ReInitData()
end

function Activity13CarGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13CarGameMainWindow.package, WinResConfig.Activity13CarGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniGame2WindowUis(contentPane)
    Activity13CarGameMainWindow.UpdateInfo()
    Activity13CarGameMainWindow.InitBtn()
  end)
end

function Activity13CarGameMainWindow.UpdateInfo()
  local gameId = 70441017
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1013", "MiniGame1_1000")
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13CarGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame13_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13CarGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame13_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity13_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity13CarGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13CarGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity13CarGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity13CarGameTaskWindow.name)
  end)
end

function Activity13CarGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity13CarGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity13_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity13CarGameMainWindow
