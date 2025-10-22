require("ActivityDungeon1007_MiniGameStartWindowByName")
local Activity8MiniGameWindow = {}
local uis, contentPane
local gameId = 70441009
local controller = require("Activity8_MiniGameController")
local playerObj, touchable, pressTime, increase, dottedLine, fullLine
local Screen2WorldPosition = function(global)
  local cam = StageCamera.main
  local position = cam:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -cam.transform.position.z))
  return position
end
local World2LocalPosition = function(position)
  local parent = uis.Main.OperateRegion.root
  local cam = controller.GetCamera()
  local viewport = cam:WorldToViewportPoint(position)
  local viewLoader = parent:GetChild("VIEW_LOADER")
  local point = Vector2(viewLoader.width * viewport.x, viewLoader.height * (1 - viewport.y))
  local transformpoint = viewLoader:TransformPoint(point, parent)
  return transformpoint
end
local ScaledScreen2World = function(val)
  return val * UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
end
local SetSortingOrder = function(go, sortingOrder)
  local renderers = go:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
  for i = 1, renderers.Length do
    renderers[i - 1].sortingOrder = sortingOrder
  end
end
local colliderUIObjLookup, colliderObjLookup
local OnCreateCollider = function(collider)
  local id = collider.id
  local width, height = collider.width, collider.height
  local uiObj, obj
  if collider.type == "PILLAR" then
    if 1 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_pillar_a.prefab")
    elseif 2 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_pillar_b.prefab")
    elseif 3 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_pillar_c.prefab")
    end
  elseif collider.type == "OBSTACLE" then
    if 1 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_vine_a.prefab")
    elseif 2 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_vine_b.prefab")
    elseif 3 == id then
      obj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_vine_c.prefab")
    end
  elseif collider.type == "PLAYER" then
    local go = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame008/minigame008_gugu.prefab")
    playerObj = go
    obj = playerObj
  elseif collider.type == "ITEM" then
    uiObj = UIMgr:CreateObject("ActivityDungeon1007", "MiniStart_ItemAni")
    local itemType = collider.itemType
    local ctrlIndex
    if "HP" == itemType then
      ctrlIndex = 0
    elseif "INVINCIBLE" == itemType then
      ctrlIndex = 1
    else
      ctrlIndex = 2
    end
    PlayUITrans(uiObj, "up", nil, 0, -1)
    ChangeUIController(uiObj:GetChild("Item"), "c1", ctrlIndex)
  end
  local x, y = collider.body.x, collider.body.y
  if uiObj then
    uiObj:SetPivot(0.5, 0.5, true)
    local parent = uis.Main.OperateRegion.root
    colliderUIObjLookup = colliderUIObjLookup or {}
    colliderUIObjLookup[collider] = uiObj
    parent:AddChild(uiObj)
    local localPosition = World2LocalPosition(Vector3(x, y, 0))
    uiObj:SetXY(localPosition.x, localPosition.y)
  end
  if obj then
    colliderObjLookup = colliderObjLookup or {}
    colliderObjLookup[collider] = obj
    obj.transform.position = Vector3(x, y, 0)
    SetSortingOrder(obj, 6)
  end
end
local energyBar
local OFFSET = Vector3(0.1, 1, 0)
local DisplayChargeEnergyBar = function(display, percent, position)
  if display then
    if not energyBar then
      energyBar = UIMgr:CreateObject("ActivityDungeon1007", "MiniStart_Strength")
      local parent = uis.Main.OperateRegion.root
      parent:AddChild(energyBar)
    end
    local localposition = World2LocalPosition(position + OFFSET)
    energyBar:SetXY(localposition.x, localposition.y)
    energyBar.visible = true
    local block = energyBar:GetChild("StrengthImage")
    local halfWidth = block.width * 0.5
    block:SetXY(halfWidth + (energyBar.width - halfWidth * 0.5 - halfWidth) * percent, block.y)
  elseif energyBar then
    energyBar.visible = false
  end
