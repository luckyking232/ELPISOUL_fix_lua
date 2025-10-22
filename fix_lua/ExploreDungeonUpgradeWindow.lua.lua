require("ExploreDungeon_LevelUpWindowByName")
local ExploreDungeonUpgradeWindow = {}
local uis, contentPane, chapters, outputs, hangingTimer, RefreshPanelInfo, cachedMapObj
local FormatTime = function(time)
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
local RefreshHangingTime = function(duration, threshold)
  local panel = uis.Main.AFKRegion
  duration = math.min(threshold, duration)
  panel.ProduceProgressBar.value = duration / threshold * 100
  local info = ExploreDungeonData.GetPlayerInfo()
  local progressText
  progressText = T(20736, FormatTime(duration), FormatTime(threshold))
  UIUtil.SetText(panel.ProduceProgressBar, progressText, "WordTxt")
end
local GiveupCurrentStage = function()
  ExploreDungeonService.QuitSealBigHookChallengeReq(function()
    UIMgr:CloseWindow(WinResConfig.DungeonInfoWindow.name)
    RefreshPanelInfo(false)
  end)
end
local sureBtnParam = {touchCallback = GiveupCurrentStage}
local cancelBtnParam = {}
local OpenGiveupConfirmWindow = function()
  MessageBox.Show(T(20755), sureBtnParam, cancelBtnParam)
end
local dungeonInfoParam = {stageId = -1}
local dungeonInfoParamWithGiveupFunc = {
  stageId = -1,
  firstBtnTitle = T(20756),
  secondBtnTitle = T(20754),
  secondBtnCallback = OpenGiveupConfirmWindow
}
local RefreshChapterInfo = function(chapter, playAnim)
  local title = uis.Main.Title
  local conf = TableData.GetConfig(chapter, "BaseChapter")
  title.NameTxt.text = conf.name and conf.name() or chapter
  title.WordTxt.text = conf.des and conf.des() or chapter
  local url = UIUtil.GetResUrl(conf.map_path)
  local parent = uis.Main.MapRegion.root
  if cachedMapObj and not cachedMapObj.isDisposed then
    if cachedMapObj.name ~= tostring(chapter) then
      local mapObj = UIMgr:CreateComponentFromURL(url)
      local index = parent:GetChildIndex(cachedMapObj)
      parent:AddChildAt(mapObj, index)
      local upvalue = cachedMapObj
      mapObj.alpha = 0
      PlayUITrans(upvalue, "out1", function()
        upvalue:Dispose()
        if mapObj and not mapObj.isDisposed then
          mapObj.alpha = 1
          if playAnim then
            PlayUITrans(mapObj, "in1")
          end
        end
      end)
      cachedMapObj = mapObj
    end
  else
    local mapObj = UIMgr:CreateComponentFromURL(url)
    parent:AddChild(mapObj)
    if playAnim then
      PlayUITrans(mapObj, "in1")
    end
    cachedMapObj = mapObj
  end
  cachedMapObj.name = chapter
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local round = playerInfo.round
  local i = table.keyof(chapters, chapter, "id")
  local latestI = table.keyof(chapters, playerInfo.currentChapter, "id")
  local allPassed = 0 == playerInfo.currentStage or i < latestI
  local index = table.keyof(conf.stages, playerInfo.currentStage) or 1
  local challengableText = T(1302)
  for i, v in ipairs(conf.stages) do
    local child = cachedMapObj:GetChild(string.format("Tips%s", i))
    local btn = child:GetChild("TipsBtn")
    local stageConf = TableData.GetConfig(v, "BaseStage")
    UIUtil.SetText(btn, stageConf.name(), "NumberTxt")
    UIUtil.SetText(btn:GetChild("New"), challengableText, "WordTxt")
    if not allPassed then
      if i < index then
        ChangeUIController(btn, "c1", 2)
      elseif i > index then
        ChangeUIController(btn, "c1", 0)
      else
        local tipsRound = btn:GetChild("TipsRound")
        UIUtil.SetText(tipsRound, T(20752), "WordTxt")
        ChangeUIController(btn, "c1", 1)
        local list = tipsRound:GetChild("RoundList")
        
        function list.itemRenderer(j, gcmp)
          ChangeUIController(gcmp, "c1", j < round and 1 or 0)
        end
        
        list.numItems = 2
      end
    else
      ChangeUIController(btn, "c1", 2)
    end
    btn.onClick:Set(function()
      if not allPassed then
        if i == index then
          local param = 0 == round and dungeonInfoParam or dungeonInfoParamWithGiveupFunc
          param.stageId = v
          OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, param)
        elseif i < index then
          FloatTipsUtil.ShowWarnTips(T(20747))
        else
          FloatTipsUtil.ShowWarnTips(T(20748))
        end
      else
        FloatTipsUtil.ShowWarnTips(T(20747))
      end
    end)
  end
  local chapterList = uis.Main.TabList
  local k = table.keyof(chapters, chapter, "id")
  chapterList:ScrollToView(k - 1, playAnim)
  chapterList.selectedIndex = k - 1
