local DEFAULT_GRID_WIDTH = 0.9
local DEFAULT_GRID_HEIGHT = 0.7
local DEFAULT_SHOOT_NUM = 3
local LAUNCH_INTERVAL = 0.1
local AUTO_INCREASE_COUNT = 0
local EFFECT_INCREASE_COUNT = 1
local BALL_RADIUS = 0.15
local BALL_VELOCITY = 15
local GRAVITY_SCALE = 1
local MIN_VELOCITY = 1
local DESTROY_LESS_THAN_MIN_VELOCITY_TIME = 3
local COLLIDER_SCALE = 0.57
local HORIZONTAL_SPAWN_GAP = 1
local ITEM_COLLIDE_LOWER_LIMIT = 20
local ITEM_COLLIDE_UPPER_LIMIT = 40
local ITEM_COLLIDE_ADDITION_STEP = 1
local ITEM_COLLIDE_ADDITION_COLLIDE_TIMES = 1
local PER_ROW_MAX_EMPTY_COUNT = 2
local MAX_CONTINUOUS_ROW = 1
local ITEM_RANDOM_OFFSET_X = 0.1
local ITEM_RANDOM_OFFSET_Y = 0.1
local BALL_BOUNCINESS = 0.8
local SPAWN_START_ROW = 5
local ON_STAY_COLLISION_INTERVAL = 0.5
local WALL_TAG = "ACTIVITY13_BOUNCE_BALL_WALL"
local BOUNCE_BALL_CONFIGS
local physics2D = CS.UnityEngine.Physics2D
local columns, rows, worldCenter, worldWidth, worldHeight, items, grids, walls, balls, enableMoveDownwards, gameOver, launch, launchableCount, tempLaunchableCount, launchedTimer, launchedCount, launchedDirection, tweeners, elapse, remainedRows, getShootPositionFunc, __oncreateitem, __ondestroyitem, __oncollision, __ongameover, collideTimes, step, OnCollision, OnCollisionEnter, OnCollisionStay, OnCollisionExit
local ITEM_EFFECT = {
  INCREASE_LAUNCHED_COUNT = "INCREASE_LAUNCHED_COUNT",
  BOOM_HORIZONTAL = "BOOM_HORIZONTAL",
  BOOM_VERTICAL = "BOOM_VERTICAL",
  BOOM_CROSS = "BOOM_CROSS"
}
local ITEM_PROBABILITY = {
  NONE = 0,
  ITEM = 0.892,
  ADD_BULLET = 0.06,
  BOMB_CROSS = 0.008,
  BOMB_VERTICAL = 0.02,
  BOMB_HORIZONTAL = 0.02
}
ITEM_PROBABILITY[1] = "NONE"
ITEM_PROBABILITY[2] = "ITEM"
ITEM_PROBABILITY[3] = "ADD_BULLET"
ITEM_PROBABILITY[4] = "BOMB_CROSS"
ITEM_PROBABILITY[5] = "BOMB_VERTICAL"
ITEM_PROBABILITY[6] = "BOMB_HORIZONTAL"
local Scale = function(val)
  local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
  return scale * val
end
local FindItemByGo = function(go)
  for i, v in ipairs(items) do
    if v.go == go then
      return v
    end
  end
end
local GetPosition = function(gridX, gridY)
  local gridWidth, gridHeight = Scale(DEFAULT_GRID_WIDTH), Scale(DEFAULT_GRID_HEIGHT)
  local startX = worldCenter.x - worldWidth * 0.5 + (worldWidth - columns * gridWidth) * 0.5
  local startY = worldCenter.y + worldHeight * 0.5
  local px = startX + (gridX - 1) * gridWidth + gridWidth * 0.5
  local py = startY - (gridY - 1) * gridHeight - gridHeight * 0.5
  return px, py
end
local SetGridSize = function(width, height)
  DEFAULT_GRID_WIDTH = width
  DEFAULT_GRID_HEIGHT = height
end
local SetColliderScale = function(scale)
  COLLIDER_SCALE = scale
