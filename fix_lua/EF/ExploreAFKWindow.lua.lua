require("Explore_ExploreAFKWindowByName")
local ExploreAFKWindow = {}
local uis, contentPane, teamsInfo, currentSelectedTeam, lastSelectedTeamIndex, playDropAnim, tweeners
local CardItemRenderer = function(i, gcmp)
  local index = i + 1
  local occupationType = currentSelectedTeam.occupationTypes[index]
  local holder = gcmp:GetChild("QBHolder")
  holder.visible = false
  local occupation = gcmp:GetChild("Occupation")
  ChangeUIController(occupation, "c1", occupationType - 1)
  local groupId = currentSelectedTeam.id
  local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
  local exists = true
  if not (groupInfo and groupInfo.cards) or 0 == #groupInfo.cards then
    exists = false
  end
  local cardId
  if exists then
    cardId = groupInfo.cards[index]
  else
    cardId = ExploreAFKData.GetTempGroupCard(groupId, index)
  end
  local ui_shadow = gcmp:GetChild("n3")
  if cardId then
    if ui_shadow then
      ui_shadow.visible = false
    end
    local cardData = CardData.GetCardDataById(cardId)
    local fashionData = TableData.GetConfig(cardData.fashionId, "BaseFashion")
    if fashionData then
      if playDropAnim then
        local tweenId
        tweenId = LeanTween.delayedCall(i * 0.2, function()
          local k = table.keyof(tweeners, tweenId)
          if k then
            table.remove(tweeners, k)
          end
          local entry
          entry = ExploreAFKMgr.CreateCard(groupId, index, cardId, SPINE_STATE_ENUM.IN, false, function(o)
            SkeletonAnimationUtil.SetAnimation(entry.go, 0, SPINE_STATE_ENUM.IDLE, true)
            UIUtil.SetBattleSpineEffectIndexByGrade(entry.go, cardId)
          end)
        end).id
        table.insert(tweeners, tweenId)
      else
        ExploreAFKMgr.CreateCard(groupId, index, cardId, SPINE_STATE_ENUM.IDLE, true)
      end
    end
    ChangeUIController(gcmp, "c1", 1)
  else
    if ui_shadow then
      ui_shadow.visible = true
    end
    ChangeUIController(gcmp, "c1", 0)
  end
  gcmp.onClick:Set(function()
    if exists then
      return
    end
    OpenWindow(WinResConfig.ExploreDispatchWindow.name, nil, groupId)
  end)
end
local DisplayHourglass = function(gcmp, placeholder)
  local n1 = gcmp:GetChild(placeholder)
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
local TimeItemRenderer = function(i, gcmp)
  local index = i + 1
  local rewardInfo = currentSelectedTeam.rewards[index]
  local hours = math.floor(rewardInfo.time / 60)
  UIUtil.SetText(gcmp, T(1609, hours), "TimeTxt")
  if currentSelectedTeam.selectedRewardIndex and currentSelectedTeam.selectedRewardIndex == index then
    ChangeUIController(gcmp, "button", 1)
  else
    ChangeUIController(gcmp, "button", 0)
  end
  gcmp.onClick:Set(function()
    currentSelectedTeam.selectedRewardIndex = index
    local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
    local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
    timelist.numItems = #currentSelectedTeam.rewards
    local selectedReward = currentSelectedTeam.rewards[index]
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    local rewardCnt = #selectedReward.reward
    rewardlist.numItems = rewardCnt
    spendlist.numItems = #selectedReward.exadd_cost
    local rate = selectedReward.exadd_rate / 10000
    uis.Main.AFKRegoin.RewardUp.WordTxt.text = T(20566, rate)
  end)
