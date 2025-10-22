require("ActivityDungeon1017_MiniGameWindowByName")
local Activity17DodgerGameMainWindow = {}
local uis, contentPane
ld("Activity17_MiniGame")
local gameId = 70441021

local function RefreshPanelInfo()
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local str = conf.game_day_reward[1]
  local splits = Split(str, ":")
  local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
  uis.Main.Top.Integral.WordTxt.text = T(20785)
  uis.Main.Top.Integral.NumberTxt.text = T(20786, info.miniHighScore / 10)
  local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
  uis.Main.Botton.TodayTask.c1Ctr.selectedIndex = not finished and 0 or rewarded and 2 or 1
  uis.Main.Botton.TodayTask.Item.c1Ctr.selectedIndex = 0
  local achieveDailyScoreThresholdTxt = T(20787, finished and 1 or 0)
  uis.Main.Botton.TodayTask.WordTxt.text = achieveDailyScoreThresholdTxt
  UIUtil.ShowItemFrame(itemId, uis.Main.Botton.TodayTask.Item.ItemFrame.root, count, nil, function(context)
    UIUtil.CommonItemClickCallback(itemId, itemType)
    context:StopPropagation()
  end)
  uis.Main.Botton.TodayTask.root.onClick:Set(function()
    if finished and not rewarded then
      Activity17_MiniGameService.MiniGameGetDailyRewardReq(gameId, RefreshPanelInfo)
    end
  end)
end

function Activity17DodgerGameMainWindow.ReInitData()
end

function Activity17DodgerGameMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17DodgerGameMainWindow.package, WinResConfig.Activity17DodgerGameMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniGameWindowUis(contentPane)
    Activity17DodgerGameMainWindow.UpdateInfo()
    Activity17DodgerGameMainWindow.InitBtn()
  end)
end

function Activity17DodgerGameMainWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1017/MiniGame_1000"
  UIUtil.SetText(uis.Main.SetBtn, T(20783), "WordTxt")
  UIUtil.SetText(uis.Main.StartBtn, T(20784), "WordTxt")
  uis.Main.Top.Integral.WordTxt.text = T(20785)
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DodgerGameMainWindow.name,
    com = uis.Main.Botton.TodayTask.root,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame17_DailyTaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DodgerGameMainWindow.name,
    com = uis.Main.Botton.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.MiniGame17_TaskRewardable(gameId)
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  Activity17_MiniGameService.MiniGameInfoReq(gameId, RefreshPanelInfo)
end

function Activity17DodgerGameMainWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity17DodgerGameMainWindow.name)
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
          Activity17_MiniGameService.MiniGameSubmitReq(gameId, {}, 0, 0, function()
          end)
        end)
        return
      end
      GameObject.Destroy(obj)
      obj = nil
    end
    OpenWindow(WinResConfig.Activity17DodgerGameWindow.name)
  end)
  uis.Main.Botton.TaskBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity17DodgerGameTaskWindow.name)
  end)
  uis.Main.SetBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity17DodgerGameSettingsWindow.name)
  end)
end

function Activity17DodgerGameMainWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity17DodgerGameMainWindow.name)
  uis = nil
  contentPane = nil
end

function Activity17DodgerGameMainWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity17_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity17DodgerGameMainWindow
