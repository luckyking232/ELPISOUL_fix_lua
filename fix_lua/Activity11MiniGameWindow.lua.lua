require("ActivityDungeon1011_MiniGameStartWindowByName")
local Activity11MiniGameWindow = {}
local uis, contentPane
local controller = require("Activity11_MiniGameController")
local levelIndex, itemObjLookup, busy, bombCount, fireworksCount, itemTextLookup, score, levelConfig
local ANGLE_DELTA_DEFAULT = 0
local ANGLE_DELTA_ACC = 800
local MAX_SHOT_ANGLE = 70
local Screen2WorldPosition = function(global)
  local cam = StageCamera.main
  local position = cam:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -cam.transform.position.z))
  return position
end
local World2ScreenPosition = function(worldPosition)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(worldPosition)
  return Vector2(sp.x, Screen.height - sp.y)
end
local GetOrCreateHolder = function(parent, name, index)
  local holder = parent:GetChild(name)
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    if index then
      parent:AddChildAt(holder, index)
    else
      parent:AddChild(holder)
    end
    holder.name = name
    UIUtil.SetHolderCenter(holder)
  end
  return holder
end
local EFFECT_IMAGE_URL = {
  [controller.BALL_EFFECT.ICE] = "ui://f18h360qrfedbk",
  [controller.BALL_EFFECT.FREEZE] = "ui://f18h360qrfedbj",
  [controller.BALL_EFFECT.CHAIN] = "ui://f18h360qrfedbl",
  [controller.BALL_EFFECT.CHAIN_X2] = "ui://f18h360qrfedbm"
}
local GetControllerIndexes = function(itemType, color)
  local ctrl1_index = 0
  if "BALL" == itemType then
    if color == controller.BALL_COLOR.RED then
      ctrl1_index = 1
    elseif color == controller.BALL_COLOR.BLUE then
      ctrl1_index = 4
    elseif color == controller.BALL_COLOR.GREEN then
      ctrl1_index = 2
    elseif color == controller.BALL_COLOR.CYAN then
      ctrl1_index = 0
    elseif color == controller.BALL_COLOR.YELLOW then
      ctrl1_index = 3
    elseif color == controller.BALL_COLOR.GRAY then
      ctrl1_index = 5
    elseif color == controller.BALL_COLOR.STONE then
      ctrl1_index = 6
    elseif color == controller.BALL_COLOR.PINK then
      ctrl1_index = 19
    elseif color == controller.BALL_COLOR.BLUE_GREEN then
      ctrl1_index = 16
    elseif color == controller.BALL_COLOR.RED_GREEN then
      ctrl1_index = 11
    elseif color == controller.BALL_COLOR.YELLOW_GREEN then
      ctrl1_index = 14
    elseif color == controller.BALL_COLOR.CYAN_GREEN then
      ctrl1_index = 8
    elseif color == controller.BALL_COLOR.RED_BLUE then
      ctrl1_index = 12
    elseif color == controller.BALL_COLOR.YELLOW_BLUE then
      ctrl1_index = 15
    elseif color == controller.BALL_COLOR.CYAN_BLUE then
      ctrl1_index = 10
    elseif color == controller.BALL_COLOR.YELLOW_RED then
      ctrl1_index = 13
    elseif color == controller.BALL_COLOR.CYAN_RED then
      ctrl1_index = 7
    elseif color == controller.BALL_COLOR.CYAN_YELLOW then
      ctrl1_index = 9
    elseif color == controller.BALL_COLOR.RED_PINK then
      ctrl1_index = 20
    elseif color == controller.BALL_COLOR.YELLOW_PINK then
      ctrl1_index = 21
    elseif color == controller.BALL_COLOR.BLUE_PINK then
      ctrl1_index = 22
    elseif color == controller.BALL_COLOR.PINK_GREEN then
      ctrl1_index = 23
    elseif color == controller.BALL_COLOR.CYAN_PINK then
      ctrl1_index = 24
    end
  elseif "BOMB" == itemType then
    ctrl1_index = 17
  elseif "FIREWORKS" == itemType then
    ctrl1_index = 18
  end
  return ctrl1_index
