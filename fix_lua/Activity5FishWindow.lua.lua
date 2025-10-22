require("ActivityDungeon1004_MiniGameStart2WindowByName")
local Activity5FishWindow = {}
local uis, contentPane, fishingRod, waitTimeTween, getFishTween, tweenScale, scaleRoot
local max = 4
local now = 0
local integral
local gameId = 70441006
local allFishCofn, barTweener, harvestTweener, holderShadow, objShadow, nowId, new
local nameShadow = {
  "big",
  "huge",
  "mid",
  "small"
}
local itemDataTemp

function Activity5FishWindow.ReInitData()
end

function Activity5FishWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishWindow.package, WinResConfig.Activity5FishWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniGameStart2WindowUis(contentPane)
    allFishCofn = Activity5FishWindow.GetAllFish()
    Activity5_MiniGameData.newNum = Activity5_MiniGameData.newNum or 1
    holderShadow = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    uis.Main.root:AddChild(holderShadow)
    holderShadow:SetPivot(0.5, 0.5, true)
    holderShadow:Center()
    holderShadow:SetXY(uis.Main.Effect3Holder.x, uis.Main.Effect3Holder.y)
    Activity5FishWindow.UpdateInfo()
    Activity5FishWindow.InitBtn()
  end)
end

function Activity5FishWindow.UpdateInfo()
  scaleRoot = uis.Main.StageRegion.Stage3Btn:GetChild("Effect")
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_water.prefab", uis.Main.BackGround.BackGroundHolder)
  UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame006/MiniGame006_yuying.prefab", uis.Main.Effect1Holder)
  fishingRod = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame006/MiniGame006_yugan.prefab", uis.Main.Effect3Holder)
  SkeletonAnimationUtil.AddEvent(fishingRod, Activity5FishWindow.PlayFlowerAnim)
  Activity5FishWindow.InitGame()
end

function Activity5FishWindow.PlayFlowerAnim(track, event)
  if track.Animation.Name == "action" and event.Data.Name == "event" then
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_water_shuihua.prefab", uis.Main.Effect2Holder)
  end
end