end
local new_vec2_list = CS.System.Collections.Generic.List(CS.UnityEngine.Vector2)
local cs_vec2_list
local collisionUtils = CS.CollisionUtils
local CreateItem = function(itemType, gridX, gridY, number)
  local inst = {
    itemType = itemType,
    gridX = gridX,
    gridY = gridY,
    number = number,
    effect = false
  }
  local go = CS.UnityEngine.GameObject(string.format("ITEM_%s_[%s,%s]", itemType, gridX, gridY))
  inst.go = go
  inst.transform = go.transform
  local collider = go:AddComponent(typeof(CS.UnityEngine.PolygonCollider2D))
  if not cs_vec2_list then
    cs_vec2_list = new_vec2_list(32)
  end
  cs_vec2_list:Clear()
  local config = BOUNCE_BALL_CONFIGS[itemType]
  for _, v in ipairs(config.vertices) do
    local scaledVert = Scale(Vector2(v.x, v.y) * COLLIDER_SCALE)
    cs_vec2_list:Add(scaledVert)
  end
  collider.points = cs_vec2_list:ToArray()
  local px, py = GetPosition(gridX, gridY)
  local offsetX = (math.random(0, 2000) - 1000) / 1000 * ITEM_RANDOM_OFFSET_X
  local offsetY = (math.random(0, 2000) - 1000) / 1000 * ITEM_RANDOM_OFFSET_Y
  go.transform.position = Vector3(px + offsetX, py + offsetY)
  inst.offsetX = offsetX
  inst.offsetY = offsetY
  if 10 == itemType then
    inst.effect = ITEM_EFFECT.INCREASE_LAUNCHED_COUNT
    inst.number = 1
  elseif 11 == itemType then
    inst.effect = ITEM_EFFECT.BOOM_CROSS
    inst.number = 1
  elseif 12 == itemType then
    inst.effect = ITEM_EFFECT.BOOM_HORIZONTAL
    inst.number = 1
  elseif 13 == itemType then
    inst.effect = ITEM_EFFECT.BOOM_VERTICAL
    inst.number = 1
  end
  if type(__oncreateitem) == "function" then
    __oncreateitem(inst)
  end
  inst.collider = collider
  table.insert(items, inst)
  return inst
end
local DestroyItem = function(item, eliminate, collide)
  local i = table.keyof(items, item)
  if type(i) == "number" then
    table.remove(items, i)
  end
  if type(__ondestroyitem) == "function" then
    __ondestroyitem(item, eliminate, collide)
  end
  local go = item.go
  collisionUtils.RemoveTriggerEnter2DListener(go, OnCollision)
  collisionUtils.RemoveCollisionEnter2DListener(go, OnCollisionEnter)
  collisionUtils.RemoveCollisionStay2DListener(go, OnCollisionStay)
  collisionUtils.RemoveCollisionExit2DListener(go, OnCollisionExit)
  CS.UnityEngine.Object.Destroy(go)
  if 0 == item.itemType then
    local k = table.keyof(balls, item)
    if k then
      table.remove(balls, k)
    end
  end
  for k, _ in pairs(item) do
    item[k] = nil
  end
end
local sharedPhysicsMaterial
local CreateBall = function(x, y)
  local inst = {itemType = 0}
  local go = CS.UnityEngine.GameObject("BALL")
  local body = go:AddComponent(typeof(CS.UnityEngine.Rigidbody2D))
  body.gravityScale = GRAVITY_SCALE
  local collider = go:AddComponent(typeof(CS.UnityEngine.CircleCollider2D))
  collider.radius = Scale(BALL_RADIUS) * 0.66
  inst.go = go
  inst.transform = go.transform
  inst.collider = collider
  inst.body = body
  inst.transform.position = Vector3(x, y)
  body.collisionDetectionMode = CS.UnityEngine.CollisionDetectionMode2D.Continuous
  body.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezeRotation
  body.interpolation = CS.UnityEngine.RigidbodyInterpolation2D.Interpolate
  body.sleepMode = CS.UnityEngine.RigidbodySleepMode2D.NeverSleep
  collisionUtils.AddTriggerEnter2DListener(go, OnCollision)
  collisionUtils.AddCollisionEnter2DListener(go, OnCollisionEnter)
  collisionUtils.AddCollisionStay2DListener(go, OnCollisionStay)
  collisionUtils.AddCollisionExit2DListener(go, OnCollisionExit)
  if not sharedPhysicsMaterial then
    sharedPhysicsMaterial = CS.UnityEngine.PhysicsMaterial2D()
    sharedPhysicsMaterial.friction = 0
    sharedPhysicsMaterial.bounciness = BALL_BOUNCINESS
  end
  collider.sharedMaterial = sharedPhysicsMaterial
  if type(__oncreateitem) == "function" then
    __oncreateitem(inst)
  end
  table.insert(items, inst)
  return inst