end
local UpdateEffect = function(gobj, effect)
  if type(effect) == "number" then
    for k, url in pairs(EFFECT_IMAGE_URL) do
      local childname = string.format("EFFECT_LOADER_%s", k)
      local child = gobj:GetChild(childname)
      if 0 ~= effect & k then
        if not child then
          local loader = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Loader)
          loader:SetPivot(0.5, 0.5, true)
          if k == controller.BALL_EFFECT.CHAIN_X2 or k == controller.BALL_EFFECT.CHAIN then
            loader:SetSize(50, 50)
          else
            loader:SetSize(gobj.width, gobj.height)
          end
          loader.name = childname
          gobj:AddChild(loader)
          loader:Center()
          child = loader
        end
        child.url = url
        child.visible = true
      elseif child then
        child.visible = false
      end
    end
  end
end
local UpdateItemPosition = function(item)
  local parent = uis.Main.BoxRegion.BeadRegion.root
  local obj = itemObjLookup[item]
  if obj and not obj.isDisposed then
    local x, y = item.body.x, item.body.y
    local screenPosition = World2ScreenPosition(Vector3(x, y))
    local localPosition = parent:GlobalToLocal(screenPosition)
    obj:SetPosition(localPosition.x, localPosition.y)
    if item.type == controller.ITEM_TYPE.BALL or item.type == controller.ITEM_TYPE.FIREWORKS then
      local angle = item.body.angle
      obj.rotation = -math.deg(angle)
    end
    if item.type == controller.ITEM_TYPE.BALL and item.state == "STATIC" then
      local holder = obj:GetChild("Effect1Holder")
      holder:SetNativeObject(nil)
    end
    if item.type == controller.ITEM_TYPE.BALL and item.state == "STATIC" then
      obj.visible = obj.y >= -28
    end
  end
  if itemTextLookup then
    local text = itemTextLookup[item]
    if text then
      local x, y = item.body.x, item.body.y
      local pos = World2ScreenPosition(Vector3(x, y))
      local point = parent:GlobalToLocal(pos)
      text:SetXY(point.x, point.y)
      text.text = string.format([[
X:%s,Y:%s
E:%s]], item.gridX or "-", item.gridY or "-", item.effect or "-")
    end
  end
end
local OnCreateItem = function(item)
  local url
  if item.type == controller.ITEM_TYPE.BALL or item.type == controller.ITEM_TYPE.BOMB or item.type == controller.ITEM_TYPE.FIREWORKS then
    url = "ui://ActivityDungeon1011/MiniStart_Bead"
  end
  if url then
    itemObjLookup = itemObjLookup or {}
    local parent = uis.Main.BoxRegion.BeadRegion.root
    local obj = UIMgr:CreateComponentFromURL(url)
    obj:SetPivot(0.5, 0.5, true)
    parent:AddChild(obj)
    obj.rotation = -math.deg(item.body.angle)
    itemObjLookup[item] = obj
    UpdateItemPosition(item)
    local ctrl1_index = GetControllerIndexes(item.type, item.color)
    ChangeUIController(obj, "c1", ctrl1_index)
    UpdateEffect(obj, item.effect)
    if item.state == "PROJECTILE" then
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_trail.prefab")
      UIUtil.SetObjectToUI(effect, obj:GetChild("Effect1Holder"))
    end
  end
