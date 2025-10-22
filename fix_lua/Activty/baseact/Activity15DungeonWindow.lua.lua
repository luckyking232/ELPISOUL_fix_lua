require("ActivityDungeon1015_ActivityDungeonWindowByName")
local Activity15DungeonWindow = {}
local uis, contentPane, jumpTb, configData, activityInfo, effect
local InitMiniGameInfo = function()
  local data = ActivityDungeonData.GetActivityData()
  if data.id == 70440015 then
    ld("Activity15_MiniGame")
    Activity15_MiniGameService.MiniGameInfoReq(function()
      RedDotMgr.AddNode({
        windowName = WinResConfig.Activity15DungeonWindow.name,
        com = uis.Main.MiniGameBtn,
        visibleFunc = function()
          return RedDotActivityDungeon.MiniGame15_TaskRewardable() or RedDotActivityDungeon.MiniGame15_DailyTaskRewardable()
        end,
        dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
      })
      RedDotMgr.UpdateNodeByWindowName(WinResConfig.Activity15DungeonWindow.name)
    end)
  end
end

function Activity15DungeonWindow.ReInitData()
end

function Activity15DungeonWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15DungeonWindow.package, WinResConfig.Activity15DungeonWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_ActivityDungeonWindowUis(contentPane)
    local trans = uis.Main.root:GetTransition("in")
    if trans then
      uis.Main.root.touchable = false
      trans:SetHook("sign", function()
        uis.Main.root.touchable = true
      end)
    end
    Activity15DungeonWindow.InitBtn()
    local plotShowId = bridgeObj.argTable[1]
    ChangeUIController(uis.Main.root, "review", plotShowId and 1 or 0)
    if plotShowId then
      configData = ActivityDungeonMgr.GetConfigDataByShowId(plotShowId)
      local reviewWord = uis.Main.root:GetChild("ReviewWord")
      if reviewWord then
        reviewWord.onClick:Set(function()
          local id = ActivityDungeonMgr.GetActivityPlotStoryId(plotShowId)
          if id then
            OpenWindow(WinResConfig.Activity15PlotWindow.name, nil, id, configData)
          end
        end)
        UIUtil.SetText(reviewWord, T(1801), "WordTxt")
      end
      Activity15DungeonWindow.LoadBg()
    else
      configData = ActivityDungeonData.GetActivityData()
      activityInfo = ActivityDungeonData.GetActivityInfo()
      if configData and activityInfo then
        Activity15DungeonWindow.InitBtnTxt()
        Activity15DungeonWindow.UpdateInfo()
        Activity15DungeonWindow.InitRedDot()
        Activity15DungeonWindow.LoadBg()
      end
    end
  end)
end

function Activity15DungeonWindow.LoadBg()
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

function Activity15DungeonWindow.InitRedDot()
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15DungeonWindow.name,
    com = uis.Main.SignBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanSgin(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15DungeonWindow.name,
    com = uis.Main.PassBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanHomePass(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15DungeonWindow.name,
    com = uis.Main.TaskBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanTask(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
  RedDotMgr.AddNode({
    windowName = WinResConfig.Activity15DungeonWindow.name,
    com = uis.Main.MaterialBtn,
    visibleFunc = function()
      return RedDotActivityDungeon.CanMaterialRed(ActivityDungeonData.GetShowId())
    end,
    dataType = RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON
  })
end

function Activity15DungeonWindow.UpdateInfo()
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
            OpenWindow(WinResConfig.Activity15MaterialWindow.name)
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
            OpenWindow(WinResConfig.Activity15BossBattleWindow.name)
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

function Activity15DungeonWindow.InitBtnTxt()
  UIUtil.SetText(uis.Main.BossBtn, T(2010))
  UIUtil.SetText(uis.Main.MaterialBtn, T(2011))
  uis.Main.NormalBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15ChallengeWindow.name)
  end)
  UIUtil.SetText(uis.Main.NormalBtn, T(2012))
  if configData and configData.pass_port_id then
    local passData = TableData.GetConfig(configData.pass_port_id, "BaseBattlePassport")
    if passData then
      uis.Main.PassBtn.onClick:Set(function()
        PassportService.GetBattlePassInfoReq(function()
          ActivityDungeonMgr.activityIndex = 0
          OpenWindow(WinResConfig.Activity15PassportWindow.name)
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
      OpenWindow(WinResConfig.Activity15PlotWindow.name, nil, id, configData)
    else
      FloatTipsUtil.ShowWarnTips(T(1607))
    end
  end)
  UIUtil.SetText(uis.Main.PlotBtn, T(2007))
  uis.Main.ShopBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15ShopWindow.name)
  end)
  UIUtil.SetText(uis.Main.ShopBtn, T(2009))
  uis.Main.SignBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15SignWindow.name)
  end)
  UIUtil.SetText(uis.Main.SignBtn, T(2013))
  uis.Main.TaskBtn.onClick:Set(function()
    ActivityDungeonService.GetActivityAllReq(function()
      OpenWindow(WinResConfig.Activity15TaskWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.TaskBtn, T(2008))
  uis.Main.MiniGameBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity15MiniGameMainWindow.name)
  end)
end

function Activity15DungeonWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.Activity15DungeonWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_ADVENTURE)
end

function Activity15DungeonWindow.OnShown()
  if uis then
    Activity15DungeonWindow.UpdateInfo()
  end
end

function Activity15DungeonWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.Activity15DungeonWindow.name)
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

function Activity15DungeonWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityDungeonMgr.CheckActivityEnd()
  end
end

return Activity15DungeonWindow
