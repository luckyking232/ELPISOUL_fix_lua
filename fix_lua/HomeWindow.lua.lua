require("Home_HomeWindowByName")
local HomeWindow = {}
local uis, contentPane, curResPath, lastSceneObject, curSceneObject, cardShowObject, lastSceneCamera, curSceneCamera
local cachedEffect = {}
local tempGraph, curRolePos, lastRolePos, curFaceId, defaultPos, normalScale
local sliderScale = 0.5
local lastScale, curTypingEffect, curSoundEventIns, lastSoundTime, curTalkTimer, canTalkPlay, bannerTimer, enterActivityId, enterActivityIndex, bannerIndex, monthListBtn, reservationGiftItem, raffleListBtn, acPicListIndex, acPicListByActivity, multiDropItem, returnGiftItem, returnGiftId, signGiftItem, tempSetRoleInfo, canOpenTheDay, roleChanged, playerReturnBtn

function HomeWindow.ReInitData()
end

function HomeWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.HomeWindow.package, WinResConfig.HomeWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetHome_HomeWindowUis(contentPane)
    ActorData.InitHeadNew()
    ld("Carnival", function()
      CarnivalService.GetCarnivalInfoReq()
    end)
    ld("Biography", function()
      BiographyService.GetPlantInfoReq()
    end)
    ActorData.InitFashionPosInfo()
    HomeWindow.UpdateBackground()
    HomeWindow.UpdateModel()
    HomeWindow.UpdateTextDisplay()
    HomeWindow.UpdateInfo()
    HomeWindow.InitBtn()
    HomeWindow.InitSettingModel()
    HomeWindow.InitRedDot()
    HomeWindow.ShowActivitySign()
    HomeWindow.InitRedDotDataReq()
    HomeWindow.ShowRaffleButton()
    HomeWindow.ShowTurnTable()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ADVENTURE_ARENA, false) then
      ArenaService.ArenaGetAllReq()
    end
    CardData.InitCardJumpSkillData()
    ld("Chat", function()
      ChatMgr.GetChatMsgInit()
    end)
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND, false) then
      ld("Friend", function()
        FriendService.GetFriendsReq()
      end)
    end
    bannerIndex = 1
    ld("Lottery", function()
      LotteryService.GetGachaInfoReq(false, function()
        HomeWindow.UpdateLotteryInfo()
      end)
    end)
    ld("Passport", function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_TASK, false) then
        PassportService.GetBattlePassInfoReq()
      end
    end)
    CardService.GetAllCardFashionReq()
    AdventureService.GetSceneInfoReq({
      ProtoEnum.SCENE_TYPE.CLIMB_TOWER
    })
    ShopService.GetGiftInfoReq(function()
      HomeWindow.UpdateActivityTxt()
      HomeWindow.ShowReservationGift()
    end)
    ShopService.GetAgreementInfoReq()
    FunctionQueueUtil.Add("Shop", function()
      if not AdventureData.IsStagePassed(50110106) then
        return true
      end
      ShopService.PurchaseGetReq(function()
        if not ShopMgr.CheckMonthCardDay() then
          FunctionQueueUtil.SetFunEnd("Shop")
        end
      end, function()
        FunctionQueueUtil.SetFunEnd("Shop")
      end)
    end, GetActivityWeight(ACTIVITY_ID.MONTH_CARD), true)
    FunctionQueueUtil.Add("Notice", function()
      if BlockInTestPackage(true) or UIMgr:GetTopWindow() ~= WinResConfig.HomeWindow.name then
        return true
      end
      if not AdventureData.IsStagePassed(50110106) then
        return true
      end
      if 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ANNOUNCEMENT_ALWAYS_ENABLE) then
        ld("Notice", function()
          NoticeService.GetAllNoticesReq()
        end)
      else
        ld("Notice", function()
          NoticeService.GetAllNoticesReq(false, nil, true)
        end)
      end
    end, GetActivityWeight(ACTIVITY_ID.NOTICE), true)
    ld("ActivityReturn")
    ActivityReturnService.GetAllActivitiesReq(function()
      local activInfo = ActivityReturnData.GetActivityInfo()
      if activInfo then
        FunctionQueueUtil.Add(PLAYER_PREF_ENUM.ACTIVITY_PLAYER_RETURN_POPUP, function()
          return not ActivityReturnMgr.TriggerPlayerReturnIfNecessary()
        end, GetActivityWeight(activInfo.activityId) or math.huge, true)
      end
    end)
    contentPane.touchable = false
    UIUtil.ChangeLoginScreenEffectOut(function()
      HomeWindow.PlayLoginTalk()
      if GuideMgr.curTriggerWindowName == WinResConfig.HomeWindow.name or GuideMgr.delayWin or GuideMgr.guideBol then
        GuideMgr.delayWin = true
        contentPane.touchable = true
      else
        FunctionQueueUtil.Start()
        GuideMgr.delayWin = nil
        if FunctionQueueUtil.CheckHomeIsEnd() then
          contentPane.touchable = true
        end
      end
    end)
    LeanTween.delayedCall(0.1, function()
      ActorService.GetOperateRecordReq(nil, function()
        RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.WATCH)
      end)
    end)
  end)
end

function HomeWindow.UpdateLanguage()
  HomeWindow.UpdateTextDisplay()
  HomeWindow.UpdateInfo()
end

function HomeWindow.UpdateBackground(interval)
  if nil ~= lastSceneObject then
    return
  end
  local path, effectList = HomeData.GetWeatherBackground()
  if path == curResPath then
    return
  end
  HomeWindow.UpdateBGMParameter()
  if curSceneObject then
    lastSceneObject = curSceneObject
    lastSceneCamera = curSceneCamera
  end
  curResPath = path
  curSceneObject = ResourceManager.Instantiate(curResPath)
  curSceneCamera = curSceneObject:GetComponentInChildren(typeof(Camera), true)
  if curSceneCamera then
    curSceneCamera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
  end
  HomeData.UpdateWeatherLightParam(0)
  if lastSceneObject then
    HomeData.UpdateWeatherModelParam(cardShowObject, interval or 2)
    ResourceManager.DestroyGameObject(lastSceneObject, false)
    lastSceneObject = nil
    lastSceneCamera = nil
  end
  for i, v in pairs(cachedEffect) do
    ResourceManager.DestroyGameObject(v, false)
  end
  cachedEffect = {}
  for i, v in ipairs(effectList) do
    ResourceManager.InstantiateAsync(v, function(effect)
      cachedEffect[v] = effect
    end)
  end
end

function HomeWindow.UpdateModel()
  curFaceId = ActorData.GetFaceId()
  local tempFashionId = tempSetRoleInfo and tempSetRoleInfo.id or curFaceId
  local fashionConfig = TableData.GetConfig(tempFashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_spine then
    UIUtil.SetCardShowSpineAutoAlpha(tempFashionId, uis.Main.CardShow.CardShow.CardShowLoader, uis.Main.CardShow.CardShow.CardShowHolder, true, function(object)
      cardShowObject = object
      CS.CardSpineTouchEvent.SetEnableSpineInteraction(cardShowObject, true)
      HomeWindow.UpdateModelScale()
      HomeWindow.UpdateModelPosition()
      HomeData.UpdateWeatherModelParam(cardShowObject, 0)
    end)
  end
end

function HomeWindow.UpdateModelPosition(refresh)
  if nil == cardShowObject then
    return
  end
  curFaceId = ActorData.GetFaceId()
  local tempFashionId = tempSetRoleInfo and tempSetRoleInfo.id or curFaceId
  local fashionConfig = TableData.GetConfig(tempFashionId, "BaseFashion")
  if fashionConfig and fashionConfig.show_spine_position then
    if nil == tempGraph then
      tempGraph = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      tempGraph.gameObjectName = "立绘位置调整"
      uis.Main.CardShow.root:AddChild(tempGraph)
    end
    if true ~= refresh then
      tempGraph.x = fashionConfig.show_spine_position[1]
      tempGraph.y = -fashionConfig.show_spine_position[2]
    else
      LuaUtil.SetLocalPos(cardShowObject, tempGraph.x, -tempGraph.y, 0)
    end
  end
end

local scaleRatio

function HomeWindow.UpdateModelScale()
  if cardShowObject then
    if nil == scaleRatio then
      local adapter = curSceneCamera:GetComponent(typeof(CS.AutoAdaptScreen))
      scaleRatio = Const.DefaultShowSpineScale * curSceneCamera.transform.position.z * math.tan(math.rad(curSceneCamera.fieldOfView / 2)) / (UICamera.transform.position.z * math.tan(math.rad(UICamera.fieldOfView / 2))) * adapter.cachedFOV / curSceneCamera.fieldOfView
    end
    LuaUtil.SetScale(cardShowObject, scaleRatio, scaleRatio, 1)
  end
end

function HomeWindow.UpdateTextDisplay()
  local middleZone = uis.Main.MiddleZone
  UIUtil.SetBtnText(middleZone.GaChaBtn, T(3), T(10163))
  UIUtil.SetBtnText(middleZone.HomeBtn, T(4), T(10164))
  UIUtil.SetBtnText(middleZone.PassportBtn, T(10), T(10170))
  UIUtil.SetText(middleZone.ActivityBtn, T(11), "TitleTxt")
  UIUtil.SetText(middleZone.ActivityBtn, T(869), "TitleWordTxt")
  UIUtil.SetBtnText(middleZone.ShopBtn, T(12), T(10172))
  local bottomArea = uis.Main.BottomArea
  UIUtil.SetBtnText(bottomArea.MemberBtn, T(7), T(10167))
  UIUtil.SetBtnText(bottomArea.BadgeBtn, T(8), T(10168))
  UIUtil.SetBtnText(bottomArea.GuildBtn, T(5), T(10165))
  UIUtil.SetBtnText(bottomArea.PlotBtn, T(6), T(10166))
  uis.Main.Position.PosTxt.text = T(572)
  uis.Main.Position.ZoomTxt.text = T(574)
  UIUtil.SetText(uis.Main.MiddleZone.ActivityBtn, T(958), "LockWordTxt")
  UIUtil.SetText(uis.Main.MiddleZone.ActivityBtn, T(959), "LockTxt")
  UIUtil.SetText(uis.Main.MiddleZone.HomeBtn:GetChild("AbyssSign"), T(20306), "WordTxt")
end

function HomeWindow.UpdateAbyssNoviceBonus()
  ld("AbyssExplore")
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE, false) then
    AbyssExploreMgr.GetExploreInfo(function(msg)
      if msg and msg.manorInfo then
        local manorInfo = msg.manorInfo
        AbyssExploreData.SetManorInfo(manorInfo)
        local rewarded = manorInfo.rookieReward
        ChangeUIController(uis.Main.MiddleZone.CasketBtn, "lock", manorInfo.rookieFinished and 0 or 1)
        if not manorInfo.rookieFinished then
          ChangeUIController(uis.Main.MiddleZone.CasketBtn, "c1", 0)
        end
        if not rewarded then
          uis.Main.MiddleZone.newpeopleCtr.selectedIndex = 1
        else
          uis.Main.MiddleZone.newpeopleCtr.selectedIndex = 0
        end
        HomeWindow.ShowActivityDungeon()
      end
    end)
  else
    ChangeUIController(uis.Main.MiddleZone.CasketBtn, "lock", 1)
    ChangeUIController(uis.Main.MiddleZone.CasketBtn, "c1", 0)
  end