end
local colors
local OnDestroyItem = function(item, boom, firework)
  if itemObjLookup then
    local obj = itemObjLookup[item]
    itemObjLookup[item] = nil
    if obj then
      if boom then
        local holder = GetOrCreateHolder(uis.Main.BoxRegion.BeadRegion.root, string.format("HOLDER_%s", tostring(item)))
        holder:SetXY(obj.x, obj.y)
        local effect
        if item.type == controller.ITEM_TYPE.BALL then
          if not firework then
            effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_dis.prefab")
            colors = colors or {}
            table.clear(colors)
            if 0 ~= item.color & controller.BALL_COLOR.RED then
              table.insert(colors, "red")
            end
            if 0 ~= item.color & controller.BALL_COLOR.YELLOW then
              table.insert(colors, "yellow")
            end
            if 0 ~= item.color & controller.BALL_COLOR.GREEN then
              table.insert(colors, "green")
            end
            if 0 ~= item.color & controller.BALL_COLOR.CYAN then
              table.insert(colors, "cyan")
            end
            if 0 ~= item.color & controller.BALL_COLOR.BLUE then
              table.insert(colors, "blue")
            end
            if 0 ~= item.color & controller.BALL_COLOR.PINK then
              table.insert(colors, "purple")
            end
            if 0 ~= item.color & controller.BALL_COLOR.GRAY then
              table.insert(colors, "gray")
            end
            local transform = effect.transform
            for i = 1, transform.childCount do
              transform:GetChild(i - 1).gameObject:SetActive(false)
            end
            for _, name in ipairs(colors) do
              local child = LuaUtil.FindChild(transform, name)
              if child then
                child.gameObject:SetActive(true)
              end
            end
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_act")
          else
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_rocket")
            effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_boom.prefab")
          end
        elseif item.type == controller.ITEM_TYPE.BOMB then
          effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_hugeboom.prefab")
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_explosion")
        end
        UIUtil.SetObjectToUI(effect, holder)
        LuaUtil.SetEffectSetting(effect, function()
          holder:Dispose()
        end)
      end
      obj:Dispose()
    end
  end
  if boom then
    score = score + 1
  end
  if itemTextLookup then
    local text = itemTextLookup[item]
    if text then
      text:Dispose()
      itemTextLookup[item] = nil
    end
  end
end
local OnBallEffectChanged = function(ball, oldEffect, newEffect)
  local obj = itemObjLookup[ball]
  if obj then
    local holder, effect
    if oldEffect & controller.BALL_EFFECT.CHAIN and newEffect & controller.BALL_EFFECT.CHAIN then
      holder = GetOrCreateHolder(uis.Main.BoxRegion.BeadRegion.root, string.format("HOLDER_EFFECT_CHAIN_%s", ball))
      holder:SetXY(obj.x, obj.y)
      effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_lock_dis.prefab")
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_chain_unlock")
    end
    if oldEffect & controller.BALL_EFFECT.CHAIN_X2 and newEffect & controller.BALL_EFFECT.CHAIN_X2 then
      holder = GetOrCreateHolder(uis.Main.BoxRegion.BeadRegion.root, string.format("HOLDER_EFFECT_CHAIN_%s", ball))
      holder:SetXY(obj.x, obj.y)
      effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_lock_dis.prefab")
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_chain_unlock")
    end
    if oldEffect & controller.BALL_EFFECT.FREEZE and newEffect & controller.BALL_EFFECT.FREEZE then
      holder = GetOrCreateHolder(uis.Main.BoxRegion.BeadRegion.root, string.format("HOLDER_EFFECT_FREEZE_%s", ball))
      holder:SetXY(obj.x, obj.y)
      effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_frezz_dis.prefab")
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_ice_unfreeze")
    end
    if oldEffect & controller.BALL_EFFECT.ICE and newEffect & controller.BALL_EFFECT.ICE then
      holder = GetOrCreateHolder(uis.Main.BoxRegion.BeadRegion.root, string.format("HOLDER_EFFECT_FREEZE_%s", ball))
      holder:SetXY(obj.x, obj.y)
      effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_frezz_dis.prefab")
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_ice_unfreeze")
    end
    if effect and holder then
      UIUtil.SetObjectToUI(effect, holder)
      LuaUtil.SetEffectSetting(effect, function()
        holder:Dispose()
      end)
    end
    UpdateEffect(obj, newEffect)
  end
end
local gameOverDelayTween
local OnGameOver = function(win, elapse)
  local map = {}
  local info = Activity11_MiniGameData.GetMiniGameInfo(70441013)
  local remoteMap = info.extraCount
  local oldVal = remoteMap and remoteMap[1] or 0
  if win then
    map[1] = math.max(levelIndex, oldVal)
  else
    map[1] = oldVal
  end
  Activity11_MiniGameService.MiniGameSubmitReq(map, score, math.floor(elapse), function()
    gameOverDelayTween = LeanTween.delayedCall(0.2, function()
      gameOverDelayTween = nil
      local lastLevel = levelIndex >= #Activity11_MiniGameData.GetOrLoadLevelConfigs()
      OpenWindow(WinResConfig.Activity11MiniGameSubmitWindow.name, nil, win, score, math.floor(elapse), levelConfig.id, lastLevel)
    end).id
  end)