end
local SpendItemRenderer = function(i, gcmp)
  local selectedReward = currentSelectedTeam.rewards[currentSelectedTeam.selectedRewardIndex]
  local cost = selectedReward.exadd_cost[i + 1]
  local splits = Split(cost, ":")
  local itemId, count = tonumber(splits[2]), splits[3]
  UIUtil.SetIconById(gcmp:GetChild("PicLoader"), itemId)
  UIUtil.SetText(gcmp, T(20219), "WordTxt")
  UIUtil.SetText(gcmp, count, "NumberTxt")
  local enough = ActorData.GetItemCount(itemId) >= tonumber(count)
  ChangeUIController(gcmp, "c1", enough and 0 or 1)
  local extra = currentSelectedTeam.extra
  ChangeUIController(gcmp, "c2", extra and extra - 1 == i and 1 or 0)
  gcmp.onClick:Set(function()
    local c2 = gcmp:GetController("c2")
    if 0 == c2.selectedIndex then
      if ActorData.GetItemCount(itemId) >= tonumber(count) then
        local list = uis.Main.AFKRegoin.RewardUp.SpendList
        for j = 0, list.numChildren - 1 do
          local ctrl = list:GetChildAt(j):GetController("c2")
          ctrl.selectedIndex = j == i and 1 or 0
        end
        currentSelectedTeam.extra = i + 1
      else
        FloatTipsUtil.ShowWarnTips(T(7001200))
      end
    else
      c2.selectedIndex = 0
      currentSelectedTeam.extra = nil
    end
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    local select = currentSelectedTeam.rewards[selectedRewardIndex]
    local rewardCnt = #select.reward
    rewardlist.numItems = rewardCnt
  end)
end
local RewardItemRenderer = function(i, gcmp)
  local item = gcmp:GetChild("Item")
  local groupInfo = ExploreAFKData.GetGroupInfo(currentSelectedTeam.id)
  local rewardId, isExtra
  if groupInfo then
    rewardId = groupInfo.rewardId
    isExtra = groupInfo.isExtra
  else
    local rewards = currentSelectedTeam.rewards
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    isExtra = currentSelectedTeam.extra
    if selectedRewardIndex then
      rewardId = rewards[selectedRewardIndex].id
    end
  end
  if rewardId then
    local rewardItems = currentSelectedTeam.rewardItemsLookup[rewardId]
    if rewardItems then
      local index = i + 1
      local rewardItem = rewardItems[index]
      local itemId, count = rewardItem.itemId, rewardItem.count
      UIUtil.SetIconById(item:GetChild("ItemLoader"), itemId)
      UIUtil.SetText(gcmp, count, "NumberTxt")
      local extraTxt = isExtra and T(20588, rewardItem.extra or 0) or ""
      ChangeUIController(gcmp, "c1", isExtra and 1 or 0)
      UIUtil.SetText(gcmp, extraTxt, "AddNumberTxt")
      item.onClick:Set(function()
        UIUtil.CommonItemClickCallback(itemId, rewardItem.itemType)
      end)
    end
  end
end
local CreateDispatchShow = function(groupInfo, state)
  local parent = uis.Main.AFKRegoin
  local cardlist = parent.CardList
  local loader = parent.PicLoader
  loader.visible = true
  ExploreAFKMgr.CreateDispatchShow(groupInfo, loader, state)
  cardlist.visible = false