end

function HomeWindow.UpdateInfo()
  HomeWindow.UpdatePlayerInformation()
  HomeWindow.UpdateAssetsTips()
  HomeWindow.UpdateAdventureInfo()
  HomeWindow.UpdateActivityTxt()
  HomeWindow.UpdateAbyssNoviceBonus()
end

function HomeWindow.GetTaskInfo()
  local func = function(taskInfo)
    if taskInfo then
      if taskInfo.value >= taskInfo.targetValue then
        return taskInfo, false
      end
      return taskInfo, true
    else
      return nil, true
    end
  end
  enterActivityId = nil
  local taskInfo, finished = func(DailyTaskData.GetHomeShowTask())
  local carnivalTaskInfo, biographyTaskInfo
  if finished then
    local taskInfoTarget = DailyTaskData.ShowHomeDailyTarget()
    if taskInfoTarget then
      enterActivityId = ACTIVITY_ID.DAILY_TASK
      return taskInfoTarget
    end
    local lvGift = CarnivalData.ShowHomeLvGift()
    if lvGift then
      enterActivityId = ACTIVITY_ID.LV_GIFT
      return lvGift
    end
    carnivalTaskInfo, finished = func(CarnivalData.GetHomeShowTask())
    if finished then
      local carnivalTaskInfoTarget = CarnivalData.ShowHomeCarnivalTarget()
      if carnivalTaskInfoTarget then
        enterActivityId = ACTIVITY_ID.CARNIVAL
        return carnivalTaskInfoTarget
      end
      local signInfo = CarnivalData.SignIsShowHome()
      if signInfo then
        enterActivityId = ACTIVITY_ID.INITIAL_SIGN
        return signInfo
      end
      biographyTaskInfo, finished = func(BiographyData.GetHomeShowTask())
      if false == finished then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
      biographyTaskInfo = CarnivalData.BiographyShowHome()
      if biographyTaskInfo then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
      local dailySupply = DailySupplyMgr.HasAnyInTimeSupply()
      if dailySupply then
        enterActivityId = ACTIVITY_ID.DAILY_SUPPLY
        local conf = TableData.GetConfig(ACTIVITY_ID.DAILY_SUPPLY, "BaseActivity")
        return {
          url = UIUtil.GetResUrl(conf.home_icon),
          text = T(80629606, DailySupplyMgr.GetTotalSupplies())
        }
      end
      if nil ~= taskInfo then
        enterActivityId = ACTIVITY_ID.DAILY_TASK
        return taskInfo
      end
      if nil ~= carnivalTaskInfo then
        enterActivityId = ACTIVITY_ID.CARNIVAL
        return carnivalTaskInfo
      end
      if nil ~= biographyTaskInfo then
        enterActivityId = ACTIVITY_ID.BIOGRAPHY
        return biographyTaskInfo
      end
    else
      enterActivityId = ACTIVITY_ID.CARNIVAL
      return carnivalTaskInfo
    end
  else
    enterActivityId = ACTIVITY_ID.DAILY_TASK
    return taskInfo
  end
end

function HomeWindow.UpdateBatteryLevel()
  if uis then
    local batteryProgressBar = uis.Main.PlayerInformation.BatteryProgressBar
    batteryProgressBar.value = SystemInfo.batteryLevel * 100
  end
end

function HomeWindow.UpdateActivityTxt()
  local activeBtn = uis.Main.MiddleZone.ActivityBtn
  local taskInfo = HomeWindow.GetTaskInfo()
  CarnivalData.SaveEnterActivityId(enterActivityId)
  if taskInfo then
    enterActivityIndex = taskInfo.tabIndex
    CarnivalData.SaveHomeTaskId(taskInfo.taskUid)
    activeBtn:GetChild("PicLoader").url = taskInfo.url
    UIUtil.SetText(activeBtn, taskInfo.text, "WordTxt")
    if taskInfo.value and taskInfo.targetValue then
      if taskInfo.value >= taskInfo.targetValue then
        UIUtil.SetText(activeBtn, T(1462, taskInfo.targetValue, taskInfo.targetValue), "NumberTxt")
        ChangeUIController(activeBtn, "c1", 1)
        RedDotMgr.SetRedVisible(activeBtn, true)
      else
        UIUtil.SetText(activeBtn, T(1463, taskInfo.value, taskInfo.targetValue), "NumberTxt")
        ChangeUIController(activeBtn, "c1", 0)
      end
    else
      ChangeUIController(activeBtn, "c1", 1)
      UIUtil.SetText(activeBtn, "", "NumberTxt")
    end
  else
    enterActivityIndex = nil
    ChangeUIController(activeBtn, "c1", 2)
    CarnivalData.SaveHomeTaskId(nil)
  end
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = activeBtn,
    dataType = RED_DOT_DATA_TYPE.TASK,
    visibleFunc = function()
      return RedDotTask.HomeTaskRed()
    end,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_TASK_LIST)
  })
end

function HomeWindow.UpdatePlayerInformation()
  local playerInformation = uis.Main.PlayerInformation
  playerInformation.PlayerLevelTxt.text = T(244, ActorData.GetLevel())
  playerInformation.PlayerNameTxt.text = ActorData.GetName()
  playerInformation.IdNumberTxt.text = T(1, ActorData.GetUin())
  playerInformation.ExpProgressBar.value = 100 * ActorData.GetExp() / ActorData.GetExpMax()
  HomeWindow.UpdateServerTime()
  local loginDays = ActorData.GetLoginDays()
  if loginDays <= 365 then
    playerInformation.Day.c1Ctr.selectedIndex = 0
    playerInformation.Day.Day1Txt.text = loginDays
    playerInformation.Day.UnitTxt.text = T(299)
  else
    playerInformation.Day.c1Ctr.selectedIndex = 1
    playerInformation.Day.Day1Txt.text = string.format("%.1f", loginDays / 365)
    playerInformation.Day.Day2Txt.text = T(345, loginDays)
    playerInformation.Day.UnitTxt.text = T(10154)
  end
  if curFaceId ~= ActorData.GetFaceId() and nil == tempSetRoleInfo then
    HomeWindow.SetRoleUiPos()
    HomeWindow.UpdateModel()
    canTalkPlay = true
  end
  HomeWindow.UpdateBatteryLevel()
end

function HomeWindow.OpenActorInfoWindow()
  OpenWindow(WinResConfig.ActorInfoWindow.name)
end

function HomeWindow.UpdateLotteryInfo(notRefresh)
  local openList = LotteryData.Info.openList
  local list = {}
  local freeNum
  for id, v in pairs(openList) do
    if -1 == v or v - LoginData.GetCurServerTime() > 0 then
      local config = TableData.GetConfig(id, "BaseGacha")
      if config then
        if 0 ~= config.type and not string.isEmptyOrNil(config.home_banner) then
          table.insert(list, config)
        end
        for _, vv in pairs(config.gacha_mode) do
          if LotteryData.Info.dailyFreeCount[vv] and LotteryData.Info.dailyFreeCount[vv] > 0 then
            local data = TableData.GetConfig(vv, "BaseGachaMode")
            if data then
              freeNum = LotteryData.Info.dailyFreeCount[vv] * data.gacha_time
            end
          end
        end
      end
    end
  end
  table.sort(list, function(a, b)
    return a.sort < b.sort
  end)
  local ShowBanner = function()
    if uis and list then
      local gachaBtn = uis.Main.MiddleZone.GaChaBtn
      if #list < 1 then
        ChangeUIController(gachaBtn, "c1", 0)
      elseif 1 == #list and list[1].home_banner then
        local picCom = gachaBtn:GetChild("Pic")
        picCom:GetChild("Pic1Loader").url = UIUtil.GetResUrl(list[1].home_banner)
        ChangeUIController(gachaBtn, "c1", 1)
      else
        bannerIndex = bannerIndex + 1
        if bannerIndex > #list then
          bannerIndex = 1
        end
        local firstPool = list[bannerIndex]
        if firstPool then
          local picCom = gachaBtn:GetChild("Pic")
          picCom:GetChild("Pic2Loader").url = UIUtil.GetResUrl(firstPool.home_banner)
          local trans = picCom:GetTransition("up")
          if trans then
            trans:ClearHooks()
            trans:SetHook("sign", function()
              picCom:GetChild("Pic1Loader").url = UIUtil.GetResUrl(firstPool.home_banner)
            end)
            trans:Play()
          end
        end
        ChangeUIController(gachaBtn, "c1", 1)
      end
      if freeNum then
        ChangeUIController(gachaBtn, "LotteryFree", 1)
        UIUtil.SetText(gachaBtn:GetChild("LotteryFree"), T(1159, freeNum))
      else
        ChangeUIController(gachaBtn, "LotteryFree", 0)
      end
    end
  end
  HomeWindow.StartBannerTimer(ShowBanner)
  if nil == notRefresh then
    ShowBanner()
  end
