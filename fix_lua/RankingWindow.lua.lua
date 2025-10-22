require("RankingList_RankingWindowByName")
ld("Ranklist")
local RankingWindow = {}
local uis, contentPane, playAnim, selectedIndex, lastSelectedIndex, TAB_LIST
local TAB_INDEX = {
  MAIN_LINE = 1,
  TOWER = 2,
  PVP = 3,
  BOSS = 4,
  GUILDWAR = 5
}
local tablist, clearCache, bridge
local GetTabItem = function(tabIndex)
  local k = table.keyof(tablist, tabIndex, "tabIndex")
  return k, tablist[k]
end
local RefreshTablist = function()
  tablist = tablist or {}
  table.clear(tablist)
  for i, v in ipairs(TAB_LIST) do
    if type(v.funcId) ~= "number" or EnterClampUtil.WhetherToEnter(v.funcId, false) then
      table.insert(tablist, {tabIndex = i, tab = v})
    end
  end
end
local ScrollToTop = function()
  local list = uis.Main.RankList.RankList
  if list.numItems > 0 then
    list:ScrollToView(0, false)
  end
end
local RefreshSelectedPanel = function()
  local index, selected = GetTabItem(selectedIndex)
  local selectedTab = selected.tab
  local count = selectedTab.GetLength()
  local list = uis.Main.RankList.RankList
  list.numItems = count
  playAnim = false
  local empty = 0 == (count and count or 0)
  uis.Main.c1Ctr.selectedIndex = empty and 1 or 0
  local guild = selectedIndex == TAB_INDEX.GUILDWAR
  for i = 1, 3 do
    local gcmp = uis.Main.Region[string.format("Rank%s", i)].root
    local info = selectedTab.GetRankInfoAt(i)
    local number = gcmp:GetChild("Number")
    local rank = i
    UIUtil.SetText(number, rank, "NumberTxt")
    if rank <= 3 then
      ChangeUIController(number, "c1", rank - 1)
    else
      ChangeUIController(number, "c1", 3)
    end
    ChangeUIController(gcmp, "type", guild and 1 or 0)
    if info then
      if guild then
        local headData = TableData.GetConfig(info.iconId, "BaseGuildHeadIcon")
        if headData then
          gcmp:GetChild("GulidIconLoader").url = UIUtil.GetResUrl(headData.icon)
        end
      else
        UIUtil.ShowPlayerHead(info, gcmp:GetChild("Head"))
      end
      local name = info.name or info.guildName
      if selectedIndex == TAB_INDEX.PVP then
        name = ArenaMgr.GetRobotName(info.randNameId, info.name)
      end
      UIUtil.SetText(gcmp, name, "NameTxt")
      UIUtil.SetText(gcmp, name, "n4")
      gcmp.onClick:Set(function()
        if selectedIndex == TAB_INDEX.GUILDWAR then
          return
        end
        if selectedIndex == TAB_INDEX.PVP and type(info.randNameId) == "number" and info.randNameId > 0 then
          return
        end
        ActorService.GetOtherDetailInfoReq(info.uin, function(otherInfo)
          OpenWindow(WinResConfig.PlayerWindow.name, nil, otherInfo)
        end)
      end)
    else
      UIUtil.SetText(gcmp, T(20886), "NameTxt")
      UIUtil.SetText(gcmp, T(20886), "n4")
      gcmp.onClick:Clear()
    end
    gcmp:GetChild("GulidIconLoader").visible = nil ~= info
    gcmp:GetChild("Head").visible = nil ~= info
  end
  local rank = selectedTab.GetRank()
  local ratio = type(selectedTab.GetRankRatio) == "function" and selectedTab.GetRankRatio() or 0
  local rankText
  if count < rank and ratio > 0 then
    rankText = T(20319, string.format("%s%%", math.ceil(ratio * 100 / 10000)))
  elseif rank > 0 then
    rankText = rank
  else
    rankText = T(20311)
  end
  local emptyText = T(20886)
  uis.Main.Info.WordTxt.text = T(20278)
  uis.Main.Info.Info1.NumberTxt.text = rankText
  uis.Main.RankEmpty.WordTxt.text = emptyText
  uis.Main.TabList.selectedIndex = index - 1
  uis.Main.Info.c1Ctr.selectedIndex = "function" == type(selectedTab.Goto) and 1 or 0
  uis.Main.Info.GoBtn.onClick:Set(function()
    selectedTab.Goto()
    bridge.argTable[1] = false
    lastSelectedIndex = selectedIndex
  end)