end
local levelGradient = {
  30,
  40,
  60,
  90
}
local SelectTeamTab = function(index, dispatchState)
  local teamInfo = teamsInfo[index + 1]
  local selectedRewardIndex = 1
  local changed = nil == currentSelectedTeam or currentSelectedTeam.id ~= teamInfo.id
  selectedRewardIndex = currentSelectedTeam and (changed and 1 or currentSelectedTeam.selectedRewardIndex) or selectedRewardIndex
  currentSelectedTeam = teamInfo
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.ExploreAFKWindow.name)
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.EXPLORE_AFK_AVAILABLE_TEAM, "")
  local o = string.isEmptyOrNil(str) and {} or Json.decode(str)
  local entry, k = nil, table.keyof(o, teamInfo.id, "groupId")
  if not k then
    entry = {}
    table.insert(o, entry)
  else
    entry = o[k]
  end
  entry.groupId = teamInfo.id
  entry.timestamp = LoginData.GetCurServerTime()
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.EXPLORE_AFK_AVAILABLE_TEAM, Json.encode(o))
  togglelist.selectedIndex = index
  local config = TableData.GetConfig(teamInfo.id, "BaseDispatchTeam")
  if (config.quality_level or 0) > 0 then
    local level = config.card_level or 1
    local previous = 0
    local displayLevel = 0
    for i = 1, #levelGradient do
      local val = levelGradient[i]
      previous = previous + val
      if level <= previous then
        displayLevel = level - (previous - val)
        break
      end
    end
    uis.Main.AFKRegoin.Word.WordTxt.text = T(20565, T(20465 + config.quality_level), displayLevel)
  else
    uis.Main.AFKRegoin.Word.WordTxt.text = ""
  end
  local groupInfo = ExploreAFKData.GetGroupInfo(teamInfo.id)
  tweeners = tweeners or {}
  for i, v in ipairs(tweeners) do
    LeanTween.cancel(v)
  end
  table.clear(tweeners)
  if groupInfo then
    local timestamp = LoginData.GetCurServerTime()
    local diff = (groupInfo and groupInfo.overStamp or 0) - timestamp
    local countdown = uis.Main.AFKRegoin.Countdown
    if diff > 0 then
      uis.Main.AFKRegoin.c1Ctr.selectedIndex = 1
      local rewardId = groupInfo.rewardId
      local rewards = teamInfo.rewards
      local k = table.keyof(rewards, rewardId, "id")
      if k then
        local seconds = rewards[k].time * 60
        countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
      else
        local tbl = TableData.GetTable("BaseDispatchReward")
        for i, v in pairs(tbl) do
          if i == rewardId then
            local seconds = v.time * 60
            countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
            break
          end
        end
      end
      countdown.WordTxt.text = T(20553)
      countdown.WordTipsTxt.text = T(20551)
      countdown.Time.WordTxt.text = T(20552)
      countdown.Time.TimeTxt.text = TimeUtil.GetTimeStr(diff, false)
      DisplayHourglass(countdown.Time.root, "n1")
    else
      uis.Main.AFKRegoin.c1Ctr.selectedIndex = 2
      local hourglass = countdown.Time.root:GetChild("hourglass")
      if hourglass then
        hourglass:Dispose()
      end
    end
    local config = TableData.GetConfig(groupInfo.rewardId, "BaseDispatchReward")
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    local rewardCnt = #config.reward
    rewardlist.numItems = rewardCnt
    CreateDispatchShow(groupInfo, dispatchState and dispatchState or diff <= 0 and DISPATCH_STATE.FINISHED or DISPATCH_STATE.IN_PROGRESS)
  else
    local cardlist = uis.Main.AFKRegoin.CardList
    local loader = uis.Main.AFKRegoin.PicLoader
    loader.visible = true
    cardlist.visible = true
    local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
    local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
    local rewardlist = uis.Main.AFKRewardInfo.ItemList
    currentSelectedTeam.selectedRewardIndex = selectedRewardIndex
    ExploreAFKMgr.ClearCollection()
    ExploreAFKMgr.CreateDispatchScene(currentSelectedTeam.id, loader)
    cardlist.numItems = #teamInfo.occupationTypes
    timelist.numItems = #teamInfo.rewards
    local selectedReward = currentSelectedTeam.rewards[selectedRewardIndex]
    local rewardCnt = #selectedReward.reward
    rewardlist.numItems = rewardCnt
    spendlist.numItems = #selectedReward.exadd_cost
    local rate = selectedReward.exadd_rate / 10000
    uis.Main.AFKRegoin.RewardUp.WordTxt.text = T(20566, rate)
    uis.Main.AFKRegoin.c1Ctr.selectedIndex = 0
  end
  lastSelectedTeamIndex = index
end
local ToggleItemRenderer = function(i, gcmp, onlyDisplay)
  local teamInfo = teamsInfo[i + 1]
  local conf = TableData.GetConfig(teamInfo.id, "BaseDispatchTeam")
  local unlock = ExploreAFKData.GetLevel() >= conf.dispatch_level
  if not onlyDisplay and unlock then
    local redDot = gcmp:GetChild("Red")
    if not redDot then
      redDot = UIMgr:CreateObject("CommonResource", "RedDot")
      gcmp:AddChild(redDot)
      redDot.name = "Red"
      redDot.visible = false
      redDot:SetPosition(168, 8)
    end
    RedDotMgr.AddNode({
      windowName = WinResConfig.ExploreAFKWindow.name,
      com = gcmp,
      visibleFunc = function()
        return RedDotExploreAFK.IsGroupAvailable(teamInfo.id) or RedDotExploreAFK.IsGroupCompleted(teamInfo.id)
      end,
      dataType = RED_DOT_DATA_TYPE.GUILD
    })
  end
  local groupInfo = ExploreAFKData.GetGroupInfo(teamInfo.id)
  local availableText = T(20557)
  local completedText = T(20547)
  UIUtil.SetText(gcmp, teamInfo.name, "NameTxt")
  if unlock then
    local available = true
    if groupInfo then
      local diff = groupInfo.overStamp - LoginData.GetCurServerTime()
      if diff > 0 then
        available = false
        UIUtil.SetText(gcmp, TimeUtil.FormatTime(diff), "TimeTxt")
        ChangeUIController(gcmp, "c1", 1)
        DisplayHourglass(gcmp, "n8")
      elseif diff < 0 then
        available = false
        ChangeUIController(gcmp, "c1", 2)
        UIUtil.SetText(gcmp, completedText, "NothingTxt")
        local hourglass = gcmp:GetChild("hourglass")
        if hourglass then
          hourglass:Dispose()
        end
      end
    end
    if available then
      ChangeUIController(gcmp, "c1", 0)
      UIUtil.SetText(gcmp, availableText, "NothingTxt")
      local hourglass = gcmp:GetChild("hourglass")
      if hourglass then
        hourglass:Dispose()
      end
    end
  else
    ChangeUIController(gcmp, "c1", 3)
    UIUtil.SetText(gcmp, T(1249, conf.dispatch_level), "LockTxt")
    local hourglass = gcmp:GetChild("hourglass")
    if hourglass then
      hourglass:Dispose()
    end
  end
  if onlyDisplay then
    return
  end
  gcmp.onClick:Set(function()
    if unlock then
      SelectTeamTab(i)
    else
      FloatTipsUtil.ShowWarnTips(T(20571, conf.dispatch_level))
    end
  end)
