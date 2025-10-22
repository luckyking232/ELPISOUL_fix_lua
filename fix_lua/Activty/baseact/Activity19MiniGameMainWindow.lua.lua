require("ActivityDungeon1019_MiniGameWindowByName")
local Activity19MiniGameMainWindow = {}
local uis, contentPane
local gameId = 70441024
ld("Activity19_MiniGame")

local function RefreshPanelInfo()
  local info = Activity19_MiniGameData.GetMiniGameInfo()
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(20840)
  uis.Main.Top.Integral.NumberTxt.text = info.miniHighScore
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20841, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.SetText(uis.Main.StartBtn, T(20842), "WordTxt")
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity19_MiniGameService.MiniGameGetDailyRewardReq(RefreshPanelInfo)
    end
  end)
end

function Activity19MiniGameMainWindow.ReInitData()
end

function Activity19MiniGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity19MiniGameMainWindow.package, WinResConfig.Activity19MiniGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1019_MiniGameWindowUis(contentPane)
    Activity19MiniGameMainWindow.UpdateInfo()
    Activity19MiniGameMainWindow.InitBtn()
  end)
end

function Activity19MiniGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1019/MiniGame_1000"
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity19MiniGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame19_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity19MiniGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame19_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity19_MiniGameService.MiniGameInfoReq(RefreshPanelInfo)
end

function Activity19MiniGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity19MiniGameMainWindow.name)
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
          Activity19_MiniGameService.GameSubmitWithLowestScore()
        end)
        return
      end
      GameObject.Destroy(obj)
      obj = nil
    end
    OpenWindow(WinResConfig.Activity19MiniGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity19MiniGameTaskWindow.name)
  end)
end

function Activity19MiniGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity19MiniGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function Activity19MiniGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity19_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity19MiniGameMainWindow
