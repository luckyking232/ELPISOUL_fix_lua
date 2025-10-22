require("Schedule_ScheduleWindowByName")
local ScheduleWindow = {}
local uis, contentPane

function ScheduleWindow.ReInitData()
end

function ScheduleWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ScheduleWindow.package, WinResConfig.ScheduleWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetSchedule_ScheduleWindowUis(contentPane)
    ScheduleWindow.InitBtn()
    ScheduleWindow.Update()
  end)
end

function ScheduleWindow.Update()
  ScheduleWindow.LoadingShow()
  ScheduleService.GetFeatureScheduleReq(function()
    if uis then
      ScheduleWindow.UpdateInfo()
    end
  end)
end

function ScheduleWindow.GetLoadingData()
  local config = TableData.GetTable("BaseActivitySchedule")
  local data = {}
  for i, v in pairs(config) do
    if v.type > 1 then
      local type = v.type - 1
      data[type] = data[type] or {}
      table.insert(data[type], v)
    end
  end
  for i = 1, 2 do
    table.sort(data[i], function(a, b)
      return a.sort < b.sort
    end)
  end
  return data
end

function ScheduleWindow.LoadingShow()
  UIUtil.SetText(uis.Main.ScheduleTips.TabSignBtn, T(1732), "Word1Txt")
  UIUtil.SetText(uis.Main.ScheduleTips.TabSignBtn, T(1733), "Word2Txt")
  uis.Main.ScheduleTips.TitleTxt.text = T(1731)
  local tips = uis.Main.ScheduleTips
  tips.LeftRegion.Loading.WordTxt.text = T(1875)
  ChangeController(tips.LeftRegion.loadingCtr, 1)
  local list = tips.RightRegion.RightRegionList
  local data = ScheduleWindow.GetLoadingData()
  local wordTitle = {
    T(1746),
    T(1747)
  }
  local comName = {
    "Build",
    "Super",
    "Rogue",
    "Box",
    "Explore",
    "DailyTask",
    "Arena",
    "InitialEnergy"
  }
  
  function list.itemRenderer(i, root)
    UIUtil.SetText(root:GetChild("Title"), wordTitle[i + 1], "TitleTxt")
    local moduleList = root:GetChild("ModuleList")
    
    function moduleList.itemRenderer(index, item)
      local scheduleData = data[i + 1][index + 1]
      ChangeUIController(item, "c1", scheduleData.show_type)
      local loadCom = item:GetChild(comName[scheduleData.show_type + 1])
      if loadCom then
        ChangeUIController(loadCom, "lock", 4)
        UIUtil.SetText(loadCom:GetChild("Loading"), T(1875), "WordTxt")
        UIUtil.SetText(loadCom, scheduleData.name(), "NameTxt")
      end
    end
    
    moduleList.numItems = #data[i + 1]
  end
  
  list.numItems = #data
end

function ScheduleWindow.UpdateInfo()
  ScheduleWindow.InitAsset()
  ScheduleWindow.InitActivity()
  ScheduleWindow.InitMap()
  ScheduleWindow.InitDaily()
  RedDotMgr.AddNode({
    windowName = WinResConfig.ScheduleWindow.name,
    com = uis.Main.ScheduleTips.TabSignBtn,
    visibleFunc = function()
      return RedDotSchedule.CanItem()
    end,
    dataType = RED_DOT_DATA_TYPE.SCHEDULE
  })
end

function ScheduleWindow.ShowTips(callBack)
  local showInt = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SCHEDULE_SHOW_TIPS)
  if 1 == showInt then
    callBack()
  else
    MessageBox.Show(T(1745), {touchCallback = callBack}, {})
  end
end

