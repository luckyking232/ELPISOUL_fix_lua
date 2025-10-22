require("ActivityDungeon1004_MainSeasonsWindowByName")
local Activity5EntranceAnimWindow = {}
local uis, contentPane, touchable, exitWhenDoubleClick
local setSpritesColor = function(go, color)
  local spriteRenderers = go:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
  if spriteRenderers then
    for i = 0, spriteRenderers.Length - 1 do
      local sr = spriteRenderers[i]
      sr.color = color
    end
  end
end
local tweeners
local RemoveTween = function(tweenId)
  local k = table.keyof(tweeners, tweenId)
  if k then
    table.remove(tweeners, k)
  end
end
local GetOrCreateHolder = function(root, name)
  local holder = root:GetChild(name)
  if not holder then
    holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    holder.name = name
    holder.pivotAsAnchor = true
    holder:SetPivot(0.5, 0.5)
    root:AddChild(holder)
    holder:Center()
  end
  return holder
end

local function FindChild(transform, name)
  local result
  for i = 1, transform.childCount do
    local child = transform:GetChild(i - 1)
    if string.find(child.name, name) then
      result = child
      break
    else
      local subResult = FindChild(child, name)
      if subResult then
        result = subResult
        break
      end
    end
  end
  return result
end

local PATH_LOOKUP = {
  [1] = "Assets/Art/Models/UI_spine/prefab/Eventcovers/eventcovers_0005_4.prefab",
  [2] = "Assets/Art/Models/UI_spine/prefab/Eventcovers/eventcovers_0005_1.prefab",
  [3] = "Assets/Art/Models/UI_spine/prefab/Eventcovers/eventcovers_0005_2.prefab",
  [4] = "Assets/Art/Models/UI_spine/prefab/Eventcovers/eventcovers_0005_3.prefab"
}
local currentNum, currentEff, soundEvent

local function PlayDailyEntranceAnim(num, endNum)
  if endNum < num then
    return
  end
  touchable = false
  local path = PATH_LOOKUP[num]
  local o = ResourceManager.Instantiate(path)
  local holdername = string.format("EffectHolder%s", num)
  local holder = GetOrCreateHolder(uis.Main.root, holdername)
  UIUtil.SetObjectToUI(o, holder)
  o.transform.localPosition = Vector3.zero
  if not exitWhenDoubleClick then
    uis.Main.root.touchable = false
  end
  local color = Color.white
  color.a = 0
  LuaUtil.ResetAlpha(o)
  setSpritesColor(o, color)
  SkeletonAnimationUtil.SetAlpha(o, 0)
  tweeners = tweeners or {}
  local post_blur = FindChild(o.transform, "POST_blur").gameObject
  post_blur:SetActive(true)
  currentNum = num
  currentEff = o
  local tweenId
  tweenId = LeanTween.value(0, 1, 0.8):setOnUpdate(function(val)
    LuaUtil.SetAlpha(o, val, true)
    color.a = val
    setSpritesColor(o, color)
    SkeletonAnimationUtil.SetAlpha(o, val)
  end):setOnComplete(function()
    RemoveTween(tweenId)
    tweenId = LeanTween.delayedCall(2, function()
      PlayDailyEntranceAnim(num + 1, endNum)
      RemoveTween(tweenId)
      if num < endNum then
        post_blur:SetActive(false)
        tweenId = LeanTween.value(1, 0, 0.5):setOnUpdate(function(val)
          LuaUtil.SetAlpha(o, val, true)
          color.a = val
          setSpritesColor(o, color)
          SkeletonAnimationUtil.SetAlpha(o, val)
        end):setOnComplete(function()
          RemoveTween(tweenId)
          holder:Dispose()
        end).id
        table.insert(tweeners, tweenId)
      else
        uis.Main.root.touchable = true
        touchable = true
      end
    end).id
    table.insert(tweeners, tweenId)
  end).id
  table.insert(tweeners, tweenId)
end

local from, to

function Activity5EntranceAnimWindow.ReInitData()
end

function Activity5EntranceAnimWindow.OnInit(bridgeObj)
  bridgeObj:SetView(WinResConfig.Activity5EntranceAnimWindow.package, WinResConfig.Activity5EntranceAnimWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    from = bridgeObj.argTable[1]
    to = bridgeObj.argTable[2]
    exitWhenDoubleClick = bridgeObj.argTable[3]
    uis = GetActivityDungeon1004_MainSeasonsWindowUis(contentPane)
    Activity5EntranceAnimWindow.UpdateInfo()
    Activity5EntranceAnimWindow.InitBtn()
  end)
end

function Activity5EntranceAnimWindow.UpdateInfo()
  if from > to then
    UIMgr:CloseToWindow(WinResConfig.Activity5DungeonWindow.name)
  else
    soundEvent = SoundManager:PlaySfxSound("event:/sfx/sfx_ui/ui_sys/sfx_4time_enter_loop", "bank:/sfx/sfx_ui/ui_sys/ui_sys")
    PlayDailyEntranceAnim(from, to)
  end
end

function Activity5EntranceAnimWindow.InitBtn()
  uis.Main.root.onClick:Set(function(context)
    if exitWhenDoubleClick and context.inputEvent.isDoubleClick then
      touchable = true
    end
    if touchable then
      local tweenId
      local holdername = string.format("EffectHolder%s", currentNum)
      local color = Color.white
      local holder = GetOrCreateHolder(uis.Main.root, holdername)
      tweenId = LeanTween.value(1, 0, 0.5):setOnUpdate(function(val)
        LuaUtil.SetAlpha(currentEff, val, true)
        color.a = val
        setSpritesColor(currentEff, color)
        SkeletonAnimationUtil.SetAlpha(currentEff, val)
      end):setOnComplete(function()
        RemoveTween(tweenId)
        holder:Dispose()
        UIMgr:CloseToWindow(WinResConfig.Activity5DungeonWindow.name)
      end).id
      table.insert(tweeners, tweenId)
      touchable = false
    end
  end)
end

function Activity5EntranceAnimWindow.OnClose()
  uis = nil
  contentPane = nil
  currentNum = nil
  if tweeners then
    for i, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
    table.clear(tweeners)
  end
  tweeners = nil
  if soundEvent then
    SoundManager:StopSoundEvent(soundEvent)
  end
  soundEvent = nil
end

return Activity5EntranceAnimWindow