end
local CreateWall = function(x, y, width, height)
  local go = CS.UnityEngine.GameObject()
  go.name = WALL_TAG
  local collider = go:AddComponent(typeof(CS.UnityEngine.BoxCollider2D))
  local transform = go.transform
  transform.position = Vector3(x, y, 0)
  collider.size = Vector2(width, height)
  table.insert(walls, go)
end
local CollectVertical = function(item, buffer)
  buffer = buffer or {}
  local gridX, _ = item.gridX, item.gridY
  for y = 1, rows do
    for _, v in ipairs(items) do
      if not table.keyof(buffer, v) and v.gridX == gridX and v.gridY == y then
        table.insert(buffer, v)
      end
    end
  end
  return buffer
end
local CollectHorizontal = function(item, buffer)
  buffer = buffer or {}
  local _, gridY = item.gridX, item.gridY
  for x = 1, columns do
    for _, v in ipairs(items) do
      if not table.keyof(buffer, v) and v.gridY == gridY and v.gridX == x then
        table.insert(buffer, v)
      end
    end
  end
  return buffer
end

function OnCollision(go, other)
  local ball = FindItemByGo(go)
  if ball then
    physics2D.IgnoreCollision(ball.collider, walls[3]:GetComponent(typeof(CS.UnityEngine.Collider2D)), false)
    local item = FindItemByGo(other.gameObject)
    if item then
      local effect = item.effect
      if effect then
        local buffer
        if effect == ITEM_EFFECT.BOOM_CROSS then
          buffer = CollectHorizontal(item, CollectVertical(item))
        elseif effect == ITEM_EFFECT.BOOM_VERTICAL then
          buffer = CollectVertical(item)
        elseif effect == ITEM_EFFECT.BOOM_HORIZONTAL then
          buffer = CollectHorizontal(item)
        elseif effect == ITEM_EFFECT.INCREASE_LAUNCHED_COUNT then
          tempLaunchableCount = (tempLaunchableCount or 0) + EFFECT_INCREASE_COUNT
        end
        if buffer then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_explo")
          for _, v in ipairs(buffer) do
            v.number = math.max(0, v.number - 1)
            if v.number <= 0 then
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_xiaochu")
              local collide = v == item
              DestroyItem(v, true, collide)
            end
          end
        else
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_xiaochu")
          DestroyItem(item, true, true)
        end
      else
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_col")
        item.number = math.max(0, item.number - 1)
        if type(__oncollision) == "function" then
          __oncollision(item)
        end
        if item.number <= 0 then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_xiaochu")
          DestroyItem(item, true, true)
        end
      end
      collideTimes = collideTimes + 1
    else
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_xiuzheng_col")
    end
  end
end

function OnCollisionEnter(go, other)
  OnCollision(go, other)
  local ball = FindItemByGo(go)
  if FindItemByGo(other.gameObject) then
    ball._stayTimer = 0
  end
end

function OnCollisionStay(go, other)
  local ball = FindItemByGo(go)
  if ball and FindItemByGo(other.gameObject) then
    ball._stayTimer = (ball._stayTimer or 0) + Time.fixedDeltaTime
    if ball._stayTimer >= ON_STAY_COLLISION_INTERVAL then
      ball._stayTimer = 0
      OnCollision(go, other)
    end
  end
end

