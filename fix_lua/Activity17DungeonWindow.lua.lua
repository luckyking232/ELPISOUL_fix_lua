require("ActivityDungeon1017_ActivityDungeonWindowByName")
local Activity17DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect
local gameId = 70441021
local eventTipsRoot, cursors, cursorRoot
local GetEventControllerIndex = function(etype, esubtype)
  local ctrlname, ctrlIndex = "c1", 0
  if etype == AbyssExploreEventID.ACTIVITY_BOSS then
    ctrlIndex = 3
  elseif etype == AbyssExploreEventID.ACTIVITY_STAGE then
    ctrlIndex = 0
  elseif etype == AbyssExploreEventID.ACTIVITY_MINIGAME1 then
    ctrlIndex = 1
  elseif etype == AbyssExploreEventID.ACTIVITY_MINIGAME2 then
    ctrlIndex = 2
  end
  return ctrlname, ctrlIndex
end
local OnPopupEventTips = function(events)
  local parent = uis.Main.root
  if not eventTipsRoot then
    eventTipsRoot = UIMgr:CreateObject("ActivityDungeon1017", "EventTipsList")
    eventTipsRoot.opaque = false
    local childIndex = parent:GetChildIndex(uis.Main.BackGround.root)
    parent:AddChildAt(eventTipsRoot, childIndex + 1)
    AbyssEventList.Reset(eventTipsRoot)
  end
  AbyssEventList.SetBusy(false)
  AbyssEventList.PopupEventList(eventTipsRoot, events, "Assets/Art/Effects/Prefab/UI_prefab/Activities/FX_eventcover_0005_minititle_light.prefab", GetEventControllerIndex)
end
local eventTipsPositionOffset = Vector3(0.5, 0, 0)
local UpdateEventTipsPosition = function()
  if eventTipsRoot and eventTipsRoot.visible then
    local position = AbyssExploreChrCtrl.GetPosition()
    position = position + eventTipsPositionOffset
    local sp = AbyssExploreMgr.WorldToScreenPoint(position)
    local parent = uis.Main.root
    local lp = parent:RootToLocal(sp)
    eventTipsRoot:SetXY(lp.x, lp.y)
  end
end
local cursorPositionOffset = Vector3(0, 0)
local cacheSplits
local UpdateCursors = function()
  if cursors and cursorRoot then
    local cursorParent = cursorRoot
    local allEvents = AbyssExploreData.GetAllEvents()
    if type(allEvents) ~= "table" then
      return
    end
    for _, cursor in ipairs(cursors) do
      local gobj = cursor.gobj
      local id = cursor.eventId
      local event = allEvents[id]
      if cursor.position then
        local worldPos = cursor.position + cursorPositionOffset
        local screenPos = AbyssExploreMgr.WorldToScreenPoint(worldPos)
        if screenPos then
          local position = cursorParent:RootToLocal(screenPos)
          gobj:SetXY(position.x, position.y)
        end
      end
      if event then
        local e_type = event.type
        if e_type == AbyssExploreEventID.ACTIVITY_BOSS then
          if configData and configData.boss_chapter_ids then
            if not cacheSplits then
              cacheSplits = Split(configData.boss_chapter_ids, ":")
            end
            if 2 == #cacheSplits then
              local stageId = tonumber(cacheSplits[2])
              local unlock = table.contain(ActivityDungeonData.GetActivityInfo().finishStages, stageId)
              ChangeUIController(gobj, "lock", unlock and 1 or 0)
            end
          end
        else
          ChangeUIController(gobj, "lock", 1)
        end
      end
    end
  end
end
local OnCameraPositionChanged = function()
  UpdateEventTipsPosition()
  UpdateCursors()
end
local OnChrStartMoving = function()
  if not eventTipsRoot then
    return
  end
  AbyssEventList.ClearEventTips(eventTipsRoot, true, nil, true)
end
local buffer
local TreasureFilter = function(evt)
  return evt.type == AbyssExploreEventID.POSITIVE and evt.subtype == AbyssExploreSubEventID.TREASURE
