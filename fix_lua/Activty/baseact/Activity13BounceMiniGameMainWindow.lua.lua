require("ActivityDungeon1013_MiniGameWindowByName")
local Activity13BounceMiniGameMainWindow = {}
local uis, contentPane
ld("Activity13_MiniGame")
local gameId = 70441016
local RefreshPanelInfo = function()
  local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(20524)
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20757, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20659), "WordTxt")
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

function Activity13BounceMiniGameMainWindow.ReInitData()
end

function Activity13BounceMiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13BounceMiniGameMainWindow.package, WinResConfig.Activity13BounceMiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniGameWindowUis(contentPane)
    Activity13BounceMiniGameMainWindow.UpdateInfo()
    Activity13BounceMiniGameMainWindow.InitBtn()
  end)
end

function Activity13BounceMiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1013/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13BounceMiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame13_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13BounceMiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame13_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity13_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity13BounceMiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameMainWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    if Application.platform == RuntimePlatform.Android or Application.platform == RuntimePlatform.IPhonePlayer then
      local obj = GameObject()
      local wheelJoint2D = obj:AddComponent(typeof(CS.UnityEngine.WheelJoint2D))
      if nil == wheelJoint2D then
        GameObject.Destroy(obj)
        obj = nil
        local config = TableData.GetConfig(gameId, "BaseActivityStageGame")
        UIUtil.DealClientVersionOutdated(config.game_name and config.game_name(), nil, function()
          Activity13_MiniGameService.BounceGameSubmitWithLowestScore()
        end)
        return
      end
      GameObject.Destroy(obj)
      obj = nil
    end
    OpenWindow(WinResConfig.Activity13BounceMiniGameWindow.name)
  end)
  uis.Main.Botton.RecordBtn.onClick:Set(function()
    Activity13_MiniGameService.MiniGameGetRankInfoReq(gameId, function()
      OpenWindow(WinResConfig.Activity13BounceMiniGameRankWindow.name)
    end)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity13BounceMiniGameTaskWindow.name)
  end)
end

function Activity13BounceMiniGameMainWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.Activity13BounceMiniGameMainWindow.name)
end

function Activity13BounceMiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity13_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity13BounceMiniGameMainWindow