end

function HomeWindow.UpdateServerTime()
  local playerInformation = uis.Main.PlayerInformation
  playerInformation.TimeTxt.text = TimeUtil.FormatDate("%H:%M", LoginData.GetCurServerTime())
  if Application.platform ~= RuntimePlatform.Android and Application.platform ~= RuntimePlatform.IPhonePlayer and LoginData.GetServerVersion() and LoginData.GetCurServerTime() then
    uis.Main.BottomLeft.ServerTxt.text = LoginData.GetServerVersion() .. "       " .. TimeUtil.FormatDate("%Y/%m/%d %H:%M", LoginData.GetCurServerTime())
  end
end

function HomeWindow.UpdateAssetsTips()
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsGroup.AssetsTipsList, {
    21000003,
    21000001,
    21000002
  })
  HomeWindow.UpdateEnergy()
  HomeWindow.UpdateHeadRect()
end

function HomeWindow.UpdateHeadRect()
  local actorInfo = ActorData.GetActorInfo()
  if actorInfo.actorHead then
    local actorHead = actorInfo.actorHead
    local data = TableData.GetConfig(actorHead.headRectId, "BaseItem")
    if data and data.effect_value and data.effect_value == "1" and not ActorData.GetItemInfoByUid(actorHead.headRectItemUid) then
      local tempInfo = {
        fashionId = actorHead.fashionId,
        headId = actorHead.headId,
        headRectId = 0,
        headRectStamp = 0,
        headRectExtra = 0,
        headRectItemUid = 0
      }
      ActorService.ChangeHeadReq(tempInfo)
    end
  end
end

function HomeWindow.UpdateAdventureInfo()
  local adventureBtn = uis.Main.MiddleZone.AdventureBtn
  local sceneInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.MAIN_LINE)
  local currentChapter = sceneInfo.currentChapter
  local chapterConfig = TableData.GetConfig(currentChapter, "BaseChapter")
  if chapterConfig then
    adventureBtn:GetChild("NameTxt").text = chapterConfig.name_detail()
    adventureBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(chapterConfig.icon)
    local currentStage = sceneInfo.currentStage
    if 0 == currentStage then
      currentStage = chapterConfig.stages[#chapterConfig.stages]
    else
      currentStage = currentStage - 1
    end
    local stageData = TableData.GetConfig(currentStage, "BaseStage")
    if stageData then
      adventureBtn:GetChild("PlotNameTxt").text = T(2, stageData.name(), stageData.name_detail())
    end
  end
end

function HomeWindow.UpdateEnergy()
  local numberTxt = uis.Main.MiddleZone.ReasonBtn:GetChild("NumberTxt")
  local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
  local maxEnergy = ActorData.GetEnergyMax()
  numberTxt.text = T(352, energy, maxEnergy)
end

function HomeWindow.UpdateMessage()
  local chatBtn = uis.Main.AssetsTipsGroup.ChatBtn
  if ChatData.newWorldMsg then
    ChangeUIController(chatBtn, "c1", 1)
  else
    ChangeUIController(chatBtn, "c1", 0)
  end
end

function HomeWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.BottomArea.MemberBtn,
    visibleFunc = function()
      return RedDotCard.CanAnyCardGrowUp()
    end,
    dataType = RED_DOT_DATA_TYPE.CARD,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_CARD)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.BottomArea.PlotBtn,
    newFlagVisibleFunc = function()
      return RedDotStory.HomeTaskRed()
    end,
    visibleFunc = function()
      return RedDotStory.CanCradStarUp()
    end,
    dataType = RED_DOT_DATA_TYPE.STORY,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_STORY)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.PassportBtn,
    visibleFunc = function()
      return RedDotPassport.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.PASSPORT,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_TASK)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.GaChaBtn,
    visibleFunc = function()
      return RedDotGacha.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.GACHA,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_SUMMON)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.AssetsTipsGroup.MailBtn,
    visibleFunc = function()
      return RedDot_Mail.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.MAIL,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_MAIL)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.AssetsTipsGroup.NoticeBtn,
    visibleFunc = function()
      return RedDot_Notice.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.NOTICE,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_NOTICE)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.BottomArea.GuildBtn,
    visibleFunc = function()
      return RedDotGuild.HomeTaskRed()
    end,
    dataType = RED_DOT_DATA_TYPE.GUILD,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_TOTAL)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.ShopBtn,
    visibleFunc = function()
      return RedDotShop.HomeTaskRed()
    end,
    dataType = RED_DOT_DATA_TYPE.SHOP,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_SHOP)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.AssetsTipsGroup.TotalBtn,
    visibleFunc = function()
      return RedDotFriend.HaveAddFriendSeat() and RedDotFriend.HaveAddFriendRequest()
    end,
    dataType = RED_DOT_DATA_TYPE.TOTAL,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_TOTAL)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.AssetsTipsGroup.ChatBtn,
    visibleFunc = function()
      return RedDotChat.HaveUnreadUnionMsg() or RedDotChat.HaveUnreadPrivateMsg()
    end,
    dataType = RED_DOT_DATA_TYPE.CHAT
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.TotalOpr.ChatBtn,
    visibleFunc = function()
      return RedDotChat.HaveUnreadUnionMsg() or RedDotChat.HaveUnreadPrivateMsg()
    end,
    dataType = RED_DOT_DATA_TYPE.CHAT
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.TotalOpr.FriendBtn,
    visibleFunc = function()
      return RedDotFriend.HaveAddFriendSeat() and RedDotFriend.HaveAddFriendRequest()
    end,
    dataType = RED_DOT_DATA_TYPE.FRIEND
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.AdventureBtn,
    visibleFunc = function()
      return RedDotArena.ShowHome() or RedDotPlotDungeon.ShowHome() or RedDotRaidBoss.HasAnyRewards() or RedDotTower.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.ADVENTURE_ARENA)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.BottomArea.BadgeBtn,
    visibleFunc = function()
      return RedDotBadge.CanShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.BADGE,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.BADGE)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.HomeBtn,
    newFlagVisibleFunc = function()
      return RedDotAbyss.HasNewFunction()
    end,
    dataType = RED_DOT_DATA_TYPE.ABYSS,
    newFlagName = "abyss",
    onlyNew = true,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_EXPLORE)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.MiddleZone.AbyssNewPeopleBtn,
    dataType = RED_DOT_DATA_TYPE.ABYSS,
    visibleFunc = function()
      if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE, false) then
        return false
      end
      local manorInfo = AbyssExploreData.GetManorInfo()
      if manorInfo then
        return manorInfo.rookieFinished and not manorInfo.rookieReward
      end
      return false
    end,
    homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.HOME_EXPLORE)
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.HomeWindow.name,
    com = uis.Main.LookBtn,
    visibleFunc = function()
      return RedDotWatch.ShowHome()
    end,
    dataType = RED_DOT_DATA_TYPE.WATCH
  })
end

function HomeWindow.InitRedDotDataReq()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) then
    GuildMgr.UpdateApplyJoin()
    GuildMgr.UpdateGuildSign()
  end
end

