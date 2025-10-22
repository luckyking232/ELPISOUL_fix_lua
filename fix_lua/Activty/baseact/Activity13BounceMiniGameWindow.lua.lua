require("ActivityDungeon1013_MiniGameStartWindowByName")
local Activity13BounceMiniGameWindow = {}
local uis, contentPane
local gameId = 70441016
local MAX_SHOT_ANGLE = 70
local ANGLE_DELTA_DEFAULT = 0
local ANGLE_DELTA_ACC = 800
local TWINKLE_DURATION = 0.04
local controller = require("Activity13_BounceBallController")
local itemObjLookup, busy, touching, shootDirection, angleDelta, buttonDirection, buttonMode, dotline, points
local score = 0
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return newX, newY
end
local Screen2WorldPosition = function(global)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
  return position
end
local World2ScreenPosition = function(position)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(position)
  return Vector2(sp.x, Screen.height - sp.y)
end
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
local SyncItemPosition = function(item)
  local obj = itemObjLookup[item]
  if obj then
    local parent
    local itemType = item.itemType
    if itemType > 0 then
      parent = uis.Main.Box.root
      ChangeUIController(obj, "c1", itemType - 1)
    else
      parent = uis.Main.root
    end
    obj.xy = parent:GlobalToLocal(World2ScreenPosition(item.transform.position))
  end
end
local OnCreateItem = function(item)
  itemObjLookup = itemObjLookup or {}
  local itemType = item.itemType
  local parent, obj
  if itemType > 0 then
    parent = uis.Main.Box.root
    obj = UIMgr:CreateComponent("ActivityDungeon1013", "MiniStart_Item")
    ChangeUIController(obj, "c1", itemType - 1)
  else
    parent = uis.Main.root
    obj = UIMgr:CreateComponent("ActivityDungeon1013", "MiniStart_LaunchBall")
  end
  obj:SetPivot(0.5, 0.5, true)
  parent:AddChild(obj)
  obj.xy = parent:GlobalToLocal(World2ScreenPosition(item.transform.position))
  itemObjLookup[item] = obj
  UIUtil.SetText(obj:GetChild("ItemNumber"), item.number, "NumberTxt")
end
local OnDestroyItem = function(item, eliminate, collide)
  if itemObjLookup then
    local obj = itemObjLookup[item]
    itemObjLookup[item] = nil
    if collide then
      local effect = item.effect
      if effect then
        local container = uis.Main.Box.root
        if "BOOM_VERTICAL" == effect then
          local holder = GetOrCreateHolder(container, string.format("%s_BOOM_VERTICAL", tostring(item)))
          holder.xy = obj.xy
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_shu.prefab", holder, nil, true)
        elseif "BOOM_HORIZONTAL" == effect then
          local holder = GetOrCreateHolder(container, string.format("%s_BOOM_HORIZONTAL", tostring(item)))
          holder.xy = obj.xy
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_heng.prefab", holder, nil, true)
        elseif "BOOM_CROSS" == effect then
          local holder1 = GetOrCreateHolder(container, string.format("%s_BOOM_HORIZONTAL", tostring(item)))
          local holder2 = GetOrCreateHolder(container, string.format("%s_BOOM_VERTICAL", tostring(item)))
          holder1.xy = obj.xy
          holder2.xy = obj.xy
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_heng.prefab", holder1, nil, true)
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_shu.prefab", holder2, nil, true)
        end
      end
    end
    if obj then
      obj:Dispose()
    end
  end
end
local OnGameOver = function(win, elapse)
  Activity13_MiniGameService.MiniGameSubmitReq(gameId, {}, score, math.floor(elapse), function()
    OpenWindow(WinResConfig.Activity13BounceMiniGameSubmitWindow.name, nil, score, win)
  end)
end
local Twinkle = function(itemObj)
  itemObj:TweenScale(0.8 * Vector2.one, TWINKLE_DURATION):OnComplete(function()
    itemObj:TweenScale(Vector2.one, TWINKLE_DURATION)
  end)