end
local RefreshSelectedPanelAndScrollToTop = function()
  RefreshSelectedPanel()
  ScrollToTop()
end
local OnClickMainlineRanklist = function()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RANK_LIST_MAIN_LINE, true) then
    return
  end
  selectedIndex = TAB_INDEX.MAIN_LINE
  RanklistService.GetRankInfoReq(ProtoEnum.SCENE_TYPE.MAIN_LINE, 0, RefreshSelectedPanelAndScrollToTop)
end
local OnClickTowerRanklist = function()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RANK_LIST_TOWER, true) then
    return
  end
  selectedIndex = TAB_INDEX.TOWER
  RanklistService.GetRankInfoReq(ProtoEnum.SCENE_TYPE.CLIMB_TOWER, 0, RefreshSelectedPanelAndScrollToTop)
end
local OnClickPVPRanklist = function()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RANK_LIST_PVP, true) then
    return
  end
  ld("Arena")
  selectedIndex = TAB_INDEX.PVP
  ArenaService.ArenaGetTopRankReq(RefreshSelectedPanelAndScrollToTop)
end
local OnClickRaidBossRanklist = function()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RANK_LIST_RAIDBOSS, true) then
    return
  end
  ld("RaidBoss")
  selectedIndex = TAB_INDEX.BOSS
  RaidBossService.GetPlayerRankInfoReq(1, RefreshSelectedPanelAndScrollToTop)
end
local OnClickGuildWarRanklist = function()
  if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RANK_LIST_GUILDWAR, true) then
    return
  end
  ld("Guild")
  ld("GuildWar")
  selectedIndex = TAB_INDEX.GUILDWAR
  RanklistService.GetGuildRankInfoReq(RefreshSelectedPanelAndScrollToTop)