end
local InitTeamsInfo = function()
  teamsInfo = {}
  local level = ExploreAFKData.GetLevel()
  local teamTbl = TableData.GetTable("BaseDispatchTeam")
  local dispatchRwdTbl = TableData.GetTable("BaseDispatchReward")
  for i, v in pairs(teamTbl) do
    local job_num = v.job_num
    local occupationTypes = {}
    local rewards = {}
    local rewardItemsLookup = {}
    for _, occupationType in ipairs(job_num) do
      table.insert(occupationTypes, occupationType)
    end
    if v.dispatch_reward then
      for _, dispatch_reward_group in ipairs(v.dispatch_reward) do
        for _, rwdItem in pairs(dispatchRwdTbl) do
          if rwdItem.group_id == dispatch_reward_group then
            local levelIsInRange = true
            if rwdItem.level_range then
              levelIsInRange = level >= rwdItem.level_range[1] and level < rwdItem.level_range[2]
            end
            if levelIsInRange and not table.keyof(rewards, rwdItem.id, "id") then
              table.insert(rewards, rwdItem)
            end
            local rewardItems = {}
            rewardItemsLookup[rwdItem.id] = rewardItems
            for _, str in ipairs(rwdItem.reward) do
              local splits = Split(str, ":")
              table.insert(rewardItems, {
                itemType = tonumber(splits[1]),
                itemId = tonumber(splits[2]),
                count = tonumber(splits[3])
              })
            end
            for _, str in ipairs(rwdItem.exadd_reward) do
              local splits = Split(str, ":")
              local itemId = tonumber(splits[2])
              local count = tonumber(splits[3])
              local exists = table.keyof(rewardItems, itemId, "itemId")
              if not exists then
                table.insert(rewardItems, {
                  itemType = tonumber(splits[1]),
                  itemId = tonumber(splits[2]),
                  count = tonumber(splits[3])
                })
              else
                rewardItems[exists].extra = count
              end
            end
          end
        end
      end
    end
    local name = v.name_team and v.name_team() or "未配置" .. tostring(v.id)
    table.insert(teamsInfo, {
      id = i,
      occupationTypes = occupationTypes,
      rewards = rewards,
      rewardItemsLookup = rewardItemsLookup,
      name = name
    })
  end
  table.sort(teamsInfo, function(x, y)
    return x.id < y.id
  end)
