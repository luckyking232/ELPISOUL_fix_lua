require("ActivityDungeon1013_ActivityDungeonWindowByName")
local Activity13DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect, eventTipsRoot, cursors, cursorRoot, soundSource, soundEvt3D
local OnPopupEventTips = function(events)
  local parent = uis.Main.root
  if not eventTipsRoot then
    eventTipsRoot = UIMgr:CreateObject("ActivityDungeon1013", "EventTipsList")
    eventTipsRoot.opaque = false
    local childIndex = parent:GetChildIndex(uis.Main.BackGround.root)
    parent:AddChildAt(eventTipsRoot, childIndex + 1)
    AbyssEventList.Reset(eventTipsRoot)
  end
  AbyssEventList.SetBusy(false)
  AbyssEventList.PopupEventList(eventTipsRoot, events, "Assets/Art/Effects/Prefab/UI_prefab/Activities/FX_eventcover_0005_minititle_light.prefab")
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
local OnUpdate = function()
  if AbyssExploreMgr.Exists() and not AbyssExploreCamCtrl.IsSwiping() then
    UpdateEventTipsPosition()
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
  [76201406] = Vector3(1001.5, 997, 0),
  [76201407] = Vector3(1012, 994, 0)
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
    if e_type == AbyssExploreEventID.ACTIVITY_MINIGAME1 or e_type == AbyssExploreEventID.ACTIVITY_MINIGAME2 or e_type == AbyssExploreEventID.ACTIVITY_BOSS or e_type == AbyssExploreEventID.ACTIVITY_RECOVER or e_type == AbyssExploreEventID.ACTIVITY_SIGN then
      local gobj = UIMgr:CreateObject("ActivityDungeon1013", "MainBuildSign")
      gobj:SetPivot(0.5, 0.95, true)
      local location = event.location
      local position = ResidentEventPositionLookup[eventId] or location and AbyssExploreMapCtrl.GridToWorld(location.x, location.y) or AbyssExploreMapCtrl.GridToWorld(event.x, event.y)
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
      elseif e_type == AbyssExploreEventID.ACTIVITY_BOSS then
        ctrl_index = 1
      elseif e_type == AbyssExploreEventID.ACTIVITY_SIGN then
        ctrl_index = 2
      elseif e_type == AbyssExploreEventID.ACTIVITY_MINIGAME1 then
        ctrl_index = 4
      elseif e_type == AbyssExploreEventID.ACTIVITY_MINIGAME2 then
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
  if data.id == 70440013 then
    ld("Activity13_MiniGame")
    Activity13_MiniGameService.MiniGameInfoReq(70441016, function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity13DungeonWindow.name,
        com = uis.Main.MiniGame1Btn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame13_TaskRewardable(70441016) or RedDotActivityDungeon.MiniGame13_DailyTaskRewardable(70441016)
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity13DungeonWindow.name)
    end)
    Activity13_MiniGameService.MiniGameInfoReq(70441017, function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity13DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame13_TaskRewardable(70441017) or RedDotActivityDungeon.MiniGame13_DailyTaskRewardable(70441017)
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity13DungeonWindow.name)
    end)
  end
end
local PlaySound3D = function()
  soundSource = GameObject("SOUND_SOURCE")
  soundSource.transform.position = Vector3(999.840027, 1007.32001, 0)
  SoundManager:LoadBank("bank:/sfx/sfx_ui/ui_sys/ui_sys", true)
  local sndEvent = RuntimeManager.CreateInstance("event:/sfx/sfx_ui/ui_sys/sfx_jingmi_piano")
  local attributes = CS.FMODUnity.RuntimeUtils.To3DAttributes(soundSource.transform)
  sndEvent:set3DAttributes(attributes)
  sndEvent:start()
  sndEvent:release()
  soundEvt3D = sndEvent
  local listenerGo = AbyssExploreChrCtrl.GetRoot().gameObject
  local listener = listenerGo:GetOrAddComponent(typeof(CS.FMODUnity.StudioListener))
  listener.attenuationObject = listenerGo
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
  local lastTimestamp = PlayerPrefsUtil.GetFloat(PLAYER_PREF_ENUM.ACTIVITY13_LOGIN_TIMESTAMP, 0, startStamp)
  local last_d, last_h = getD_H(lastTimestamp)
  local outOfDate = d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5
  if outOfDate then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_show")
    OpenWindow(WinResConfig.Activity13EntranceAnimWindow.name)
  else
    uis.Main.root.touchable = false
    PlayUITrans(uis.Main.root, "in1", function()
      uis.Main.root.touchable = true
      AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
    end)
  end
  PlayerPrefsUtil.SetFloat(PLAYER_PREF_ENUM.ACTIVITY13_LOGIN_TIMESTAMP, timestamp, startStamp)
end

function Activity13DungeonWindow.ReInitData()
end