end
local ownerColliderObjLookup, pressSoundEventInst
local OnUpdate = function(player, allColliders)
  local scale = 1.3333333333333333
  if playerObj and not playerObj:IsNull() then
    local x, y = player.body.x, player.body.y
    local transform = playerObj.transform
    local offset = scale * player.width * 0.1
    local halfHeight = scale * player.height * 0.5
    local position = Vector3(x - offset, y - halfHeight, 0)
    transform.position = position
    if pressTime and pressTime >= 0 then
      local percent = pressTime / math.max(controller.GetTimeReachMaxVel_Vertical(), controller.GetTimeReachMaxVel_Horizontal())
      DisplayChargeEnergyBar(true, percent, position)
      if not pressSoundEventInst then
        pressSoundEventInst = SoundManager:PlaySfxSound("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_xuli", "bank:/sfx/sfx_ui/ui_sys/ui_sys")
      end
      pressSoundEventInst:setParameterByName("xuli", math.floor(percent * 100))
      local playerPosition = position
      local points, extend = controller.CalculateTrack(pressTime, 20, controller.GetExtend() <= 0)
      local p = playerPosition
      local len = 0
      for i = 1, #points do
        len = len + Vector3.Distance(p, playerPosition + points[i])
        p = playerPosition + points[i]
      end
      local line = extend and fullLine or dottedLine
      local density = 1 / len
      line:ClearPositionsBuffer()
      line.density = density
      line:AddPositionToBuffer(playerPosition)
      for _, v in ipairs(points) do
        line:AddPositionToBuffer(v + playerPosition)
      end
      line:ApplyPositionsBuffer(false)
      line.cachedGameObject:SetActive(true)
    else
      DisplayChargeEnergyBar(false)
      fullLine.cachedGameObject:SetActive(false)
      dottedLine.cachedGameObject:SetActive(false)
      if pressSoundEventInst then
        SoundUtil.StopSoundEvent(pressSoundEventInst)
      end
      pressSoundEventInst = nil
    end
  end
  if colliderObjLookup then
    for _, collider in ipairs(allColliders) do
      local obj = colliderObjLookup[collider]
      if collider.type ~= "PLAYER" and obj then
        local x, y = collider.body.x, collider.body.y
        local transform = obj.transform
        transform.position = Vector3(x, y, 0)
      end
    end
  end
  if colliderUIObjLookup then
    for _, collider in ipairs(allColliders) do
      local obj = colliderUIObjLookup[collider]
      if obj then
        obj:SetPivot(0.5, 0.5, true)
        local x, y = collider.body.x, collider.body.y
        local localPosition = World2LocalPosition(Vector3(x, y, 0))
        obj:SetXY(localPosition.x, localPosition.y)
      end
    end
  end
  if ownerColliderObjLookup then
    for _, collider in ipairs(allColliders) do
      local entry = ownerColliderObjLookup[collider]
      if entry then
        local obj = entry.obj
        local offset = entry.offset
        if obj then
          local x, y = collider.body.x, collider.body.y
          local localPosition = World2LocalPosition(Vector3(x, y, 0) + offset)
          obj:SetXY(localPosition.x, localPosition.y)
        end
      end
    end
  end
  if controller then
    local dist = controller.GetDist()
    local integer, frac = math.modf(dist)
    uis.Main.Integral.NumberTxt.text = T(20636, integer)
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
  end
  return holder
end
local OnDestroyCollider = function(collider, owner, playEffect)
  if colliderUIObjLookup then
    local obj = colliderUIObjLookup[collider]
    if obj then
      if playEffect and collider.type == "ITEM" then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_item")
        local go = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame009/FX_minigame008_getitem_blue.prefab")
        local holder = GetOrCreateHolder(uis.Main.OperateRegion.root, string.format("HOLDER_%s", tostring(collider)))
        holder:SetXY(obj.x, obj.y)
        UIUtil.SetObjectToUI(go, holder)
        LuaUtil.PlayEffect(go)
        ownerColliderObjLookup = ownerColliderObjLookup or {}
        ownerColliderObjLookup[owner] = {
          obj = holder,
          offset = Vector3(0, ScaledScreen2World(owner.height + collider.height) * 0.5, 0)
        }
        EffectUtil.SetAutoDestroyCallback(go, function()
          ownerColliderObjLookup[owner] = nil
          holder:Dispose()
        end)
        local openTips = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY08_ITEM_EXPLAIN, -1) < 0
        if openTips then
          OpenWindow(WinResConfig.Activity8MiniGameExplainWindow.name)
        end
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY08_ITEM_EXPLAIN, 1)
      end
      obj:Dispose()
    end
    colliderUIObjLookup[collider] = nil
  end
  if colliderObjLookup then
    local obj = colliderObjLookup[collider]
    ResourceManager.DestroyGameObject(obj)
    colliderObjLookup[collider] = nil
  end