end
local readyPoint
local GetReadyPointFunc = function()
  return readyPoint
end
local shootDirection, angleDelta, buttonMode
local RefreshCandidate = function()
  local candidateType = controller.GetCandidateType()
  local color = controller.GetCandidateColor()
  local nextColor = controller.GetNextCandidateColor()
  local ctrl1_index = GetControllerIndexes(candidateType, color)
  if candidateType == controller.ITEM_TYPE.BALL then
    if color == controller.BALL_COLOR.NONE then
      uis.Main.Launch.Bead1.root.visible = false
    else
      uis.Main.Launch.Bead1.root.visible = true
      uis.Main.Launch.Bead1.c1Ctr.selectedIndex = ctrl1_index
    end
  else
    uis.Main.Launch.Bead1.root.visible = true
    uis.Main.Launch.Bead1.c1Ctr.selectedIndex = ctrl1_index
  end
  if nextColor == controller.BALL_COLOR.NONE then
    uis.Main.Launch.Bead2.root.visible = false
  else
    local ctrl1_index2 = GetControllerIndexes(controller.ITEM_TYPE.BALL, nextColor)
    uis.Main.Launch.Bead2.c1Ctr.selectedIndex = ctrl1_index2
    uis.Main.Launch.Bead2.root.visible = true
  end
  uis.Main.Launch.Bead1.root.rotation = 0
  uis.Main.Launch.Bead2.root.rotation = 0
  local angle = Vector2.SignedAngle(Vector2.up, Vector2(shootDirection.x, shootDirection.y))
  angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
  uis.Main.Launch.Bead1.root.rotation = -angle
  uis.Main.Launch.Bead2.root.rotation = 0
end
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return newX, newY
end
local drawline = CS.UnityEngine.Debug.DrawLine
local touching, dotlines
local LoadPathRenderer = function(path, sortingOrder)
  local pathRenderer = ResourceManager.Instantiate(path):GetOrAddComponent(typeof(CS.PathRenderer))
  pathRenderer.positionCount = 0
  pathRenderer.lineWidth = 0.8
  pathRenderer.density = 1
  pathRenderer.flowspeed = 0
  pathRenderer.numCornerVertices = 0
  pathRenderer.cachedLineRenderer.sortingOrder = sortingOrder
  return pathRenderer
end
local SetArrowAngle = function(angle)
  local arrow = uis.Main.Launch.root:GetChild("ArrowImage")
  arrow.visible = true
  arrow.rotation = -angle
  uis.Main.Launch.Bead1.root.rotation = -angle
end
local points
local UpdateAuxiliaryline = function(direction)
  local angle = Vector2.SignedAngle(Vector2.up, Vector2(direction.x, direction.y))
  angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
  local nx, ny = rotatePointAround(0, 1, angle, 0, 0)
  direction.x = nx
  direction.y = ny
  SetArrowAngle(angle)
  local origin, rayDirection = Vector2(readyPoint.x, readyPoint.y), Vector2(nx, ny)
  points = points or {}
  table.clear(points)
  dotlines = dotlines or {}
  if controller.GetCandidateType() ~= controller.ITEM_TYPE.FIREWORKS then
    local _, intersection = controller.RayCast(origin, rayDirection, points)
    table.insert(points, intersection)
    local p0 = readyPoint
    table.insert(points, 1, p0)
  else
    table.insert(points, readyPoint)
    local normalized = direction.normalized
    table.insert(points, readyPoint + Vector3(normalized.x, normalized.y) * 1000)
  end
  local len = #points
  for i = 1, len do
    local nextI = i + 1
    if len >= nextI then
      if not dotlines[i] then
        dotlines[i] = LoadPathRenderer("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/bubbleshooter_dotline.prefab", 10)
        local holder = GetOrCreateHolder(uis.Main.BoxRegion.root, string.format("DOTLINE_HOLDER%s", i), 2)
        UIUtil.SetObjectToUI(dotlines[i].cachedGameObject, holder)
      end
      dotlines[i]:ClearPositionsBuffer()
      dotlines[i]:AddPositionToBuffer(Vector3(points[i].x, points[i].y))
      dotlines[i]:AddPositionToBuffer(Vector3(points[nextI].x, points[nextI].y))
      dotlines[i]:ApplyPositionsBuffer(false)
      dotlines[i].cachedGameObject:SetActive(true)
    end
  end
  for i = len, #dotlines do
    dotlines[i].cachedGameObject:SetActive(false)
  end