function Activity13DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.Activity13DungeonWindow.package, WinResConfig.Activity13DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_ActivityDungeonWindowUis(contentPane)
    RegisterListeners()
    Activity13DungeonWindow.InitBtn()
    local plotShowId = bridgeObj.argTable[1]
    ChangeUIController(uis.Main.root, "review", plotShowId and 1 or 0)
    if plotShowId then
      configData = ActivityDungeonMgr.GetConfigDataByShowId(plotShowId)
      local reviewWord = uis.Main.root:GetChild("ReviewWord")
      if reviewWord then
        reviewWord.onClick:Set(function()
          local id = ActivityDungeonMgr.GetActivityPlotStoryId(plotShowId)
          if id then
            OpenWindow(WinResConfig.Activity13PlotWindow.name, nil, id, configData)
          end
        end)
        UIUtil.SetText(reviewWord, T(1801), "WordTxt")
      end
      Activity13DungeonWindow.LoadBg()
    else
      configData = ActivityDungeonData.GetActivityData()
      activityInfo = ActivityDungeonData.GetActivityInfo()
      if configData and activityInfo then
        Activity13DungeonWindow.InitBtnText()
        Activity13DungeonWindow.UpdateInfo()
        Activity13DungeonWindow.InitRedDot()
        Activity13DungeonWindow.LoadBg()
      end
    end
  end)
end

function Activity13DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity13DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity13DungeonWindow.LoadBg()
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  if configData and configData.sound then
    SoundUtil.PlayMusic(configData.sound)
  end
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_MAIN_IN)
end

function Activity13DungeonWindow.UpdateInfo()
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
          if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
            return
          end
          if lock then
            AbyssEventList.SetBusy(true)
            OpenWindow(WinResConfig.Activity13MaterialWindow.name)
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
          if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
            return
          end
          if lock then
            AbyssEventList.SetBusy(true)
            OpenWindow(WinResConfig.Activity13BossBattleWindow.name)
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
  RefreshEventDisplayInfo()
  PlayDailyEntranceAnimIfNecessary()
end

function Activity13DungeonWindow.InitBtnText()
  UIUtil.SetText(uis.Main.BossBtn, T(1975))
  UIUtil.SetText(uis.Main.MaterialBtn, T(1976))
  uis.Main.NormalBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity13ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(1977))
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
          OpenWindow(WinResConfig.Activity13PassportWindow.name)
        end)
      end)
      UIUtil.SetText(uis.Main.PassBtn, passData.name())
    end
  end
  if configData and configData.game_id then
    local btn = {
      uis.Main.MiniGame1Btn,
      uis.Main.MiniGameBtn
    }
    for i = 1, #btn do
      if configData.game_id[i] then
        local conf = TableData.GetConfig(configData.game_id[i], "BaseActivityStageGame")
        if conf then
          UIUtil.SetText(btn[i], conf.game_name and conf.game_name() or "", "NameTxt")
        end
      end
    end
  end
  uis.Main.PlotBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    local id = ActivityDungeonMgr.GetUnlockPlotId()
    configData = ActivityDungeonData.GetActivityData()
    if table.getLen(id) > 0 then
      AbyssEventList.SetBusy(true)
      OpenWindow(WinResConfig.Activity13PlotWindow.name, nil, id, configData)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(1972))
  uis.Main.ShopBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity13ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(1974))
  uis.Main.SignBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity13SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(1978))
  uis.Main.TaskBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity13TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(1973))
  uis.Main.MiniGameBtn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity13CarGameMainWindow.name)
  end)
  uis.Main.MiniGame1Btn.onClick:Set(function()
    if AbyssEventList.IsBusy() or not AbyssExploreMgr.IsGesturable() then
      return
    end
    AbyssEventList.SetBusy(true)
    OpenWindow(WinResConfig.Activity13BounceMiniGameMainWindow.name)
  end)
end

function Activity13DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity13DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
end

local show

function Activity13DungeonWindow.OnShown()
  if uis then
    Activity13DungeonWindow.UpdateInfo()
    AbyssExploreMgr.Dispatch(AbyssExploreMsgEnum.COLLECT_EVENTS)
  end
  AbyssExploreMgr.SetActive(true)
  AbyssEventList.SetBusy(false)
  if not show then
    AbyssExploreMgr.EnableGestureOp(true)
  end
  show = true
end

function Activity13DungeonWindow.OnHide()
  if show then
    AbyssExploreMgr.EnableGestureOp(false)
  end
  show = false
end

function Activity13DungeonWindow.OnClose()
  UnregisterListeners()
  uis = nil
  contentPane = nil
  if eventTipsRoot then
    eventTipsRoot:Dispose()
  end
  if cursorRoot then
    cursorRoot:Dispose()
  end
  cursorRoot = nil
  eventTipsRoot = nil
  AbyssExploreMgr.SetActive(false)
  RedDotMgr.RemoveNode(WinResConfig.Activity13DungeonWindow.name)
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  configData = nil
  activityInfo = nil
  if soundEvt3D then
    SoundUtil.StopSoundEvent(soundEvt3D, true)
    soundEvt3D = nil
  end
  if soundSource then
    CS.UnityEngine.Object.DestroyImmediate(soundSource)
    soundSource = nil
  end
end

function Activity13DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity13DungeonWindow
