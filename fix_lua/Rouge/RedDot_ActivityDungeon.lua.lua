RedDotActivityDungeon = {}

function RedDotActivityDungeon.CanShowHome(showId)
  return RedDotActivityDungeon.CanMaterialRed(showId) or RedDotActivityDungeon.CanHomePass(showId) or RedDotActivityDungeon.CanTask(showId) or RedDotActivityDungeon.CanSgin(showId)
end

function RedDotActivityDungeon.CanTask(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo then
      for i, v in pairs(activityInfo.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

local GetMaxDay = function(showId)
  local data = ActivityDungeonData.GetActivityData(showId)
  if data and data.check_in_id then
    local allSign = TableData.GetTable("BaseActivityCheckIn")
    local max = 0
    for i, v in pairs(allSign) do
      if v.type == data.check_in_id then
        max = math.max(max, v.day)
      end
    end
    return max
  end
end

function RedDotActivityDungeon.CanSgin(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo and activityInfo.curDay > 0 then
      local max = GetMaxDay()
      if max then
        max = math.min(max, activityInfo.curDay)
        for i = 1, max do
          if table.contain(activityInfo.signDay, i) == false then
            return true
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanHomePass(showId)
  return RedDotActivityDungeon.CanReward(showId) or RedDotActivityDungeon.DailyTaskComplete(showId)
end

function RedDotActivityDungeon.CanReward(showId)
  if PassportData then
    local info = PassportData.GetActivityPassport(showId)
    if info then
      local GetReward = function(passId)
        for _, vv in pairs(info.rewards) do
          if vv.passId == passId then
            return vv
          end
        end
      end
      local passportData = TableData.GetConfig(info.passPortId, "BaseBattlePassport")
      for i, v in pairs(info.openList) do
        local infoReward = GetReward(v)
        infoReward = infoReward or {
          rewardLvs = {}
        }
        if table.getLen(infoReward.rewardLvs) < info.lv and passportData.level_max >= info.lv then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.DailyTaskComplete(showId)
  if PassportData then
    local info = PassportData.GetActivityPassport(showId)
    if info then
      local data = TableData.GetConfig(info.passPortId, "BaseBattlePassport")
      if data and data.level_max > info.lv and 2 == data.group_id then
        for i, vv in pairs(info.dailyTask) do
          if vv.state == ProtoEnum.TASK_STATE.FINISHED then
            return true
          end
        end
      end
    end
    return false
  end
end

function RedDotActivityDungeon.CanMaterialRed(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo and activityInfo.creamCount > 0 then
      local configData = ActivityDungeonData.GetActivityData(showId)
      if configData and configData.cream_chapter_ids then
        local arr = Split(configData.cream_chapter_ids, ":")
        if 3 == #arr and table.contain(activityInfo.finishStages, tonumber(arr[2])) then
          local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.ACTIVIVTY_DUNGEON_DAY)
          if string.isEmptyOrNil(str) or ActivityDungeonMgr.GetCurDay() ~= str then
            return true
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanDailyNew(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    local time = LoginData.GetCurServerTime()
    for i, v in pairs(activityInfo.normalChapter) do
      if v <= time then
        local chapterData = TableData.GetConfig(i, "BaseChapter")
        if chapterData then
          if chapterData.pre == nil or 0 == chapterData.pre then
            if AdventureData.CanShowStageNew(i) then
              return true
            end
          else
            local preChapterData = TableData.GetConfig(chapterData.pre, "BaseChapter")
            if preChapterData then
              local endStage = preChapterData.stages[#preChapterData.stages]
              if table.contain(activityInfo.finishStages, endStage) and AdventureData.CanShowStageNew(i) then
                return true
              end
            end
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.CanBossNew(showId)
  if ActivityDungeonData then
    local activityInfo = ActivityDungeonData.GetActivityInfo(showId)
    if activityInfo then
      local configData = ActivityDungeonData.GetActivityData(showId)
      if configData and configData.boss_chapter_ids then
        local arr = Split(configData.boss_chapter_ids, ":")
        if 2 == #arr and table.contain(activityInfo.finishStages, tonumber(arr[2])) then
          local time = LoginData.GetCurServerTime()
          for i, v in pairs(activityInfo.bossChapter) do
            local chapterData = TableData.GetConfig(i, "BaseChapter")
            if chapterData then
              for index = 1, #chapterData.stages do
                if not table.contain(activityInfo.finishStages, chapterData.stages[index]) then
                  local stageData = TableData.GetConfig(chapterData.stages[index], "BaseStage")
                  if stageData and (stageData.unlock_time == nil or time >= activityInfo.baseInfo.startStamp + stageData.unlock_time) and (nil == stageData.pre or 0 == stageData.pre or table.contain(activityInfo.finishStages, stageData.pre)) and AdventureData.CanShowStageNew(stageData.id) then
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame1_TaskRewardable()
  if Activity1_MiniGameData then
    local info = Activity1_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame1_DailyTaskRewardable()
  if Activity1_MiniGameData then
    local info = Activity1_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame2_TaskRewardable()
  if Activity2_MiniGameData then
    local info = Activity2_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame2_DailyTaskRewardable()
  if Activity2_MiniGameData then
    local info = Activity2_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame3_TaskRewardable()
  if Activity3_MiniGameData then
    local info = Activity3_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame3_DailyTaskRewardable()
  if Activity3_MiniGameData then
    local info = Activity3_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame4_TaskRewardable()
  if Activity4_MiniGameData then
    local info = Activity4_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame4_DailyTaskRewardable()
  if Activity4_MiniGameData then
    local info = Activity4_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame5_FishTaskRewardable()
  if Activity5_MiniGameData then
    local info = Activity5_MiniGameData.GetMiniGameInfo(70441006)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame5_FishDailyTaskRewardable()
  if Activity5_MiniGameData then
    local info = Activity5_MiniGameData.GetMiniGameInfo(70441006)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame5_FishBookRewardable()
  if Activity5_MiniGameData then
    local info = Activity5_MiniGameData.GetMiniGameInfo(70441006)
    if info then
      for i, v in pairs(info.extraCount) do
        if v == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame5_TaskRewardable()
  if Activity5_MiniGameData then
    local info = Activity5_MiniGameData.GetMiniGameInfo(70441005)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame5_DailyTaskRewardable()
  if Activity5_MiniGameData then
    local info = Activity5_MiniGameData.GetMiniGameInfo(70441005)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame6_TaskRewardable()
  if Activity6_MiniGameData then
    local info = Activity6_MiniGameData.GetMiniGameInfo(70441007)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame6_DailyTaskRewardable()
  if Activity6_MiniGameData then
    local info = Activity6_MiniGameData.GetMiniGameInfo(70441007)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame10_TaskRewardable()
  if Activity10_MiniGameData then
    local info = Activity10_MiniGameData.GetMiniGameInfo(Activity10_MiniGameData.gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame10_DailyTaskRewardable()
  if Activity10_MiniGameData then
    local info = Activity10_MiniGameData.GetMiniGameInfo(Activity10_MiniGameData.gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame7_TaskRewardable()
  if Activity7_MiniGameData then
    local info = Activity7_MiniGameData.GetMiniGameInfo(70441008)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame7_DailyTaskRewardable()
  if Activity7_MiniGameData then
    local info = Activity7_MiniGameData.GetMiniGameInfo(70441008)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame8_TaskRewardable()
  if Activity8_MiniGameData then
    local info = Activity8_MiniGameData.GetMiniGameInfo(70441009)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame8_DailyTaskRewardable()
  if Activity8_MiniGameData then
    local info = Activity8_MiniGameData.GetMiniGameInfo(70441009)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame9_TaskRewardable(gameId)
  if Activity9_MiniGameData then
    local info = Activity9_MiniGameData.GetOneMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame9_DailyTaskRewardable(gameId)
  if Activity9_MiniGameData then
    local info = Activity9_MiniGameData.GetOneMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame11_TaskRewardable()
  if Activity11_MiniGameData then
    local info = Activity11_MiniGameData.GetMiniGameInfo(70441013)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame11_DailyTaskRewardable()
  if Activity11_MiniGameData then
    local info = Activity11_MiniGameData.GetMiniGameInfo(70441013)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame12_TaskRewardable()
  if Activity12_MiniGameData then
    local info = Activity12_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame12_DailyTaskRewardable()
  if Activity12_MiniGameData then
    local info = Activity12_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame13_TaskRewardable(gameId)
  if Activity13_MiniGameData then
    local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame13_DailyTaskRewardable(gameId)
  if Activity13_MiniGameData then
    local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame14_TaskRewardable()
  if Activity14_MiniGameData then
    local info = Activity14_MiniGameData.GetMiniGameInfo(70441018)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame14_DailyTaskRewardable()
  if Activity14_MiniGameData then
    local info = Activity14_MiniGameData.GetMiniGameInfo(70441018)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame15_TaskRewardable()
  if Activity15_MiniGameData then
    local info = Activity15_MiniGameData.GetMiniGameInfo(70441019)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame15_DailyTaskRewardable()
  if Activity15_MiniGameData then
    local info = Activity15_MiniGameData.GetMiniGameInfo(70441019)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame16_TaskRewardable()
  if Activity16_MiniGameData then
    local info = Activity16_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame16_DailyTaskRewardable()
  if Activity16_MiniGameData then
    local info = Activity16_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame17_DailyTaskRewardable(gameId)
  if Activity17_MiniGameData then
    local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame17_TaskRewardable(gameId)
  if Activity17_MiniGameData then
    local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame18_TaskRewardable(gameId)
  if Activity18_MiniGameData then
    local info = Activity18_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame18_DailyTaskRewardable(gameId)
  if Activity18_MiniGameData then
    local info = Activity18_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame19_TaskRewardable(gameId)
  if Activity19_MiniGameData then
    local info = Activity19_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame19_DailyTaskRewardable(gameId)
  if Activity19_MiniGameData then
    local info = Activity19_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame20_TaskRewardable(gameId)
  if Activity20_MiniGameData then
    local info = Activity20_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame20_DailyTaskRewardable(gameId)
  if Activity20_MiniGameData then
    local info = Activity20_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame21_TaskRewardable()
  if Activity21_MiniGameData then
    local info = Activity21_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame21_DailyTaskRewardable()
  if Activity21_MiniGameData then
    local info = Activity21_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end

function RedDotActivityDungeon.MiniGame22_TaskRewardable()
  if Activity22_MiniGameData then
    local info = Activity22_MiniGameData.GetMiniGameInfo()
    if info then
      for i, v in pairs(info.taskList) do
        if v.state == ProtoEnum.TASK_STATE.FINISHED then
          return true
        end
      end
    end
  end
end

function RedDotActivityDungeon.MiniGame22_DailyTaskRewardable()
  if Activity22_MiniGameData then
    local info = Activity22_MiniGameData.GetMiniGameInfo()
    if info then
      local rewarded = info.miniDailyStat >= ProtoEnum.TASK_STATE.REWARD
      local finished = info.miniDailyStat >= ProtoEnum.TASK_STATE.FINISHED
      return finished and not rewarded
    end
  end
end
