require("ActivityDungeon1021_MiniTaskWindowByName")
local Activity21MiniGameTaskWindow = {}
local uis, contentPane
local gameId = 70441026

local function RefreshRewardList()
  local info = Activity21_MiniGameData.GetMiniGameInfo(gameId)
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
    UIUtil.SetText(child, T(723, barValue, task_parameter), "NumberTxt")
    if state == ProtoEnum.TASK_STATE.FINISHED then
      UIUtil.SetText(child, T(1382), "Word1Txt")
      ChangeUIController(child, "c1", 1)
      child:GetChild("GetBtn").onClick:Set(function()
        local activityInfo = ActivityDungeonData.GetActivityInfo()
        ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, task.uid, function()
          if uis then
            Activity21_MiniGameService.MiniGameInfoReq(RefreshRewardList)
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
        end)
      end)
    elseif state == ProtoEnum.TASK_STATE.NORMAL then
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

function Activity21MiniGameTaskWindow.ReInitData()
end

function Activity21MiniGameTaskWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21MiniGameTaskWindow.package, WinResConfig.Activity21MiniGameTaskWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1021_MiniTaskWindowUis(contentPane)
    Activity21MiniGameTaskWindow.UpdateInfo()
    Activity21MiniGameTaskWindow.InitBtn()
  end)
end

function Activity21MiniGameTaskWindow.UpdateInfo()
  local info = Activity21_MiniGameData.GetMiniGameInfo(gameId)
  local conf = TableData.GetConfig(gameId, "BaseActivityStageGame")
  local threshold = conf.game_day_num
  local num = math.min(info.miniDailyNum, threshold)
  local dailyNumTxt = T(20536)
  uis.Main.Integral.WordTxt.text = dailyNumTxt
  uis.Main.Integral.NumberTxt.text = string.format("%s/%s", num, threshold)
  RefreshRewardList()
  local list = uis.Main.TipsList
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity21MiniGameTaskWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity21MiniGameTaskWindow.name)
  end)
end

function Activity21MiniGameTaskWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity21MiniGameTaskWindow