end
local RefreshExpInfo = function(level, exp, playAnim)
  local levelTblStartOffset = 21000030000
  local levelConf
  local MAX_LEVEL = -math.huge
  local tbl = TableData.GetTable("BaseSealOnHookLevel")
  for k, v in pairs(tbl) do
    local conf_level = k - levelTblStartOffset
    MAX_LEVEL = math.max(MAX_LEVEL, conf_level)
    if level == conf_level then
      levelConf = v
    end
  end
  local title = uis.Main.Title
  local levelText = string.format("[size=19]Lv.[/size]%s", level)
  local expThreshold = levelConf and levelConf.next_exp or 1.0E-6
  local expText = string.format("%s/%s", exp, expThreshold)
  title.LevelTxt.text = levelText
  title.ExpTxt.text = expText
  title.ExpProgressBar.value = exp / expThreshold * 100
  local maxExpText = T(20556)
  title.ExpMaxTxt.text = maxExpText
  title.c1Ctr.selectedIndex = level >= MAX_LEVEL and 1 or 0
  UIUtil.SetIconById(title.PicLoader, 21000030)
end

local function RefreshRewardInfo()
  if not uis then
    return
  end
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local startTime = playerInfo.produceStartTime
  local timestamp = LoginData.GetCurServerTime()
  local fastCollectRemain = playerInfo.fastCollectCnt
  local duration = timestamp - startTime
  local panel = uis.Main.AFKRegion
  local interval = TableData.GetConfig(70011701, "BaseFixed").int_value
  local threshold = TableData.GetConfig(70011703, "BaseFixed").int_value
  local fastCollectThreshold = TableData.GetConfig(70011704, "BaseFixed").int_value
  local greenText = T(20794, fastCollectRemain, fastCollectThreshold)
  local redText = T(20795, fastCollectRemain, fastCollectThreshold)
  UIUtil.SetText(panel.QuickGetNumber.root, fastCollectRemain > 0 and greenText or redText, "WordTxt")
  outputs = ExploreDungeonMgr.GetCurrentOutputs()
  RefreshHangingTime(duration, threshold)
  panel.ProduceList.numItems = #outputs
  local rewardlist = panel.RewardList
  rewardlist.numItems = #playerInfo.hookRewards
  if hangingTimer then
    hangingTimer:stop()
  end
  local startDuration = duration
  local fetchInterval = 5
  hangingTimer = TimerUtil.setInterval(1, -1, function()
    local duration = LoginData.GetCurServerTime() - playerInfo.produceStartTime
    RefreshHangingTime(duration, threshold)
    if 0 == math.floor(duration - startDuration) % fetchInterval then
      ExploreDungeonService.GetPlayerInfoReq(function()
        local info = ExploreDungeonData.GetPlayerInfo()
        RefreshRewardInfo()
      end)
    end
  end)
  hangingTimer:start()
end

local ChapterItemRenderer = function(i, gcmp)
  local info = ExploreDungeonData.GetPlayerInfo()
  local index = i + 1
  local conf = chapters[index]
  local url = UIUtil.GetResUrl(conf.icon)
  gcmp:GetChild("PicLoader").url = url
  local k = table.keyof(chapters, info.currentChapter, "id")
  local cleared = index < k
  local locked = index > k
  local splits = conf.open_condition and Split(conf.open_condition, ":")
  local meetLevel = true
  if splits then
    local playerInfo = ExploreDungeonData.GetPlayerInfo()
    meetLevel = playerInfo.hookLevel >= tonumber(splits[2])
  end
  if locked then
    ChangeUIController(gcmp, "c1", 0)
  elseif cleared then
    ChangeUIController(gcmp, "c1", 2)
  else
    ChangeUIController(gcmp, "c1", 1)
  end
  UIUtil.SetText(gcmp, T(20753), "WordTxt")
  gcmp.onClick:Set(function()
    if not locked and meetLevel then
      RefreshChapterInfo(conf.id, true)
    elseif not meetLevel then
      FloatTipsUtil.ShowWarnTips(T(20740, splits[2]))
    elseif locked then
      FloatTipsUtil.ShowWarnTips(T(20732))
    end
  end)
end
local ProduceItemRenderer = function(i, gcmp)
  local reward = outputs[i + 1]
  local id = reward.itemId
  local count = reward.count + (reward.addition or 0)
  UIUtil.SetIconById(gcmp:GetChild("PicLoader"), id)
  gcmp.onClick:Set(function()
    UIUtil.CommonItemClickCallback(id, reward.itemType)
  end)
  local unitTimeOutputText = T(20737, count)
  UIUtil.SetText(gcmp, unitTimeOutputText, "NumberTxt")