end
TAB_LIST = {
  [TAB_INDEX.MAIN_LINE] = {
    title = T(20881),
    onClick = OnClickMainlineRanklist,
    GetRankInfoAt = function(rank)
      return RanklistData.GetPlayerRankInfoAt(ProtoEnum.SCENE_TYPE.MAIN_LINE, rank)
    end,
    GetLength = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.MAIN_LINE)
      return info and info.totalRank or 0
    end,
    GetRank = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.MAIN_LINE)
      return info and info.myRank or 0
    end,
    GetRankRatio = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.MAIN_LINE)
      return info and info.rankRatio or 0
    end,
    Goto = function()
      ld("Adventure", function()
        AdventureService.GetSceneInfoReq({
          ProtoEnum.SCENE_TYPE.MAIN_LINE,
          ProtoEnum.SCENE_TYPE.MAIN_LINE_HARD,
          ProtoEnum.SCENE_TYPE.MAIN_LINE_HARD_3
        }, function()
          AdventureMgr.EnterPlotMain()
          OpenWindow(WinResConfig.PlotDungeonWindow.name)
        end)
      end)
    end,
    funcId = FEATURE_ENUM.RANK_LIST_MAIN_LINE
  },
  [TAB_INDEX.TOWER] = {
    title = T(20882),
    onClick = OnClickTowerRanklist,
    GetRankInfoAt = function(rank)
      return RanklistData.GetPlayerRankInfoAt(ProtoEnum.SCENE_TYPE.CLIMB_TOWER, rank)
    end,
    GetLength = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
      return info and info.totalRank or 0
    end,
    GetRank = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
      return info and info.myRank or 0
    end,
    GetRankRatio = function()
      local info = RanklistData.GetRankInfo(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
      return info and info.rankRatio or 0
    end,
    Goto = function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_TOWER, true) then
        ld("Adventure", function()
          AdventureService.GetSceneInfoReq({
            ProtoEnum.SCENE_TYPE.CLIMB_TOWER
          }, function()
            OpenWindow(WinResConfig.TowerListWindow.name)
          end)
        end)
      end
    end,
    funcId = FEATURE_ENUM.RANK_LIST_TOWER
  },
  [TAB_INDEX.PVP] = {
    title = T(20883),
    onClick = OnClickPVPRanklist,
    GetRankInfoAt = function(rank)
      local rankList = ArenaData.Rank.rankList
      return rankList and rankList[rank] and rankList[rank].info
    end,
    GetRank = function()
      local info = ArenaData.Rank
      local rank = info and info.rank or math.huge
      if rank and rank < ArenaMgr.minRank then
        return rank
      end
      return 0
    end,
    GetLength = function()
      local rankList = ArenaData.Rank.rankList
      return rankList and #rankList or 0
    end,
    Goto = function()
      ld("Arena", function()
        ArenaService.ArenaGetAllReq(function()
          if ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.DAILY_SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.SETTLE or ArenaData.Info.seasonStat == ProtoEnum.ARENA_SEASON_STAT.CLOSE then
            FloatTipsUtil.ShowWarnTips(T(439))
            return
          end
          OpenWindow(WinResConfig.ArenaWindow.name)
        end)
      end)
    end,
    funcId = FEATURE_ENUM.RANK_LIST_PVP
  },
  [TAB_INDEX.BOSS] = {
    title = T(20884),
    onClick = OnClickRaidBossRanklist,
    GetRankInfoAt = function(rank)
      return RaidBossData.GetPlayerRankInfoAt(rank)
    end,
    GetLength = function()
      local data = RaidBossData.GetPlayersRankData()
      return data and data.rankCount or 0
    end,
    GetRank = function()
      local data = RaidBossData.GetPlayersRankData()
      return data and data.rank or 0
    end,
    GetRankRatio = function()
      local data = RaidBossData.GetPlayersRankData()
      return data and data.rankRatio or 0
    end,
    Goto = function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_RAID, true) then
        ld("RaidBoss")
        RaidBossService.GetRaidBossInfoReq(function()
          OpenWindow(WinResConfig.RaidBossWindow.name)
        end)
      end
    end,
    funcId = FEATURE_ENUM.RANK_LIST_RAIDBOSS
  },
  [TAB_INDEX.GUILDWAR] = {
    title = T(20885),
    onClick = OnClickGuildWarRanklist,
    GetRankInfoAt = function(rank)
      local info = RanklistData.GetGuildWarRankInfo()
      if info then
        return info.guildList and info.guildList[rank]
      end
    end,
    GetLength = function()
      local info = RanklistData.GetGuildWarRankInfo()
      if info then
        return info.guildList and #info.guildList or 0
      end
    end,
    GetRank = function()
      local info = RanklistData.GetGuildWarRankInfo()
      return info and info.rank or 0
    end,
    GetRankRatio = function()
      local info = RanklistData.GetGuildWarRankInfo()
      return info and info.rankRatio or 0
    end,
    Goto = function()
      ld("GuildWar")
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, true) then
        GuildWarService.GetGuildWarScheduleReq(function(msg)
          if msg.inGuild then
            ld("Guild")
            GuildService.GetMyGuildSimpleInfoReq()
            local state = msg.schedule.state
            if state == ProtoEnum.GuildWarState.GWS_NOTICE then
              OpenWindow(WinResConfig.GuildBossPreviewWindow.name)
            elseif state == ProtoEnum.GuildWarState.GWS_FIGHT then
              GuildWarService.GetGuildWarAllInfoReq(function()
                UIMgr:CloseWindow(WinResConfig.RankingWindow.name)
                AbyssExploreMgr.Enter(EXPLORE_MAP_ID.GUILD_WAR_1)
              end)
            else
              GuildWarService.GetGuildWarAllInfoReq(function()
                OpenWindow(WinResConfig.GuildBossEndWindow.name)
              end)
            end
          else
            MessageBox.Show(T(1605), {
              touchCallback = function()
                if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) then
                  ld("Guild", function()
                    GuildService.EnterGuild()
                  end)
                end
              end
            }, {})
          end
        end)
      end
    end,
    funcId = FEATURE_ENUM.RANK_LIST_GUILDWAR
  }
}
local chapter_title = {
  [1] = T(2153),
  [3] = T(2154),
  [4] = T(2193)
}
local RankInfoItemRenderer = function(i, gcmp)
  local rank = i + 1
  local _, selected = GetTabItem(selectedIndex)
  local tabIndex = selected.tabIndex
  local selectedTab = selected.tab
  local info = selectedTab.GetRankInfoAt(rank)
  local child = gcmp:GetChild("PlayerRankTips")
  PlayUITransToComplete(gcmp, "up")
  if playAnim then
    child.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.08)
  else
    child.alpha = 1
  end
  local number = child:GetChild("Number")
  UIUtil.SetText(number, rank, "NumberTxt")
  if rank <= 3 then
    ChangeUIController(number, "c1", rank - 1)
  else
    ChangeUIController(number, "c1", 3)
  end
  local length = #tostring(rank)
  ChangeUIController(number, "c2", math.min(length - 1, 1))
  child:GetChild("GulidIconLoader").visible = nil ~= info
  child:GetChild("Head").visible = nil ~= info
  ChangeUIController(child, "type", selectedIndex == TAB_INDEX.GUILDWAR and 1 or 0)
  if info then
    local lvTxt = T(20274, info.level)
    local uin = info.uin
    local isSelf = selectedIndex ~= TAB_INDEX.GUILDWAR and ActorData.GetUin() == uin
    local name = info.name or info.guildName
    if selectedIndex == TAB_INDEX.PVP then
      name = ArenaMgr.GetRobotName(info.randNameId, info.name)
    end
    UIUtil.SetText(child, name, "NameTxt")
    local numberText, wordText = "", ""
    if selectedIndex == TAB_INDEX.MAIN_LINE then
      local stageId = info.stageId
      local stageConf = TableData.GetConfig(stageId, "BaseStage")
      local chapterConf = TableData.GetConfig(stageConf.chapter_id, "BaseChapter")
      local c_type = stageConf.chapter_type
      wordText = chapter_title[c_type]
      numberText = string.format("%s-%s", chapterConf and chapterConf.name(), stageConf and stageConf.name() or tostring(stageId))
    elseif selectedIndex == TAB_INDEX.TOWER then
      local stageId = info.stageId
      local stageConf = TableData.GetConfig(stageId, "BaseStage")
      if stageConf then
        numberText = string.format("%s-%s", stageConf and stageConf.name_detail() or tostring(stageId), stageConf and stageConf.name() or tostring(stageId))
      else
        numberText = tostring(stageId)
      end
    elseif selectedIndex == TAB_INDEX.BOSS then
      if type(info.scoreDiff) == "number" and info.scoreDiff > 0 then
        wordText = string.format("%s%02d", T(20288), info.scoreDiff)
        numberText = string.formatNum(info.score, 3)
      else
        wordText = T(20275)
        numberText = string.formatNum(info.score, 3)
      end
    elseif selectedIndex == TAB_INDEX.GUILDWAR then
      wordText = T(1591, info.round)
      numberText = string.formatNum(info.score, 3)
    end
    UIUtil.SetText(child, numberText, "NumberTxt")
    UIUtil.SetText(child, wordText, "NumberWordTxt")
    UIUtil.SetText(child, lvTxt, "LevelTxt")
    UIUtil.SetText(child, info.guildName or "", "Name1Txt")
    ChangeUIController(child, "c1", isSelf and 1 or 0)
    local head = child:GetChild("Head")
    if selectedIndex == TAB_INDEX.GUILDWAR then
      local headData = TableData.GetConfig(info.iconId, "BaseGuildHeadIcon")
      if headData then
        child:GetChild("GulidIconLoader").url = UIUtil.GetResUrl(headData.icon)
      end
    else
      UIUtil.ShowPlayerHead(info, head)
    end
    child.onClick:Set(function(context)
      if selectedIndex == TAB_INDEX.GUILDWAR then
        return
      end
      if selectedIndex == TAB_INDEX.PVP and type(info.randNameId) == "number" and info.randNameId > 0 then
        return
      end
      local clickArea = head:GetChild("HeadBg")
      local position = clickArea:GlobalToLocal(context.inputEvent.position)
      local min, max = Vector2.zero, clickArea.size
      if position.x > min.x and position.y > min.y and position.x < max.x and position.x < max.y then
        ActorService.GetOtherDetailInfoReq(info.uin, function(otherInfo)
          OpenWindow(WinResConfig.PlayerWindow.name, nil, otherInfo)
        end)
      end
    end)
  else
    if selectedIndex ~= TAB_INDEX.MAIN_LINE and selectedIndex ~= TAB_INDEX.TOWER and selectedIndex ~= TAB_INDEX.BOSS then
      return
    end
    local count = selectedTab.GetLength()
    if rank <= count then
      UIUtil.SetText(child, T(20295), "NameTxt")
      UIUtil.SetText(child, T(20295), "LevelTxt")
      UIUtil.SetText(child, T(20295), "Name1Txt")
      UIUtil.SetText(child, T(20295), "NumberTxt")
      UIUtil.SetText(child, T(20295), "NumberWordTxt")
      if selectedIndex ~= TAB_INDEX.MAIN_LINE or selectedIndex ~= TAB_INDEX.TOWER then
        local r_type = selectedIndex ~= TAB_INDEX.MAIN_LINE and ProtoEnum.SCENE_TYPE.CLIMB_TOWER or ProtoEnum.SCENE_TYPE.MAIN_LINE
        RanklistMgr.RequireRankInfo(r_type, rank - 1, RefreshSelectedPanel)
      else
        RaidBossMgr.RequireRankInfo(rank, RefreshSelectedPanel)
      end
    else
      UIUtil.SetText(child, "", "NameTxt")
      UIUtil.SetText(child, "", "LevelTxt")
      UIUtil.SetText(child, "", "Name1Txt")
      UIUtil.SetText(child, "", "NumberTxt")
      UIUtil.SetText(child, "", "NumberWordTxt")
    end
    child.onClick:Clear()
  end
