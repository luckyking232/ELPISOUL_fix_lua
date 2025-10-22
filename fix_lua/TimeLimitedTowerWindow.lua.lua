require("TowerSpecial_TowerSpecialWindowByName")
local TimeLimitedTowerWindow = {}
local uis, contentPane
local SPECIAL_LEVEL_INDEX_TO_LAST = 2
local EventItemRenderer = function(i, gcmp)
  local stages = TimeLimitedTowerMgr.GetStages()
  local index = i + 1
  local len = #stages
  local stageId = stages[index]
  local subgcmp = gcmp:GetChild("BattleEventBtn")
  local passed = TimeLimitedTowerMgr.IsStagePassed(stageId)
  local latestStageIndex = TimeLimitedTowerMgr.GetLatestStageIndex()
  local current = latestStageIndex == index
  local unlockTxt = T(20364)
  local signTxt = T(1302)
  local conf = TableData.GetConfig(stageId, "BaseStage")
  UIUtil.SetText(subgcmp:GetChild("Sign"), signTxt, "WordTxt")
  UIUtil.SetText(subgcmp, conf.name and conf.name() or "未配置" .. tostring(stageId), "NumberTxt")
  UIUtil.SetText(subgcmp, conf.name_detail and conf.name_detail() or "未配置" .. tostring(stageId), "NameTxt")
  local special = len - index < SPECIAL_LEVEL_INDEX_TO_LAST
  ChangeUIController(subgcmp, "c2", special and 1 or 0)
  local loader = subgcmp:GetChild("PicLoader")
  local holder = subgcmp:GetChild("EffectHolder")
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    subgcmp:AddChildAt(holder, 0)
    holder.name = "EffectHolder"
    UIUtil.SetHolderCenter(holder)
  end
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/HardPata/FX_hardpata_under.prefab")
  UIUtil.SetObjectToUI(effect, holder)
  loader.url = UIUtil.GetResUrl(conf.icon)
  local unlockedTimestamp = TimeLimitedTowerData.GetStartTimestamp()
  if type(conf.unlock_time) == "number" then
    unlockedTimestamp = unlockedTimestamp + conf.unlock_time
  end
  if passed then
    ChangeUIController(subgcmp, "c1", 2)
  else
    local unlocked = unlockedTimestamp <= LoginData.GetCurServerTime()
    if not unlocked then
      ChangeUIController(subgcmp, "c1", 0)
      local diff = unlockedTimestamp - LoginData.GetCurServerTime()
      local content = T(20600, TimeUtil.FormatEnTime(diff))
      UIUtil.SetText(subgcmp:GetChild("Lock"), content, "WordTxt")
    else
      ChangeUIController(subgcmp, "c1", current and 1 or 0)
      UIUtil.SetText(subgcmp:GetChild("Lock"), unlockTxt, "WordTxt")
    end
  end
  subgcmp.onClick:Set(function()
    local unlocked = LoginData.GetCurServerTime() >= unlockedTimestamp
    if current and not passed then
      if unlocked then
        OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {stageId = stageId})
      else
        local diff = unlockedTimestamp - LoginData.GetCurServerTime()
        local content = T(20600, TimeUtil.FormatEnTime(diff))
        FloatTipsUtil.ShowWarnTips(content)
      end
    end
  end)
end
local DotItemRenderer = function(i, gcmp)
  local stages = TimeLimitedTowerMgr.GetStages()
  local index = i + 1
  local stageId = stages[index]
  local latestStageIndex = TimeLimitedTowerMgr.GetLatestStageIndex()
  local conf = TableData.GetConfig(stageId, "BaseStage")
  UIUtil.SetText(gcmp, conf.name and conf.name() or string.format("%02d", index), "NumberTxt")
  ChangeUIController(gcmp, "c1", i + 1 == latestStageIndex and 1 or 0)