end
local OnCollide = function(other, player, direction, invincible)
  local otherType = other.type
  if "PILLAR" == otherType then
    if 0 ~= direction[1] then
      SkeletonAnimationUtil.SetAnimation(playerObj, 0, "punch", false)
      SkeletonAnimationUtil.AddAnimation(playerObj, 0, "drop", true, 0)
    elseif SkeletonAnimationUtil.GetSkeletonAnimation(playerObj).AnimationName ~= "relive" then
      if SkeletonAnimationUtil.GetSkeletonAnimation(playerObj).AnimationName ~= "jump_down" then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_land")
        SkeletonAnimationUtil.SetAnimation(playerObj, 0, "jump_down", false)
        SkeletonAnimationUtil.AddAnimation(playerObj, 0, "idle", true, 0)
      end
      touchable = true
    end
  elseif "OBSTACLE" == otherType then
    if not invincible then
      SkeletonAnimationUtil.SetAnimation(playerObj, 0, "punch", false)
      SkeletonAnimationUtil.AddAnimation(playerObj, 0, "drop", true, 0)
    else
      local position = World2LocalPosition(playerObj.transform.position)
      local go = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame009/FX_minigame008_cross.prefab")
      local holder = GetOrCreateHolder(uis.Main.OperateRegion.root, string.format("HOLDER_%s", tostring(other)))
      holder:SetXY(position.x, position.y)
      UIUtil.SetObjectToUI(go, holder)
      LuaUtil.PlayEffect(go)
      ownerColliderObjLookup = ownerColliderObjLookup or {}
      ownerColliderObjLookup[other] = {
        obj = holder,
        offset = Vector3(player.body.x - other.body.x, player.body.y - other.body.y, 0)
      }
      EffectUtil.SetAutoDestroyCallback(go, function()
        ownerColliderObjLookup[other] = nil
        holder:Dispose()
      end)
    end
  elseif "WALL" == otherType then
    playerObj:SetActive(false)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_fail")
  end
end
local OnSeparated = function(player, stand, jumping)
  if not jumping then
    pressTime = -1
    touchable = false
    fullLine.cachedGameObject:SetActive(false)
    dottedLine.cachedGameObject:SetActive(false)
  end
end
local OnGameOver = function(succeed)
  OpenWindow(WinResConfig.Activity8MiniGameSubmitWindow.name, nil, succeed, math.floor(controller.GetDist()), math.floor(controller.GetElapse()))
end
local assets = {
  [1] = {name = "Hp", ctrlIndex = 0},
  [2] = {name = "Invincible", ctrlIndex = 1},
  [3] = {name = "Extend", ctrlIndex = 2}
}
local OnRefreshInfo = function(hp, invincible, extend)
  local list = uis.Main.AssetsTipsList
  list.numItems = 3
end
local OnRevive = function(player, stand)
  touchable = false
  playerObj:SetActive(true)
  LeanTween.delayedCall(0.38, function()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_land")
    local go = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MapAdventure/FX_tanxian_huanrenyanwu.prefab")
    local playerBody = player.body
    go.transform.position = Vector3(playerBody.x, playerBody.y - player.height * 0.5, 0)
    SetSortingOrder(go, 7)
    LuaUtil.PlayEffect(go)
    EffectUtil.SetAutoDestroyCallback(go, function()
      ResourceManager.DestroyGameObject(go)
    end)
  end)
  SkeletonAnimationUtil.SetAnimation(playerObj, 0, "relive", false, function()
    touchable = true
  end, true, "0", 1, 0)
  SkeletonAnimationUtil.AddAnimation(playerObj, 0, "idle", true, 0)
end
local GetCurrentMiniGameConfig = function()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity8_MiniGameData.GetMiniGameInfo(gameId)
  local curDay = math.ceil((LoginData.GetCurServerTime() - activityInfo.baseInfo.startStamp) / 86400)
  local difficulties = GetDifficulties(curDay)
  local miniDailyNum = info.miniDailyNum + 1
  local index = miniDailyNum > #difficulties and math.random(1, #difficulties) or miniDailyNum
  return difficulties[index]
end

function Activity8MiniGameWindow.ReInitData()
end

function Activity8MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameWindow.package, WinResConfig.Activity8MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_MiniGameStartWindowUis(contentPane)
    Activity8MiniGameWindow.UpdateInfo()
    Activity8MiniGameWindow.InitBtn()
  end)
end

local LoadPathRenderer = function(path, sortingOrder)
  local pathRenderer = ResourceManager.Instantiate(path):GetOrAddComponent(typeof(CS.PathRenderer))
  pathRenderer.positionCount = 0
  pathRenderer.lineWidth = 0.8
  pathRenderer.density = 0.008
  pathRenderer.flowspeed = 0
  pathRenderer.numCornerVertices = 0
  pathRenderer.cachedLineRenderer.sortingOrder = sortingOrder
  return pathRenderer