function Activity5FishWindow.InitBtn()
  UIUtil.SetText(uis.Main.StageRegion.Stage1Btn, T(1713))
  uis.Main.StageRegion.Stage1Btn.onClick:Set(function()
    now = 0
    integral = 0
    uis.Main.StageRegion.root.alpha = 0
    uis.Main.StageRegion.root.touchable = false
    uis.Main.c1Ctr.selectedIndex = 1
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_rod_wh")
    SkeletonAnimationUtil.SetAnimation(fishingRod, 0, "action", false, 0, function()
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_water_shuibo.prefab", uis.Main.EffectHolder)
      SkeletonAnimationUtil.SetAnimation(fishingRod, 0, "idle", true, 0, function()
      end)
      if waitTimeTween then
        LeanTween.cancel(waitTimeTween.uniqueId)
        waitTimeTween = nil
      end
      if getFishTween then
        LeanTween.cancel(getFishTween.uniqueId)
        getFishTween = nil
      end
      local time = math.random(20, 50)
      waitTimeTween = LeanTween.delayedCall(time / 10, function()
        uis.Main.StageRegion.root.alpha = 1
        uis.Main.StageRegion.root.touchable = true
        Activity5FishWindow.GetRandomFish()
        itemDataTemp = TableData.GetConfig(nowId, "BaseActivityGameItem")
        if itemDataTemp and itemDataTemp.size then
          objShadow = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame006/MiniGame006_yuying_get.prefab", holderShadow)
          SkeletonAnimationUtil.SetAnimation(objShadow, 0, nameShadow[itemDataTemp.size], false, 0, function()
          end)
        end
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_button_get.prefab", uis.Main.StageRegion.Stage2Btn:GetChild("Effect1Holder"))
        getFishTween = LeanTween.delayedCall(5, function()
          SkeletonAnimationUtil.SetAnimation(objShadow, 0, nameShadow[itemDataTemp.size] .. "_dis", false, 0, function()
            if holderShadow then
              holderShadow:SetNativeObject(nil)
              objShadow = nil
            end
          end)
          FloatTipsUtil.ShowWarnTips(T(1727))
          Activity5FishWindow.InitGame()
        end)
      end)
    end)
  end)
  UIUtil.SetText(uis.Main.StageRegion.Stage2Btn, T(1714))
  uis.Main.StageRegion.Stage2Btn.onClick:Set(function()
    if getFishTween then
      LeanTween.cancel(getFishTween.uniqueId)
      getFishTween = nil
    end
    if tweenScale then
      tweenScale:SetPaused(true)
      tweenScale:Kill()
      tweenScale = nil
    end
    if objShadow then
      SkeletonAnimationUtil.SetAnimation(objShadow, 0, nameShadow[itemDataTemp.size] .. "_get", false, 0, function()
        if holderShadow then
          holderShadow:SetNativeObject(nil)
          objShadow = nil
        end
      end)
    end
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_water_get.prefab", uis.Main.Effect2Holder)
    Activity5FishWindow.Start()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_pull_clk")
  end)
  uis.Main.StageRegion.Stage3Btn.onClick:Set(function()
    if tweenScale then
      tweenScale:SetPaused(true)
      tweenScale:Kill()
      tweenScale = nil
      local x = scaleRoot.scale.x
      local word = uis.Main.StageRegion.Stage3Btn:GetChild("Word")
      local effectPath
      if x < 0.63 and x >= 0.535 or x < 0.315 and x >= 0.225 then
        integral = integral + 34
        UIUtil.SetText(word, T(1711), "WordTxt")
        ChangeUIController(word, "c1", 1)
        effectPath = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_button_press_eff.prefab"
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_pull_excel")
      elseif x < 0.535 and x >= 0.315 then
        integral = integral + 50
        ChangeUIController(word, "c1", 0)
        UIUtil.SetText(word, T(1712), "WordTxt")
        effectPath = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame006/FX_MiniGame006_ui_button_press_eff2.prefab"
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_pull_perfect")
      else
        ChangeUIController(word, "c1", 2)
        UIUtil.SetText(word, T(1710), "WordTxt")
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_pull_fail")
      end
      integral = math.min(integral, 100)
      Activity5FishWindow.InitNumber()
      PlayUITrans(uis.Main.StageRegion.Stage3Btn, "up", function()
        UIUtil.SetText(word, "", "WordTxt")
        if integral >= 100 then
          SkeletonAnimationUtil.SetAnimation(fishingRod, 0, "get_up", false, 0, function()
            uis.Main.Effect2Holder:SetNativeObject(nil)
            Activity5FishWindow.GameOver()
            scaleRoot:SetScale(0, 0)
          end)
          return
        end
        if max > now then
          Activity5FishWindow.Start()
        else
          FloatTipsUtil.ShowWarnTips(T(1727))
          Activity5FishWindow.InitGame()
        end
      end)
      if effectPath then
        UIUtil.SetEffectToUI(effectPath, uis.Main.StageRegion.Stage3Btn:GetChild("Effect1Holder"))
      end
    end
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    if 2 == uis.Main.c1Ctr.selectedIndex then
      Activity5FishWindow.SetPaused(true)
      MessageBox.Show(T(1728), {
        touchCallback = function()
          UIMgr:CloseWindow(WinResConfig.Activity5FishWindow.name)
        end
      }, {
        touchCallback = function()
          Activity5FishWindow.SetPaused(false)
        end
      })
    else
      UIMgr:CloseWindow(WinResConfig.Activity5FishWindow.name)
    end
  end)
  UIUtil.SetText(uis.Main.TopRegion.BookBtn, T(1705), "WordTxt")
  uis.Main.TopRegion.BookBtn.onClick:Set(function()
  end)
end

function Activity5FishWindow.SetPaused(bol)
  if tweenScale then
    tweenScale:SetPaused(bol)
  end
end

function Activity5FishWindow.GetRandomFish()
  local index = math.random(1, table.getLen(allFishCofn))
  local fishId = Activity5_MiniGameData.GetAllFish()
  nowId = allFishCofn[index].id
  new = not fishId[nowId]
  print(Activity5_MiniGameData.newNum, ">>>>>>>>>>>>>>>>>>>>> Activity5_MiniGameData.newNum>>")
  if not new and Activity5_MiniGameData.newNum > 3 and table.getLen(fishId) < table.getLen(allFishCofn) then
    local tempId = {}
    for i, v in pairs(allFishCofn) do
      if not fishId[v.id] then
        table.insert(tempId, v.id)
      end
    end
    if table.getLen(tempId) > 0 then
      index = math.random(1, table.getLen(tempId))
      nowId = tempId[index]
      new = true
    end
  end
end

function Activity5FishWindow.GameOver()
  if nowId then
    local map = {}
    map[nowId] = new and 1 or 2
    if itemDataTemp and 2 == itemDataTemp.type then
      new = nil
    end
    Activity5_MiniGameService.MiniGameSubmitReq(gameId, map, 1, 1, function()
      local v2 = uis.Main.TopRegion.BookBtn:LocalToRoot(Vector2.zero, GRoot.inst.root)
      v2 = Vector2(v2.x - uis.Main.TopRegion.BookBtn.width, v2.y + uis.Main.TopRegion.BookBtn.height / 2)
      if new then
        Activity5_MiniGameData.newNum = 1
        OpenWindow(WinResConfig.Activity5FishNewEndWindow.name, nil, nowId, v2)
      else
        Activity5_MiniGameData.newNum = 1 + Activity5_MiniGameData.newNum
        OpenWindow(WinResConfig.Activity5FishEndWindow.name, nil, nowId, v2)
      end
    end)
  end
