local GetChapterConfig = function()
  local activityId = TimeLimitedTowerData.GetActivityId()
  local conf = TableData.GetConfig(activityId, "BaseActivity")
  if conf then
    local splits = Split(conf.parameter, "|")
    local chapterId = tonumber(splits[1])
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    return chapterConf
  end
end
local GetStages = function()
  local conf = GetChapterConfig()
  if conf then
    return conf.stages
  end
end
local GetLatestStageIndex = function()
  local stages = GetStages()
  if stages then
    for i, v in ipairs(stages) do
      local passed = TimeLimitedTowerMgr.IsStagePassed(v)
      if not passed then
        return i
      end
    end
    return #stages
  else
    return 1
  end
end
local params = {
  stageId = -1,
  sceneType = 10,
  extData = nil,
  backFunc = function()
    UIMgr:CloseWindow(WinResConfig.FormationWindow.name)
  end
}
local PrepareEnterBattle = function(stageId)
  params.stageId = stageId
  ld("Formation")
  FormationMgr.TryOpenFormationWindow(params, true)
end
local IsStagePassed = function(stageId)
  local passedStages = TimeLimitedTowerData.GetPassedStages()
  local cnt = passedStages and #passedStages or 0
  for i = 1, cnt do
    if passedStages[i] == stageId then
      return true
    end
  end
  return false
end
local IsInProgress = function()
  local startTimestamp = TimeLimitedTowerData.GetStartTimestamp()
  local endTimestamp = TimeLimitedTowerData.GetEndTimestamp()
  if type(startTimestamp) ~= "number" or type(endTimestamp) ~= "number" then
    return false
  end
  if startTimestamp > endTimestamp then
    return false
  end
  local timestamp = LoginData.GetCurServerTime()
  return startTimestamp < timestamp and endTimestamp > timestamp
end
local IsOutOfDate = function(kickout)
  if not IsInProgress() then
    MessageBox.Show(T(20610), {
      touchCallback = function()
        if kickout then
          UIMgr:CloseToWindow(WinResConfig.AdventureWindow.name)
        end
      end
    }, nil, {
      touchCallback = function()
        if kickout then
          UIMgr:CloseToWindow(WinResConfig.AdventureWindow.name)
        end
      end
    })
    return true
  end
  return false
end
return {
  GetChapterConfig = GetChapterConfig,
  GetStages = GetStages,
  GetLatestStageIndex = GetLatestStageIndex,
  PrepareEnterBattle = PrepareEnterBattle,
  IsStagePassed = IsStagePassed,
  IsInProgress = IsInProgress,
  IsOutOfDate = IsOutOfDate
}