end
local buttonDirection = 0
local OnUpdate = function(allItems)
  if not busy then
    if 0 ~= buttonDirection then
      local delta = buttonDirection * angleDelta * Time.deltaTime
      local angle = Vector2.SignedAngle(Vector2.up, shootDirection) + delta
      angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
      local nx, ny = rotatePointAround(0, 1, angle, 0, 0)
      shootDirection.x = nx
      shootDirection.y = ny
      angleDelta = angleDelta + ANGLE_DELTA_ACC * Time.deltaTime
    elseif touching then
      buttonMode = false
      local touchPoint = Stage.inst.touchPosition
      local worldPosition = Screen2WorldPosition(touchPoint)
      local readyPoint = GetReadyPointFunc()
      shootDirection = Vector2(worldPosition.x - readyPoint.x, worldPosition.y - readyPoint.y)
      UpdateAuxiliaryline(shootDirection)
    end
  end
  if buttonMode then
    UpdateAuxiliaryline(shootDirection)
  elseif not touching and dotlines then
    for i, v in ipairs(dotlines) do
      v.cachedGameObject:SetActive(false)
    end
  end
  for _, item in ipairs(allItems) do
    UpdateItemPosition(item)
  end
  UIUtil.SetText(uis.Main.Launch.root, T(20660, controller.GetRemainedShootCount()), "NumberTxt")
end
local Switch = function(itemType)
  if itemType == controller.ITEM_TYPE.BOMB then
    if controller.GetBombCount() <= 0 then
      return
    end
  elseif itemType == controller.ITEM_TYPE.FIREWORKS and controller.GetFireworksCount() <= 0 then
    return
  end
  controller.SwitchCandidateType(itemType)
  RefreshCandidate()
end
local BottomItemRenderer = function(i, gcmp)
  local point = gcmp:TransformPoint(Vector2(gcmp.width * 0.5, gcmp.height * 0.5), uis.Main.Launch.root)
  if 0 == i then
    ChangeUIController(gcmp, "c1", 0)
    local newCount = controller.GetBombCount()
    if newCount > bombCount then
      local holder = GetOrCreateHolder(uis.Main.Launch.root, "BOMB_UPDATE_HOLDER")
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_itemreflash.prefab")
      holder:SetXY(point.x, point.y)
      UIUtil.SetObjectToUI(effect, holder)
      LuaUtil.PlayEffect(effect)
      EffectUtil.SetAutoDestroyCallback(effect, function()
        holder:Dispose()
      end)
    end
    UIUtil.SetText(gcmp, newCount, "NumberTxt")
    bombCount = newCount
    gcmp.onClick:Set(function()
      if not busy then
        Switch(controller.ITEM_TYPE.BOMB)
      end
    end)
  else
    ChangeUIController(gcmp, "c1", 1)
    local newCount = controller.GetFireworksCount()
    local comboCount = controller.GetComboCount()
    if newCount > fireworksCount then
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/FX_minigame013_itemreflash.prefab")
      local holder = GetOrCreateHolder(uis.Main.Launch.root, "FIREWORKS_UPDATE_HOLDER")
      holder:SetXY(point.x, point.y)
      UIUtil.SetObjectToUI(effect, holder)
      LuaUtil.PlayEffect(effect)
      EffectUtil.SetAutoDestroyCallback(effect, function()
        holder:Dispose()
      end)
    end
    local bar = gcmp:GetChild("ItemProgressBar")
    local val = 100 * (comboCount / 7)
    if val > bar.value then
      bar:TweenValue(val, 0.3)
    else
      bar.value = val
    end
    UIUtil.SetText(gcmp, newCount, "NumberTxt")
    fireworksCount = newCount
    gcmp.onClick:Set(function()
      if not busy then
        Switch(controller.ITEM_TYPE.FIREWORKS)
      end
    end)
  end