end
local closestTreasure
local MAP_ID_OFFSET_IN_TBL = 75000001
local OnUpdate = function()
  if AbyssExploreMgr.Exists() and not AbyssExploreCamCtrl.IsSwiping() then
    UpdateEventTipsPosition()
  end
  if AbyssExploreMgr.Exists() then
    buffer = buffer or {}
    table.clear(buffer)
    AbyssExploreData.GetEvents(TreasureFilter, buffer)
    local result
    local minDist = math.huge
    local playerPosition = AbyssExploreChrCtrl.GetPosition()
    local count = 0
    local threshold = #buffer
    AbyssExploreMapCtrl.IgnoreObstacle(true)
    for _, v in ipairs(buffer) do
      if 0 == v.finishTimestamp and v.mapId == MAP_ID_OFFSET_IN_TBL + EXPLORE_MAP_ID.ACTIVITY_4 then
        count = count + 1
        local position = AbyssExploreMapCtrl.GridToWorld(v.x, v.y)
        local inst = AbyssExploreMapCtrl.GetMapLogicInst()
        local founded, points = inst.pathFinder:Search(playerPosition, position)
        if founded and minDist > points.Count then
          minDist = points.Count
          result = v
        end
      end
    end
    AbyssExploreMapCtrl.IgnoreObstacle(false)
    closestTreasure = result
    local arrow = uis.Main.TreasureBtn:GetChild("Arrow")
    if result then
      local target = AbyssExploreMapCtrl.GridToWorld(result.x, result.y)
      local dir = target - playerPosition
      arrow.rotation = Vector3.SignedAngle(Vector3.up, dir, -Vector3.forward)
      ChangeUIController(uis.Main.TreasureBtn, "c1", 0)
    else
      ChangeUIController(uis.Main.TreasureBtn, "c1", 1)
    end
    local tipsTxt = T(20836, count, threshold)
    UIUtil.SetText(uis.Main.TreasureBtn, tipsTxt, "WordTxt")
  end
end
local OnLateUpdate = function()
  if not AbyssExploreMgr.Exists() then
    return
  end
  if not AbyssExploreCamCtrl.IsSwiping() then
    UpdateCursors()
  end
end
local RegisterListeners = function()
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.CAMERA_POSITION_CHANGED, OnCameraPositionChanged)
  AbyssExploreMgr.AddListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
  UpdateManager.AddUpdateHandler(OnUpdate)
  UpdateManager.AddLateUpdateHandler(OnLateUpdate)
end
local UnregisterListeners = function()
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.POPUP_EVENT_TIPS, OnPopupEventTips)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.CAMERA_POSITION_CHANGED, OnCameraPositionChanged)
  AbyssExploreMgr.RemoveListener(AbyssExploreMsgEnum.CHA_START_MOVING, OnChrStartMoving)
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.RemoveLateUpdateHandler(OnLateUpdate)
end
local ResidentEventPositionLookup = {
  [76201415] = Vector3(996.5, 1006.59998, 0)
}
local RefreshEventDisplayInfo = function()
  if cursors then
    for _, v in ipairs(cursors) do
      v.gobj:Dispose()
    end
    table.clear(cursors)
  end
  cursors = cursors or {}
  if not cursorRoot then
    cursorRoot = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Component)
    uis.Main.root:AddChildAt(cursorRoot, 0)
  end
  local events = AbyssExploreData.GetAllEvents()
  for _, event in pairs(events) do
    local e_type = event.type
    local eventId = event.eventId
    if e_type == AbyssExploreEventID.ACTIVITY_MINIGAME1 or e_type == AbyssExploreEventID.ACTIVITY_MINIGAME2 or e_type == AbyssExploreEventID.ACTIVITY_BOSS or e_type == AbyssExploreEventID.ACTIVITY_RECOVER or e_type == AbyssExploreEventID.ACTIVITY_SIGN or e_type == AbyssExploreEventID.ACTIVITY_STAGE then
      local gobj = UIMgr:CreateObject("ActivityDungeon1017", "MainBuildSign")
      gobj:SetPivot(0.5, 0.95, true)
      local position = ResidentEventPositionLookup[eventId] or AbyssExploreMapCtrl.GridToWorld(event.x, event.y)
      local cursor = {
        eventId = eventId,
        gobj = gobj,
        position = position
      }
      local ctrl_index = 0
      local conf = TableData.GetConfig(eventId, "BaseManorEvent")
      local eventTitle = conf.name and conf.name() or "未配置" .. tostring(eventId)
      if e_type == AbyssExploreEventID.ACTIVITY_RECOVER then
        ctrl_index = 0
      elseif e_type == AbyssExploreEventID.ACTIVITY_MINIGAME1 then
        ctrl_index = 1
      elseif e_type == AbyssExploreEventID.ACTIVITY_MINIGAME2 then
        ctrl_index = 2
      elseif e_type == AbyssExploreEventID.ACTIVITY_BOSS then
        ctrl_index = 3
      end
      UIUtil.SetText(gobj, eventTitle, "WordTxt")
      ChangeUIController(gobj, "c1", ctrl_index)
      table.insert(cursors, cursor)
      cursorRoot:AddChild(gobj)
    end
  end