end
local RewardItemRenderer = function(i, gcmp)
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local rewards = playerInfo.hookRewards
  local reward = rewards[i + 1]
  local id = reward.itemId
  local count = reward.count
  UIUtil.ShowItemFrame(id, gcmp, count, nil, function()
    UIUtil.CommonItemClickCallback(id, 1)
  end)
end

function RefreshPanelInfo(playAnim)
  local playerInfo = ExploreDungeonData.GetPlayerInfo()
  local currentChapter = playerInfo.currentChapter
  chapters = chapters or {}
  table.clear(chapters)
  ExploreDungeonMgr.GetChapters(chapters)
  local level = playerInfo.hookLevel
  local exp = playerInfo.hookExp
  local chapterList = uis.Main.TabList
  chapterList.numItems = #chapters
  RefreshChapterInfo(currentChapter, playAnim)
  RefreshExpInfo(level, exp, playAnim)
  RefreshRewardInfo()
  local stage = ExploreDungeonMgr.GetOutputsImprovedStage()
  uis.Main.AFKRegion.ExplainBtn.visible = type(stage) == "number"
end

function ExploreDungeonUpgradeWindow.ReInitData()
end

function ExploreDungeonUpgradeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDungeonUpgradeWindow.package, WinResConfig.ExploreDungeonUpgradeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDungeon_LevelUpWindowUis(contentPane)
    ExploreDungeonUpgradeWindow.UpdateInfo()
    ExploreDungeonUpgradeWindow.InitBtn()
  end)
end

function ExploreDungeonUpgradeWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(FEATURE_ENUM.SEAL_DUNGEON_UPGRADE, "BaseFeature").back_ground)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_enter.prefab", uis.Main.root:GetChild("EffectHolder"))
  local chapterList = uis.Main.TabList
  chapterList.itemRenderer = ChapterItemRenderer
  local producelist = uis.Main.AFKRegion.ProduceList
  producelist.itemRenderer = ProduceItemRenderer
  local rewardlist = uis.Main.AFKRegion.RewardList
  rewardlist.itemRenderer = RewardItemRenderer
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreDungeonUpgradeWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.SEAL_DUNGEON_UPGRADE)
  ExploreDungeonService.GetPlayerInfoReq(function()
    RefreshPanelInfo(true)
  end)
  local gotoShopText = T(20606)
  local getRewardTxt = T(20733)
  local fullText = T(20734)
  local titleText = T(20735)
  local fastCollectText = T(20792)
  local explainText = T(20793)
  local panel = uis.Main.AFKRegion
  panel.TitleTxt.text = titleText
  UIUtil.SetText(uis.Main.ShopBtn, gotoShopText)
  UIUtil.SetText(panel.GetBtn, getRewardTxt)
  UIUtil.SetText(panel.QuickGetBtn, fastCollectText)
  UIUtil.SetText(panel.ExplainBtn, explainText)
  local threshold = TableData.GetConfig(70011703, "BaseFixed").int_value
  local secPerSegment = 3600
  local division = threshold / secPerSegment
  local width = panel.ProduceProgressBar.width
  local gap = width / division
  local segment = division - 1
  for i = 1, math.floor(segment) do
    local image = UIMgr:CreateObject("ExploreDungeon", "ScaleImage")
    panel.ProduceProgressBar:AddChild(image)
    image:SetXY(i * gap - image.width * 0.5, 0)
  end
end

function ExploreDungeonUpgradeWindow.InitBtn()
  uis.Main.ShopBtn.onClick:Set(function()
    AbyssExploreService.ShopInfoReq(true, function()
      OpenWindow(WinResConfig.AbyssShopWindow.name, nil, nil, 4, true, 6)
    end)
  end)
  uis.Main.AFKRegion.GetBtn.onClick:Set(function()
    ExploreDungeonService.GetRewardReq(function()
      RefreshPanelInfo(false)
    end)
  end)
  uis.Main.AFKRegion.QuickGetBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExploreDungeonFastCollectWindow.name)
  end)
  uis.Main.AFKRegion.ExplainBtn.onClick:Set(function()
    OpenWindow(WinResConfig.ExploreDungeonUpgradeExplainWindow.name)
  end)
end

function ExploreDungeonUpgradeWindow.OnClose()
  uis = nil
  contentPane = nil
  if hangingTimer then
    hangingTimer:stop()
  end
  hangingTimer = nil
  cachedMapObj = nil
end

function ExploreDungeonUpgradeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.ExploreDungeon.REFRESH_PANEL_INFO then
    RefreshPanelInfo(false)
  end
end

return ExploreDungeonUpgradeWindow