end
local RefreshPanelInfo = function(dispatchState)
  local exp = ExploreAFKData.GetExp()
  local level = ExploreAFKData.GetLevel()
  local title = uis.Main.AFKTitle
  local titleNameText = T(20554)
  local levelText = T(1249, level)
  local descText = T(20555)
  local maxExpText = T(20556)
  title.NameTxt.text = titleNameText
  title.LevelTxt.text = levelText
  title.WordTxt.text = descText
  title.ExpMaxTxt.text = maxExpText
  local maxLevel = ExploreAFKData.GetMaxLevel()
  local max = level >= maxLevel
  title.c1Ctr.selectedIndex = max and 1 or 0
  local threshold = ExploreAFKData.GetLevelExpThreshold(level)
  title.ExpTxt.text = string.format("%s/%s", exp, threshold)
  title.ExpProgressBar.value = max and 0 or exp / threshold * 100
  UIUtil.SetIconById(title.PicLoader, 21000022)
  if not teamsInfo then
    InitTeamsInfo()
  end
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  RedDotMgr.RemoveNode(WinResConfig.ExploreAFKWindow.name)
  local teamIndex = lastSelectedTeamIndex or 0
  togglelist.numItems = #teamsInfo
  if teamIndex >= 0 then
    SelectTeamTab(teamIndex, dispatchState)
  end
  local val = TableData.GetConfig(70011501, "BaseFixed").array_value
  local assetlist = Split(val, "|")
  for k, v in pairs(assetlist) do
    assetlist[k] = tonumber(v)
  end
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, assetlist)
end
local Update = function()
  local timestamp = LoginData.GetCurServerTime()
  if currentSelectedTeam then
    local groupId = currentSelectedTeam.id
    local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
    local diff = (groupInfo and groupInfo.overStamp or 0) - timestamp
    if diff >= 0 then
      local rewardId = groupInfo.rewardId
      local rewards = currentSelectedTeam.rewards
      local k = table.keyof(rewards, rewardId, "id")
      local countdown = uis.Main.AFKRegoin.Countdown
      if k then
        local seconds = rewards[k].time * 60
        countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
      else
        local tbl = TableData.GetTable("BaseDispatchReward")
        for i, v in pairs(tbl) do
          if i == rewardId then
            local seconds = v.time * 60
            countdown.CountdownProgressBar.value = (1 - diff / seconds) * 100
            break
          end
        end
      end
      countdown.WordTxt.text = T(20553)
      countdown.WordTipsTxt.text = T(20551)
      countdown.Time.WordTxt.text = T(20552)
      countdown.Time.TimeTxt.text = TimeUtil.GetTimeStr(diff, false)
    elseif groupInfo and diff < 0 then
      uis.Main.AFKRegoin.c1Ctr.selectedIndex = 2
      if not ExploreAFKMgr.IsDispatchShowFinished() then
        ExploreAFKMgr.CreateDispatchShow(groupInfo, uis.Main.AFKRegoin.PicLoader, DISPATCH_STATE.FINISHED)
        RedDotMgr.UpdateNodeByWindowName(WinResConfig.ExploreAFKWindow.name)
      end
    end
  end
  local allGroupsInfo = ExploreAFKData.GetAllGroupsInfo()
  if allGroupsInfo and teamsInfo then
    for i, v in ipairs(allGroupsInfo) do
      local k = table.keyof(teamsInfo, v.groupId, "id")
      if k then
        local list = uis.Main.AFKRegoin.SwitchBtnList
        local index = k - 1
        if index >= 0 and index < list.numChildren then
          ToggleItemRenderer(index, uis.Main.AFKRegoin.SwitchBtnList:GetChildAt(index), true)
        end
      end
    end
  end
end

function ExploreAFKWindow.ReInitData()
end

function ExploreAFKWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreAFKWindow.package, WinResConfig.ExploreAFKWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExplore_ExploreAFKWindowUis(contentPane)
    ExploreAFKWindow.UpdateInfo()
    ExploreAFKWindow.InitBtn()
  end)
end