end
local InitMiniGameInfo = function()
  local data = ActivityDungeonData.GetActivityData()
  if data.id == 70440017 then
    ld("Activity17_MiniGame")
    Activity17_MiniGameService.MiniGameInfoReq(gameId, function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity17DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame17_TaskRewardable(gameId) or RedDotActivityDungeon.MiniGame17_DailyTaskRewardable(gameId)
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity17DungeonWindow.name)
    end)
  end
end
local getD_H = function(timestamp)
  local localTimestamp = timestamp + LoginData.timezoneOffset
  local day = math.floor(localTimestamp / 86400)
  local mod = localTimestamp % 86400
  local hour = mod / 3600 % 24
  return day, hour
end
local PlayDailyEntranceAnimIfNecessary = function()
  local info = ActivityDungeonData.GetActivityInfo()
  local startStamp = info.baseInfo.startStamp
  local timestamp = LoginData.GetCurServerTime()
  local d, h = getD_H(timestamp)
  local lastTimestamp = PlayerPrefsUtil.GetFloat(PLAYER_PREF_ENUM.ACTIVITY17_LOGIN_TIMESTAMP, 0, startStamp)
  local last_d, last_h = getD_H(lastTimestamp)
  local outOfDate = d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5
  if outOfDate then
    OpenWindow(WinResConfig.Activity17EntranceAnimWindow.name)
  else
    uis.Main.root.touchable = false
    PlayUITrans(uis.Main.root, "in1", function()
      uis.Main.root.touchable = true
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    end)
  end
  PlayerPrefsUtil.SetFloat(PLAYER_PREF_ENUM.ACTIVITY17_LOGIN_TIMESTAMP, timestamp, startStamp)
end

function Activity17DungeonWindow.ReInitData()
end

function Activity17DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.Activity17DungeonWindow.package, WinResConfig.Activity17DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_ActivityDungeonWindowUis(contentPane)
    RegisterListeners()
    local trans = uis.Main.root:GetTransition("in")
    if trans then
      uis.Main.root.touchable = false
      trans:SetHook("sign", function()
        uis.Main.root.touchable = true
      end)
    end
    Activity17DungeonWindow.InitBtn()
    local plotShowId = bridgeObj.argTable[1]
    ChangeUIController(uis.Main.root, "review", plotShowId and 1 or 0)
    if plotShowId then
      configData = ActivityDungeonMgr.GetConfigDataByShowId(plotShowId)
      local reviewWord = uis.Main.root:GetChild("ReviewWord")
      if reviewWord then
        reviewWord.onClick:Set(function()
          local id = ActivityDungeonMgr.GetActivityPlotStoryId(plotShowId)
          if id then
            OpenWindow(WinResConfig.Activity17PlotWindow.name, nil, id, configData)
          end
        end)
        UIUtil.SetText(reviewWord, T(1801), "WordTxt")
      end
      Activity17DungeonWindow.LoadBg()
    else
      configData = ActivityDungeonData.GetActivityData()
      activityInfo = ActivityDungeonData.GetActivityInfo()
      if configData and activityInfo then
        Activity17DungeonWindow.InitBtnTxt()
        Activity17DungeonWindow.UpdateInfo()
        Activity17DungeonWindow.InitRedDot()
        Activity17DungeonWindow.LoadBg()
      end
    end
  end)
end