end
local CardItemRenderer = function(i, gcmp)
  local subgcmp = gcmp:GetChild("CardHeadBtn")
  local chapterConf = TimeLimitedTowerMgr.GetChapterConfig()
  local recommend_card = chapterConf.recommend_card
  local index = i + 1
  local cardId = recommend_card[index]
  local conf = TableData.GetConfig(cardId, "BaseCard")
  UIUtil.SetHeadByFaceId(conf.fashion_id, subgcmp:GetChild("CardPic"):GetChild("CardPicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
  UIUtil.SetText(subgcmp, conf.name(), "NameTxt")
  local occupation = subgcmp:GetChild("Occupation")
  ChangeUIController(occupation, "C1", conf.type - 1)
  UIUtil.ShowElementList(subgcmp:GetChild("ElementList"), conf)
end
local RefreshPanelInfo = function(playanim)
  if TimeLimitedTowerMgr.IsOutOfDate(true) then
    return
  end
  local chapterConf = TimeLimitedTowerMgr.GetChapterConfig()
  local stages = TimeLimitedTowerMgr.GetStages()
  local panel = uis.Main.BattleEventRegion
  local eventlist = panel.EventList
  local dotlist = uis.Main.Progress.DotList
  local cardlist = uis.Main.RecommendCard.CardList
  local numStages = #stages
  eventlist.numItems = numStages
  dotlist.numItems = numStages
  local numCards = chapterConf and chapterConf.recommend_card and #chapterConf.recommend_card or 0
  cardlist.numItems = numCards
  uis.Main.RecommendCard.root.visible = numCards > 0
  if playanim then
    for i = 0, eventlist.numChildren - 1 do
      local child = eventlist:GetChildAt(i)
      child:GetChildAt(0).alpha = 0
      PlayUITrans(child, "up", nil, i * 0.03)
    end
  end
  eventlist:ScrollToView(TimeLimitedTowerMgr.GetLatestStageIndex() - 1, playanim)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.TimeLimitedTowerWindow.name)
end

function TimeLimitedTowerWindow.ReInitData()
end

function TimeLimitedTowerWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TimeLimitedTowerWindow.package, WinResConfig.TimeLimitedTowerWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTowerSpecial_TowerSpecialWindowUis(contentPane)
    TimeLimitedTowerWindow.UpdateInfo()
    TimeLimitedTowerWindow.InitBtn()
  end)
end

function TimeLimitedTowerWindow.UpdateInfo()
  PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.TIME_LIMITED_SEASON_RECORD, TimeLimitedTowerData.GetStartTimestamp())
  if RedDotTimeLimitedTower.IsNearlyDeadline() then
    local deadline = TimeLimitedTowerData.GetEndTimestamp()
    local content = TimeUtil.FormatDate("%Y_%m_%d", LoginData.serverTime)
    local concat = string.format("%s_%s", deadline, content)
    PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.TIME_LIMITED_TOWER_DEADLINE, concat)
  end
  uis.Main.BackGround.BackGroundLoader.url = "ui://UIBackGround/TowerSpecial_1000"
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/HardPata/FX_hardpataback.prefab")
  local panel = uis.Main.BattleEventRegion
  local holder = panel.Effect1Holder
  holder:SetPivot(0.5, 0.5)
  holder:Center()
  UIUtil.SetObjectToUI(effect, holder)
  effect.transform.localPosition = Vector3.zero
  local eventlist = panel.EventList
  local dotlist = uis.Main.Progress.DotList
  local cardlist = uis.Main.RecommendCard.CardList
  eventlist.itemRenderer = EventItemRenderer
  dotlist.itemRenderer = DotItemRenderer
  cardlist.itemRenderer = CardItemRenderer
  uis.Main.RecommendCard.WordTxt.text = T(20591)
  RedDotMgr.AddNode({
    windowName = WinResConfig.TimeLimitedTowerWindow.name,
    com = uis.Main.RewardBtn,
    visibleFunc = function()
      return RedDotTimeLimitedTower.HasAnyFinishedTask()
    end,
    dataType = RED_DOT_DATA_TYPE.ADVENTURE
  })
  TimeLimitedTowerService.GetTimeLimitedTowerInfoReq(function()
    RefreshPanelInfo(true)
  end)
end

function TimeLimitedTowerWindow.InitBtn()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TimeLimitedTowerWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.TIME_LIMITED_TOWER)
  uis.Main.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.TimeLimitedTowerRewardWindow.name)
  end)
  uis.Main.Progress.ProgressBtn.onClick:Set(function()
    if not TimeLimitedTowerMgr.IsOutOfDate(true) then
      MessageBox.Show(T(20592), {
        touchCallback = function()
          TimeLimitedTowerService.ResetTimeLimitedTowerReq(function()
            RefreshPanelInfo(true)
          end)
        end
      }, {})
    end
  end)
  uis.Main.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.TimeLimitedTowerRewardWindow.name)
  end)
end

function TimeLimitedTowerWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.TimeLimitedTowerWindow.name) then
    RefreshPanelInfo(false)
  end
end

function TimeLimitedTowerWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.TimeLimitedTowerWindow.name)
  uis = nil
  contentPane = nil
end

return TimeLimitedTowerWindow