end

function RankingWindow.ReInitData()
end

function RankingWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RankingWindow.package, WinResConfig.RankingWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    bridge = bridgeObj
    uis = GetRankingList_RankingWindowUis(contentPane)
    clearCache = bridgeObj.argTable[1]
    RankingWindow.UpdateInfo()
    RankingWindow.InitBtn()
  end)
end

function RankingWindow.UpdateInfo()
  RefreshTablist()
  local list = uis.Main.TabList
  local numItems = #tablist
  
  function list.itemRenderer(i, gcmp)
    local item = tablist[i + 1].tab
    UIUtil.SetText(gcmp, item.title, "WordTxt")
    gcmp.onClick:Set(function()
      if selectedIndex ~= item.tabIndex then
        playAnim = true
        item.onClick()
      end
    end)
  end
  
  list.numItems = numItems
  local ranklist = uis.Main.RankList.RankList
  ranklist.itemRenderer = RankInfoItemRenderer
  ranklist:SetVirtual()
  if clearCache then
    lastSelectedIndex = nil
  end
  if numItems > 0 then
    local defaultSelectedIndex = lastSelectedIndex or tablist[1].tabIndex
    local index, selected = GetTabItem(defaultSelectedIndex)
    list.selectedIndex = index - 1
    selected.tab.onClick()
    selectedIndex = defaultSelectedIndex
  end
end

function RankingWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    lastSelectedIndex = nil
    UIMgr:CloseWindow(WinResConfig.RankingWindow.name)
  end)
end

function RankingWindow.OnClose()
  RanklistMgr.ClearRankInfoCache()
  if RaidBossMgr then
    RaidBossMgr.ClearPlayerRankCache()
  end
  uis = nil
  contentPane = nil
end

return RankingWindow
