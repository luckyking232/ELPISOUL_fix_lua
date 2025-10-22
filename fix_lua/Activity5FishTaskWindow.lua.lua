require("ActivityDungeon1004_MiniTask2WindowByName")
local Activity5FishTaskWindow = {}
local uis, contentPane
local gameId = 70441006

local function RefreshRewardList()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local minigame_tasks = info.taskList
  local list = uis.Main.TipsList
  list:SetVirtual()
  
  function list.itemRenderer(i, gcmp)
    local task = minigame_tasks[i + 1]
    local taskId = task.taskId
    local state = task.state
    local taskConf = TableData.GetConfig(taskId, "BaseTask")
    local child = gcmp:GetChild("Tips")
    local task_parameter = taskConf.task_parameter[1]
    local barValue = math.min(task.value, task_parameter)
    if state == ProtoEnum.TASK_STATE.FINISHED then
      UIUtil.SetText(child, T(1382), "Word1Txt")
      UIUtil.SetText(child, T(723, barValue, task_parameter), "NumberTxt")
      ChangeUIController(child, "c1", 1)
      child:GetChild("GetBtn").onClick:Set(function()
        local activityInfo = ActivityDungeonData.GetActivityInfo()
        ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, task.uid, function()
          if uis then
            Activity5_MiniGameService.MiniGameInfoReq(gameId, RefreshRewardList)
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
        end)
      end)
    elseif state == ProtoEnum.TASK_STATE.NORMAL then
      UIUtil.SetText(child, T(723, barValue, task_parameter), "NumberTxt")
      UIUtil.SetText(child, T(1384), "Word1Txt")
      ChangeUIController(child, "c1", 0)
    elseif state == ProtoEnum.TASK_STATE.REWARD then
      ChangeUIController(child, "c1", 2)
    end
    UIUtil.SetText(child, taskConf.name and taskConf.name() or taskId, "WordTxt")
    local itemlist = child:GetChild("ItemList")
    
    function itemlist.itemRenderer(j, subgcmp)
      local str = taskConf.reward[j + 1]
      local splits = Split(str, ":")
      local itemType, itemId, count = tonumber(splits[1]), tonumber(splits[2]), tonumber(splits[3])
      local itemFrame = subgcmp:GetChild("ItemFrame")
      UIUtil.ShowItemFrame(itemId, itemFrame, count, nil, function()
        UIUtil.CommonItemClickCallback(itemId, itemType)
      end)
    end
    
    itemlist.opaque = false
    itemlist.numItems = taskConf.reward and #taskConf.reward or 0
  end
  
  table.sort(minigame_tasks, function(x, y)
    if x.state == y.state then
      return x.taskId < y.taskId
    end
    local xstate = x.state
    if xstate == ProtoEnum.TASK_STATE.FINISHED then
      xstate = xstate - 2
    end
    local ystate = y.state
    if ystate == ProtoEnum.TASK_STATE.FINISHED then
      ystate = ystate - 2
    end
    return xstate < ystate
  end)
  list.numItems = #minigame_tasks
end

function Activity5FishTaskWindow.ReInitData()
end

function Activity5FishTaskWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishTaskWindow.package, WinResConfig.Activity5FishTaskWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniTask2WindowUis(contentPane)
    Activity5FishTaskWindow.UpdateInfo()
    Activity5FishTaskWindow.InitBtn()
  end)
end

function Activity5FishTaskWindow.UpdateInfo()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(70441006, "BaseActivityStageGame")
  local threshold = conf.game_day_num
  local score = threshold < info.miniDailyScore and threshold or info.miniDailyScore
  local dailyScoreTxt = T(1718)
  uis.Main.Integral.WordTxt.text = dailyScoreTxt
  uis.Main.Integral.NumberTxt.text = string.format("%s/%s", score, threshold)
  RefreshRewardList()
  local list = uis.Main.TipsList
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity5FishTaskWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5FishTaskWindow.name)
  end)
end

function Activity5FishTaskWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5FishTaskWindow