end
local OnCollision = function(item)
  if itemObjLookup then
    local itemObj = itemObjLookup[item]
    if itemObj and not itemObj.isDisposed then
      score = score + 1
      Twinkle(itemObj)
    end
  end
end
local GetShootPoint = function()
  local global = uis.Main.Launch.Staff.Effect1Holder:LocalToGlobal(Vector2.zero)
  local result = Screen2WorldPosition(global)
  return Vector3(result.x, result.y)
end
local SetStaffAngle = function(angle)
  local launch = uis.Main.Launch
  local staff = launch.Staff.root
  staff.visible = true
  staff.rotation = -angle - 180
  local xy = launch.Staff.Effect1Holder:TransformPoint(Vector2.zero, launch.root)
  launch.Ball.root.xy = xy - launch.Ball.root.size * 0.5
end
local UpdateAuxiliaryline = function(direction)
  local angle = Vector2.SignedAngle(Vector2.down, Vector2(direction.x, direction.y))
  angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
  local nx, ny = rotatePointAround(0, -1, angle, 0, 0)
  direction.x = nx
  direction.y = ny
  SetStaffAngle(angle)
  local readyPoint = GetShootPoint()
  points = points or {}
  table.clear(points)
  if not dotline then
    dotline = LoadPathRenderer("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame013/bubbleshooter_dotline.prefab", 100)
    local holder = GetOrCreateHolder(uis.Main.Box.root, string.format("DOTLINE_HOLDER"))
    UIUtil.SetObjectToUI(dotline.cachedGameObject, holder)
  end
  local normalized = direction.normalized
  controller.CalculateTrack(normalized, 2, 40, points)
  local len = #points
  if len > 0 then
    dotline:ClearPositionsBuffer()
    dotline:AddPositionToBuffer(readyPoint)
    for i = 1, len do
      dotline:AddPositionToBuffer(Vector3(points[i].x + readyPoint.x, points[i].y + readyPoint.y))
    end
    dotline.cachedGameObject:SetActive(true)
    dotline:ApplyPositionsBuffer(false)
  end
end
local OnUpdate = function()
  if not busy then
    if 0 ~= buttonDirection then
      local delta = buttonDirection * angleDelta * Time.deltaTime
      local angle = Vector2.SignedAngle(Vector2.down, shootDirection) + delta
      angle = (angle >= 0 and 1 or -1) * math.min(MAX_SHOT_ANGLE, math.abs(angle))
      local nx, ny = rotatePointAround(0, -1, angle, 0, 0)
      shootDirection.x = nx
      shootDirection.y = ny
      angleDelta = angleDelta + ANGLE_DELTA_ACC * Time.deltaTime
    elseif touching then
      buttonMode = false
      local touchPoint = Stage.inst.touchPosition
      local worldPosition = Screen2WorldPosition(touchPoint)
      local global = uis.Main.Launch.Staff.root:LocalToGlobal(Vector2.zero)
      local origin = Screen2WorldPosition(global)
      shootDirection = Vector2(worldPosition.x - origin.x, worldPosition.y - origin.y)
      UpdateAuxiliaryline(shootDirection)
    end
  end
  if buttonMode then
    UpdateAuxiliaryline(shootDirection)
  elseif not touching and dotline then
    dotline.cachedGameObject:SetActive(false)
  end
  if itemObjLookup then
    for item, obj in pairs(itemObjLookup) do
      SyncItemPosition(item)
      if item.itemType > 0 then
        UIUtil.SetText(obj:GetChild("ItemNumber"), item.number, "NumberTxt")
      end
    end
  end
  local scoreText = T(20758, score)
  local numberText = T(20759, controller.GetLaunchedCount())
  uis.Main.Launch.Info1.WordTxt.text = scoreText
  uis.Main.Launch.Info2.WordTxt.text = numberText
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  controller.Release()
  if dotline then
    ResourceManager.DestroyGameObject(dotline.cachedGameObject)
  end
  dotline = nil