function ExploreAFKWindow.UpdateInfo()
  ExploreAFKData.InitTempGroupCards()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(11317, "BaseFeature").back_ground)
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreAFKWindow.name, uis.Main.CurrencyReturn, 11317, function()
    if AbyssExploreMgr and AbyssExploreMgr.Exists(EXPLORE_MAP_ID.ABYSS) then
      UIMgr:CloseToWindow(WinResConfig.AbyssWindow.name)
    elseif UIMgr:IsWindowInList(WinResConfig.ScheduleWindow.name) then
      UIMgr:CloseToWindow(WinResConfig.ScheduleWindow.name)
    else
      UIMgr:CloseWindow(WinResConfig.ExploreAFKWindow.name)
    end
  end)
  local cardlist = uis.Main.AFKRegoin.CardList
  local togglelist = uis.Main.AFKRegoin.SwitchBtnList
  local timelist = uis.Main.AFKRegoin.TimeChoice.TimeList
  local spendlist = uis.Main.AFKRegoin.RewardUp.SpendList
  local rewardlist = uis.Main.AFKRewardInfo.ItemList
  cardlist.itemRenderer = CardItemRenderer
  togglelist.itemRenderer = ToggleItemRenderer
  timelist.itemRenderer = TimeItemRenderer
  spendlist.itemRenderer = SpendItemRenderer
  rewardlist.itemRenderer = RewardItemRenderer
  ExploreAFKService.GetExploreAFKInfoReq(function()
    playDropAnim = true
    RefreshPanelInfo()
    playDropAnim = false
  end)
  local startDispatchText = T(20543)
  local rewardInfoText = T(20544)
  local getText = T(20545)
  local giveupText = T(20546)
  local completedText = T(20547)
  local startTipsText = T(20548)
  UIUtil.SetText(uis.Main.AFKStartTips.root, startTipsText, "WordTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.StartBtn, startDispatchText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.GetBtn, getText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.GiveUpBtn, giveupText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRegoin.End.root, completedText, "WordTxt")
  UIUtil.SetText(uis.Main.AFKRewardInfo.root, rewardInfoText, "NameTxt")
  UIUtil.SetText(uis.Main.AFKRewardInfo.ShopBtn, T(20606), "WordTxt")
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
end

function ExploreAFKWindow.InitBtn()
  uis.Main.AFKRegoin.StartBtn.onClick:Set(function()
    local ready = ExploreAFKMgr.IsGroupReady(currentSelectedTeam.id)
    local selectedRewardIndex = currentSelectedTeam.selectedRewardIndex
    if currentSelectedTeam and ready and selectedRewardIndex then
      local groupId = currentSelectedTeam.id
      local reward = currentSelectedTeam.rewards[currentSelectedTeam.selectedRewardIndex]
      ExploreAFKMgr.StartDispatch(groupId, reward.id, currentSelectedTeam.extra, function()
        local allGroupCards = ExploreAFKData.GetAllTempGroupCards()
        local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
        for _, entry in pairs(allGroupCards) do
          local cardEntries = entry.cardEntries
          for i = #cardEntries, 1, -1 do
            local cardEntry = cardEntries[i]
            if table.keyof(groupInfo.cards, entry.cardId) then
              table.remove(cardEntry, i)
            end
          end
        end
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_shouyi_gather_notif")
        RefreshPanelInfo(0)
        PlayUITrans(uis.Main.root, "Start")
      end)
    elseif not ready then
      FloatTipsUtil.ShowWarnTips(T(20549))
    end
  end)
  uis.Main.AFKRegoin.GetBtn.onClick:Set(function()
    local groupId = currentSelectedTeam.id
    local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
    for i, v in ipairs(groupInfo.cards) do
      ExploreAFKData.AddOrOverrideCardToTempGroup(groupId, v, i)
    end
    ExploreAFKService.GetExploreAFKRewardsReq(currentSelectedTeam.id, function()
      ExploreAFKMgr.ClearSpines(true)
      RefreshPanelInfo()
    end)
  end)
  uis.Main.AFKRegoin.GiveUpBtn.onClick:Set(function()
    MessageBox.Show(T(20550), {
      touchCallback = function()
        local groupId = currentSelectedTeam.id
        local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
        for i, v in ipairs(groupInfo.cards) do
          ExploreAFKData.AddOrOverrideCardToTempGroup(groupId, v, i)
        end
        ExploreAFKService.CancelExploreAFKReq(groupId, function()
          ExploreAFKMgr.ClearSpines(true)
          RefreshPanelInfo()
        end)
      end
    }, {})
  end)
  uis.Main.AFKRewardInfo.ShopBtn.onClick:Set(function()
    AbyssExploreService.ShopInfoReq(true, function()
      OpenWindow(WinResConfig.AbyssShopWindow.name, nil, nil, 4, true)
    end)
  end)
end

function ExploreAFKWindow.OnShown()
  if uis then
    playDropAnim = true
    RefreshPanelInfo()
    playDropAnim = false
  end
end

function ExploreAFKWindow.OnClose()
  uis = nil
  contentPane = nil
  lastSelectedTeamIndex = nil
  RedDotMgr.RemoveNode(WinResConfig.ExploreAFKWindow.name)
  UpdateManager.RemoveUpdateHandler(Update)
  ExploreAFKMgr.ReleaseDispatchShow()
  currentSelectedTeam = nil
  playDropAnim = nil
  teamsInfo = nil
  if tweeners then
    for i, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
    tweeners = nil
  end
end

function ExploreAFKWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ExploreAFKWindow.REFRESH_TEAM_INFO then
    teamsInfo = nil
    InitTeamsInfo()
  end
end

return ExploreAFKWindow
