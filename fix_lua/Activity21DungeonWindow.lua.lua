require("ActivityDungeon1021_ActivityDungeonWindowByName")
local Activity21DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect
local InitMiniGameInfo = function()
  local data = ActivityDungeonData.GetActivityData()
  if data.id == 70440021 then
    ld("Activity21_MiniGame", function()
      Activity21_MiniGameService.MiniGameInfoReq(function()
        RedDotMgr.AddNode({
          windowName = WinResConfig.Activity21DungeonWindow.name,
          com = uis.Main.MiniGameBtn,
          visibleFunc = function()
            return RedDotActivityDungeon.MiniGame21_TaskRewardable() or RedDotActivityDungeon.MiniGame21_DailyTaskRewardable()
          end,
          dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
        })
        RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity21DungeonWindow.name)
      end)
    end)
  end
end

function Activity21DungeonWindow.ReInitData()
end

function Activity21DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21DungeonWindow.package, WinResConfig.Activity21DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1021_ActivityDungeonWindowUis(contentPane)
    local trans = uis.Main.root:GetTransition("in")
    if trans then
      uis.Main.root.touchable = false
      trans:SetHook("sign", function()
        uis.Main.root.touchable = true
      end)
    end
    Activity21DungeonWindow.InitBtn()
    local plotShowId = bridgeObj.argTable[1]
    ChangeUIController(uis.Main.root, "review", plotShowId and 1 or 0)
    if plotShowId then
      configData = ActivityDungeonMgr.GetConfigDataByShowId(plotShowId)
      local reviewWord = uis.Main.root:GetChild("ReviewWord")
      if reviewWord then
        reviewWord.onClick:Set(function()
          local id = ActivityDungeonMgr.GetActivityPlotStoryId(plotShowId)
          if id then
            OpenWindow(WinResConfig.Activity21PlotWindow.name, nil, id, configData)
          end
        end)
        UIUtil.SetText(reviewWord, T(1801), "WordTxt")
      end
      Activity21DungeonWindow.LoadBg()
    else
      configData = ActivityDungeonData.GetActivityData()
      activityInfo = ActivityDungeonData.GetActivityInfo()
      if configData and activityInfo then
        Activity21DungeonWindow.InitBtnTxt()
        Activity21DungeonWindow.UpdateInfo()
        Activity21DungeonWindow.InitRedDot()
        Activity21DungeonWindow.LoadBg()
      end
    end
  end)
end

function Activity21DungeonWindow.LoadBg()
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  effect = UIUtil.SetEffectToUI(configData.bg_main, uis.Main.BackGround.BackGroundHolder)
  if effect then
    LuaUtil.PlayEffect(effect)
    SkeletonAnimationUtil.SetAnimation(effect, 0, "in", false, 0, function()
      if effect then
        SkeletonAnimationUtil.SetAnimation(effect, 0, "idle", true)
      end
    end)
  end
  if configData.sound then
    SoundUtil.PlayMusic(configData.sound)
  end
  SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_THREE_MAIN_IN)
end

function Activity21DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity21DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity21DungeonWindow.UpdateInfo()
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
            OpenWindow(WinResConfig.Activity21MaterialWindow.name)
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
            OpenWindow(WinResConfig.Activity21BossBattleWindow.name)
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
end

function Activity21DungeonWindow.InitBtnTxt()
  UIUtil.SetText(uis.Main.BossBtn, T(2169))
  UIUtil.SetText(uis.Main.MaterialBtn, T(2170))
  uis.Main.NormalBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(2171))
  if configData and configData.pass_port_id then
    local passData = TableData.GetConfig(configData.pass_port_id, "BaseBattlePassport")
    if passData then
      uis.Main.PassBtn.onClick:Set(function()
        PassportService.GetBattlePassInfoReq(function()
          ActivityDungeonMgr.activityIndex = 0
          OpenWindow(WinResConfig.Activity21PassportWindow.name)
        end)
      end)
      UIUtil.SetText(uis.Main.PassBtn, passData.name())
    end
  end
  local conf = TableData.GetConfig(configData.game_id[1], "BaseActivityStageGame")
  if conf then
    UIUtil.SetText(uis.Main.MiniGameBtn, conf.game_name and conf.game_name() or "", "NameTxt")
  end
  uis.Main.PlotBtn.onClick:Set(function()
    local id = ActivityDungeonMgr.GetUnlockPlotId()
    configData = ActivityDungeonData.GetActivityData()
    if table.getLen(id) > 0 then
      OpenWindow(WinResConfig.Activity21PlotWindow.name, nil, id, configData)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(2166))
  uis.Main.ShopBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(2168))
  uis.Main.SignBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(2172))
  uis.Main.TaskBtn.onClick:Set(function()
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity21TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(2167))
  uis.Main.MiniGameBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity21MiniGameMainWindow.name)
  end)
end

function Activity21DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity21DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
end

function Activity21DungeonWindow.OnShown()
  if uis then
    Activity21DungeonWindow.UpdateInfo()
  end
end

function Activity21DungeonWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity21DungeonWindow.name)
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

function Activity21DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity21DungeonWindow