end
local StartGame = function()
  local root = uis.Main.root
  local parent = uis.Main.OperateRegion.root
  local worldPosition = Vector3(2000, 2000, 0)
  local CONST_HEIGHT = 9
  local worldWidth, worldHeight = StageCamera.main.aspect * CONST_HEIGHT, CONST_HEIGHT
  touchable = true
  local viewLoaderName = "VIEW_LOADER"
  local viewLoader = parent:GetChild(viewLoaderName)
  if not viewLoader then
    viewLoader = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Loader)
    viewLoader.name = viewLoaderName
    parent:AddChild(viewLoader)
  end
  viewLoader.width = root.width
  viewLoader.height = root.height
  viewLoader:Center()
  if not fullLine then
    fullLine = LoadPathRenderer("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_fullline.prefab", 6)
  end
  fullLine.cachedGameObject:SetActive(false)
  fullLine.density = 0.08
  if not dottedLine then
    dottedLine = LoadPathRenderer("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_dottedline.prefab", 6)
  end
  dottedLine.cachedGameObject:SetActive(false)
  dottedLine.density = 0.1
  pressTime = -1
  controller.StartGame(viewLoader, worldPosition, worldWidth, worldHeight, OnCreateCollider, OnDestroyCollider, OnUpdate, OnCollide, OnSeparated, OnGameOver, OnRefreshInfo, OnRevive)
  local list = uis.Main.AssetsTipsList
  list.numItems = 3
end

function Activity8MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1007/MiniGame_1001"
  local holder = GetOrCreateHolder(uis.Main.root, "BG_EFFECT_HOLDER")
  UIUtil.SetHolderCenter(holder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", holder)
  OpenWindow(WinResConfig.Activity8MiniGameGuideWindow.name)
  local list = uis.Main.AssetsTipsList
  
  function list.itemRenderer(i, gcmp)
    local assetInfo = assets[i + 1]
    local addition = 0
    if 0 == i then
      addition = 1
    end
    ChangeUIController(gcmp, "c1", assetInfo.ctrlIndex)
    UIUtil.SetText(gcmp, controller[string.format("Get%s", assetInfo.name)]() + addition, "NumberTxt")
  end
  
  StartGame()
end

function Activity8MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(20648), {
      touchCallback = function()
        controller.Release()
        Activity8_MiniGameService.MiniGameSubmitReq({}, math.floor(controller.GetDist()), math.ceil(controller.GetElapse()), function()
          UIMgr:CloseToWindow(WinResConfig.Activity8MiniGameMainWindow.name)
        end)
      end
    }, {})
  end)
  uis.Main.FunctionDetailsBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity8MiniGameExplainWindow.name)
  end)
  local gesture = CS.FairyGUI.LongPressGesture.GetLongPressGesture(uis.Main.TouchScreenBtn)
  gesture.trigger = 0.01
  gesture.interval = 0
  gesture.onBegin:Set(function()
    if not touchable then
      return
    end
    increase = true
    pressTime = 0
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "prepare", true)
  end)
  gesture.onAction:Set(function()
    if not touchable then
      return
    end
    local max = math.max(controller.GetTimeReachMaxVel_Vertical(), controller.GetTimeReachMaxVel_Horizontal())
    pressTime = math.max(0, math.min((pressTime >= 0 and pressTime or 0) + (increase and Time.deltaTime or -Time.deltaTime), max))
    if increase then
      if max <= pressTime then
        increase = false
      end
    elseif pressTime <= 0 then
      increase = true
    end
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "prepare", true)
  end)
  gesture.onEnd:Set(function()
    if not touchable then
      return
    end
    fullLine.cachedGameObject:SetActive(false)
    dottedLine.cachedGameObject:SetActive(false)
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "jump", true)
    controller.Jump(math.max(pressTime, 0))
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_jump")
    pressTime = -1
    touchable = false
  end)
end

function Activity8MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  colliderUIObjLookup = nil
  ownerColliderObjLookup = nil
  controller.Release()
  if playerObj then
    ResourceManager.DestroyGameObject(playerObj)
  end
  if colliderObjLookup then
    for i, v in pairs(colliderObjLookup) do
      ResourceManager.DestroyGameObject(v, false)
    end
  end
  if fullLine then
    ResourceManager.DestroyGameObject(fullLine.cachedGameObject, false)
  end
  if dottedLine then
    ResourceManager.DestroyGameObject(dottedLine.cachedGameObject, false)
  end
  fullLine = nil
  dottedLine = nil
  colliderObjLookup = nil
  playerObj = nil
  energyBar = nil
end

function Activity8MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity8_MiniGame.REFRESH_MINIGAME_INFO then
  elseif msgId == WindowMsgEnum.Activity8_MiniGame.RESET then
    StartGame()
  end
end

return Activity8MiniGameWindow