end

function Activity5FishWindow.GetAllFish()
  local data = TableData.GetTable("BaseActivityGameItem")
  local fish = {}
  for i, v in pairs(data) do
    if v.game_id == gameId then
      table.insert(fish, v)
    end
  end
  return fish
end

function Activity5FishWindow.InitGame()
  uis.Main.c1Ctr.selectedIndex = 0
  uis.Main.StageRegion.root.alpha = 1
  uis.Main.StageRegion.root.touchable = true
  local top = uis.Main.TopRegion
  integral = 0
  top.NumberProgressBar.value = 0
  top.HarvestProgressBar.value = 0
  uis.Main.EffectHolder:SetNativeObject(nil)
  uis.Main.Effect2Holder:SetNativeObject(nil)
  uis.Main.StageRegion.Stage3Btn:GetChild("Effect1Holder"):SetNativeObject(nil)
  uis.Main.StageRegion.Stage2Btn:GetChild("Effect1Holder"):SetNativeObject(nil)
  SkeletonAnimationUtil.SetAnimation(fishingRod, 0, "prepare", true, 0, function()
  end)
end

function Activity5FishWindow.Start()
  uis.Main.c1Ctr.selectedIndex = 2
  now = now + 1
  Activity5FishWindow.InitNumber()
  SkeletonAnimationUtil.SetAnimation(fishingRod, 0, "get", true, 0, function()
  end)
  scaleRoot:SetScale(1, 1)
  local time = math.random(10, 15)
  tweenScale = scaleRoot:TweenScale(Vector2.zero, time / 10):SetEase(EaseType.Linear):OnComplete(function()
    if max > now then
      if tweenScale then
        tweenScale:SetPaused(true)
        tweenScale:Kill()
        tweenScale = nil
      end
      Activity5FishWindow.Start()
    else
      FloatTipsUtil.ShowWarnTips(T(1727))
      Activity5FishWindow.InitGame()
    end
  end)
end

function Activity5FishWindow.InitNumber()
  local top = uis.Main.TopRegion
  if harvestTweener then
    LeanTween.cancel(harvestTweener.uniqueId)
    harvestTweener = nil
  end
  harvestTweener = LeanTween.value(top.HarvestProgressBar.value, integral, 0.5):setOnUpdate(function(val)
    top.HarvestProgressBar.value = val
  end):setOnComplete(function()
    top.HarvestProgressBar.value = integral
    harvestTweener = nil
  end)
  top.Harvest.NumberTxt.text = integral .. "%"
  top.Number.NumberTxt.text = T(1704, max - now)
  local tatal = now / max * 100
  if barTweener then
    LeanTween.cancel(barTweener.uniqueId)
    barTweener = nil
  end
  barTweener = LeanTween.value(top.NumberProgressBar.value, tatal, 0.5):setOnUpdate(function(val)
    top.NumberProgressBar.value = val
  end):setOnComplete(function()
    top.NumberProgressBar.value = tatal
    barTweener = nil
  end)
end

function Activity5FishWindow.OnShowAnimationEnd()
  LightManager:SetCameraBloom(UICamera, true, 1, 255, 255, 255, 1.1, 0, "UI")
end

function Activity5FishWindow.OnPreClose()
  LightManager:SetCameraBloom(UICamera, false)
end

function Activity5FishWindow.OnClose()
  uis = nil
  contentPane = nil
  scaleRoot = nil
  allFishCofn = nil
  integral = nil
  now = nil
  holderShadow = nil
  objShadow = nil
  nowId, new = nil, nil
  itemDataTemp = nil
  if tweenScale then
    tweenScale:Kill()
    tweenScale = nil
  end
  if waitTimeTween then
    LeanTween.cancel(waitTimeTween.uniqueId)
    waitTimeTween = nil
  end
  if getFishTween then
    LeanTween.cancel(getFishTween.uniqueId)
    getFishTween = nil
  end
  if barTweener then
    LeanTween.cancel(barTweener.uniqueId)
    barTweener = nil
  end
  if harvestTweener then
    LeanTween.cancel(harvestTweener.uniqueId)
    harvestTweener = nil
  end
end

function Activity5FishWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity5_MiniGame.RESET then
    Activity5FishWindow.InitGame()
  end
end

return Activity5FishWindow
