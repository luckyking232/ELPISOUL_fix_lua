ActivityDungeonMgr = {}

function ActivityDungeonMgr.OpenWindow(showId)
  ActivityDungeonData.SaveShowId(showId)
  local data = ActivityDungeonData.GetActivityData()
  if data then
    if 1 == data.show_id then
      OpenWindow(WinResConfig.ActivityDungeonWindow.name)
    elseif 2 == data.show_id then
      OpenWindow(WinResConfig.Activity2DungeonWindow.name)
    elseif 3 == data.show_id then
      OpenWindow(WinResConfig.Activity3DungeonWindow.name)
    elseif 4 == data.show_id then
      OpenWindow(WinResConfig.Activity4DungeonWindow.name)
    elseif 5 == data.show_id then
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_1)
    elseif 6 == data.show_id then
      OpenWindow(WinResConfig.Activity6DungeonWindow.name)
    elseif 7 == data.show_id then
      OpenWindow(WinResConfig.Activity7DungeonWindow.name)
    elseif 8 == data.show_id then
      OpenWindow(WinResConfig.Activity8DungeonWindow.name)
    elseif 9 == data.show_id then
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_2)
    elseif 10 == data.show_id then
      OpenWindow(WinResConfig.Activity10DungeonWindow.name)
    elseif 11 == data.show_id then
      OpenWindow(WinResConfig.Activity11DungeonWindow.name)
    elseif 12 == data.show_id then
      OpenWindow(WinResConfig.Activity12DungeonWindow.name)
    elseif 13 == data.show_id then
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_3)
    elseif 14 == data.show_id then
      OpenWindow(WinResConfig.Activity14DungeonWindow.name)
    elseif 15 == data.show_id then
      OpenWindow(WinResConfig.Activity15DungeonWindow.name)
    elseif 16 == data.show_id then
      OpenWindow(WinResConfig.Activity16DungeonWindow.name)
    elseif 17 == data.show_id then
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_4)
    elseif 18 == data.show_id then
      OpenWindow(WinResConfig.Activity18DungeonWindow.name)
    elseif 19 == data.show_id then
      OpenWindow(WinResConfig.Activity19DungeonWindow.name)
    elseif 20 == data.show_id then
      OpenWindow(WinResConfig.Activity20DungeonWindow.name)
    elseif 21 == data.show_id then
      OpenWindow(WinResConfig.Activity21DungeonWindow.name)
    elseif 22 == data.show_id then
      OpenWindow(WinResConfig.Activity22DungeonWindow.name)
    end
  end
end

function ActivityDungeonMgr.OpenActivityPlotWindow(showId)
  if 1 == showId then
    OpenWindow(WinResConfig.ActivityDungeonWindow.name, nil, showId)
  elseif 2 == showId then
    OpenWindow(WinResConfig.Activity2DungeonWindow.name, nil, showId)
  elseif 3 == showId then
    OpenWindow(WinResConfig.Activity3DungeonWindow.name, nil, showId)
  elseif 4 == showId then
    OpenWindow(WinResConfig.Activity4DungeonWindow.name, nil, showId)
  elseif 5 == showId then
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_1, nil, nil, showId)
  elseif 6 == showId then
    OpenWindow(WinResConfig.Activity6DungeonWindow.name, nil, showId)
  elseif 7 == showId then
    OpenWindow(WinResConfig.Activity7DungeonWindow.name, nil, showId)
  elseif 8 == showId then
    OpenWindow(WinResConfig.Activity8DungeonWindow.name, nil, showId)
  elseif 9 == showId then
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_2, nil, nil, showId)
  elseif 10 == showId then
    OpenWindow(WinResConfig.Activity10DungeonWindow.name, nil, showId)
  elseif 11 == showId then
    OpenWindow(WinResConfig.Activity11DungeonWindow.name, nil, showId)
  elseif 12 == showId then
    OpenWindow(WinResConfig.Activity12DungeonWindow.name, nil, showId)
  elseif 13 == showId then
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_3, nil, nil, showId)
  elseif 14 == showId then
    OpenWindow(WinResConfig.Activity14DungeonWindow.name, nil, showId)
  elseif 15 == showId then
    OpenWindow(WinResConfig.Activity15DungeonWindow.name, nil, showId)
  elseif 16 == showId then
    OpenWindow(WinResConfig.Activity16DungeonWindow.name, nil, showId)
  elseif 17 == showId then
    AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ACTIVITY_4, nil, nil, showId)
  elseif 18 == showId then
    OpenWindow(WinResConfig.Activity18DungeonWindow.name, nil, showId)
  elseif 19 == showId then
    OpenWindow(WinResConfig.Activity19DungeonWindow.name, nil, showId)
  elseif 20 == showId then
    OpenWindow(WinResConfig.Activity20DungeonWindow.name, nil, showId)
  elseif 21 == showId then
    OpenWindow(WinResConfig.Activity21DungeonWindow.name, nil, showId)
  elseif 22 == showId then
    OpenWindow(WinResConfig.Activity22DungeonWindow.name, nil, showId)
  end
end

function ActivityDungeonMgr.GetUnlockPlotId()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local data = ActivityDungeonData.GetActivityData()
  local storyId = {}
  if activityInfo and data then
    for i = 1, #data.story_id do
      local dataStory = TableData.GetConfig(data.story_id[i], "BaseStory")
      if dataStory then
        local arr = Split(dataStory.open_condition, ":")
        local stageId = tonumber(arr[2])
        if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.STAGE and table.contain(activityInfo.finishStages, stageId) then
          table.insert(storyId, dataStory.id)
        end
      end
    end
  end
  return storyId
end

function ActivityDungeonMgr.GetCurDay()
  return TimeUtil.FormatDate("%Y%m%d", LoginData.GetCurServerTime())
end

function ActivityDungeonMgr.SaveDay()
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.ACTIVIVTY_DUNGEON_DAY, ActivityDungeonMgr.GetCurDay())
end

function ActivityDungeonMgr.MergeItemNum(rewards)
  local newReward = {}
  local AddItem = function(drop)
    local isFind = false
    for i, v in ipairs(newReward) do
      if v.item.itemId == drop.item.itemId and v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
        isFind = true
        newReward[i].item.count = newReward[i].item.count + drop.item.count
        break
      end
    end
    if false == isFind then
      table.insert(newReward, drop)
    end
  end
  for i = 1, #rewards do
    AddItem(rewards[i])
  end
  return newReward
end

function ActivityDungeonMgr.CheckActivityEnd()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  if activityInfo and LoginData.GetCurServerTime() >= activityInfo.baseInfo.endStamp then
    MessageBox.Show(T(1618), {
      touchCallback = function()
        UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
      end
    }, nil, {touchable = false})
  end
end

function ActivityDungeonMgr.GetConfigDataByShowId(showId)
  local data = TableData.GetTable("BaseActivityStageConfig")
  for i, v in pairs(data) do
    if v.show_id == showId then
      return v
    end
  end
end

function ActivityDungeonMgr.GetActivityPlotStoryId(showId)
  local data = TableData.GetTable("BaseActivityStageReview")
  for i, v in pairs(data) do
    if v.show_id == showId then
      return v.story_id
    end
  end
end