function OnCollisionExit(go, other)
  local ball = FindItemByGo(go)
  if ball and FindItemByGo(other.gameObject) then
    ball._stayTimer = 0
  end
end

local cross = function(x0, y0, x1, y1)
  if not x1 and not y1 and x0 and y0 then
    local lhs, rhs = x0, y0
    x0 = lhs.x
    y0 = lhs.y
    x1 = rhs.x
    y1 = rhs.y
  end
  return x0 * y1 - y0 * x1
end
local epsilon = 0.001
local Intersects = function(vert0, vert1, p, dir)
  local d0x, d0y = vert1.x - vert0.x, vert1.y - vert0.y
  local d1x, d1y = dir.x, dir.y
  local demo = cross(d0x, d0y, d1x, d1y)
  if math.abs(demo) < epsilon then
    return false
  end
  local diffx, diffy = p.x - vert0.x, p.y - vert0.y
  local t1 = cross(diffx, diffy, d1x, d1y) / demo
  if t1 >= 0 and t1 <= 1 then
    return true, vert0 + (vert1 - vert0) * t1
  end
  return false
end
local dl = CS.UnityEngine.Debug.DrawLine
local Raycast = function(direction, hitpoints)
  hitpoints = hitpoints or {}
  local shootPoint = getShootPositionFunc()
  local origin = Vector2(shootPoint.x, shootPoint.y)
  local radius = Scale(BALL_RADIUS)
  local hitInfo = physics2D.Raycast(Vector2(shootPoint.x, shootPoint.y), direction)
end
local PrepareForLaunch = function(direction)
  if gameOver then
    return false
  end
  if tweeners and #tweeners > 0 then
    return false
  end
  if type(launchedCount) ~= "number" or launchedCount <= 0 then
    return false
  end
  for _, v in ipairs(items) do
    if 0 == v.itemType then
      return false
    end
  end
  launch = true
  launchedDirection = direction
  tempLaunchableCount = 0
  launchedTimer = 0
  return true
end
local Launch = function(direction)
  local shootPoint = getShootPositionFunc()
  local inst = CreateBall(shootPoint.x, shootPoint.y)
  physics2D.IgnoreCollision(inst.collider, walls[3]:GetComponent(typeof(CS.UnityEngine.Collider2D)), true)
  local velocity = direction.normalized * BALL_VELOCITY
  inst.body.velocity = velocity
  for _, other in ipairs(balls) do
    physics2D.IgnoreCollision(inst.collider, other.collider, true)
  end
  table.insert(balls, inst)
end
local CalculateS = function(v0, a, t, clamp)
  if v0 * a < 0 and clamp then
    t = math.min(t, v0 / -a)
  end
  return v0 * t + 0.5 * a * t ^ 2
end
local CalculateTrack = function(direction, time, smoothness, buffer)
  buffer = buffer or {}
  local normalized = direction.normalized * BALL_VELOCITY
  local horizontalVel = normalized.x
  local verticalVel = normalized.y
  local gravity = physics2D.gravity.y
  for i = 1, smoothness do
    local t = i / smoothness * time
    local x = CalculateS(horizontalVel, 0, t, true)
    local y = CalculateS(verticalVel, gravity, t)
    table.insert(buffer, Vector3(x, y, 0))
  end
  return buffer
end
local CheckGameOver = function()
  local anyItems = false
  for _, item in ipairs(items) do
    if item.itemType > 0 then
      anyItems = true
      break
    end
  end
  if anyItems then
    for _, item in ipairs(items) do
      if item.itemType > 0 and item.gridY <= 0 then
        gameOver = true
        if type(__ongameover) == "function" then
          __ongameover(false, elapse)
        end
        break
      end
    end
  else
    gameOver = true
    if type(__ongameover) == "function" then
      __ongameover(true, elapse)
    end
  end