end
local RefreshBottomItems = function()
  local itemlist = uis.Main.Launch.ItemList
  itemlist.numItems = 2
end
local PlaySwitchAnimation = function()
  local bead1 = uis.Main.Launch.Bead1.root
  local bead2 = uis.Main.Launch.Bead2.root
  local originScale = bead2.scale
  local originPosition = bead2.position
  local originRotation = bead2.rotation
  local angle = Vector2.SignedAngle(Vector2.up, Vector2(shootDirection.x, shootDirection.y))
  angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
  bead2:TweenMove(bead1.xy, 0.3)
  bead2:TweenRotate(-angle, 0.3)
  bead2:TweenScale(bead1.scale, 0.3):OnComplete(function()
    uis.Main.Launch.Bead1.root.visible = true
    uis.Main.Launch.c1Ctr.selectedIndex = 1
    bead2.scale = originScale
    bead2.position = originPosition
    bead2.rotation = originRotation
    RefreshCandidate()
    busy = false
  end)
end
local OnFinishedShooting = function()
  PlaySwitchAnimation()
  RefreshBottomItems()
end
local StartGame = function()
  local levelConfigs = Activity11_MiniGameData.GetOrLoadLevelConfigs()
  if levelIndex > #levelConfigs then
    levelConfig = levelConfigs[math.random(1, #levelConfigs)]
  else
    levelConfig = levelConfigs[levelIndex]
  end
  Activity11_MiniGameData.levelIndex = levelIndex
  busy = false
  buttonMode = false
  score = 0
  local parent = uis.Main.BoxRegion.root
  local global = parent:LocalToGlobal(Vector2(parent.width * 0.5, parent.height * 0.5))
  local center = Screen2WorldPosition(global)
  local min = Screen2WorldPosition(parent:LocalToGlobal(Vector2.zero))
  local max = Screen2WorldPosition(parent:LocalToGlobal(Vector2(parent.width, parent.height)))
  readyPoint = Screen2WorldPosition(uis.Main.Launch.Bead1.root:LocalToGlobal(Vector2.zero))
  local maxRow, maxCol, shootNum, balls = levelConfig.maxRow, levelConfig.maxCol, levelConfig.shootNum, levelConfig.balls
  controller.Initialize(maxRow, maxCol, shootNum, balls, center, max.x - min.x, -(max.y - min.y), OnUpdate, OnCreateItem, OnDestroyItem, OnBallEffectChanged, OnFinishedShooting, GetReadyPointFunc, OnGameOver)
  shootDirection = Vector2.up
  angleDelta = ANGLE_DELTA_DEFAULT
  RefreshCandidate()
  bombCount = 0
  fireworksCount = 0
  RefreshBottomItems()
end

function Activity11MiniGameWindow.ReInitData()
end

function Activity11MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity11MiniGameWindow.package, WinResConfig.Activity11MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    levelIndex = bridgeObj.argTable[1]
    uis = GetActivityDungeon1011_MiniGameStartWindowUis(contentPane)
    Activity11MiniGameWindow.UpdateInfo()
    Activity11MiniGameWindow.InitBtn()
  end)
end

function Activity11MiniGameWindow.UpdateInfo()
  local holder = uis.Main.BackGround.BackGroundHolder
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", holder)
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1011/MiniGame_1002"
  StartGame()
  local root = uis.Main.BoxRegion.root
  uis.Main.Launch.c1Ctr.selectedIndex = 1
  root.onTouchBegin:Set(function(context)
    context:CaptureTouch()
    if not busy then
      touching = true
    end
  end)
  root.onTouchMove:Set(function(context)
    if not busy then
      touching = true
    end
    local touchPoint = context.inputEvent.position
    local width, height = root.width, root.height
    local localPoint = root:GlobalToLocal(touchPoint)
    local result = localPoint.x >= 0 and width >= localPoint.x and localPoint.y >= 0 and height >= localPoint.y
    if not result then
      touching = false
    end
  end)
  root.onTouchEnd:Set(function(context)
    if busy or not touching then
      return
    end
    touching = false
    if controller.Shoot(shootDirection) then
      busy = true
      uis.Main.Launch.c1Ctr.selectedIndex = 0
      uis.Main.Launch.Bead1.root.visible = false
    end
  end)
  ChangeUIController(uis.Main.HandRegion.LeftBtn, "c1", 0)
  ChangeUIController(uis.Main.HandRegion.RightBtn, "c1", 1)
  uis.Main.HandRegion.LeftBtn.onTouchBegin:Set(function()
    buttonMode = true
    buttonDirection = 1
    angleDelta = ANGLE_DELTA_DEFAULT
  end)
  uis.Main.HandRegion.LeftBtn.onTouchEnd:Set(function()
    buttonDirection = 0
  end)
  uis.Main.HandRegion.RightBtn.onTouchBegin:Set(function()
    buttonMode = true
    angleDelta = ANGLE_DELTA_DEFAULT
    buttonDirection = -1
  end)
  uis.Main.HandRegion.RightBtn.onTouchEnd:Set(function()
    buttonDirection = 0
  end)
  uis.Main.HandRegion.ShootBtn.onClick:Set(function()
    if busy then
      return
    end
    if controller.Shoot(shootDirection) then
      busy = true
      uis.Main.Launch.c1Ctr.selectedIndex = 0
      uis.Main.Launch.Bead1.root.visible = false
    end
    buttonMode = false
  end)
  UIUtil.SetText(uis.Main.HandRegion.ShootBtn, T(20688))
  local itemlist = uis.Main.Launch.ItemList
  itemlist.itemRenderer = BottomItemRenderer
  RefreshBottomItems()
end

local gameId = 70441013

function Activity11MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(20685), {
      touchCallback = function()
        local info = Activity11_MiniGameData.GetMiniGameInfo(gameId)
        local remoteMap = info.extraCount
        local oldVal = remoteMap and remoteMap[1] or 0
        local map = {oldVal}
        Activity11_MiniGameService.MiniGameSubmitReq(map, score, math.ceil(controller.GetElapse()), function()
          UIMgr:CloseToWindow(WinResConfig.Activity11MiniGameChoiceWindow.name)
        end)
      end
    }, {})
  end)
  uis.Main.FunctionDetailsBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity11MiniGameExplainWindow.name)
  end)
  local bead1 = uis.Main.Launch.Bead1.root
  local bead2 = uis.Main.Launch.Bead2.root
  local pos1 = bead1.position
  local pos2 = bead2.position
  local scale1 = bead1.scale
  local scale2 = bead2.scale
  uis.Main.Launch.SwitchBtn.onClick:Set(function(context)
    if busy or IsUITransPlaying(uis.Main.Launch.root, "switch") then
      return
    end
    context:StopPropagation()
    if controller.GetRemainedShootCount() >= 1 then
      uis.Main.Launch.c1Ctr.selectedIndex = 0
      local rot1 = bead1.rotation
      local trans = PlayUITrans(uis.Main.Launch.root, "switch", function()
        uis.Main.Launch.c1Ctr.selectedIndex = 1
        bead1.position = pos1
        bead1.scale = scale1
        bead2.position = pos2
        bead2.scale = scale2
        controller.SwitchCandidateColor()
        RefreshCandidate()
      end)
      local duration = trans.totalDuration
      bead2:TweenRotate(bead1.rotation, duration):OnComplete(function()
        bead2.rotation = 0
      end)
      bead1:TweenRotate(0, duration):OnComplete(function()
        bead1.rotation = rot1
      end)
    end
  end)
end

function Activity11MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  controller.Release()
  if gameOverDelayTween then
    LeanTween.cancel(gameOverDelayTween)
  end
  if dotlines then
    for _, v in ipairs(dotlines) do
      ResourceManager.DestroyGameObject(v.cachedGameObject)
    end
  end
  dotlines = nil
  gameOverDelayTween = nil
end

function Activity11MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity11_MiniGame.RESET then
    local index = para
    if type(index) == "number" then
      local levelConfigs = Activity11_MiniGameData.GetOrLoadLevelConfigs()
      local numLevels = #levelConfigs
      if numLevels > levelIndex and index < numLevels then
        levelIndex = index + 1
      end
    end
    StartGame()
  end
end

return Activity11MiniGameWindow