function HomeWindow.InitBtn()
  uis.Main.CardShow.root.onClick:Set(function()
    HomeWindow.UpdateTalkWord()
  end)
  uis.Main.DayBtn.onClick:Set(function()
    HomeData.SetTestTime(HOME_TIME_ENUM.DAY)
    HomeWindow.UpdateBackground(0)
  end)
  uis.Main.DuskBtn.onClick:Set(function()
    HomeData.SetTestTime(HOME_TIME_ENUM.DUSK)
    HomeWindow.UpdateBackground(0)
  end)
  uis.Main.NightBtn.onClick:Set(function()
    HomeData.SetTestTime(HOME_TIME_ENUM.NIGHT)
    HomeWindow.UpdateBackground(0)
  end)
  uis.Main.MiddleZone.AdventureBtn.onClick:Set(function()
    ld("Adventure", function()
      AdventureService.GetSceneInfoReq({
        ProtoEnum.SCENE_TYPE.CLIMB_TOWER,
        ProtoEnum.SCENE_TYPE.MAIN_LINE
      }, function()
        AdventureMgr.Init()
        OpenWindow(WinResConfig.AdventureWindow.name)
      end)
    end)
  end)
  uis.Main.MiddleZone.HomeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_EXPLORE) then
      ld("AbyssExplore")
      AbyssExploreMgr.Enter(EXPLORE_MAP_ID.ABYSS)
    end
  end)
  uis.Main.MiddleZone.GaChaBtn.onClick:Set(function()
    if BlockInTestPackage() then
      return
    end
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SUMMON) then
      LotteryService.GetGachaInfoReq(false, function()
        OpenWindow(WinResConfig.LotteryWindow.name)
      end)
    end
  end)
  uis.Main.MiddleZone.PassportBtn.onClick:Set(function()
    if BlockInTestPackage() then
      return
    end
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_TASK) then
      PassportService.GetBattlePassInfoReq(function()
        PassportMgr.OpenPassportWindow()
      end)
    end
  end)
  uis.Main.MiddleZone.ReasonBtn.onClick:Set(function()
    ld("Energy", function()
      EnergyService.GetEnergyRecoverInfoReq()
    end)
  end)
  uis.Main.LookBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_LOOK_ROLE) then
      CardService.GetAllCardFashionReq(function()
        OpenWindow(WinResConfig.WatchWindow.name)
      end)
    end
  end)
  local friendBtn = uis.Main.TotalOpr.FriendBtn
  if friendBtn then
    friendBtn.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_FRIEND) then
        ld("Friend", function()
          FriendMgr.TryToOpenFriendWindow()
        end)
      end
    end)
  end
  uis.Main.TotalOpr.SetBtn.onClick:Add(HomeWindow.OpenActorInfoWindow)
  uis.Main.PlayerInformation.root.onClick:Set(function()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_PLAYER_INFO) then
      ActorService.GetSelfDetailInfoReq()
    end
  end)
  uis.Main.TotalOpr.PlayerInfoBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_PLAYER_INFO) then
      ActorService.GetSelfDetailInfoReq()
    end
  end)
  local chatBtn = uis.Main.TotalOpr.ChatBtn
  if chatBtn then
    chatBtn.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT) then
        ld("Chat", function()
          OpenWindow(WinResConfig.ChatWindow.name)
        end)
      end
    end)
  end
  local chatBtn2 = uis.Main.AssetsTipsGroup.ChatBtn
  if chatBtn2 then
    chatBtn2.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_CHAT) then
        ld("Chat", function()
          OpenWindow(WinResConfig.ChatWindow.name)
        end)
      end
    end)
  end
  if CheckUpdateManager.Singleton.isIosReview == true then
    uis.Main.TotalOpr.CodeBtn.visible = false
  else
    uis.Main.TotalOpr.CodeBtn.onClick:Add(HomeWindow.OpenCodeWindow)
  end
  uis.Main.AssetsTipsGroup.BagBtn.onClick:Set(function()
    ld("Bag", function()
      OpenWindow(WinResConfig.BagWindow.name)
    end)
  end)
  uis.Main.AssetsTipsGroup.MailBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_MAIL) then
      MailService.GetAllMailsReq(0, function()
        MailMgr.OpenMailWindow()
      end)
    end
  end)
  uis.Main.AssetsTipsGroup.TotalBtn.onClick:Add(HomeWindow.OpenTotalOpr)
  uis.Main.AssetsTipsGroup.NoticeBtn.onClick:Set(function()
    if BlockInTestPackage() then
      return
    end
    ld("Notice", function()
      NoticeService.GetAllNoticesReq(true)
    end)
  end)
  uis.Main.BottomArea.MemberBtn.onClick:Set(function()
    ld("Card", function()
      OpenWindow(WinResConfig.CardListWindow.name)
    end)
  end)
  uis.Main.BottomArea.GuildBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD) then
      ld("Guild", function()
        GuildService.EnterGuild()
      end)
    end
  end)
  uis.Main.BottomArea.PlotBtn.onClick:Set(function()
    if BlockInTestPackage() then
      return
    end
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_STORY) then
      ActorService.GetStoryListReq(0)
      ld("Story", function()
        StoryService.GetStoryMonsterListReq(function()
          OpenWindow(WinResConfig.StoryWindow.name)
        end)
      end)
    end
  end)
  uis.Main.MiddleZone.ShopBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SHOP) then
      ld("Shop", function()
        ShopService.PurchaseGetReq(function()
          ShopMgr.recommendPage = 0
          OpenWindow(WinResConfig.ShopWindow.name)
        end)
      end)
    end
  end)
  uis.Main.MiddleZone.ActivityBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_TASK_LIST, false) then
      OpenWindow(WinResConfig.CarnivalWindow.name, nil, enterActivityId, enterActivityIndex)
    end
  end)
  uis.Main.BottomArea.BadgeBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
      OpenWindow(WinResConfig.BadgeWindow.name)
    end
  end)
  uis.Main.MiddleZone.AbyssNewPeopleBtn.onClick:Set(function()
    OpenWindow(WinResConfig.AbyssRewardWindow.name)
  end)
  HomeWindow.ShowSchedule()
  uis.Main.MusicBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_MUSIC) then
      OpenWindow(WinResConfig.MusicWindow.name)
    end
  end)
  uis.Main.AssetsTipsGroup.RankBtn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_RANK_LIST, true) then
      OpenWindow(WinResConfig.RankingWindow.name, nil, true)
    end
  end)
  HomeWindow.CheckActivityDungeonState()
  HomeWindow.CheckPlayerReturnActivityState()
  HomeWindow.CheckGuildWarState()
end

function HomeWindow.CheckGuildWarState()
  ld("GuildWar", function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD, false) then
      GuildWarService.GetGuildWarAllInfoReq(function()
        HomeWindow.ShowGuildWar()
      end)
    end
  end)
end

function HomeWindow.CheckActivityDungeonState()
  ld("ActivityDungeon", function()
    ActivityDungeonService.GetActivityAllReq(function()
      HomeWindow.ShowActivityDungeon()
      HomeWindow.ShowSingInGiftButton()
      HomeWindow.ShowMultiDrop()
      HomeWindow.CheckRemoveMultiDrop()
    end)
  end)
end

function HomeWindow.CheckPlayerReturnActivityState()
  ld("ActivityReturn", function()
    ActivityReturnService.GetAllActivitiesReq(function()
      HomeWindow.ShowPlayerReturnActivity()
    end)
  end)
end

function HomeWindow.ShowGuildWar()
  acPicListIndex = acPicListIndex or {}
  local data = GuildWarData.GetGuildWarConfig()
  if data then
    local itemBanner
    if acPicListIndex[FEATURE_ENUM.HOME_GUILD_WAR] == nil then
      itemBanner = UIMgr:CreateObject("Home", "AcPicLoaderBtn")
      uis.Main.BottomLeft.AcBanner.PicList:AddChild(itemBanner)
      acPicListIndex[FEATURE_ENUM.HOME_GUILD_WAR] = itemBanner
    else
      itemBanner = acPicListIndex[FEATURE_ENUM.HOME_GUILD_WAR]
    end
    local loader = itemBanner:GetChild("PicLoader")
    if loader then
      loader.url = UIUtil.GetResUrl(data.bg_btn)
    end
    local info = GuildWarData.GetGuildScheduleInfo()
    if info then
      if info.state == ProtoEnum.GuildWarState.GWS_FIGHT then
        UIUtil.SetText(itemBanner, T(1611, TimeUtil.FormatEnTime(info.endStamp - LoginData.GetCurServerTime())), "TimeTxt")
      else
        UIUtil.SetText(itemBanner, "", "TimeTxt")
      end
    end
    if not EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD_WAR, false) then
      local featureData = TableData.GetConfig(FEATURE_ENUM.HOME_GUILD_WAR, "BaseFeature")
      if featureData then
        UIUtil.SetText(itemBanner:GetChild("AcLock"), featureData.unlock_des(), "LockTxt")
      end
      ChangeUIController(itemBanner, "lock", 1)
    else
      RedDotMgr.AddNode({
        windowName = WinResConfig.HomeWindow.name,
        com = itemBanner,
        visibleFunc = function()
          return RedDotGuildWar.CanShowHome()
        end,
        dataType = RED_DOT_DATA_TYPE.GUILD_WAR
      })
      ChangeUIController(itemBanner, "lock", 0)
    end
    itemBanner.onClick:Set(function()
      if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_GUILD_WAR) then
        GuildWarMgr.OpenGuildWarWindow()
      end
    end)
    if nil == info or info.state ~= ProtoEnum.GuildWarState.GWS_FIGHT then
      if itemBanner then
        RedDotMgr.RemoveOneNode(WinResConfig.HomeWindow.name, itemBanner)
      end
      HomeWindow.RemoveActivityButton(FEATURE_ENUM.HOME_GUILD_WAR)
    end
  end
  ChangeController(uis.Main.BottomLeft.c1Ctr, 1)
end

function HomeWindow.ShowActivityDungeon()
  acPicListByActivity = acPicListByActivity or {}
  local Remove = function(id)
    if acPicListByActivity[id] then
      local childIndex = uis.Main.BottomLeft.AcBanner.PicList:GetChildIndex(acPicListByActivity[id])
      uis.Main.BottomLeft.AcBanner.PicList:RemoveChildAt(childIndex, true)
      acPicListByActivity[id] = nil
    end
  end
  local info = ActivityDungeonData.GetAllActivityStage()
  if table.getLen(info) ~= table.getLen(acPicListByActivity) then
    for i, v in pairs(acPicListByActivity) do
      Remove(i)
    end
  end
  for i, v in ipairs(info) do
    if LoginData.GetCurServerTime() < v.baseInfo.endStamp then
      local data = TableData.GetConfig(v.baseInfo.activityId, "BaseActivity")
      if data and data.type == 10119 then
        local itemBanner
        if acPicListByActivity[v.baseInfo.activityId] == nil then
          itemBanner = UIMgr:CreateObject("Home", "AcPicLoaderBtn")
          local loader = itemBanner:GetChild("PicLoader")
          if loader then
            loader.url = UIUtil.GetResUrl(data.btn_pic)
          end
          uis.Main.BottomLeft.AcBanner.PicList:AddChild(itemBanner)
          acPicListByActivity[v.baseInfo.activityId] = itemBanner
        else
          itemBanner = acPicListByActivity[v.baseInfo.activityId]
        end
        UIUtil.SetText(itemBanner, T(1611, TimeUtil.FormatEnTime(v.baseInfo.endStamp - LoginData.GetCurServerTime())), "TimeTxt")
        local GetUnLock = function()
          if AbyssExploreData then
            local manorInfo = AbyssExploreData.GetManorInfo()
            return manorInfo and manorInfo.rookieFinished
          end
        end
        if GetUnLock() then
          ChangeUIController(itemBanner, "lock", 0)
          local config = TableData.GetConfig(tonumber(data.parameter), "BaseActivityStageConfig")
          if config and config.show_id then
            RedDotMgr.AddNode({
              windowName = WinResConfig.HomeWindow.name,
              com = itemBanner,
              visibleFunc = function()
                return RedDotActivityDungeon.CanShowHome(config.show_id)
              end,
              dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
            })
            itemBanner.onClick:Set(function()
              if LoginData.GetCurServerTime() >= v.baseInfo.endStamp then
                FloatTipsUtil.ShowWarnTips(T(1618))
                Remove(v.baseInfo.activityId)
              else
                ActivityDungeonService.GetActivityAllReq(function()
                  ActivityDungeonMgr.OpenWindow(config.show_id)
                end)
              end
            end)
          end
        else
          local featureData = TableData.GetConfig(FEATURE_ENUM.HOME_ACIVITY_DUNGEON, "BaseFeature")
          if featureData then
            UIUtil.SetText(itemBanner:GetChild("AcLock"), featureData.unlock_des(), "LockTxt")
            itemBanner.onClick:Set(function()
              if featureData.unlock_tips then
                FloatTipsUtil.ShowWarnTips(featureData.unlock_tips())
              elseif featureData.unlock_des then
                FloatTipsUtil.ShowWarnTips(featureData.unlock_des())
              end
            end)
          end
          ChangeUIController(itemBanner, "lock", 1)
        end
        ChangeController(uis.Main.BottomLeft.c1Ctr, 1)
      end
    else
      Remove(v.baseInfo.activityId)
    end
  end