end
local MoveDownwards = function(numRows)
  local flag = false
  for _, item in ipairs(items) do
    if item.itemType > 0 then
      flag = true
      item.gridY = item.gridY - numRows
      item.__position = item.transform.position
    end
  end
  tweeners = tweeners or {}
  if tweeners then
    for i, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
  end
  table.clear(tweeners)
  if flag then
    local tweenId
    tweenId = LeanTween.value(0, 1, 0.5):setOnUpdate(function(val)
      for _, item in ipairs(items) do
        if item.itemType > 0 then
          local px, py = GetPosition(item.gridX, item.gridY)
          item.transform.position = Vector3.Lerp(item.__position, Vector3(px + item.offsetX, py + item.offsetY), val)
        end
      end
    end):setOnComplete(function()
      for _, item in ipairs(items) do
        if item.itemType > 0 then
          local px, py = GetPosition(item.gridX, item.gridY)
          item.transform.position = Vector3(px + item.offsetX, py + item.offsetY)
        end
      end
      local i = table.keyof(tweeners, tweenId)
      if i then
        table.remove(tweeners, i)
      end
      CheckGameOver()
    end).id
    table.insert(tweeners, tweenId)
  else
    CheckGameOver()
  end
end
local RandomItemType = function(guarantee)
  local percent = math.random(1, 1000) / 1000
  local probability = 0
  for i, k in ipairs(ITEM_PROBABILITY) do
    probability = probability + ITEM_PROBABILITY[k]
    if percent <= probability then
      if "NONE" == k and not guarantee then
        return false
      elseif "ITEM" == k then
        return math.random(1, 9)
      elseif "ADD_BULLET" == k then
        return 10
      elseif "BOMB_CROSS" == k then
        return 11
      elseif "BOMB_VERTICAL" == k then
        return 13
      elseif "BOMB_HORIZONTAL" == k then
        return 12
      end
    end
  end
end
local HasContinuousItemAtSameColumn = function(row, col, count)
  local result = true
  local startRow, endRow = row - 1, row - count
  for y = startRow, endRow, -1 do
    local flag = false
    for _, v in ipairs(items) do
      if v.itemType > 0 and v.gridY == y and v.gridX == col then
        flag = true
        break
      end
    end
    if not flag then
      result = false
      break
    end
  end
  return result
end
local AutoCreateLastRowItems = function()
  if remainedRows > 0 then
    local y = rows + 1
    local emptyNum = 0
    local x = 1
    while x <= columns do
      local randomType = RandomItemType(emptyNum >= PER_ROW_MAX_EMPTY_COUNT)
      if randomType and not HasContinuousItemAtSameColumn(y, x, MAX_CONTINUOUS_ROW) then
        local addition = math.floor(step / ITEM_COLLIDE_ADDITION_COLLIDE_TIMES) * ITEM_COLLIDE_ADDITION_STEP
        local scale = math.random(ITEM_COLLIDE_LOWER_LIMIT, ITEM_COLLIDE_UPPER_LIMIT + Mathf.FloorToInt(addition)) / 10
        local count = Mathf.CeilToInt(launchableCount * scale)
        CreateItem(randomType, x, y, count)
        x = x + HORIZONTAL_SPAWN_GAP
      else
        emptyNum = emptyNum + 1
      end
      x = x + 1
    end
    remainedRows = remainedRows - 1
  end
end
local DestroyOutOfBoundsItem = function()
  if items then
    local bottomBoundary = worldCenter.y - worldHeight
    local leftBoundary = worldCenter.x - worldWidth
    local rightBoundary = worldCenter.x + worldWidth
    local len = #items
    for i = len, 1, -1 do
      local item = items[i]
      local collider = item.collider
      local bounds = collider.bounds
      if bottomBoundary > bounds.max.y or leftBoundary > bounds.max.x or rightBoundary < bounds.min.x then
        DestroyItem(item)
      end
    end
  end