function Activity17DungeonWindow.LoadBg()
  if configData.sound then
    SoundUtil.PlayMusic(configData.sound)
  end
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_MAIN_IN)
end

function Activity17DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity17DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity17DungeonWindow.UpdateInfo()
  activityInfo = ActivityDungeonData.GetActivityInfo()
  if nil == activityInfo then
    return
  end
  if activityInfo.baseInfo.startStamp > 0 and activityInfo.baseInfo.endStamp > 0 then
    local startStamp = TimeUtil.FormatDate("%m/%d", activityInfo.baseInfo.startStamp)
    local endStamp = TimeUtil.FormatDate("%m/%d", activityInfo.baseInfo.endStamp)
    uis.Main.MainTitle.Time1Txt.text = T(1520, startStamp, endStamp)
    uis.Main.MainTitle.Time2Txt.text = T(1521, TimeUtil.FormatEnTime(activityInfo.baseInfo.endStamp - LoginData.GetCurServerTime(), true))
  end
  if configData then
    if configData.shop_id then
      local shopData = TableData.GetConfig(configData.shop_id, "BaseActivityShop")
      if shopData then
        UIUtil.SetIconById(uis.Main.ShopBtn:GetChild("PicLoader"), shopData.token_id)
        UIUtil.SetText(uis.Main.ShopBtn, ActorData.GetItemCount(shopData.token_id), "NumberTxt")
      end
    end
    if configData.cream_chapter_ids then
      local arr = Split(configData.cream_chapter_ids, ":")
      if 3 == #arr then
        local stageId = tonumber(arr[2])
        local lock = table.contain(activityInfo.finishStages, stageId)
        ChangeUIController(uis.Main.MaterialBtn, "lock", lock and 1 or 0)
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        local tips = ""
        if stageData then
          UIUtil.SetText(uis.Main.MaterialBtn, T(1535, stageData.name()), "LockTxt")
          tips = T(1542, stageData.name())
        end
        uis.Main.MaterialBtn.onClick:Set(function()
          if lock then
            OpenWindow(WinResConfig.Activity17MaterialWindow.name)
          else
            FloatTipsUtil.ShowWarnTips(tips)
          end
        end)
      end
    end
    if configData.boss_chapter_ids then
      local arr = Split(configData.boss_chapter_ids, ":")
      if 2 == #arr then
        local stageId = tonumber(arr[2])
        local lock = table.contain(activityInfo.finishStages, stageId)
        ChangeUIController(uis.Main.BossBtn, "lock", lock and 1 or 0)
        local stageData = TableData.GetConfig(stageId, "BaseStage")
        local tips = ""
        if stageData then
          UIUtil.SetText(uis.Main.BossBtn, T(1535, stageData.name()), "LockTxt")
          tips = T(1542, stageData.name())
        end
        uis.Main.BossBtn.onClick:Set(function()
          if lock then
            OpenWindow(WinResConfig.Activity17BossBattleWindow.name)
          else
            FloatTipsUtil.ShowWarnTips(tips)
          end
        end)
      end
    end
  end
  ChangeUIController(uis.Main.NormalBtn, "new", RedDotActivityDungeon.CanDailyNew(ActivityDungeonData.GetShowId()) and 1 or 0)
  ChangeUIController(uis.Main.BossBtn, "new", RedDotActivityDungeon.CanBossNew(ActivityDungeonData.GetShowId()) and 1 or 0)
  if activityInfo and LoginData.GetCurServerTime() < activityInfo.baseInfo.endStamp then
    ActivityDungeonService.GetActivityAllReq()
    InitMiniGameInfo()
  end
  local str = RedDotSign.TurnTableShowFree(configData.turntable_activity_id[1])
  ChangeUIController(uis.Main.Box1Btn, "c1", str and 1 or 0)
  if str then
    UIUtil.SetText(uis.Main.Box1Btn, str, "WordTxt")
  end
  local str2 = RedDotSign.TurnTableShowFree(configData.turntable_activity_id[2])
  ChangeUIController(uis.Main.Box2Btn, "c1", str2 and 1 or 0)
  if str2 then
    UIUtil.SetText(uis.Main.Box2Btn, str2, "WordTxt")
  end
  RefreshEventDisplayInfo()
  PlayDailyEntranceAnimIfNecessary()