end

function HomeWindow.RemoveActivityButton(featureId)
  if acPicListIndex[featureId] then
    local childIndex = uis.Main.BottomLeft.AcBanner.PicList:GetChildIndex(acPicListIndex[featureId])
    if childIndex then
      uis.Main.BottomLeft.AcBanner.PicList:RemoveChildAt(childIndex, true)
      acPicListIndex[featureId] = nil
    end
  end
end

function HomeWindow.ShowPlayerReturnActivity()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if activInfo and activInfo.baseInfo.endStamp > LoginData.GetCurServerTime() then
    local list = uis.Main.Sign.SignList
    if not playerReturnBtn then
      local obj = UIMgr:CreateObject("Home", "PlayerReturnsBtn")
      local dataAct = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivity")
      local index = dataAct and dataAct.sort or 0
      local config = SignData.GetActivitySignInData()
      local num = 0
      if config and #config > 0 and dataAct.sort then
        for i = 1, #config do
          if config[i].sort and config[i].sort < dataAct.sort then
            num = num + 1
          end
        end
      end
      index = math.max(0, num)
      index = math.min(index, uis.Main.Sign.SignList.numChildren)
      list:AddChildAt(obj, index)
      playerReturnBtn = obj
      UIUtil.SetText(playerReturnBtn, T(20818))
      RedDotMgr.AddNode({
        windowName = WinResConfig.HomeWindow.name,
        com = playerReturnBtn,
        visibleFunc = function()
          return RedDotPlayerReturn.HasAnyRewards() or RedDotPlayerReturn.HasMultiDroppedCount()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
      })
    end
    playerReturnBtn.onClick:Set(function()
      OpenWindow(WinResConfig.PlayerReturnsWindow.name)
    end)
  elseif playerReturnBtn then
    RedDotData.RemoveOneNode(WinResConfig.HomeWindow.name, playerReturnBtn)
    playerReturnBtn:Dispose()
    playerReturnBtn = nil
  end
end

function HomeWindow.OpenCodeWindow()
  OpenWindow(WinResConfig.CodeWindow.name)
end

function HomeWindow.InitSettingModel()
  uis.Main.PositionMask.root.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 1 == uis.Main.c1Ctr.selectedIndex and 2 or 1
  end)
  local beginPos
  uis.Main.PositionMask.root.onTouchBegin:Set(function(context)
    context:CaptureTouch()
    beginPos = GRoot.inst:GlobalToLocal(context.inputEvent.position)
  end)
  defaultPos = uis.Main.CardShow.CardShow.root.xy
  normalScale = 1
  lastScale = 1
  lastRolePos = defaultPos
  uis.Main.Position.ZoomSlider.min = normalScale * (1 - sliderScale)
  uis.Main.Position.ZoomSlider.max = normalScale * (1 + sliderScale)
  local scale = normalScale
  local actorInfo = ActorData.GetActorInfo()
  local showIndex = tempSetRoleInfo and tempSetRoleInfo.index or actorInfo.showFashionIndex + 1
  local posArr = ActorData.GetFashionPosInfoByIndex(showIndex)
  if posArr and posArr.x and posArr.y then
    curRolePos = Vector2(posArr.x, posArr.y)
    lastRolePos = curRolePos
    scale = posArr.scale or normalScale
    scale = scale > uis.Main.Position.ZoomSlider.max and uis.Main.Position.ZoomSlider.max or scale
    lastScale = scale
    uis.Main.Position.ZoomSlider.value = scale
    uis.Main.CardShow.CardShow.root:SetScale(scale, scale)
  else
    uis.Main.Position.ZoomSlider.value = normalScale
    curRolePos = uis.Main.CardShow.CardShow.root.xy
  end
  HomeWindow.UpdateTextPosition()
  local dis, x, y, isMove
  uis.Main.PositionMask.root.onTouchMove:Set(function(context)
    dis = GRoot.inst:GlobalToLocal(context.inputEvent.position) - beginPos
    x = curRolePos.x + dis.x
    y = curRolePos.y + dis.y
    uis.Main.CardShow.CardShow.root:SetXY(x, y)
    HomeWindow.UpdateModelPosition()
    uis.Main.Position.PosNumberTxt.text = T(573, math.ceil(x), math.ceil(y))
    isMove = true
  end)
  uis.Main.PositionMask.root.onTouchEnd:Set(function(context)
    if isMove then
      dis = GRoot.inst:GlobalToLocal(context.inputEvent.position) - beginPos
      curRolePos = Vector2(curRolePos.x + dis.x, curRolePos.y + dis.y)
      HomeWindow.UpdateTextPosition()
      isMove = false
    end
  end)
  uis.Main.Position.CloseBtn.onClick:Set(function()
    if lastRolePos ~= Vector2(math.ceil(curRolePos.x), math.ceil(curRolePos.y)) or lastScale ~= GetPreciseDecimal(scale, 2) then
      MessageBox.Show(T(576), {
        touchCallback = function()
          curRolePos = lastRolePos
          scale = lastScale
          uis.Main.Position.ZoomSlider.value = scale
          uis.Main.CardShow.CardShow.root:SetScale(scale, scale)
          HomeWindow.UpdateTextPosition()
          HomeWindow.QuitSettingModel()
        end
      }, {})
    else
      HomeWindow.QuitSettingModel()
    end
  end)
  uis.Main.Position.DefaultBtn.onClick:Set(function()
    MessageBox.Show(T(575), {
      touchCallback = function()
        HomeWindow.ResetLookRoleInfo()
      end
    }, {})
  end)
  uis.Main.Position.KeepBtn.onClick:Set(function()
    HomeWindow.SaveLookRoleInfo()
    HomeWindow.QuitSettingModel()
  end)
  uis.Main.Position.ZoomSlider.onChanged:Set(function()
    scale = uis.Main.Position.ZoomSlider.value
    uis.Main.CardShow.CardShow.root:SetScale(scale, scale)
  end)
end

function HomeWindow.SetRoleUiPos()
  local actorInfo = ActorData.GetActorInfo()
  local showIndex = tempSetRoleInfo and tempSetRoleInfo.index or actorInfo.showFashionIndex + 1
  local posArr = ActorData.GetFashionPosInfoByIndex(showIndex)
  if posArr and posArr.x and posArr.y then
    curRolePos = Vector2(posArr.x, posArr.y)
    lastRolePos = curRolePos
    local scale = posArr.scale or normalScale
    local scale = scale > uis.Main.Position.ZoomSlider.max and uis.Main.Position.ZoomSlider.max or scale
    lastScale = scale
    uis.Main.Position.ZoomSlider.value = scale
    uis.Main.CardShow.CardShow.root:SetScale(scale, scale)
  else
    HomeWindow.ResetLookRoleInfo()
    lastRolePos = curRolePos
    lastScale = normalScale
  end
  HomeWindow.UpdateTextPosition()
end

function HomeWindow.ResetLookRoleInfo()
  curRolePos = defaultPos
  local s = normalScale
  uis.Main.CardShow.CardShow.root:SetScale(s, s)
  uis.Main.Position.ZoomSlider.value = s
  HomeWindow.UpdateTextPosition()
end

function HomeWindow.SaveLookRoleInfo()
  local scale = GetPreciseDecimal(uis.Main.CardShow.CardShow.root.scale.x, 2)
  lastScale = scale
  lastRolePos = Vector2(math.ceil(curRolePos.x), math.ceil(curRolePos.y))
  ActorData.UpdateFashionPosInfo(tempSetRoleInfo.index, {
    x = lastRolePos.x,
    y = lastRolePos.y,
    scale = scale
  })
  local GetOnePos = function(index)
    local posArr = ActorData.GetFashionPosInfoByIndex(index)
    if posArr and posArr.x and posArr.y then
      return string.format("%d:%d:%s", posArr.x, posArr.y, posArr.scale)
    end
    return ""
  end
  local str = string.format("%s|%s|%s|%s|%s", GetOnePos(1), GetOnePos(2), GetOnePos(3), GetOnePos(4), GetOnePos(5))
  print(str, ">>>>>保存位置>>>>>>>>>>>>>", tempSetRoleInfo.index)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.HOME_LOOK_ROLE, str)
end

function HomeWindow.EnterSettingModel()
  HomeWindow.SetRoleUiPos()
  HomeWindow.UpdateModel()
  uis.Main.c1Ctr.selectedIndex = 1
end

function HomeWindow.QuitSettingModel()
  OpenWindow(WinResConfig.WatchWindow.name, nil, tempSetRoleInfo)
  LeanTween.delayedCall(1, function()
    if uis then
      tempSetRoleInfo = nil
      HomeWindow.SetRoleUiPos()
      HomeWindow.UpdateModel()
      uis.Main.c1Ctr.selectedIndex = 0
    end
  end)
end

function HomeWindow.UpdateTextPosition()
  uis.Main.CardShow.CardShow.root:SetXY(curRolePos.x, curRolePos.y)
  HomeWindow.UpdateModelPosition()
  uis.Main.Position.PosNumberTxt.text = T(573, math.ceil(curRolePos.x), math.ceil(curRolePos.y))
end

function HomeWindow.ShowReservationGift()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.RESERVATION_GIFT, false) then
    local show, data = SignData.CanShowReservation()
    if show and data then
      local item = UIMgr:CreateObject("Home", "ReservationBtn")
      UIUtil.SetText(item, T(1468))
      item.onClick:Set(function()
        OpenWindow(WinResConfig.ReservationWindow.name)
      end)
      local index = data.sort or 0
      local config = SignData.GetActivitySignInData(true)
      local num = 0
      if config and #config > 0 and data.sort then
        for i = 1, #config do
          if config[i].sort and config[i].sort < data.sort then
            num = num + 1
          end
        end
      end
      index = math.max(0, num)
      index = math.min(index, uis.Main.Sign.SignList.numChildren)
      uis.Main.Sign.SignList:AddChildAt(item, index)
      reservationGiftItem = item
      RedDotMgr.AddNode({
        windowName = WinResConfig.HomeWindow.name,
        com = item,
        visibleFunc = function()
          return RedDotSign.HomeReservationRed(data)
        end,
        dataType = RED_DOT_DATA_TYPE.RESERVATION,
        homeLimitSort = GetHomeRedDotSort(FEATURE_ENUM.RESERVATION_GIFT)
      })
    end
  end
