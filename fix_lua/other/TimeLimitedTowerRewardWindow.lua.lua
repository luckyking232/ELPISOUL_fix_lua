require("TowerSpecial_RewardListWindowByName")
local TimeLimitedTowerRewardWindow = {}
local uis, contentPane
local RefreshPanelInfo = function(playanim)
  local itemlist = uis.Main.ItemList
  local tasks = TimeLimitedTowerData.GetTasks()
  itemlist.numItems = tasks and #tasks or 0
  if playanim then
    for i = 0, itemlist.numChildren - 1 do
      local child = itemlist:GetChildAt(i)
      child:GetChildAt(0).alpha = 0
      PlayUITrans(child, "up", nil, i * 0.03)
    end
  end
end
local ItemRenderer = function(i, gcmp)
  local tasks = TimeLimitedTowerData.GetTasks()
  local index = i + 1
  local task = tasks[index]
  local taskState = task.state
  local reward = taskState == ProtoEnum.TASK_STATE.REWARD
  local finished = taskState == ProtoEnum.TASK_STATE.FINISHED
  local subgcmp = gcmp:GetChild("Item")
  ChangeUIController(subgcmp, "c1", reward and 2 or finished and 1 or 0)
  local taskConfig = TableData.GetConfig(task.taskId, "BaseTask")
  UIUtil.SetText(subgcmp, T(20321), "ProgressTxt")
  UIUtil.SetText(subgcmp, T(20320), "GetTxt")
  UIUtil.SetText(subgcmp, taskConfig.name(), "WordTxt")
  local rewardlist = subgcmp:GetChild("RewardList")
  local rewards = {}
  for _, str in ipairs(taskConfig.reward) do
    local splits = Split(str, ":")
    table.insert(rewards, {
      itemId = tonumber(splits[2]),
      count = tonumber(splits[3]),
      type = tonumber(splits[1])
    })
  end
  
  function rewardlist.itemRenderer(j, ggcmp)
    local reward = rewards[j + 1]
    local type = reward.type
    local itemId = reward.itemId
    UIUtil.ShowItemFrame(itemId, ggcmp, reward.count, nil, function(context)
      UIUtil.CommonItemClickCallback(itemId, type)
      context:StopPropagation()
    end)
  end
  
  rewardlist.numItems = #rewards
  subgcmp.onClick:Set(function()
    if finished then
      TimeLimitedTowerService.GetRewardReq(task.uid, function()
        TimeLimitedTowerService.GetTimeLimitedTowerInfoReq(RefreshPanelInfo)
      end)
    end
  end)
end

function TimeLimitedTowerRewardWindow.ReInitData()
end

function TimeLimitedTowerRewardWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TimeLimitedTowerRewardWindow.package, WinResConfig.TimeLimitedTowerRewardWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTowerSpecial_RewardListWindowUis(contentPane)
    TimeLimitedTowerRewardWindow.UpdateInfo()
    TimeLimitedTowerRewardWindow.InitBtn()
  end)
end

function TimeLimitedTowerRewardWindow.UpdateInfo()
  uis.Main.Title.TitleTxt.text = T(20593)
  uis.Main.Title.WordTxt.text = T(20594)
  uis.Main.BackGround.BackGroundLoader.url = "ui://UIBackGround/TowerSpecial_1001"
  local itemlist = uis.Main.ItemList
  itemlist.itemRenderer = ItemRenderer
  RefreshPanelInfo(true)
  uis.Main.Title.TitleTxt.text = T(20595)
  uis.Main.Title.WordTxt.text = T(20596)
end

function TimeLimitedTowerRewardWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.TimeLimitedTowerRewardWindow.name)
  end)
end

function TimeLimitedTowerRewardWindow.OnClose()
  uis = nil
  contentPane = nil
end

return TimeLimitedTowerRewardWindow
