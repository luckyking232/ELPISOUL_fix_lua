require("ActivityDungeon1018_TaskWindowByName")
local Activity18TaskWindow = {}
local uis, contentPane

function Activity18TaskWindow.ReInitData()
end

function Activity18TaskWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity18TaskWindow.package, WinResConfig.Activity18TaskWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1018_TaskWindowUis(contentPane)
    Activity18TaskWindow.UpdateInfo()
    Activity18TaskWindow.InitBtn()
    local data = ActivityDungeonData.GetActivityData()
    if data then
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(data.bg_task)
    end
  end)
end

function Activity18TaskWindow.UpdateInfo(notPlayAnim)
  local title = uis.Main.TaskTitle
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo then
    local list = uis.Main.TaskTipsList
    local taskList = Activity18TaskWindow.SortTask(activityInfo.taskList)
    
    function list.itemRenderer(i, item)
      local info = taskList[i + 1]
      local taskData = TableData.GetConfig(info.taskId, "BaseTask")
      if taskData then
        local taskTips = item:GetChild("TaskTips")
        UIUtil.SetText(taskTips, taskData.name and taskData.name() or "", "NameTxt")
        local barValue = math.min(info.value, taskData.task_parameter[1])
        if info.state == ProtoEnum.TASK_STATE.FINISHED then
          UIUtil.SetText(taskTips:GetChild("TaskProgress"), T(1526, barValue, taskData.task_parameter[1]), "Number2Txt")
          ChangeUIController(taskTips, "c1", 1)
          taskTips:GetChild("GetBtn").onClick:Set(function()
            ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, info.uid, function()
              if uis then
                Activity18TaskWindow.UpdateInfo()
              end
            end)
          end)
        elseif info.state == ProtoEnum.TASK_STATE.NORMAL then
          UIUtil.SetText(taskTips:GetChild("TaskProgress"), T(1525, barValue, taskData.task_parameter[1]), "Number1Txt")
          ChangeUIController(taskTips, "c1", 0)
        elseif info.state == ProtoEnum.TASK_STATE.REWARD then
          ChangeUIController(taskTips, "c1", 2)
        end
        local arr = GetConfigItemList(taskData.reward, true)
        local rewardList = taskTips:GetChild("RewardList")
        
        function rewardList.itemRenderer(i, item)
          Activity18TaskWindow.ShowAllItemFrame(arr[1 + i], item)
        end
        
        rewardList.numItems = #arr
        if not notPlayAnim and i < 7 then
          taskTips.alpha = 0
          PlayUITrans(item, "up", nil, i * 0.05)
          TimerUtil.setTimeout(i * 0.05, function()
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LIST_MOVE)
          end)
        end
      end
    end
    
    list.numItems = #taskList
    title.NumberTxt.text = T(1641, Activity18TaskWindow.GetRewardNum(), #taskList)
    uis.Main.AllGetBtn.visible = RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId()) and true or false
  end
end

function Activity18TaskWindow.GetRewardNum()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local num = 0
  if activityInfo then
    for i, v in pairs(activityInfo.taskList) do
      if v.state == ProtoEnum.TASK_STATE.REWARD then
        num = num + 1
      end
    end
  end
  return num
end

function Activity18TaskWindow.ShowAllItemFrame(addAttr, item)
  if addAttr.type == ProtoEnum.TUPLE_TYPE.CARD then
    local loader = item:GetChild("CardFrame"):GetChild("ItemCardPic"):GetChild("ItemLoader")
    if loader then
      local data = TableData.GetConfig(addAttr.id, "BaseCard")
      if data then
        UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
        ChangeUIController(item:GetChild("CardFrame"), "c1", data.star - 1)
      end
    end
    ChangeUIController(item, "c2", 1)
  elseif addAttr.type == ProtoEnum.TUPLE_TYPE.ITEM then
    local config = TableData.GetConfig(addAttr.id, "BaseItem")
    local itemFrame = item:GetChild("ItemFrame")
    local loader = itemFrame:GetChild("ItemLoader")
    if loader and config then
      loader.url = UIUtil.GetResUrl(config.icon)
    end
    ChangeUIController(item, "c2", 0)
    ChangeUIController(itemFrame, "c1", config.quality)
    local numberTxt = itemFrame:GetChild("NumberTxt")
    if numberTxt then
      numberTxt.text = addAttr.value
    end
  end
  item.onClick:Set(function()
    UIUtil.OpenPreviewTips(addAttr.id, addAttr.type)
  end)
end

function Activity18TaskWindow.SortTask(taskList)
  local list = {}
  for i, v in ipairs(taskList) do
    if v.state == ProtoEnum.TASK_STATE.FINISHED then
      v.sortIndex = 3
    elseif v.state == ProtoEnum.TASK_STATE.NORMAL then
      v.sortIndex = 2
    else
      v.sortIndex = 1
    end
    table.insert(list, v)
  end
  local taskDataA, taskDataB, sortA, sortB
  table.sort(list, function(a, b)
    if a.sortIndex == b.sortIndex then
      taskDataA = TableData.GetConfig(a.taskId, "BaseTask")
      taskDataB = TableData.GetConfig(b.taskId, "BaseTask")
      if taskDataB and taskDataA then
        sortA = taskDataA.sort or 0
        sortB = taskDataB.sort or 0
        return sortA < sortB
      end
    else
      return a.sortIndex > b.sortIndex
    end
  end)
  return list
end

function Activity18TaskWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(Activity18TaskWindow.CloseWindow)
  local title = uis.Main.TaskTitle
  title.WordTxt.text = T(2115)
  title.TitleTxt.text = T(2114)
  UIUtil.SetText(uis.Main.AllGetBtn, T(1510))
  uis.Main.AllGetBtn.onClick:Set(function()
    local activityInfo = ActivityDungeonData.GetActivityInfo()
    if activityInfo then
      ActivityDungeonService.ActivityStageTaskRewardReq(activityInfo.baseInfo.activityId, 0, function()
        if uis then
          Activity18TaskWindow.UpdateInfo(true)
        end
      end)
    end
  end)
end

function Activity18TaskWindow.CloseWindow()
  UIMgr:CloseWindow(WinResConfig.Activity18TaskWindow.name)
end

function Activity18TaskWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity18TaskWindow