end

function HomeWindow.ShowMultiDrop()
  local infos = AdventureData.GetAllMultiDropInfo()
  if #infos > 0 and not HomeWindow.NotShowMultiDrop() then
    local GetNumber = function()
      local cur, max = 0, 0
      for i = 1, #infos do
        local data = TableData.GetConfig(infos[i].baseInfo.activityId, "BaseActivity")
        if data then
          local arr = Split(data.parameter, "|")
          if arr[1] then
            arr = Split(arr[1], ":")
            if arr[3] then
              max = max + tonumber(arr[3])
            end
          end
        end
        cur = cur + infos[i].dailyDrop[1].count
      end
      return T(746, cur, max)
    end
    if nil == multiDropItem then
      local config = TableData.GetConfig(70061003, "BaseActivity")
      multiDropItem = UIMgr:CreateObject("Home", "MultipleBtn")
      uis.Main.Sign.SignList:AddChild(multiDropItem)
      UIUtil.SetText(multiDropItem, config.name and config.name() or "", "WordTxt")
    end
    UIUtil.SetText(multiDropItem:GetChild("Nmuber"), GetNumber(), "NumberTxt")
    multiDropItem.onClick:Set(function()
      if HomeWindow.NotShowMultiDrop() then
        HomeWindow.CheckRemoveMultiDrop()
      else
        OpenWindow(WinResConfig.MultipleWindow.name)
      end
    end)
  end
end

function HomeWindow.NotShowMultiDrop()
  local infos = AdventureData.GetAllMultiDropInfo()
  for i, v in pairs(infos) do
    if v.baseInfo.endStamp > LoginData.GetCurServerTime() then
      return false
    end
  end
  return true
end

function HomeWindow.CheckRemoveMultiDrop()
  if multiDropItem and HomeWindow.NotShowMultiDrop() then
    local child = uis.Main.Sign.SignList:RemoveChild(multiDropItem)
    child:Dispose()
    multiDropItem = nil
  end
end

function HomeWindow.ShowMonthCard()
  ShopService.PurchaseGetReq(function()
    if AdventureData.IsStagePassed(50110106) and ShopMgr.CheckMonthCardDay(true) and nil == monthListBtn then
      local item = UIMgr:CreateObject("Home", "MonthBtn")
      UIUtil.SetText(item, T(1552))
      item.onClick:Set(function()
        OpenWindow(WinResConfig.MonthGetWindow.name)
      end)
      monthListBtn = item
      uis.Main.Sign.SignList:AddChild(item)
      item:GetChild("Red").visible = true
    end
  end)
end

function HomeWindow.ShowRaffleButton()
  local Remove = function()
    if uis.Main.Sign.SignList.numItems > 0 and raffleListBtn then
      RedDotMgr.RemoveOneNode(WinResConfig.HomeWindow.name, raffleListBtn)
      local childIndex = uis.Main.Sign.SignList:GetChildIndex(raffleListBtn)
      uis.Main.Sign.SignList:RemoveChildAt(childIndex, true)
      raffleListBtn = nil
    end
  end
  if SignData.roundAct and SignData.roundAct.baseInfo then
    if SignData.roundAct.baseInfo.endStamp > LoginData.GetCurServerTime() then
      if nil == raffleListBtn then
        local item = UIMgr:CreateObject("Home", "SignBtn")
        raffleListBtn = item
        uis.Main.Sign.SignList:AddChild(item)
        local conf = TableData.GetConfig(SignData.roundAct.baseInfo.activityId, "BaseActivity")
        if conf and conf.name then
          UIUtil.SetText(item, conf.name())
        end
        local loader = item:GetChild("PicLoader")
        if loader and conf and conf.btn_pic then
          loader.url = UIUtil.GetResUrl(conf.btn_pic)
        end
        item.onClick:Set(function()
          if SignData.roundAct and SignData.roundAct.baseInfo.endStamp > LoginData.GetCurServerTime() then
            OpenWindow(WinResConfig.RaffleWindow.name)
          else
            FloatTipsUtil.ShowWarnTips(T(1618))
            Remove()
          end
        end)
        RedDotMgr.AddNode({
          windowName = WinResConfig.HomeWindow.name,
          com = raffleListBtn,
          visibleFunc = function()
            return RedDotSign.HomeRoundActRed()
          end,
          dataType = RED_DOT_DATA_TYPE.SIGN
        })
      end
    else
      Remove()
    end
  else
    Remove()
  end
end

function HomeWindow.ShowActivitySign()
  if BlockInTestPackage(true) then
    return
  end
  if CarnivalData.SignIsShowHome() then
    FunctionQueueUtil.Add("InitialSign9", function()
      if AdventureData.IsStagePassed(50110106) then
        OpenWindow(WinResConfig.InitialSignAutoWindow.name)
        return false
      end
      return true
    end, GetActivityWeight(ACTIVITY_ID.INITIAL_SIGN), true)
  end
end

function HomeWindow.ShowSingInGiftButton()
  local config = SignData.GetActivitySignInData()
  signGiftItem = signGiftItem or {}
  canOpenTheDay = canOpenTheDay or {}
  for i = 1, #config do
    local data = config[i]
    if data then
      local item
      if data.type ~= SignTypeEnum.RETURN_ACT then
        if signGiftItem[data.id] == nil and not HomeWindow.CanRemoveSingInGift(data) then
          item = UIMgr:CreateObject("Home", "ExploreSignBtn")
          uis.Main.Sign.SignList:AddChild(item)
          item:GetChild("PicLoader").url = UIUtil.GetResUrl(data.btn_pic)
          UIUtil.SetText(item, data.name_sub and data.name_sub() or "", "TitleTxt")
        elseif signGiftItem[data.id] and signGiftItem[data.id].item then
          item = signGiftItem[data.id].item
        end
      elseif nil == returnGiftItem and not HomeWindow.CanRemoveReturnGift(data.id) then
        item = UIMgr:CreateObject("Home", "RegressionSignBtn")
        uis.Main.Sign.SignList:AddChild(item)
      else
        item = returnGiftItem
      end
      UIUtil.SetText(item, data.name and data.name() or "", "WordTxt")
      if data.open_sort and not canOpenTheDay[data.id] then
        FunctionQueueUtil.Add(tostring(data.id), function()
          if not AdventureData.IsStagePassed(50110106) then
            return true
          end
          if data.type == SignTypeEnum.SIGN_IN_ACT then
            local reward = SignData.GetSignData(tonumber(data.parameter))
            local day = #reward or -1
            if SignData.activityData[data.id].isTodaySignIn == false and day > SignData.activityData[data.id].curDay and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
              OpenWindow(WinResConfig.SignWindow.name, nil, SignData.activityData[data.id])
              canOpenTheDay[data.id] = 0
              return false
            end
          elseif data.type == SignTypeEnum.SEARCH_ACT then
            if false == SignData.activityData[data.id].isTodaySearch and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
              if data.res_url and WinResConfig[data.res_url] then
                OpenWindow(data.res_url, nil, SignData.activityData[data.id])
              end
              canOpenTheDay[data.id] = 0
              return false
            end
          elseif data.type == SignTypeEnum.RETURN_ACT and SignData.activityData[data.id] and SignData.activityData[data.id].returnDay > SignData.activityData[data.id].signDay and SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
            OpenWindow(WinResConfig.RegressionSignWindow.name, nil, SignData.activityData[data.id])
            canOpenTheDay[data.id] = 0
            return false
          end
          return true
        end, GetActivityWeight(data.id), true)
      end
      if item then
        item.onClick:Set(function()
          if SignData.activityData[data.id].baseInfo.endStamp - LoginData.GetCurServerTime() > 0 then
            if data.type == SignTypeEnum.SIGN_IN_ACT then
              OpenWindow(WinResConfig.SignWindow.name, nil, SignData.activityData[data.id])
            elseif data.type == SignTypeEnum.SEARCH_ACT then
              if data.res_url and WinResConfig[data.res_url] then
                OpenWindow(data.res_url, nil, SignData.activityData[data.id])
              end
            elseif data.type == SignTypeEnum.RETURN_ACT then
              OpenWindow(WinResConfig.RegressionSignWindow.name, nil, SignData.activityData[data.id])
            end
          else
            local child = uis.Main.Sign.SignList:RemoveChild(item)
            if child then
              child:Dispose()
            end
            FloatTipsUtil.ShowWarnTips(T(1618))
          end
        end)
        if data.type == SignTypeEnum.RETURN_ACT then
          returnGiftItem = item
          returnGiftId = data.id
          RedDotMgr.AddNode({
            windowName = WinResConfig.HomeWindow.name,
            com = item,
            visibleFunc = function()
              return RedDotSign.HomeReturnGiftRed(SignData.activityData[data.id])
            end,
            dataType = RED_DOT_DATA_TYPE.SIGN
          })
        else
          RedDotMgr.AddNode({
            windowName = WinResConfig.HomeWindow.name,
            com = item,
            visibleFunc = function()
              return RedDotSign.HomeTaskRed(data)
            end,
            dataType = RED_DOT_DATA_TYPE.SIGN
          })
          local reward = SignData.GetSignData(tonumber(data.parameter))
          local day = #reward or -1
          signGiftItem[data.id] = {
            item = item,
            id = data.id,
            maxDay = day
          }
        end
      end
    end
  end
end

function HomeWindow.CanRemoveSingInGift(data)
  if data and SignData.activityData[data.id] then
    local timeEnd = LoginData.GetCurServerTime() > SignData.activityData[data.id].baseInfo.endStamp
    local dayEnd = false
    local reward = SignData.GetSignData(tonumber(data.parameter))
    local maxDay = #reward or -1
    if SignData.activityData[data.id].isTodaySignIn and maxDay <= SignData.activityData[data.id].curDay then
      dayEnd = true
    end
    if SignData.activityData[data.id].curCount and SignData.activityData[data.id].totalCount and SignData.activityData[data.id].curCount >= SignData.activityData[data.id].totalCount then
      dayEnd = true
    end
    if dayEnd or timeEnd then
      return true
    end
  end