end
local OnUpdate = function()
  elapse = (elapse or 0) + Time.deltaTime
  DestroyOutOfBoundsItem()
  if launch then
    if type(launchedCount) == "number" and launchedCount > 0 then
      launchedTimer = launchedTimer + Time.deltaTime
      if launchedTimer >= LAUNCH_INTERVAL then
        launchedTimer = launchedTimer - LAUNCH_INTERVAL
        Launch(launchedDirection)
        launchedCount = launchedCount - 1
      end
    else
      local len = #balls
      if 0 == len then
        launch = false
        launchableCount = launchableCount + AUTO_INCREASE_COUNT
        launchedCount = launchableCount + (tempLaunchableCount or 0)
        enableMoveDownwards = true
      end
    end
  end
  if enableMoveDownwards then
    local flag = true
    for i, v in ipairs(items) do
      if 0 == v.itemType then
        flag = false
      end
    end
    if flag then
      step = step + 1
      AutoCreateLastRowItems()
      MoveDownwards(1)
      enableMoveDownwards = false
    end
  end
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  grids = nil
  if items then
    local len = #items
    for i = len, 1, -1 do
      DestroyItem(items[i])
    end
  end
  if walls then
    for i, v in ipairs(walls) do
      CS.UnityEngine.Object.DestroyImmediate(v)
    end
  end
  if tweeners then
    for i, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
  end
  items = nil
  balls = nil
  walls = nil
  tweeners = nil
end
local Initialize = function(center, width, height, onCreateItem, onDestroyItem, onCollision, onGameOver)
  Release()
  BOUNCE_BALL_CONFIGS = Json.decode(require("Activity13_BounceBallConfigs"))
  worldCenter = center
  worldWidth = width
  worldHeight = height
  __oncreateitem = onCreateItem
  __ondestroyitem = onDestroyItem
  __oncollision = onCollision
  __ongameover = onGameOver
  items = {}
  walls = {}
  balls = {}
  step = 0
  elapse = 0
  collideTimes = 0
  tempLaunchableCount = 0
  launch = false
  gameOver = false
  launchableCount = DEFAULT_SHOOT_NUM
  launchedCount = launchableCount
  local gridWidth, gridHeight = Scale(DEFAULT_GRID_WIDTH), Scale(DEFAULT_GRID_HEIGHT)
  rows = Mathf.RoundToInt(worldHeight / gridHeight)
  columns = Mathf.RoundToInt(worldWidth / gridWidth)
  local wallWidth, wallHeight = 5, height
  CreateWall(center.x - width * 0.5 - wallWidth * 0.5, center.y, wallWidth, wallHeight * 1.1)
  CreateWall(center.x + width * 0.5 + wallWidth * 0.5, center.y, wallWidth, wallHeight * 1.1)
  CreateWall(center.x, center.y + wallHeight * 0.5 + height * 0.5, width * 1.1, wallHeight)
  remainedRows = 9999999999
  local startRow = SPAWN_START_ROW
  for y = startRow, rows do
    if remainedRows <= 0 then
      break
    end
    local emptyNum = 0
    local x = 1
    while x <= columns do
      local randomType = RandomItemType(emptyNum >= PER_ROW_MAX_EMPTY_COUNT)
      if randomType and not HasContinuousItemAtSameColumn(y, x, MAX_CONTINUOUS_ROW) then
        local addition = math.floor(step / ITEM_COLLIDE_ADDITION_COLLIDE_TIMES) * ITEM_COLLIDE_ADDITION_STEP
        local scale = math.random(ITEM_COLLIDE_LOWER_LIMIT, ITEM_COLLIDE_UPPER_LIMIT + Mathf.FloorToInt(addition)) / 10
        local count = Mathf.CeilToInt(launchableCount * scale)
        CreateItem(randomType, x, y, count)
        x = x + HORIZONTAL_SPAWN_GAP
      else
        emptyNum = emptyNum + 1
      end
      x = x + 1
    end
    remainedRows = remainedRows - 1
  end
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local SetGetShootPointFunc = function(func)
  getShootPositionFunc = func
end
local GetLaunchedCount = function()
  return launchedCount
end
local GetElapse = function()
  return elapse
end
return {
  Initialize = Initialize,
  Release = Release,
  SetGridSize = SetGridSize,
  SetColliderScale = SetColliderScale,
  Raycast = Raycast,
  PrepareForLaunch = PrepareForLaunch,
  SetGetShootPointFunc = SetGetShootPointFunc,
  CalculateTrack = CalculateTrack,
  GetLaunchedCount = GetLaunchedCount,
  GetElapse = GetElapse
}