function ScheduleWindow.InitMap()
  local list = uis.Main.ScheduleTips.RightRegion.RightRegionList
  if list.numItems > 0 then
    list:RemoveChildren(0, -1, true)
  end
  local dayItem = UIMgr:CreateObject("Schedule", "RightModule1")
  UIUtil.SetText(dayItem:GetChild("Title"), T(1746), "TitleTxt")
  local moduleList = dayItem:GetChild("ModuleList")
  local info = ScheduleData.GetInfo()
  if info then
    local dayData = {
      [1] = {
        id = 70900201,
        rspInfo = info.buffStage,
        ctr = 1
      },
      [2] = {
        id = 70900202,
        rspInfo = info.manorScene,
        ctr = 0
      },
      [3] = {
        id = 70900203,
        rspInfo = info.rogueWeekTask,
        ctr = 2
      },
      [4] = {
        id = 70900204,
        rspInfo = info.manor,
        ctr = 3
      },
      [5] = {
        id = 70900205,
        rspInfo = info.dispatch,
        ctr = 4
      },
      [6] = {
        id = 70900206,
        rspInfo = info.sealBigHookInfo,
        ctr = 8
      }
    }
    local curTime = LoginData.GetCurServerTime()
    local waitNum = #dayData
    local lockNum = 0
    
    function moduleList.itemRenderer(i, item)
      local config = TableData.GetConfig(dayData[i + 1].id, "BaseActivitySchedule")
      if config then
        ChangeUIController(item, "c1", dayData[i + 1].ctr)
        local tips
        if config.id == 70900201 then
          tips = item:GetChild("Super")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.FROST_DUNGEON, false) then
              local stateInfo = info.manor.featureSchedules[table.keyof(info.manor.featureSchedules, 15, "eventType")]
              if stateInfo then
                if stateInfo.open then
                  ChangeUIController(tips, "lock", 3)
                  UIUtil.SetText(tips:GetChild("TimeOpen"), T(1737, TimeUtil.FormatEnTime(stateInfo.endTime - curTime)), "WordTxt")
                  local max, cur = 0, 0
                  for i, v in pairs(rspInfo.stages) do
                    if ScheduleWindow.GetBuffStageNum(v.targets) then
                      cur = cur + 1
                    end
                  end
                  max = table.getLen(rspInfo.openStages)
                  local canReward = ScheduleWindow.BuffStageReward(rspInfo)
                  UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
                  ChangeUIController(tips, "reward", canReward and 1 or 0)
                  if cur == max and not canReward then
                    waitNum = waitNum - 1
                  end
                  local progress = tips:GetChild("Progress")
                  local conf = TableData.GetConfig(rspInfo.chapterId, "BaseChapter")
                  if conf then
                    local allInfo = {
                      [1] = {
                        ctrName = "c1",
                        txtName = "Word1Txt",
                        stageIds = {
                          conf.stages[1],
                          conf.stages[2]
                        }
                      },
                      [2] = {
                        ctrName = "c2",
                        txtName = "Word2Txt",
                        stageIds = {
                          conf.stages[3],
                          conf.stages[4]
                        }
                      },
                      [3] = {
                        ctrName = "c3",
                        txtName = "Word3Txt",
                        stageIds = {
                          conf.stages[5]
                        }
                      }
                    }
                    for infoI = 1, #allInfo do
                      local lock, star, max = ScheduleWindow.IsUnlock(rspInfo.stages, allInfo[infoI].stageIds)
                      if lock then
                        ChangeUIController(progress, allInfo[infoI].ctrName, 1)
                        UIUtil.SetText(progress, T(914, star, max), allInfo[infoI].txtName)
                      else
                        ChangeUIController(progress, allInfo[infoI].ctrName, 0)
                      end
                    end
                  end
                  tips.onClick:Set(function()
                    local touchCallback = function()
                      if LoginData.GetCurServerTime() >= stateInfo.endTime then
                        FloatTipsUtil.ShowWarnTips(T(1771))
                        ScheduleWindow.Update()
                        return
                      end
                      ld("FrostDungeon")
                      FrostDungeonService.GetFrostDungeonInfoReq(function()
                        OpenWindow(WinResConfig.FrostDungeonWindow.name)
                      end)
                    end
                    ScheduleWindow.ShowTips(touchCallback)
                  end)
                else
                  lockNum = lockNum + 1
                  UIUtil.SetText(tips:GetChild("TimeClose"), T(1741, TimeUtil.FormatEnTime(stateInfo.startTime - curTime)), "WordTxt")
                  ChangeUIController(tips, "lock", 2)
                  tips.onClick:Set(function()
                    FloatTipsUtil.ShowWarnTips(T(1741, TimeUtil.FormatEnTime(stateInfo.startTime - curTime)))
                  end)
                end
              end
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(FEATURE_ENUM.FROST_DUNGEON, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        elseif config.id == 70900202 then
          tips = item:GetChild("Build")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.TIDE_DUNGEON, false) then
              local stateInfo = info.manor.featureSchedules[table.keyof(info.manor.featureSchedules, 4, "eventType")]
              if stateInfo then
                if stateInfo.open then
                  ChangeUIController(tips, "lock", 3)
                  UIUtil.SetText(tips:GetChild("TimeOpen"), T(1737, TimeUtil.FormatEnTime(stateInfo.endTime - curTime)), "WordTxt")
                  local canReward = ScheduleWindow.ManorBossReward(rspInfo)
                  UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
                  ChangeUIController(tips, "reward", canReward and 1 or 0)
                  local cur, max = ScheduleWindow.GetBuildNum(rspInfo)
                  if cur == max and not canReward then
                    waitNum = waitNum - 1
                  end
                  local progress = tips:GetChild("Progress")
                  local allInfo = {
                    [ProtoEnum.SCENE_TYPE.MANOR_WATER] = {ctrName = "c1", txtName = "Word1Txt"},
                    [ProtoEnum.SCENE_TYPE.MANOR_FIR] = {ctrName = "c2", txtName = "Word2Txt"},
                    [ProtoEnum.SCENE_TYPE.MANOR_WOOD] = {ctrName = "c3", txtName = "Word3Txt"}
                  }
                  for infoI = 1, #rspInfo.sceneInfos do
                    local tempInfo = allInfo[rspInfo.sceneInfos[infoI].sceneType]
                    if tempInfo then
                      if rspInfo.sceneInfos[infoI].inOpenTime then
                        ChangeUIController(progress, tempInfo.ctrName, 1)
                        local conf = TableData.GetConfig(rspInfo.sceneInfos[infoI].currentChapter, "BaseChapter")
                        if conf then
                          UIUtil.SetText(progress, T(914, table.getLen(rspInfo.sceneInfos[infoI].curChapterInfo.stages), #conf.stages), tempInfo.txtName)
                        end
                      else
                        ChangeUIController(progress, tempInfo.ctrName, 0)
                      end
                    end
                  end
                  tips.onClick:Set(function()
                    local touchCallback = function()
                      if LoginData.GetCurServerTime() >= stateInfo.endTime then
                        FloatTipsUtil.ShowWarnTips(T(1771))
                        ScheduleWindow.Update()
                        return
                      end
                      ld("TideDungeon")
                      TideDungeonService.GetTideDungeonInfoReq(AbyssTideDungeon, function()
                        OpenWindow(WinResConfig.TideWindow.name)
                      end)
                    end
                    ScheduleWindow.ShowTips(touchCallback)
                  end)
                else
                  lockNum = lockNum + 1
                  UIUtil.SetText(tips:GetChild("TimeClose"), T(1741, TimeUtil.FormatEnTime(stateInfo.startTime - curTime)), "WordTxt")
                  ChangeUIController(tips, "lock", 2)
                  tips.onClick:Set(function()
                    FloatTipsUtil.ShowWarnTips(T(1741, TimeUtil.FormatEnTime(stateInfo.startTime - curTime)))
                  end)
                end
              end
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(FEATURE_ENUM.TIDE_DUNGEON, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        elseif config.id == 70900203 then
          tips = item:GetChild("Rogue")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ROGUE, false) then
              ChangeUIController(tips, "lock", 3)
              local cur, max = ScheduleWindow.GetDayTask(rspInfo.taskList)
              local canReward = ScheduleWindow.RogueReward(rspInfo)
              UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
              ChangeUIController(tips, "reward", canReward and 1 or 0)
              local str = T(1737, TimeUtil.FormatEnTime(rspInfo.refreshStamp - curTime))
              UIUtil.SetText(tips:GetChild("TimeOpen"), str, "WordTxt")
              if cur == max and not canReward then
                waitNum = waitNum - 1
              end
              local progress = tips:GetChild("Progress")
              local integralId = TableData.GetConfig(70010039, "BaseFixed").int_value
              local integral = ActorData.GetItemCount(integralId)
              local dailyRewardList = ScheduleWindow.GetWeekTarget()
              local maxIntegral = dailyRewardList[#dailyRewardList].unlock_points
              UIUtil.SetText(progress, T(914, integral, maxIntegral), "NumberTxt")
              UIUtil.SetText(progress, T(1753), "WordTxt")
              tips.onClick:Set(function()
                local touchCallback = function()
                  ld("Rogue", function()
                    RogueService.GetRogueInfoReq(function()
                      OpenWindow(WinResConfig.RogueWindow.name)
                    end)
                  end)
                end
                ScheduleWindow.ShowTips(touchCallback)
              end)
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_ROGUE, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        elseif config.id == 70900204 then
          tips = item:GetChild("Box")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE, false) then
              local event = {}
              local max = 0
              for i, v in pairs(rspInfo.allEvents) do
                local eventData = TableData.GetConfig(v.eventId, "BaseManorEvent")
                if v.eventType == AbyssExploreEventID.POSITIVE and eventData and eventData.sub_type == AbyssExploreSubEventID.TREASURE or v.eventType == AbyssExploreEventID.DAILY_RANDOM or v.eventType == AbyssExploreEventID.ILLUSTRATIONS_BGM or v.eventType == AbyssExploreEventID.ILLUSTRATIONS_MONSTER then
                  if v.eventId >= 76201099 then
                    max = max + 1
                  end
                  if 0 == v.finishStamp then
                    table.insert(event, v.eventId)
                  end
                end
              end
              if 0 == table.getLen(event) then
                waitNum = waitNum - 1
                UIUtil.SetText(tips:GetChild("Progress"), T(1836), "WordTxt")
              else
                UIUtil.SetText(tips:GetChild("Progress"), T(1755, table.getLen(event), max), "WordTxt")
              end
              ChangeUIController(tips, "lock", 3)
              local GetBtn = tips:GetChild("GetBtn")
              UIUtil.SetText(GetBtn, T(1756), "WordTxt")
              ChangeUIController(tips, "c1", table.getLen(event) > 0 and 0 or 1)
              GetBtn.onClick:Set(function()
                ScheduleService.ManorBatchProcessEventReq(event, function()
                  ChangeUIController(tips, "c1", 1)
                  UIUtil.SetText(tips:GetChild("Progress"), T(1836), "WordTxt")
                  UIUtil.SetText(dayItem:GetChild("Title"), T(1748, waitNum - 1 - lockNum, #dayData - lockNum), "WordTxt")
                end)
              end)
              tips:GetChild("TouchBtn").onClick:Set(function()
                local touchCallback = function()
                  ld("AbyssExplore")
                  AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS)
                end
                ScheduleWindow.ShowTips(touchCallback)
              end)
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(FEATURE_ENUM.HOME_EXPLORE, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        elseif config.id == 70900205 then
          tips = item:GetChild("Explore")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            tips:GetChild("TimeOpen").visible = false
            ChangeUIController(tips, "lock", 3)
            local list = tips:GetChild("StateList")
            local conf = ScheduleWindow.GetDispatchTeamConfigs()
            local maxNum = 0
            local canGet
            
            function list.itemRenderer(i, item)
              local config = conf[i + 1]
              local groupId = config.id
              local info = ScheduleWindow.GetDispatchInfo(rspInfo.groups, groupId)
              local completed
              if info and LoginData.GetCurServerTime() > info.overStamp then
                completed = true
                canGet = true
              end
              local available = not info
              local lv = rspInfo.level or 1
              local unlock = lv >= config.dispatch_level
              if unlock then
                ChangeUIController(item, "c1", available and 0 or completed and 2 or 1)
                if not available and not completed then
                  ScheduleWindow.DisplayHourglass(item)
                else
                  local hourglass = item:GetChild("hourglass")
                  if hourglass then
                    hourglass:Dispose()
                  end
                end
                maxNum = maxNum + 1
              else
                ChangeUIController(item, "c1", 3)
              end
            end
            
            list.numItems = #conf
            if maxNum <= table.getLen(rspInfo.groups) and nil == canGet then
              waitNum = waitNum - 1
            end
            tips.onClick:Set(function()
              local touchCallback = function()
                ld("ExploreAFK")
                ExploreAFKService.GetExploreAFKInfoReq(function()
                  OpenWindow(WinResConfig.ExploreWindow.name)
                end)
              end
              ScheduleWindow.ShowTips(touchCallback)
            end)
          end
        elseif config.id == 70900206 then
          tips = item:GetChild("ExploreDungeon")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(12705, false) then
              local threshold = TableData.GetConfig(70011703, "BaseFixed").int_value
              local cTime = LoginData.GetCurServerTime() - rspInfo.produceStartTime
              UIUtil.SetText(tips:GetChild("Progress"), T(2077, ScheduleWindow.SealFormatTime(math.min(threshold, cTime)), ScheduleWindow.SealFormatTime(threshold)), "WordTxt")
              ChangeUIController(tips, "lock", 3)
              local GetBtn = tips:GetChild("GetBtn")
              UIUtil.SetText(GetBtn, T(1756), "WordTxt")
              ChangeUIController(tips, "c1", table.getLen(rspInfo.hookRewards) > 0 and 0 or 1)
              GetBtn.onClick:Set(function()
                ld("ExploreDungeon")
                ExploreDungeonService.GetRewardReq(function()
                  ChangeUIController(tips, "c1", 1)
                end)
              end)
              local touchBtn = tips:GetChild("TouchBtn")
              if touchBtn then
                touchBtn.onClick:Set(function()
                  local touchCallback = function()
                    ld("ExploreDungeon")
                    OpenWindow(WinResConfig.ExploreDungeonMainWindow.name)
                  end
                  ScheduleWindow.ShowTips(touchCallback)
                end)
              end
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(12705, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        end
        UIUtil.SetText(tips, config.name(), "NameTxt")
      end
    end
    
    moduleList.numItems = #dayData
    UIUtil.SetText(dayItem:GetChild("Title"), T(1748, waitNum - lockNum, #dayData - lockNum), "WordTxt")
  end
  list:AddChild(dayItem)
end

function ScheduleWindow.SealFormatTime(time)
  time = math.floor(time)
  local hours, minutes, seconds
  hours = math.floor(time / 3600)
  time = time % 3600
  minutes = math.floor(time / 60)
  seconds = time % 60
  if hours > 0 then
    return T(10651, hours)
  elseif minutes > 0 then
    return T(10652, minutes)
  else
    return T(10653, seconds)
  end
end

function ScheduleWindow.GetBuffStageNum(targets)
  for i, v in pairs(targets) do
    if v and v > 0 then
      return true
    end
  end
end

function ScheduleWindow.IsUnlock(stages, ids)
  local lock = false
  local star = 0
  local max = 0
  for _, v in pairs(ids) do
    local i = table.keyof(stages, v, "stageId")
    if i and stages[i].openStamp < LoginData.GetCurServerTime() then
      lock = true
      star = star + math.max(table.getLen(stages[i].targets) - 1, 0)
    end
    local conf = TableData.GetConfig(stages[i].stageId, "BaseStage")
    if conf and conf.challenge_condition then
      max = max + math.max(table.getLen(conf.challenge_condition) - 1, 0)
    end
  end
  return lock, star, max
end

function ScheduleWindow.GetWeekTarget()
  local data = TableData.GetTable("BaseTaskTarget")
  local newTb = {}
  for i, v in pairs(data) do
    if 4 == v.type then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.unlock_points < b.unlock_points
  end)
  return newTb
end

function ScheduleWindow.DisplayHourglass(gcmp)
  local n1 = gcmp:GetChild("n1")
  local hourglass = gcmp:GetChild("hourglass")
  if not hourglass then
    local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    holder.name = "hourglass"
    local eff = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/ui_timeword_hourglass_yellow.prefab")
    UIUtil.SetObjectToUI(eff, holder, 12000)
    local transform = eff.transform
    transform.localPosition = Vector3(n1.width * 0.5, -n1.height * 0.5)
    gcmp:AddChild(holder)
    hourglass = holder
  end
  if n1 then
    local position = n1.position
    hourglass:SetXY(position.x, position.y)
    n1.visible = false
  end
end

function ScheduleWindow.GetDispatchInfo(groups, groupId)
  for i, v in pairs(groups) do
    if v.groupId == groupId then
      return v
    end
  end
end

function ScheduleWindow.GetDispatchTeamConfigs()
  local configs = {}
  local tbl = TableData.GetTable("BaseDispatchTeam")
  for i, v in pairs(tbl) do
    table.insert(configs, v)
  end
  table.sort(configs, function(x, y)
    return x.id < y.id
  end)
  return configs
end

function ScheduleWindow.GetBuildNum(rspInfo)
  local cur, max = 0, 0
  if rspInfo then
    for _, v in pairs(rspInfo.sceneInfos) do
      if v.inOpenTime then
        local data = TableData.GetConfig(v.curChapterInfo.chapterId, "BaseChapter")
        if data then
          max = max + #data.stages
          for i = 1, #data.stages do
            if table.keyof(v.curChapterInfo.stages, data.stages[i], "stageId") then
              cur = cur + 1
            end
          end
        end
      end
    end
  end
  return cur, max
end

function ScheduleWindow.RogueReward(rspInfo)
  local integralId = TableData.GetConfig(70010039, "BaseFixed").int_value
  local targetData = ScheduleWindow.GetWeekTarget()
  local weekReward = rspInfo.weeklyRewards
  local integral = ActorData.GetItemCount(integralId)
  if integral and weekReward and targetData then
    for i, v in pairs(targetData) do
      if integral >= v.unlock_points and not table.contain(weekReward, v.id) then
        return true
      end
    end
  end
end

function ScheduleWindow.ManorBossReward(rspInfo)
  for i, info in pairs(rspInfo.sceneInfos) do
    if info and info.inOpenTime then
      local stage = info.currentStage
      local chapterConf = TableData.GetConfig(info.currentChapter, "BaseChapter")
      local stages = chapterConf.stages
      local rewardedStages = info.rewardedStages
      local stageIndex = 0
      if stage > 0 then
        for i, v in ipairs(stages) do
          if stage == v then
            stageIndex = i
            break
          end
        end
      else
        stageIndex = 4
      end
      local rewardable = false
      for i = 1, stageIndex - 1 do
        if rewardedStages then
          if not table.keyof(rewardedStages, stages[i]) then
            rewardable = true
            break
          end
        else
          rewardable = true
          break
        end
      end
      return rewardable
    end
  end
end

function ScheduleWindow.BuffStageReward(rspInfo)
  for i, v in pairs(rspInfo.stages) do
    for _, vv in pairs(v.targets) do
      if 1 == vv then
        return true
      end
    end
  end
end

function ScheduleWindow.InitDaily()
  local list = uis.Main.ScheduleTips.RightRegion.RightRegionList
  local dayItem = UIMgr:CreateObject("Schedule", "RightModule1")
  UIUtil.SetText(dayItem:GetChild("Title"), T(1747), "TitleTxt")
  local moduleList = dayItem:GetChild("ModuleList")
  local info = ScheduleData.GetInfo()
  if info then
    local dayData = {
      [1] = {
        id = 70900303,
        rspInfo = info.supplyInfo
      },
      [2] = {
        id = 70900302,
        rspInfo = info.dailyTask
      },
      [3] = {
        id = 70900301,
        rspInfo = info.arena
      }
    }
    local curTime = LoginData.GetCurServerTime()
    local waitNum = #dayData
    local lockNum = 0
    
    function moduleList.itemRenderer(i, item)
      local config = TableData.GetConfig(dayData[i + 1].id, "BaseActivitySchedule")
      if config then
        if config.id == 70900302 then
          ChangeUIController(item, "c1", 5)
          local tips = item:GetChild("DailyTask")
          UIUtil.SetText(tips, config.name(), "NameTxt")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.DAILY_TASK, false) then
              ChangeUIController(tips, "lock", 3)
              local cur = DailyTaskData.GetDailyItem()
              local dailyRewardList = DailyTaskData.GetDailyReward()
              local max = dailyRewardList[#dailyRewardList].config.unlock_points
              local canReward = RedDotTask.CanDailyTarget()
              UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
              ChangeUIController(tips, "reward", canReward and 1 or 0)
              if cur >= max and not canReward then
                waitNum = waitNum - 1
              end
              UIUtil.SetText(tips:GetChild("Progress"), T(914, cur, max), "NumberTxt")
              UIUtil.SetText(tips:GetChild("Progress"), T(1750), "WordTxt")
              tips.onClick:Set(function()
                local touchCallback = function()
                  OpenWindow(WinResConfig.CarnivalWindow.name, nil, ACTIVITY_ID.DAILY_TASK)
                end
                ScheduleWindow.ShowTips(touchCallback)
              end)
            else
              lockNum = lockNum + 1
              ChangeUIController(tips, "lock", 0)
              local data = TableData.GetConfig(FEATURE_ENUM.DAILY_TASK, "BaseFeature")
              if data and data.unlock_des then
                UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
              end
            end
          end
        elseif config.id == 70900301 then
          local tips = item:GetChild("Arena")
          UIUtil.SetText(tips, config.name(), "NameTxt")
          ChangeUIController(item, "c1", 6)
          if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ARENA, false) then
            local rspInfo = dayData[i + 1].rspInfo
            if rspInfo then
              if ArenaMgr.minRank > rspInfo.matchInfo.rank then
                UIUtil.SetText(tips:GetChild("Rank"), T(1752, rspInfo.matchInfo.rank), "WordTxt")
              else
                UIUtil.SetText(tips:GetChild("Rank"), T(436), "WordTxt")
              end
              local canReward = ScheduleWindow.Arenareward(rspInfo)
              UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
              ChangeUIController(tips, "reward", canReward and 1 or 0)
              local down = math.floor(rspInfo.seasonEndTime - curTime)
              if down > 0 then
                ChangeUIController(tips, "lock", 3)
                local max = TableData.GetConfig(70010107, "BaseFixed").int_value
                if rspInfo.fightNum < 1 and not canReward then
                  waitNum = waitNum - 1
                end
                UIUtil.SetText(tips:GetChild("Progress"), T(914, rspInfo.fightNum, max), "NumberTxt")
                UIUtil.SetText(tips:GetChild("Progress"), T(1751), "WordTxt")
              else
                lockNum = lockNum + 1
                ChangeUIController(tips, "lock", 2)
                UIUtil.SetText(tips:GetChild("TimeClose"), T(370), "WordTxt")
              end
              tips.onClick:Set(function()
                local touchCallback = function()
                  CurrencyReturnWindow.jumpArena()
                end
                ScheduleWindow.ShowTips(touchCallback)
              end)
            end
          else
            lockNum = lockNum + 1
            ChangeUIController(tips, "lock", 0)
            local data = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_ARENA, "BaseFeature")
            if data and data.unlock_des then
              UIUtil.SetText(tips:GetChild("Lock"), data.unlock_des(), "WordTxt")
            end
          end
        elseif config.id == 70900303 then
          local tips = item:GetChild("InitialEnergy")
          ChangeUIController(item, "c1", 7)
          UIUtil.SetText(tips, config.name(), "NameTxt")
          local rspInfo = dayData[i + 1].rspInfo
          if rspInfo then
            local configTbl = TableData.GetTable("BaseActivityVitGet")
            local rewardConf = {}
            for i, v in pairs(configTbl) do
              table.insert(rewardConf, v)
            end
            table.sort(rewardConf, function(a, b)
              return a.id < b.id
            end)
            local progress = tips:GetChild("Progress")
            local max = #rewardConf
            local GetBtn = tips:GetChild("GetBtn")
            UIUtil.SetText(GetBtn, T(1756), "WordTxt")
            local Update = function(rewarded)
              local canGet = false
              local haveEnd = true
              local lockTime
              for ind = 1, max do
                local inTime = DailySupplyMgr.InTime(rewardConf[ind].id)
                local alreadyGot = table.contain(rewarded, rewardConf[ind].id)
                local ctrName = "c" .. ind
                if alreadyGot then
                  ChangeUIController(progress, ctrName, 2)
                elseif inTime then
                  canGet = true
                  ChangeUIController(progress, ctrName, 1)
                else
                  haveEnd = nil
                  if nil == lockTime and rewardConf[ind].time and rewardConf[ind].time[1] then
                    local splits = Split(rewardConf[ind].time[1], ":")
                    lockTime = string.sub(splits[1], 1, 2) .. ":" .. string.sub(splits[1], 3, 4)
                  end
                  ChangeUIController(progress, ctrName, 0)
                end
              end
              if haveEnd then
                UIUtil.SetText(tips:GetChild("Time"), T(1837), "WordTxt")
              else
                UIUtil.SetText(tips:GetChild("Time"), T(1838, lockTime), "WordTxt")
              end
              if table.getLen(rewarded) >= max then
                waitNum = waitNum - 1
              end
              ChangeUIController(tips, "c1", canGet and 0 or 1)
            end
            Update(rspInfo.rewarded)
            ChangeUIController(tips, "lock", 3)
            GetBtn.onClick:Set(function()
              local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
              local maxEnergy = TableData.GetConfig(70010003, "BaseFixed").int_value
              local minArr = GetConfigItemList(rewardConf[1].reward, true)
              if minArr and minArr[1] and minArr[1].value > maxEnergy - energy then
                FloatTipsUtil.ShowWarnTips(T(824))
                return
              end
              DailySupplyService.RewardSupplyReq(0, false, function(msg)
                Update(msg.rewarded)
                UIUtil.SetText(dayItem:GetChild("Title"), T(1748, waitNum - lockNum, #dayData - lockNum), "WordTxt")
              end)
            end)
            tips:GetChild("TouchBtn").onClick:Set(function()
              local touchCallback = function()
                OpenWindow(WinResConfig.CarnivalWindow.name, nil, ACTIVITY_ID.DAILY_SUPPLY)
              end
              ScheduleWindow.ShowTips(touchCallback)
            end)
          end
        end
      end
    end
    
    moduleList.numItems = #dayData
    UIUtil.SetText(dayItem:GetChild("Title"), T(1748, waitNum - lockNum, #dayData - lockNum), "WordTxt")
    moduleList:ResizeToFit()
  end
  list:AddChild(dayItem)
end

function ScheduleWindow.Arenareward(arenaInfo)
  if arenaInfo and arenaInfo.highRank and arenaInfo.rewardPhase then
    local config = TableData.GetTable("BaseArenaRankReward")
    for i, v in pairs(config) do
      if v.phase == arenaInfo.rewardPhase and arenaInfo.highRank <= v.rank_low and not table.contain(arenaInfo.rewardList, v.id) then
        return true
      end
    end
  end
end

function ScheduleWindow.GetDayTask(taskList)
  local num = 0
  local max = 0
  for i, v in pairs(taskList) do
    if v.state == ProtoEnum.TASK_STATE.REWARD then
      num = num + 1
    end
    max = max + 1
  end
  return num, max
end

function ScheduleWindow.InitActivity()
  local info = ScheduleData.GetInfo()
  if info then
    local data = {
      {
        id = 70900101,
        rspInfo = info.guildWar
      },
      {
        id = 70900103,
        rspInfo = info.limitChallenge
      },
      {
        id = 70900102,
        rspInfo = info.bossInfo
      }
    }
    for i = #data, 1, -1 do
      if data[i].rspInfo == nil then
        table.remove(data, i)
      end
    end
    if info.stageActInfo and info.stageActInfo.stageAct then
      local addData = {}
      for i = 1, #info.stageActInfo.stageAct do
        local dataActivity = TableData.GetConfig(info.stageActInfo.stageAct[i].baseInfo.activityId, "BaseActivity")
        if dataActivity and dataActivity.type == 10119 then
          local config = TableData.GetConfig(tonumber(dataActivity.parameter), "BaseActivityStageConfig")
          if config then
            table.insert(addData, {
              id = config.id,
              rspInfo = info.stageActInfo.stageAct[i],
              sort = config.sort
            })
          end
        end
      end
      table.sort(addData, function(a, b)
        return a.sort > b.sort
      end)
      for i = 1, #addData do
        table.insert(data, addData[i])
      end
    end
    local list = uis.Main.ScheduleTips.LeftRegion.LeftRegionList
    local numItem = math.ceil(#data / 4)
    local maxPer = 1 / (numItem - 1)
    local ind = 1
    local listPage = 0
    
    function list.itemRenderer(i, item)
      local tempTb = {
        data[ind],
        data[ind + 1],
        data[ind + 2],
        data[ind + 3]
      }
      ScheduleWindow.ShowActivityInfo(item, tempTb)
      ind = ind + 4
    end
    
    list.numItems = numItem
    list.scrollPane.onScrollEnd:Set(function()
      listPage = Mathf.Abs(list.scrollPane.percX / maxPer)
      ScheduleWindow.SetPageShow(numItem, listPage)
    end)
    ScheduleWindow.SetPageShow(numItem, listPage)
    ChangeController(uis.Main.ScheduleTips.LeftRegion.loadingCtr, 0)
  end
end

function ScheduleWindow.SetPageShow(len, listPage)
  if len <= 1 then
    ChangeController(uis.Main.ScheduleTips.LeftRegion.c1Ctr, 0)
    return
  end
  local pageList = uis.Main.ScheduleTips.LeftRegion.PageNumberList
  
  function pageList.itemRenderer(i, item)
    if listPage == i then
      ChangeUIController(item, "c1", 1)
    else
      ChangeUIController(item, "c1", 0)
    end
  end
  
  pageList.numItems = len
  ChangeController(uis.Main.ScheduleTips.LeftRegion.c1Ctr, 1)
end

function ScheduleWindow.ShowActivityInfo(item, data)
  local time = LoginData.GetCurServerTime()
  for i = 1, 4 do
    local module = item:GetChild("Module" .. i)
    if data[i] then
      local config = TableData.GetConfig(data[i].id, "BaseActivitySchedule")
      local tips = module:GetChild("LeftModule")
      tips.onClick:Clear()
      ChangeUIController(module, "c1", 0)
      if config and tips then
        UIUtil.SetText(tips, config.name(), "NameTxt")
        tips:GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(config.icon)
        if config.id == 70900101 then
          ScheduleWindow.ShowGuildWar(data[i].rspInfo, tips)
        elseif config.id == 70900103 then
          ScheduleWindow.ShowLimitTower(data[i].rspInfo, tips)
        elseif config.id == 70900102 then
          ScheduleWindow.ShowBoss(data[i].rspInfo, tips)
        end
      else
        local config = TableData.GetConfig(data[i].id, "BaseActivityStageConfig")
        if config and tips then
          ScheduleWindow.ShowCardActivity(data[i].rspInfo, tips)
        end
      end
    else
      ChangeUIController(module, "c1", 1)
    end
  end
end

function ScheduleWindow.FinishedTask(tasks)
  for i, v in ipairs(tasks) do
    local finished = v.state == ProtoEnum.TASK_STATE.FINISHED
    if finished then
      return true
    end
  end
end

function ScheduleWindow.ShowCardActivity(stageInfo, tips)
  if stageInfo then
    local time = LoginData.GetCurServerTime()
    if time > stageInfo.baseInfo.startStamp and time < stageInfo.baseInfo.endStamp then
      ChangeUIController(tips, "lock", 3)
      local str = T(1737, TimeUtil.FormatEnTime(stageInfo.baseInfo.endStamp - time))
      UIUtil.SetText(tips:GetChild("TimeOpen"), str, "WordTxt")
      UIUtil.SetText(tips:GetChild("Ing"), T(1738), "WordTxt")
    else
      ChangeUIController(tips, "lock", 2)
    end
    local dataActivity = TableData.GetConfig(stageInfo.baseInfo.activityId, "BaseActivity")
    if dataActivity and dataActivity.type == 10119 then
      local stageConfig = TableData.GetConfig(tonumber(dataActivity.parameter), "BaseActivityStageConfig")
      if stageConfig then
        UIUtil.SetText(tips, stageConfig.name(), "NameTxt")
        tips:GetChild("Pic"):GetChild("PicLoader").url = UIUtil.GetResUrl(stageConfig.icon)
        tips.onClick:Set(function()
          local touchCallback = function()
            if LoginData.GetCurServerTime() >= stageInfo.baseInfo.endStamp then
              FloatTipsUtil.ShowWarnTips(T(1618))
            else
              ActivityDungeonService.GetActivityAllReq(function()
                ActivityDungeonMgr.OpenWindow(stageConfig.show_id)
              end)
            end
          end
          ScheduleWindow.ShowTips(touchCallback)
        end)
      end
    end
  else
    ChangeUIController(tips, "lock", 0)
  end
end

function ScheduleWindow.RaidBossRewards(raidBossData)
  if raidBossData then
    local rewardStages = raidBossData.rewardStages
    local chapter = raidBossData.curChapter
    local conf = TableData.GetConfig(chapter, "BaseChapter")
    if conf then
      local levels = conf.stages
      for _, v in ipairs(levels) do
        local i = type(rewardStages) == "table" and table.keyof(rewardStages, v)
        if type(i) ~= "number" and v < raidBossData.curStage then
          return true
        end
      end
    end
  end
end

function ScheduleWindow.ShowBoss(rspInfo, tips)
  local time = LoginData.GetCurServerTime()
  local unlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_RAID, false)
  if rspInfo and unlock and time < rspInfo.endStamp then
    local str = T(1737, TimeUtil.FormatEnTime(rspInfo.endStamp - time))
    UIUtil.SetText(tips:GetChild("TimeOpen"), str, "WordTxt")
    local maxNum = 3
    local stageData = TableData.GetConfig(rspInfo.curStage, "BaseStage")
    if stageData and stageData.next then
      UIUtil.SetText(tips:GetChild("Ing"), T(1740, rspInfo.fighterCount, maxNum), "WordTxt")
    else
      UIUtil.SetText(tips:GetChild("Ing"), T(1740, rspInfo.challengeCount, maxNum), "WordTxt")
    end
    if ScheduleWindow.RaidBossRewards(rspInfo) then
      UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
      ChangeUIController(tips, "reward", 1)
    else
      ChangeUIController(tips, "reward", 0)
    end
    ChangeUIController(tips, "lock", 3)
    tips.onClick:Set(function()
      local touchCallback = function()
        ld("RaidBoss")
        RaidBossService.GetRaidBossInfoReq(function()
          OpenWindow(WinResConfig.RaidBossWindow.name)
        end)
      end
      ScheduleWindow.ShowTips(touchCallback)
    end)
  else
    if rspInfo and time < rspInfo.nextStartStamp then
      local diff = rspInfo.nextStartStamp - time
      UIUtil.SetMoveText(tips:GetChild("Lock"):GetChild("MoveWord"), T(20331, TimeUtil.FormatEnTime(diff)), "WordTxt")
    else
      local data = TableData.GetConfig(FEATURE_ENUM.ADVENTURE_RAID, "BaseFeature")
      if data and data.unlock_des then
        UIUtil.SetMoveText(tips:GetChild("Lock"):GetChild("MoveWord"), data.unlock_des(), "WordTxt")
      end
    end
    ChangeUIController(tips, "lock", 0)
  end
end

function ScheduleWindow.ShowGuildWar(rspInfo, tips)
  if rspInfo then
    local time = LoginData.GetCurServerTime()
    if 0 ~= rspInfo.rank and rspInfo.rank < 101 then
      UIUtil.SetText(tips:GetChild("Rank"), T(429, rspInfo.rank), "WordTxt")
      ChangeUIController(tips, "GuildBoss", 1)
    elseif 0 ~= rspInfo.rankRatio then
      UIUtil.SetText(tips:GetChild("Rank"), T(1640, math.ceil(rspInfo.rankRatio / 100)), "WordTxt")
      ChangeUIController(tips, "GuildBoss", 1)
    else
      ChangeUIController(tips, "GuildBoss", 0)
    end
    if rspInfo.schedule.state == ProtoEnum.GuildWarState.GWS_FIGHT then
      local str = T(1737, TimeUtil.FormatEnTime(rspInfo.schedule.endStamp - time))
      UIUtil.SetText(tips:GetChild("TimeOpen"), str, "WordTxt")
      ChangeUIController(tips, "lock", 3)
      local maxNum = 3
      UIUtil.SetText(tips:GetChild("Ing"), T(1739, maxNum - rspInfo.fightCount, maxNum), "WordTxt")
    elseif rspInfo.schedule.state == ProtoEnum.GuildWarState.GWS_NOTICE then
      ChangeUIController(tips, "lock", 2)
      UIUtil.SetText(tips:GetChild("TimeClose"), T(1741, TimeUtil.FormatEnTime(rspInfo.schedule.endStamp - time)), "WordTxt")
    elseif rspInfo.schedule.state == ProtoEnum.GuildWarState.GWS_SETTLE or rspInfo.schedule.state == ProtoEnum.GuildWarState.GWS_SETTLE_WAIT or rspInfo.schedule.state == ProtoEnum.GuildWarState.GWS_CLOSE then
      UIUtil.SetText(tips:GetChild("TimeClose"), T(1742), "WordTxt")
      ChangeUIController(tips, "lock", 2)
    end
    tips.onClick:Set(function()
      local touchCallback = function()
        if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD_WAR) then
          GuildWarMgr.OpenGuildWarWindow()
        end
      end
      ScheduleWindow.ShowTips(touchCallback)
    end)
  else
    ChangeUIController(tips, "lock", 0)
  end
end

function ScheduleWindow.ShowLimitTower(rspInfo, tips)
  local unlock, lockStr = ScheduleWindow.TowerIsOpen(rspInfo)
  if unlock then
    local time = LoginData.GetCurServerTime()
    local str = T(1737, TimeUtil.FormatEnTime(rspInfo.endStamp - time))
    UIUtil.SetText(tips:GetChild("TimeOpen"), str, "WordTxt")
    local num, max = ScheduleWindow.GetDayTask(rspInfo.tasks)
    UIUtil.SetText(tips:GetChild("Ing"), T(1744, num, max), "WordTxt")
    ChangeUIController(tips, "lock", 3)
    if ScheduleWindow.FinishedTask(rspInfo.tasks) then
      UIUtil.SetText(tips:GetChild("Reward"), T(1859), "WordTxt")
      ChangeUIController(tips, "reward", 1)
    else
      ChangeUIController(tips, "reward", 0)
    end
    tips.onClick:Set(function()
      local touchCallback = function()
        if rspInfo.endStamp > LoginData.GetCurServerTime() then
          OpenWindow(WinResConfig.TimeLimitedTowerWindow.name)
        else
          FloatTipsUtil.ShowWarnTips(T(1618))
        end
      end
      ScheduleWindow.ShowTips(touchCallback)
    end)
  else
    ChangeUIController(tips, "lock", 0)
    UIUtil.SetMoveText(tips:GetChild("Lock"):GetChild("MoveWord"), lockStr, "WordTxt")
  end
end

function ScheduleWindow.TowerIsOpen(rspInfo)
  if nil == rspInfo then
    return false, ""
  end
  local unlock = false
  local unlockLv, unlockStage
  local conf = TableData.GetConfig(rspInfo.activityId, "BaseActivity")
  if conf then
    local splits = Split(conf.parameter, "|")
    local chapterId = tonumber(splits[1])
    local chapterConf = TableData.GetConfig(chapterId, "BaseChapter")
    if chapterConf then
      if chapterConf.open_condition then
        local arr = Split(chapterConf.open_condition, ":")
        if 2 == #arr then
          if tonumber(arr[1]) == CONDITION_ENUM.LV then
            unlockLv = tonumber(arr[2])
            unlock = unlockLv <= ActorData.GetLevel()
          elseif tonumber(arr[1]) == CONDITION_ENUM.STAGE then
            unlockStage = tonumber(arr[2])
            local sceneInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
            local currentChapter = sceneInfo.currentChapter
            if table.keyof(sceneInfo.curChapterInfo.stages, unlockStage) then
              unlock = true
            else
              local conf = TableData.GetConfig(currentChapter, "BaseChapter")
              currentChapter = conf.pre
              while currentChapter do
                conf = TableData.GetConfig(currentChapter, "BaseChapter")
                if not conf then
                  break
                end
                if table.keyof(conf.stages, unlockStage) then
                  unlock = true
                  break
                end
                if not conf.pre then
                  break
                end
                currentChapter = conf.pre
              end
            end
          end
        end
      else
        unlock = true
      end
      if unlock then
        if LoginData.GetCurServerTime() >= rspInfo.endStamp then
          return false, T(1743)
        else
          return true
        end
      elseif unlockStage then
        return false, T(969, TableData.GetConfig(unlockStage, "BaseStage").name_detail())
      elseif unlockLv then
        return false, T(80630100, unlockLv)
      end
    end
  end
end

function ScheduleWindow.GetLimitMaxNum(time)
  local stageData = TableData.GetTable("BaseStage")
  local num = 0
  for i, v in pairs(stageData) do
    if 10 == v.chapter_type and (v.unlock_time == nil or time >= v.unlock_time) then
      num = num + 1
    end
  end
  return num
end

function ScheduleWindow.InitAsset()
  local list = uis.Main.ScheduleTips.Asset.AssetList
  if list.numItems > 0 then
    list:RemoveChildren(0, -1, true)
  end
  local item = UIMgr:CreateObject("Schedule", "Asset1")
  UIUtil.SetText(item:GetChild("Title1"), T(1734), "TitleTxt")
  UIUtil.SetText(item:GetChild("Title2"), T(1735), "TitleTxt")
  local assetList = item:GetChild("AssetList")
  local id = {
    21000004,
    21000003,
    21000001,
    21000002,
    21100001,
    21100004
  }
  
  function assetList.itemRenderer(i, item)
    ChangeUIController(item, "c1", i)
    local data = TableData.GetConfig(id[i + 1], "BaseItem")
    if data then
      UIUtil.SetText(item, data.name(), "NameTxt")
      if data.id == 21000004 then
        local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
        local maxEnergy = ActorData.GetEnergyMax()
        UIUtil.SetText(item, T(1736, energy, maxEnergy), "NumberTxt")
      else
        UIUtil.SetText(item, ActorData.GetItemCount(data.id), "NumberTxt")
      end
    end
  end
  
  assetList.numItems = #id
  local itemList = item:GetChild("ItemList")
  local itemId = ScheduleWindow.GetItemCountByExpire()
  
  function itemList.itemRenderer(i, item)
    local itemInfo = itemId[i + 1]
    UIUtil.ShowItemFrame(itemInfo.itemId, item, itemInfo.count, itemInfo, function()
      local itemConfig = TableData.GetConfig(itemInfo.itemId, "BaseItem")
      if itemConfig then
        if itemConfig.show_type and 1 == itemConfig.show_type then
          ld("Bag", function()
            OpenWindow(WinResConfig.ItemTipsWindow.name, nil, itemInfo.itemUid)
          end)
        elseif itemConfig.type == ProtoEnum.ITEM_TYPE.HEAD_RECT_ITEM then
          OpenWindow(WinResConfig.ChoiceHeadWindow.name, nil, 2)
        else
          UIUtil.OpenPreviewTips(itemInfo.itemId, ProtoEnum.TUPLE_TYPE.ITEM)
        end
      end
    end)
  end
  
  itemList.numItems = #itemId
  list:AddChild(item)
end

function ScheduleWindow.GetItemCountByExpire()
  local items = ActorData.GetItems()
  local id = {}
  local time = LoginData.GetCurServerTime()
  for _, v in ipairs(items) do
    if v.count > 0 and v.expireStamp > 0 and v.expireStamp - time < 86400 then
      table.insert(id, v)
    end
  end
  table.sort(id, function(a, b)
    return a.expireStamp < b.expireStamp
  end)
  return id
end

function ScheduleWindow.InitBtn()
  uis.Main.ScheduleTips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ScheduleWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ScheduleWindow.name)
  end)
  UIUtil.SetText(uis.Main.ScheduleTips.RightWordTipsBtn, T(1749))
  uis.Main.ScheduleTips.RightWordTipsBtn.onClick:Set(function()
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.SCHEDULE_SHOW_TIPS, uis.Main.ScheduleTips.RightWordTipsBtn.selected and 1 or 0)
  end)
  local showInt = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SCHEDULE_SHOW_TIPS)
  uis.Main.ScheduleTips.RightWordTipsBtn.selected = 1 == showInt and true or false
end

function ScheduleWindow.OnShown()
  if uis then
    ScheduleWindow.InitAsset()
  end
end

function ScheduleWindow.OnClose()
  uis = nil
  contentPane = nil
  RedDotMgr.RemoveNode(WinResConfig.ScheduleWindow.name)
end

function ScheduleWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ScheduleWindow.Update()
  end
end

return ScheduleWindow
