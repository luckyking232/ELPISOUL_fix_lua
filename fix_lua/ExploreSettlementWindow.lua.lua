require("Explore_SettlementWindowByName")
local ExploreSettlementWindow = {}
local uis, contentPane, prevExp, prevLevel, cards, rewardId, rewards, soundEvent
local PlayLevelupExpIncrease = function(gcmp, prevLevel, prevExp, curLevel, curExp, onComplete)
  local progressBar = gcmp:GetChild("ExpProgressBar")
  local maxLevel = ExploreAFKData.GetMaxLevel()
  local levelup = prevLevel < curLevel
  local alreadyMaxLevel = prevLevel >= maxLevel
  local currentMaxLevel = curLevel >= maxLevel
  local threshold = ExploreAFKData.GetLevelExpThreshold(prevLevel)
  local curExpThreshold = ExploreAFKData.GetLevelExpThreshold(curLevel)
  local curLevelExpPercent = curExp / curExpThreshold * 100
  local expText = string.format("%s/%s", prevExp, threshold)
  UIUtil.SetText(gcmp, expText, "ExpTxt")
  UIUtil.SetText(gcmp, T(1592, prevLevel), "LevelTxt")
  UIUtil.SetIconById(gcmp:GetChild("PicLoader"), 21000022)
  progressBar.value = prevExp / threshold * 100
  if levelup then
    local tweener
    soundEvent = SoundManager:PlaySfxSound("event:/sfx/sfx_ui/ui_sys/ui_xianqiandui_cnt", "bank:/sfx/sfx_ui/ui_sys/ui_sys")
    tweener = progressBar:TweenValue(100, 0.8):OnUpdate(function()
      local gtweenVal = tweener.value
      local val = gtweenVal.d
      UIUtil.SetText(gcmp, string.format("%s/%s", math.floor(threshold * val / 100), threshold), "ExpTxt")
    end):OnComplete(function()
      UIUtil.SetText(gcmp, T(1592, curLevel), "LevelTxt")
      progressBar.value = 0
      if not currentMaxLevel then
        tweener = progressBar:TweenValue(curLevelExpPercent, 0.8):OnUpdate(function()
          local gtweenVal = tweener.value
          local val = gtweenVal.d
          UIUtil.SetText(gcmp, string.format("%s/%s", math.floor(curExpThreshold * val / 100), curExpThreshold), "ExpTxt")
        end):OnComplete(function()
          tweener = nil
          UIUtil.SetText(gcmp, string.format("%s/%s", curExp, curExpThreshold), "ExpTxt")
          soundEvent = nil
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_xianqiandui_cnt_stp")
          if onComplete then
            onComplete()
          end
        end)
      else
        tweener = nil
        if onComplete then
          onComplete()
        end
      end
    end)
  elseif not alreadyMaxLevel and curExp ~= prevExp then
    soundEvent = SoundManager:PlaySfxSound("event:/sfx/sfx_ui/ui_sys/ui_xianqiandui_cnt", "bank:/sfx/sfx_ui/ui_sys/ui_sys")
    local tweener
    tweener = progressBar:TweenValue(curLevelExpPercent, 0.8):OnUpdate(function()
      local gtweenVal = tweener.value
      local val = gtweenVal.d
      UIUtil.SetText(gcmp, string.format("%s/%s", math.floor(threshold * val / 100), threshold), "ExpTxt")
    end):OnComplete(function()
      tweener = nil
      UIUtil.SetText(gcmp, T(1592, curLevel), "LevelTxt")
      UIUtil.SetText(gcmp, string.format("%s/%s", curExp, curExpThreshold), "ExpTxt")
      soundEvent = nil
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_xianqiandui_cnt_stp")
      if onComplete then
        onComplete()
      end
    end)
  elseif onComplete then
    onComplete()
  end
end

function ExploreSettlementWindow.ReInitData()
end

function ExploreSettlementWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreSettlementWindow.package, WinResConfig.ExploreSettlementWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExplore_SettlementWindowUis(contentPane)
    prevExp = bridgeObj.argTable[1]
    prevLevel = bridgeObj.argTable[2]
    rewardId = bridgeObj.argTable[3]
    cards = bridgeObj.argTable[4]
    rewards = bridgeObj.argTable[5]
    ExploreSettlementWindow.UpdateInfo()
    ExploreSettlementWindow.InitBtn()
  end)
end

function ExploreSettlementWindow.UpdateInfo()
  uis.Main.TitleTxt.text = T(20558)
  local endlist = uis.Main.EndList
  local expDisplay = UIMgr:CreateObject("Explore", "SettlementExp")
  local timeDisplay = UIMgr:CreateObject("Explore", "SettlementTime")
  local cardsDisplay = UIMgr:CreateObject("Explore", "SettlementCard")
  local rewardsDisplay = UIMgr:CreateObject("Explore", "SettlementReward")
  local maxLevel = ExploreAFKData.GetMaxLevel()
  local level = ExploreAFKData.GetLevel()
  local exp = ExploreAFKData.GetExp()
  local levelup = level > prevLevel
  ChangeUIController(expDisplay, "c2", levelup and 1 or 0)
  PlayLevelupExpIncrease(expDisplay, prevLevel, prevExp, level, exp, function()
    UIUtil.SetText(expDisplay, T(20556), "ExpMaxTxt")
    local max = level >= maxLevel
    ChangeUIController(expDisplay, "c1", max and 1 or 0)
    if max then
      local progressBar = expDisplay:GetChild("ExpProgressBar")
      progressBar.value = 0
    end
  end)
  UIUtil.SetText(expDisplay, T(20559), "WordTxt")
  local config = TableData.GetConfig(rewardId, "BaseDispatchReward")
  local seconds = config.time * 60
  UIUtil.SetText(timeDisplay, T(20560), "WordTxt")
  UIUtil.SetText(timeDisplay, TimeUtil.FormatEnTime(seconds), "TimeTxt")
  local cardlist = cardsDisplay:GetChild("CardList")
  
  function cardlist.itemRenderer(i, gcmp)
    local cardId = cards[i + 1]
    local card = CardData.GetCardDataById(cardId)
    UIUtil.SetHeadByFaceId(card.fashionId, gcmp:GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
  end
  
  cardlist.numItems = cards and #cards or 0
  UIUtil.SetText(cardsDisplay, T(20561), "WordTxt")
  local rewardlist = rewardsDisplay:GetChild("ItemList")
  for i, v in pairs(rewards) do
    if v.item.itemId == 21000022 then
      table.remove(rewards, i)
    end
  end
  
  function rewardlist.itemRenderer(i, gcmp)
    local dropTuple = rewards[i + 1]
    local item = dropTuple.item
    local itemId = item.itemId
    local count = item.count
    UIUtil.ShowItemFrame(itemId, gcmp, count)
  end
  
  rewardlist.numItems = rewards and #rewards or 0
  UIUtil.SetText(rewardsDisplay, T(20562), "WordTxt")
  endlist:AddChild(expDisplay)
  endlist:AddChild(timeDisplay)
  endlist:AddChild(cardsDisplay)
  endlist:AddChild(rewardsDisplay)
end

function ExploreSettlementWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreSettlementWindow.name)
  end)
end

function ExploreSettlementWindow.OnClose()
  uis = nil
  contentPane = nil
  if soundEvent then
    SoundUtil.StopSoundEvent(soundEvent)
  end
  soundEvent = nil
end

return ExploreSettlementWindow