end

function HomeWindow.CheckRemoveSingInGift()
  if signGiftItem then
    for i, v in pairs(signGiftItem) do
      if SignData.activityData[v.id] then
        local timeEnd = LoginData.GetCurServerTime() > SignData.activityData[v.id].baseInfo.endStamp
        local dayEnd = false
        if SignData.activityData[v.id].isTodaySignIn and SignData.activityData[v.id].curDay >= v.maxDay then
          dayEnd = true
        end
        if SignData.activityData[v.id].curCount and SignData.activityData[v.id].totalCount and SignData.activityData[v.id].curCount >= SignData.activityData[v.id].totalCount then
          dayEnd = true
        end
        if dayEnd or timeEnd then
          local child = uis.Main.Sign.SignList:RemoveChild(v.item)
          child:Dispose()
          signGiftItem[i] = nil
        end
      end
    end
  end
end

function HomeWindow.CanRemoveReturnGift(giftId)
  if SignData.activityData[giftId] and SignData.returnMaxDay then
    local dayEnd = SignData.activityData[giftId].signDay >= SignData.returnMaxDay
    local timeEnd = LoginData.GetCurServerTime() > SignData.activityData[giftId].baseInfo.endStamp
    if dayEnd or timeEnd then
      return true
    end
  end
end

function HomeWindow.CheckRemoveReturnGift()
  if returnGiftItem and returnGiftId and SignData.activityData[returnGiftId] and SignData.returnMaxDay then
    local dayEnd = SignData.activityData[returnGiftId].signDay >= SignData.returnMaxDay
    local timeEnd = LoginData.GetCurServerTime() > SignData.activityData[returnGiftId].baseInfo.endStamp
    if dayEnd or timeEnd then
      local child = uis.Main.Sign.SignList:RemoveChild(returnGiftItem)
      child:Dispose()
      returnGiftItem = nil
      returnGiftId = nil
    end
  end
end

function HomeWindow.ShowSchedule()
  ld("Schedule", function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SCHEDULE, false) then
      UIUtil.SetText(uis.Main.BottomLeft.ScheduleBtn, T(1731), "NameTxt")
      ScheduleService.GetFeatureScheduleReq(function()
        local info = ScheduleData.GetInfo()
        if info and info.manor and info.manor.manorInfo and info.manor.manorInfo.rookieFinished then
          ChangeController(uis.Main.BottomLeft.ScheduleCtr, 1)
          uis.Main.BottomLeft.ScheduleBtn.onClick:Set(function()
            OpenWindow(WinResConfig.ScheduleWindow.name)
          end)
          RedDotMgr.AddNode({
            windowName = WinResConfig.HomeWindow.name,
            com = uis.Main.BottomLeft.ScheduleBtn,
            visibleFunc = function()
              if RedDotSchedule.ShowHomeNew() then
                RedDotSchedule.SaveOpen()
                ChangeUIController(uis.Main.BottomLeft.ScheduleBtn, "new", 1)
                return false
              end
              ChangeUIController(uis.Main.BottomLeft.ScheduleBtn, "new", 0)
              return RedDotSchedule.ShowHome() or RedDotSchedule.CanItem()
            end,
            dataType = RED_DOT_DATA_TYPE.SCHEDULE
          })
        else
          ChangeController(uis.Main.BottomLeft.ScheduleCtr, 0)
        end
      end)
    else
      ChangeController(uis.Main.BottomLeft.ScheduleCtr, 0)
    end
  end)
end

function HomeWindow.ShowTurnTable()
  if SignData.turnAct and table.getLen(SignData.turnAct) > 0 then
    ChangeController(uis.Main.MiddleZone.casketCtr, 1)
    UIUtil.SetText(uis.Main.MiddleZone.CasketBtn, T(2088), "NameTxt")
    uis.Main.MiddleZone.CasketBtn.onClick:Set(function()
      local controller = uis.Main.MiddleZone.CasketBtn:GetController("lock")
      if controller and 1 == controller.selectedIndex then
        FloatTipsUtil.ShowWarnTips(T(2105))
        return
      end
      local endBol = true
      for i = 1, #SignData.turnAct do
        if LoginData.GetCurServerTime() < SignData.turnAct[i].baseInfo.endStamp then
          endBol = nil
        end
      end
      if endBol then
        FloatTipsUtil.ShowWarnTips(T(1618))
        ChangeController(uis.Main.MiddleZone.casketCtr, 0)
      else
        OpenWindow(WinResConfig.CasketHomeWindow.name)
      end
    end)
    local str = RedDotSign.CanHomeTurnTable()
    if str then
      UIUtil.SetText(uis.Main.MiddleZone.CasketBtn:GetChild("Sign"), str, "WordTxt")
      ChangeUIController(uis.Main.MiddleZone.CasketBtn, "c1", 1)
      return
    end
    ChangeUIController(uis.Main.MiddleZone.CasketBtn, "c1", 0)
  else
    ChangeController(uis.Main.MiddleZone.casketCtr, 0)
  end
end

function HomeWindow.SetHomeTouchable()
  contentPane.touchable = FunctionQueueUtil.CheckHomeIsEnd()
end

function HomeWindow.InitBackground()
end

function HomeWindow.UpdateFuncUnlock()
  local bottomArea = uis.Main.BottomArea
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_EXPLORE, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.HomeBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_GUILD, function(isUnlock)
    ChangeUIController(bottomArea.GuildBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_STORY, function(isUnlock)
    ChangeUIController(bottomArea.PlotBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_SHOP, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.ShopBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_TASK, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.PassportBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_SUMMON, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.GaChaBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_TASK_LIST, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.ActivityBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_CHAT, function(isUnlock)
    ChangeUIController(uis.Main.TotalOpr.ChatBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_FRIEND, function(isUnlock)
    ChangeUIController(uis.Main.TotalOpr.FriendBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_BADGE, function(isUnlock)
    ChangeUIController(uis.Main.BottomArea.BadgeBtn, "lock", isUnlock and 0 or 1)
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.HOME_MUSIC, function(isUnlock)
    uis.Main.MusicBtn.visible = isUnlock
  end)
  EnterClampUtil.UpdateEntranceState(FEATURE_ENUM.ACIVITY_TURNTABLE, function(isUnlock)
    ChangeUIController(uis.Main.MiddleZone.CasketBtn, "lock", isUnlock and 0 or 1)
  end)
end

function HomeWindow.OnShown()
  if curSceneObject then
    curSceneObject:SetActive(true)
  end
  if lastSceneObject then
    lastSceneObject:SetActive(true)
  end
  for i, v in pairs(cachedEffect) do
    v:SetActive(true)
  end
  if uis then
    local playFestival
    if roleChanged then
      roleChanged = false
      playFestival = HomeWindow.PlayFestivalTalkIfNecessary()
    end
    if canTalkPlay and not playFestival then
      HomeWindow.UpdateTalkWord()
      canTalkPlay = nil
    end
    HomeWindow.UpdateAdventureInfo()
    HomeWindow.UpdateActivityTxt()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_TASK, false) then
      ld("Passport", function()
        PassportMgr.UpdateByHomeWindow()
      end)
    end
    LotteryService.GetGachaInfoReq(false, function()
      HomeWindow.UpdateLotteryInfo(true)
    end)
    HomeWindow.InitRedDotDataReq()
    HomeWindow.ShowMonthCard()
    HomeWindow.UpdateAbyssNoviceBonus()
  end
  SoundUtil.PlayHomeMusic(nil == curSceneObject)
  if curSceneObject then
    HomeWindow.UpdateBackground()
  else
    HomeWindow.UpdateBackground()
  end
  LightManager:SetLightEnable(true)
  HomeData.UpdateWeatherLightParam(0)
  if cardShowObject then
    HomeData.UpdateWeatherModelParam(cardShowObject, 0)
  end
  HomeWindow.StartTalkTimer()
  if AbyssExploreMgr and AbyssExploreMgr.Exists() then
    AbyssExploreMgr.Release()
  end
  MailMgr.UpdateByHomeWindow()
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.HomeWindow.name)
  if uis then
    CarnivalService.GetTaskRefreshStampReq()
    HomeWindow.ShowCrossDayTips()
    ShopService.GetGiftInfoReq()
    ShopService.GetAgreementInfoReq()
    HomeWindow.CheckActivityDungeonState()
    HomeWindow.CheckPlayerReturnActivityState()
    HomeWindow.CheckGuildWarState()
    HomeWindow.CheckRemoveReturnGift()
    HomeWindow.CheckRemoveSingInGift()
    HomeWindow.ShowSchedule()
    CardService.GetAllCardFashionReq()
    HomeWindow.ShowRaffleButton()
    HomeWindow.ShowTurnTable()
  end
end

function HomeWindow.OpenTotalOpr()
  ChangeUIController(uis.Main.root, "c2", 1)
  uis.Main.TotalOprBtn.onClick:Add(HomeWindow.HideTotalOpr)
end

function HomeWindow.HideTotalOpr()
  ChangeUIController(uis.Main.root, "c2", 0)
end

function HomeWindow.UpdateBGMParameter()
end

local typingInterval = 0.05
local typingSpeedUpInterval = 0.001

function HomeWindow.PlayLoginTalk()
  if HomeWindow.PlayFestivalTalkIfNecessary() then
    return
  end
  local talkTextEnable = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.HOME_ROLE_TEXT_ENABLE, PLAYER_PREF_DEFAULT_VALUE.HOME_ROLE_TEXT_ENABLE)
  if 1 ~= talkTextEnable then
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, BUBBLE_TYPE_ENUM.LOGIN, nil, true)
  else
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, BUBBLE_TYPE_ENUM.LOGIN, {
      wordTxt = uis.Main.TalkWord.WordTxt,
      interval = typingInterval,
      inAnim = "in",
      outAnim = "out",
      outDelay = 5
    }, true)
  end
end