end
local StartGame = function()
  OpenWindow(WinResConfig.Activity13BounceMiniGameTipsWindow.name)
  Release()
  score = 0
  buttonDirection = 0
  shootDirection = Vector2.down
  SetStaffAngle(0)
  angleDelta = ANGLE_DELTA_DEFAULT
  local container = uis.Main.Box.root
  local min = Screen2WorldPosition(container:LocalToGlobal(Vector2.zero))
  local max = Screen2WorldPosition(container:LocalToGlobal(Vector2(container.width, container.height)))
  local center = (min + max) * 0.5
  local width = max.x - min.x
  local height = min.y - max.y
  local gridObj = container:GetChildAt(0)
  controller.SetGridSize(gridObj.width * 0.01, gridObj.height * 0.01)
  local obj = UIMgr:CreateObject("ActivityDungeon1013", "MiniStart_Item")
  for i = 1, obj.numChildren do
    local child = obj:GetChildAt(i - 1)
    if child.asImage then
      controller.SetColliderScale(child.scale.x * 0.95)
      obj:Dispose()
      break
    end
  end
  controller.Initialize(center, width, height, OnCreateItem, OnDestroyItem, OnCollision, OnGameOver)
  controller.SetGetShootPointFunc(GetShootPoint)
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end

function Activity13BounceMiniGameWindow.ReInitData()
end

function Activity13BounceMiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13BounceMiniGameWindow.package, WinResConfig.Activity13BounceMiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniGameStartWindowUis(contentPane)
    Activity13BounceMiniGameWindow.UpdateInfo()
    Activity13BounceMiniGameWindow.InitBtn()
  end)
end

function Activity13BounceMiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1013/MiniGame_1001"
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
  local container = uis.Main.Box.root
  container.onTouchBegin:Set(function(context)
    context:CaptureTouch()
    if not busy then
      touching = true
    end
  end)
  container.onTouchMove:Set(function(context)
    if not busy then
      touching = true
    end
    local touchPoint = context.inputEvent.position
    local width, height = container.width, container.height
    local localPoint = container:GlobalToLocal(touchPoint)
    local result = localPoint.x >= 0 and width >= localPoint.x and localPoint.y >= 0 and height >= localPoint.y
    if not result then
      touching = false
    end
  end)
  container.onTouchEnd:Set(function()
    if busy or not touching then
      return
    end
    touching = false
    if controller.PrepareForLaunch(shootDirection) then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_shot")
    end
  end)
  StartGame()
end

function Activity13BounceMiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(20533), {
      touchCallback = function()
        local elapse = controller.GetElapse()
        Activity13_MiniGameService.MiniGameSubmitReq(gameId, {}, score, math.floor(elapse))
        UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameWindow.name)
      end
    }, {})
  end)
  local handleRegion = uis.Main.HandRegion
  ChangeUIController(handleRegion.LeftBtn, "c1", 0)
  ChangeUIController(handleRegion.RightBtn, "c1", 1)
  handleRegion.LeftBtn.onTouchBegin:Set(function()
    buttonMode = true
    buttonDirection = -1
    angleDelta = ANGLE_DELTA_DEFAULT
  end)
  handleRegion.LeftBtn.onTouchEnd:Set(function()
    buttonDirection = 0
  end)
  handleRegion.RightBtn.onTouchBegin:Set(function()
    buttonMode = true
    angleDelta = ANGLE_DELTA_DEFAULT
    buttonDirection = 1
  end)
  handleRegion.RightBtn.onTouchEnd:Set(function()
    buttonDirection = 0
  end)
  handleRegion.ShootBtn.onClick:Set(function()
    if busy then
      return
    end
    if controller.PrepareForLaunch(shootDirection) then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_shot")
    end
    buttonMode = false
  end)
  UIUtil.SetText(handleRegion.ShootBtn, T(20688))
end

function Activity13BounceMiniGameWindow.OnClose()
  Release()
  uis = nil
  contentPane = nil
end

function Activity13BounceMiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity13_MiniGame.RESET then
    StartGame()
  end
end

return Activity13BounceMiniGameWindow
