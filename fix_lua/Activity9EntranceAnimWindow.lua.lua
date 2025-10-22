require("ActivityDungeon1008_MainSeasonsWindowByName")
local Activity9EntranceAnimWindow = {}
local uis, contentPane, touchable
local setSpritesColor = function(go, color, fadeout)
  local spriteRenderers = go:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
  if spriteRenderers then
    for i = 0, spriteRenderers.Length - 1 do
      local sr = spriteRenderers[i]
      if fadeout then
        color.a = math.min(color.a, sr.color.a)
      end
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
  [1] = "Assets/Art/Models/UI_spine/prefab/Eventcovers/eventcovers_0009.prefab"
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
  uis.Main.root.touchable = false
  local color = Color.white
  color.a = 0
  LuaUtil.ResetAlpha(o)
  setSpritesColor(o, color)
  SkeletonAnimationUtil.SetAlpha(o, 0)
  tweeners = tweeners or {}
  LuaUtil.PlayEffect(o)
  local spine = LuaUtil.FindChild(o, "eventcovers_0009", true)
  SkeletonAnimationUtil.SetAnimation(spine, 0, "in", false, 0, function()
    if spine and uis then
      SkeletonAnimationUtil.SetAnimation(spine, 0, "idle", true)
    end
  end)
  local post_blur = FindChild(o.transform, "POST_blur").gameObject
  post_blur:SetActive(true)
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
          setSpritesColor(o, color, true)
          SkeletonAnimationUtil.SetAlpha(o, val)
        end):setOnComplete(function()
          RemoveTween(tweenId)
          holder:Dispose()
        end).id
        table.insert(tweeners, tweenId)
      else
        uis.Main.root.touchable = true
        touchable = true
        currentNum = num
        currentEff = o
      end
    end).id
    table.insert(tweeners, tweenId)
  end).id
  table.insert(tweeners, tweenId)
end

function Activity9EntranceAnimWindow.ReInitData()
end

function Activity9EntranceAnimWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9EntranceAnimWindow.package, WinResConfig.Activity9EntranceAnimWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MainSeasonsWindowUis(contentPane)
    Activity9EntranceAnimWindow.UpdateInfo()
    Activity9EntranceAnimWindow.InitBtn()
  end)
end

function Activity9EntranceAnimWindow.UpdateInfo()
  PlayDailyEntranceAnim(1, 1)
end

function Activity9EntranceAnimWindow.InitBtn()
  uis.Main.root.onClick:Set(function()
    if touchable then
      local tweenId
      local holdername = string.format("EffectHolder%s", currentNum)
      local color = Color.white
      local holder = GetOrCreateHolder(uis.Main.root, holdername)
      tweenId = LeanTween.value(1, 0, 0.5):setOnUpdate(function(val)
        LuaUtil.SetAlpha(currentEff, val, true)
        color.a = val
        setSpritesColor(currentEff, color, true)
        SkeletonAnimationUtil.SetAlpha(currentEff, val)
      end):setOnComplete(function()
        RemoveTween(tweenId)
        holder:Dispose()
        UIMgr:CloseToWindow(WinResConfig.Activity9DungeonWindow.name)
      end).id
      table.insert(tweeners, tweenId)
      touchable = false
    end
  end)
end

function Activity9EntranceAnimWindow.OnClose()
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

return Activity9EntranceAnimWindow