function HomeWindow.PlayFestivalTalkIfNecessary()
  local bubbleType
  local timestamp = LoginData.GetCurServerTime()
  local month, day = tonumber(os.date("%m", math.floor(timestamp))), tonumber(os.date("%d", math.floor(timestamp)))
  local festival_lookup = FESTIVAL_DATE
  local value = month * 100 + day
  for k, v in pairs(festival_lookup) do
    if v == value then
      bubbleType = BUBBLE_TYPE_ENUM[k]
      break
    end
  end
  local birthday = ActorData.GetBirthday()
  if 229 == birthday then
    local date = os.date("!*t", math.floor(timestamp))
    local t = os.time({
      year = date.year,
      month = 3,
      day = 1
    }) - 86400
    date = os.date("!*t", t)
    if 28 == date.day then
      birthday = 228
    end
  end
  if birthday > 0 and birthday == value then
    bubbleType = BUBBLE_TYPE_ENUM.BIRTHDAY
  end
  if bubbleType then
    local talkTextEnable = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.HOME_ROLE_TEXT_ENABLE, PLAYER_PREF_DEFAULT_VALUE.HOME_ROLE_TEXT_ENABLE)
    if 1 ~= talkTextEnable then
      curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, bubbleType, nil, true)
    else
      curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, bubbleType, {
        wordTxt = uis.Main.TalkWord.WordTxt,
        interval = typingInterval,
        inAnim = "in",
        outAnim = "out",
        outDelay = 5
      }, true)
    end
    return true
  end
  return false
end

function HomeWindow.UpdateTalkWord()
  if uis.Main.TalkWord.root.visible == true then
    if curTypingEffect and true == curTypingEffect.Typing then
      HomeWindow.SpeedUpTypingEffect()
      return
    else
      if lastSoundTime and Time.unscaledTime - lastSoundTime < 1 then
        return
      end
      HomeWindow.StopTalk()
    end
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curSoundEventIns = nil
  end
  local talkTextEnable = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.HOME_ROLE_TEXT_ENABLE, PLAYER_PREF_DEFAULT_VALUE.HOME_ROLE_TEXT_ENABLE)
  if 1 ~= talkTextEnable then
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, BUBBLE_TYPE_ENUM.STANDBY, nil, true)
  else
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(curFaceId, BUBBLE_TYPE_ENUM.STANDBY, {
      wordTxt = uis.Main.TalkWord.WordTxt,
      interval = typingInterval,
      inAnim = "in",
      outAnim = "out",
      outDelay = 5
    }, true)
  end
  HomeWindow.StartTalkTimer()
  lastSoundTime = Time.unscaledTime
end

function HomeWindow.StopTalk(keepSound)
  if true ~= keepSound and curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curSoundEventIns = nil
  end
  HomeWindow.StopTalkTimer()
  HomeWindow.StopTypingEffect()
  if uis then
    LeanTween.cancel(uis.Main.TalkWord.WordTxt)
  end
end

function HomeWindow.StartTalkTimer()
  HomeWindow.StopTalkTimer()
  curTalkTimer = TimerUtil.setTimeout(60, function()
    HomeWindow.UpdateTalkWord()
  end)
end

function HomeWindow.StopTalkTimer()
  if nil ~= curTalkTimer then
    curTalkTimer:stop()
    curTalkTimer = nil
  end
end

function HomeWindow.StartBannerTimer(callBack)
  HomeWindow.StopBannerTimer()
  bannerTimer = TimerUtil.setInterval(10, -1, callBack)
end

function HomeWindow.StopBannerTimer()
  if nil ~= bannerTimer then
    bannerTimer:stop()
    bannerTimer = nil
  end
end

function HomeWindow.SpeedUpTypingEffect()
  if curTypingEffect and curTypingEffect.Typing == true then
    curTypingEffect:PrintAll(typingSpeedUpInterval, 4)
  end
end

function HomeWindow.StopTypingEffect()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if uis then
    uis.Main.TalkWord.root.alpha = 0
    uis.Main.TalkWord.root.visible = false
  end
end

function HomeWindow.OnPreHide()
  LightManager:SetCameraBloom(UICamera, false)
  HomeWindow.HideTotalOpr()
end

function HomeWindow.OnHide()
  HomeWindow.StopTalk()
  LightManager:SetLightEnable(false)
  if curSceneObject then
    curSceneObject:SetActive(false)
  end
  if lastSceneObject then
    curSceneObject:SetActive(false)
  end
  if cardShowObject then
    CS.CardSpineTouchEvent.ClearTrackAnimations(cardShowObject, 1)
  end
  for i, v in pairs(cachedEffect) do
    v:SetActive(false)
  end
end

function HomeWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.HomeWindow.name)
  HomeWindow.StopTalk()
  HomeWindow.StopBannerTimer()
  if curSceneObject then
    ResourceManager.DestroyGameObject(curSceneObject)
    curSceneObject = nil
  end
  if lastSceneObject then
    ResourceManager.DestroyGameObject(lastSceneObject)
    lastSceneObject = nil
  end
  cardShowObject = nil
  for i, v in pairs(cachedEffect) do
    ResourceManager.DestroyGameObject(v)
  end
  LightManager:SetLightEnable(false)
  uis = nil
  contentPane = nil
  tempGraph = nil
  cachedEffect = {}
  curSceneCamera = nil
  lastSceneCamera = nil
  curResPath = nil
  curRolePos = nil
  defaultPos = nil
  curFaceId = nil
  normalScale = nil
  lastRolePos = nil
  lastScale = nil
  enterActivityIndex = nil
  monthListBtn = nil
  acPicListIndex = nil
  acPicListByActivity = nil
  returnGiftItem = nil
  returnGiftId = nil
  signGiftItem = nil
  tempSetRoleInfo = nil
  canOpenTheDay = nil
  multiDropItem = nil
  canTalkPlay = nil
  roleChanged = nil
  raffleListBtn = nil
  playerReturnBtn = nil
end

function HomeWindow.ShowCrossDayTips()
  if LoginData.crossDayShowTips and GuideMgr.guideBol == false then
    contentPane.touchable = false
    FunctionQueueUtil.Add("Notice", function()
      if BlockInTestPackage(true) or UIMgr:GetTopWindow() ~= WinResConfig.HomeWindow.name then
        return true
      end
      if not AdventureData.IsStagePassed(50110106) then
        return true
      end
      if 1 == PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ANNOUNCEMENT_ALWAYS_ENABLE) then
        ld("Notice", function()
          NoticeService.GetAllNoticesReq()
        end)
      else
        ld("Notice", function()
          NoticeService.GetAllNoticesReq(false, nil, true)
        end)
      end
    end, GetActivityWeight(ACTIVITY_ID.NOTICE), true)
    if CarnivalData.SignIsShowHome() then
      FunctionQueueUtil.Add("InitialSign9", function()
        if AdventureData.IsStagePassed(50110106) then
          OpenWindow(WinResConfig.InitialSignAutoWindow.name)
          return false
        end
        return true
      end, GetActivityWeight(ACTIVITY_ID.INITIAL_SIGN), true)
    end
    LoginData.crossDayShowTips = nil
  end
end

function HomeWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_SERVER_TIME_CHANGE then
    HomeWindow.UpdateServerTime()
    if enterActivityId ~= ACTIVITY_ID.DAILY_SUPPLY and DailySupplyMgr.HasAnyInTimeSupply() then
      HomeWindow.UpdateActivityTxt()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    HomeWindow.UpdateAssetsTips()
  elseif msgId == WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE then
    HomeWindow.UpdatePlayerInformation()
    HomeWindow.UpdateAbyssNoviceBonus()
    roleChanged = true
  elseif msgId == WindowMsgEnum.HomeWindow.CHAT_BTN_SHOW then
    HomeWindow.UpdateMessage()
  elseif msgId == WindowMsgEnum.HomeWindow.SETTING_LOOK_ROLE then
    tempSetRoleInfo = para
    HomeWindow.EnterSettingModel()
  elseif msgId == WindowMsgEnum.HomeWindow.UPDATE_CARD_POSITION then
    HomeWindow.UpdateModelPosition(true)
  elseif msgId == WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE then
    HomeWindow.UpdateActivityTxt()
  elseif msgId == WindowMsgEnum.Common.E_MSG_UPDATE_BATTERY then
    HomeWindow.UpdateBatteryLevel()
  elseif msgId == WindowMsgEnum.HomeWindow.SET_HOME_TOUCHABLE then
    HomeWindow.SetHomeTouchable()
  elseif msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    canOpenTheDay = {}
    SignService.GetActivityAllReq(function(msgRsp)
      if UIMgr:GetTopWindow() == WinResConfig.HomeWindow.name then
        HomeWindow.ShowCrossDayTips()
      end
      ActivityDungeonData.SaveActivityInfo(msgRsp)
      if msgRsp.stageAct then
        HomeWindow.ShowActivityDungeon()
      end
      HomeWindow.ShowMultiDrop()
      HomeWindow.ShowTurnTable()
    end)
    DailySupplyService.GetSupplyInfoReq()
    ShopService.GetAgreementInfoReq()
    PassportService.GetBattlePassInfoReq()
  elseif msgId == WindowMsgEnum.Common.E_MSG_CHANGE_LANGUAGE then
    HomeWindow.UpdateLanguage()
  elseif msgId == WindowMsgEnum.HomeWindow.CLOSE_RESERVATION_GIFT then
    local showBol = SignData.CanShowReservation()
    if uis.Main.Sign.SignList.numItems > 0 and not showBol and reservationGiftItem then
      RedDotData.RemoveOneNode(WinResConfig.HomeWindow.name, reservationGiftItem)
      local child = uis.Main.Sign.SignList:RemoveChild(reservationGiftItem)
      child:Dispose()
      reservationGiftItem = nil
    end
  elseif msgId == WindowMsgEnum.HomeWindow.CLOSE_MONTH and uis.Main.Sign.SignList.numItems > 0 and monthListBtn then
    local childIndex = uis.Main.Sign.SignList:GetChildIndex(monthListBtn)
    uis.Main.Sign.SignList:RemoveChildAt(childIndex, true)
    monthListBtn = nil
  end
end

return HomeWindow