end

function Activity17DungeonWindow.InitBtnTxt()
  UIUtil.SetText(uis.Main.BossBtn, T(2082))
  UIUtil.SetText(uis.Main.MaterialBtn, T(2083))
  uis.Main.NormalBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity17ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(2084))
  if configData and configData.pass_port_id then
    local passData = TableData.GetConfig(configData.pass_port_id, "BaseBattlePassport")
    if passData then
      uis.Main.PassBtn.onClick:Set(function()
        if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
          return
        end
        AbyssEventList.SetBusy(true)
        PassportService.GetBattlePassInfoReq(function()
          ActivityDungeonMgr.activityIndex = 0
          OpenWindow(WinResConfig.Activity17PassportWindow.name)
        end)
      end)
      UIUtil.SetText(uis.Main.PassBtn, passData.name())
    end
  end
  local gameBtnTab = {
    uis.Main.MiniGameBtn,
    uis.Main.MiniGame1Btn
  }
  for i = 1, #configData.game_id do
    local conf = TableData.GetConfig(configData.game_id[i], "BaseActivityStageGame")
    if conf then
      UIUtil.SetText(gameBtnTab[i], conf.game_name and conf.game_name() or "", "NameTxt")
    end
  end
  uis.Main.PlotBtn.onClick:Set(function()
    local id = ActivityDungeonMgr.GetUnlockPlotId()
    configData = ActivityDungeonData.GetActivityData()
    if table.getLen(id) > 0 then
      if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
        return
      end
      AbyssEventList.SetBusy(true)
      OpenWindow(WinResConfig.Activity17PlotWindow.name, nil, id, configData)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(2079))
  uis.Main.ShopBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity17ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(2081))
  uis.Main.SignBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity17SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(2085))
  uis.Main.TaskBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity17TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(2080))
  uis.Main.MiniGameBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity17DodgerGameMainWindow.name)
  end)
  uis.Main.MiniGame1Btn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity17MiniGame2MainWindow.name)
  end)
  uis.Main.Box1Btn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ACIVITY_TURNTABLE) and configData.turntable_activity_id and SignData.GetTurnActData(configData.turntable_activity_id[1]) then
      if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
        return
      end
      AbyssEventList.SetBusy(true)
      OpenWindow(WinResConfig.ActivityCasket2Window.name, nil, configData.turntable_activity_id[1])
    end
  end)
  uis.Main.Box2Btn.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.ACIVITY_TURNTABLE) and configData.turntable_activity_id and SignData.GetTurnActData(configData.turntable_activity_id[2]) then
      if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
        return
      end
      AbyssEventList.SetBusy(true)
      OpenWindow(WinResConfig.ActivityCasket3Window.name, nil, configData.turntable_activity_id[2])
    end
  end)
end

function Activity17DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity17DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
  uis.Main.TreasureBtn.onClick:Set(function()
    if closestTreasure then
      AbyssExploreMgr.SearchPathToGrid(closestTreasure.x, closestTreasure.y, AbyssPathfindingType.Positive)
    end
  end)
end

local show

function Activity17DungeonWindow.OnShown()
  if uis then
    Activity17DungeonWindow.UpdateInfo()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
  end
  AbyssExploreMgr.SetActive(true)
  AbyssEventList.SetBusy(false)
  if not show then
    AbyssExploreMgr.EnableGestureOp(true)
  end
  show = true
end

function Activity17DungeonWindow.OnHide()
  if show then
    AbyssExploreMgr.EnableGestureOp(false)
  end
  show = false
end

function Activity17DungeonWindow.OnClose()
  UnregisterListeners()
  if eventTipsRoot then
    eventTipsRoot:Dispose()
  end
  if cursorRoot then
    cursorRoot:Dispose()
  end
  cursorRoot = nil
  eventTipsRoot = nil
  closestTreasure = nil
  AbyssExploreMgr.SetActive(false)
  RedDotMgr.RemoveNode(WinResConfig.Activity17DungeonWindow.name)
  uis = nil
  if effect then
    ResourceManager.DestroyGameObject(effect, false)
    effect = nil
  end
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  configData = nil
  activityInfo = nil
end

function Activity17DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity17DungeonWindow
