local TRAY_WIDTH, TRAY_HEIGHT = 0.8, 0.6
local ITEM_WIDTH, ITEM_HEIGHT = 0.7, 0.28
local BG_MOVE_SPEED = 0.5
local CAMERA_MOVE_SPEED = 2
local DEFAULT_HP = 3
local MAX_HORIZONTAL_OFFSET_RATIO = 0.02
local BOUNCE_DIST = 0.12
local LEFT_MARGIN = 0.5
local RIGHT_MARGIN = 0.5
local MAX_COUNT_IN_VIEW = 8
local PHASE_CONFIG = {
  [1] = {
    count = 15,
    dropped_speed_min = 4,
    dropped_speed_max = 4,
    spawn_interval = 0.4,
    spawn_interval_disturb = 1.0,
    transition_time = 3
  },
  [2] = {
    count = 25,
    dropped_speed_min = 4.5,
    dropped_speed_max = 4.5,
    spawn_interval = 0.4,
    spawn_interval_disturb = 0.9,
    transition_time = 3
  },
  [3] = {
    count = 30,
    dropped_speed_min = 5,
    dropped_speed_max = 5,
    spawn_interval = 0.35,
    spawn_interval_disturb = 0.9,
    transition_time = 3
  },
  [4] = {
    count = 35,
    dropped_speed_min = 5.5,
    dropped_speed_max = 5.5,
    spawn_interval = 0.35,
    spawn_interval_disturb = 0.8,
    transition_time = 2.5
  },
  [5] = {
    count = 40,
    dropped_speed_min = 6,
    dropped_speed_max = 6,
    spawn_interval = 0.3,
    spawn_interval_disturb = 0.8,
    transition_time = 2.5
  },
  [6] = {
    count = 45,
    dropped_speed_min = 6.5,
    dropped_speed_max = 6.5,
    spawn_interval = 0.3,
    spawn_interval_disturb = 0.7,
    transition_time = 2.5
  },
  [7] = {
    count = 50,
    dropped_speed_min = 6.5,
    dropped_speed_max = 6.5,
    spawn_interval = 0.25,
    spawn_interval_disturb = 0.7,
    transition_time = 2.5
  },
  [8] = {
    count = 50,
    dropped_speed_min = 7,
    dropped_speed_max = 7,
    spawn_interval = 0.25,
    spawn_interval_disturb = 0.6,
    transition_time = 2.5
  },
  [9] = {
    count = 50,
    dropped_speed_min = 7.5,
    dropped_speed_max = 7.5,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.6,
    transition_time = 2.5
  },
  [10] = {
    count = 50,
    dropped_speed_min = 8,
    dropped_speed_max = 8,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.5,
    transition_time = 2.5
  },
  [11] = {
    count = 50,
    dropped_speed_min = 8,
    dropped_speed_max = 8,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.5,
    transition_time = 2.5
  },
  [12] = {
    count = 50,
    dropped_speed_min = 8,
    dropped_speed_max = 8,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.5,
    transition_time = 2.5
  },
  [13] = {
    count = 50,
    dropped_speed_min = 8.5,
    dropped_speed_max = 8.5,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.4,
    transition_time = 2.5
  },
  [14] = {
    count = 50,
    dropped_speed_min = 8.5,
    dropped_speed_max = 8.5,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.4,
    transition_time = 2.5
  },
  [15] = {
    count = 50,
    dropped_speed_min = 8.5,
    dropped_speed_max = 8.5,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.4,
    transition_time = 2.5
  },
  [16] = {
    count = 50,
    dropped_speed_min = 9,
    dropped_speed_max = 9,
    spawn_interval = 0.2,
    spawn_interval_disturb = 0.4,
    transition_time = 2.5
  }
}
local phase, phaseDroppedCount, phaseTimer, hp, worldCenter, worldWidth, worldHeight, spawnTimer, tray, itemIndex, droppedItems, linkedItems, pause, elapse, moveDist, waitforseconds
local collisionUtils = CS.CollisionUtils
local __oncreate, __ondestroy, __onupdate, __oncaught, __ongameover
local AdaptScale = function(value)
  return UIContentScaler.scaleFactor * Stage.inst.scaleX * value * 100
end
local MovePosition = function(px, interpolation)
  if hp <= 0 or pause > 0 then
    return
  end
  local len = #linkedItems
  local inst
  if len > 0 then
    inst = linkedItems[len]
  else
    inst = tray
  end
  local position = inst.position
  local width = inst.width
  position.x = math.min(math.max(worldCenter.x - worldWidth * 0.5 + width * 0.5, px), worldCenter.x + worldWidth * 0.5 - width * 0.5)
  inst.position = Vector3.Lerp(inst.position, Vector3(position.x, position.y), interpolation or 1)
end
local Move = function(delta, interpolation)
  if hp <= 0 or pause > 0 then
    return
  end
  local len = #linkedItems
  local inst
  if len > 0 then
    inst = linkedItems[len]
  else
    inst = tray
  end
  local position = inst.position
  MovePosition(position.x + delta, interpolation)
end
local itemTweeners
local BounceItem = function(item, value, oncomplete)
  itemTweeners = itemTweeners or {}
  if itemTweeners[item] then
    local id = itemTweeners[item]
    LeanTween.cancel(id)
  end
  local bounceDist = item.bounceDist or 0
  itemTweeners[item] = LeanTween.value(bounceDist, value, 0.1):setOnUpdate(function(val)
    item.bounceDist = val
  end):setOnComplete(function()
    itemTweeners[item] = nil
    if type(oncomplete) == "function" then
      oncomplete()
    end
  end):setEaseInSine().id
end
local BounceItems = function(items, startIndex, endIndex)
  local count = endIndex - startIndex + 1
  local bounce = AdaptScale(BOUNCE_DIST)
  for i = startIndex, endIndex do
    local item = items[i]
    BounceItem(item, bounce * ((i - startIndex + 1) / count), function()
      BounceItem(item, 0)
    end)
  end
end
local AppendItem = function(parent, child)
  local go = child.go
  local height = parent.height
  local parentPosition = parent.position
  local position = child.transform.position
  position.y = parentPosition.y + (height + child.height) * 0.5
  local diff = position.x - parentPosition.x
  local width = AdaptScale(ITEM_WIDTH)
  local offset = math.abs(diff) / width <= MAX_HORIZONTAL_OFFSET_RATIO and diff or (diff > 0 and 1 or -1) * MAX_HORIZONTAL_OFFSET_RATIO * width
  position.x = offset + parentPosition.x
  child.position = position
  parent.offset = -offset
  parent.collider.enabled = false
  local rigidbody = child.rigidbody
  rigidbody.drag = 100
  rigidbody.gravityScale = 0
  rigidbody.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezePositionY | rigidbody.constraints
  if type(__oncaught) == "function" then
    __oncaught(child)
  end
  if #linkedItems > MAX_COUNT_IN_VIEW then
    moveDist = (moveDist or 0) + child.height
  end
  BounceItems(linkedItems, math.max(#linkedItems - (MAX_COUNT_IN_VIEW + 2), 2), #linkedItems)
end
local FindItem = function(go)
  for i, v in pairs(droppedItems) do
    if v.go == go then
      return v, i
    end
  end
end
local OnTriggerEnter = function(go, collider)
  local item, index = FindItem(go)
  if not item then
    return
  end
  local collideObj = collider.gameObject
  local len = #linkedItems
  local parent
  if len > 0 then
    if collideObj == linkedItems[len].go then
      parent = linkedItems[len]
    end
  elseif collideObj == tray.go then
    parent = tray
  end
  if not parent then
    return
  end
  table.insert(linkedItems, item)
  table.remove(droppedItems, index)
  AppendItem(parent, item)
end
local CreateDroppedItem = function(x, y, color)
  local inst = {}
  itemIndex = itemIndex + 1
  local go = GameObject(string.format("ITEM_%s", itemIndex))
  local collider = go:AddComponent(typeof(CS.UnityEngine.BoxCollider2D))
  local width, height = AdaptScale(ITEM_WIDTH), AdaptScale(ITEM_HEIGHT)
  collider.size = Vector2(width, height)
  collider.isTrigger = true
  local rigidbody = go:AddComponent(typeof(CS.UnityEngine.Rigidbody2D))
  rigidbody.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezeRotation
  rigidbody.collisionDetectionMode = CS.UnityEngine.CollisionDetectionMode2D.Continuous
  rigidbody.interpolation = CS.UnityEngine.RigidbodyInterpolation2D.Interpolate
  rigidbody.gravityScale = 0
  collisionUtils.AddTriggerEnter2DListener(go, OnTriggerEnter)
  inst.go = go
  local transform = go.transform
  transform.position = Vector3(x, y, 0)
  inst.transform = transform
  inst.collider = collider
  inst.rigidbody = rigidbody
  inst.width = width
  inst.height = height
  inst.color = color
  inst.position = Vector3(x, y)
  inst.tag = "DROPPED_ITEM"
  table.insert(droppedItems, inst)
  if type(__oncreate) == "function" then
    __oncreate(inst)
  end
  return inst
end
local DestroyItem = function(item, outofboundes)
  if item then
    if type(__ondestroy) == "function" then
      __ondestroy(item, outofboundes)
    end
    collisionUtils.RemoveTriggerEnter2DListener(item.go, OnTriggerEnter)
    CS.UnityEngine.Object.Destroy(item.go)
  end
end
local CreateTray = function(x, y)
  local inst = {}
  local go = GameObject("Activity19_TRAY")
  local collider = go:AddComponent(typeof(CS.UnityEngine.BoxCollider2D))
  local width, height = AdaptScale(TRAY_WIDTH), AdaptScale(TRAY_HEIGHT)
  collider.size = Vector2(width, height)
  collider.isTrigger = false
  local rigidbody = go:AddComponent(typeof(CS.UnityEngine.Rigidbody2D))
  rigidbody.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezeRotation | CS.UnityEngine.RigidbodyConstraints2D.FreezePositionY
  rigidbody.collisionDetectionMode = CS.UnityEngine.CollisionDetectionMode2D.Continuous
  rigidbody.interpolation = CS.UnityEngine.RigidbodyInterpolation2D.Interpolate
  rigidbody.gravityScale = 0
  rigidbody.mass = 34359738367
  inst.go = go
  local transform = go.transform
  transform.position = Vector3(x, y)
  inst.transform = transform
  inst.collider = collider
  inst.rigidbody = rigidbody
  inst.width = width
  inst.height = height
  inst.tag = "TRAY"
  inst.position = Vector3(x, y)
  if type(__oncreate) == "function" then
    __oncreate(inst)
  end
  return inst
end
local prevHorizontalPos, leftSideCounter, rightSideCounter
local AutoSpawnDroppedItem = function()
  local itemWidth = AdaptScale(ITEM_WIDTH)
  local x
  local origin = worldCenter.x - worldWidth * 0.5
  if not prevHorizontalPos then
    x = origin + math.random(0, math.floor(worldWidth * 1000)) / 1000
  else
    local side, probability
    local leftPercent = (prevHorizontalPos - itemWidth * 0.5 - origin) / worldWidth
    local rightPercent = (prevHorizontalPos + itemWidth * 0.5 - origin) / worldWidth
    if leftPercent < LEFT_MARGIN then
      rightSideCounter = 0
      leftSideCounter = (leftSideCounter or 0) + 1
      probability = 1 - (LEFT_MARGIN - leftPercent) / LEFT_MARGIN
      side = math.random(0, 100) / 100 < probability / leftSideCounter and -1 or 1
    elseif 1 - rightPercent < RIGHT_MARGIN then
      leftSideCounter = 0
      rightSideCounter = (rightSideCounter or 0) + 1
      probability = (RIGHT_MARGIN - (1 - rightPercent)) / RIGHT_MARGIN
      side = math.random(0, 100) / 100 < probability * rightSideCounter and -1 or 1
    else
      probability = 0.5
      side = probability > math.random(0, 100) / 100 and -1 or 1
    end
    x = prevHorizontalPos + itemWidth * side * (math.random(50, 100) / 100)
  end
  x = math.min(math.max(worldCenter.x - worldWidth * 0.5 + itemWidth * 0.5, x), worldCenter.x + worldWidth * 0.5 - itemWidth * 0.5)
  prevHorizontalPos = x
  return CreateDroppedItem(x, worldCenter.y + worldHeight * 0.5, math.random(0, 6))
end
local AutoDestroyOutOfBoundsItem = function()
  local bottom = worldCenter.y - worldHeight * 0.6
  local len = #droppedItems
  for i = len, 1, -1 do
    local item = droppedItems[i]
    local transform = item.transform
    local position = transform.position
    if bottom > position.y then
      table.remove(droppedItems, i)
      hp = math.max(0, hp - 1)
      DestroyItem(item, true)
    end
  end
end
local AutoAdjustPosition = function()
  if type(moveDist) == "number" and moveDist > 0 then
    local delta = moveDist * Time.deltaTime * CAMERA_MOVE_SPEED
    moveDist = moveDist - delta
    for _, item in ipairs(linkedItems) do
      local position = item.position
      position.y = position.y - delta
      item.position = position
    end
    if type(__onupdate) == "function" then
      __onupdate(moveDist * Time.deltaTime * BG_MOVE_SPEED)
    end
  end
end
local UpdateLinkedItemPosition = function()
  local len = #linkedItems
  local DEFAULT_INTERPOLATION = 1
  local MIN_INTERPOLATION = 0.08
  local threshold = MAX_COUNT_IN_VIEW - 2
  for i = len - 1, 1, -1 do
    local item = linkedItems[i]
    local itemPosition = item.position
    local childPositionX = linkedItems[i + 1].position.x
    local targetpositionX = (item.offset or 0) + childPositionX
    local interpolation = math.max(((len - 1 - i) / threshold * 0.45 + 0.55) * DEFAULT_INTERPOLATION, MIN_INTERPOLATION)
    itemPosition.x = Mathf.Lerp(itemPosition.x, targetpositionX, interpolation)
    item.position = itemPosition
  end
  for i, v in ipairs(linkedItems) do
    v.transform.position = v.position + Vector3.down * (v.bounceDist or 0)
  end
end
local OnUpdate = function()
  if hp <= 0 then
    return
  end
  if pause > 0 then
    return
  end
  local deltaTime = Time.deltaTime
  elapse = elapse + deltaTime
  spawnTimer = spawnTimer + deltaTime
  if type(waitforseconds) == "number" and waitforseconds > 0 then
    waitforseconds = waitforseconds - deltaTime
  else
    local config = PHASE_CONFIG[math.min(#PHASE_CONFIG, phase)]
    if config then
      if phaseTimer > config.transition_time then
        local n = config.spawn_interval_disturb * 10000
        local disturb = math.random(0, math.floor(n)) / 10000
        if spawnTimer > config.spawn_interval + disturb then
          spawnTimer = 0
          local item = AutoSpawnDroppedItem()
          item.rigidbody.velocity = Vector2.down * math.random(math.floor((config.dropped_speed_min or 0) * 100), math.floor((config.dropped_speed_max or 0) * 100)) / 100
          phaseDroppedCount = phaseDroppedCount + 1
          if phaseDroppedCount >= config.count then
            prevHorizontalPos = nil
            leftSideCounter = 0
            rightSideCounter = 0
            phaseDroppedCount = 0
            phase = phase + 1
            phaseTimer = 0
          end
        end
      else
        phaseTimer = phaseTimer + deltaTime
      end
    end
  end
  local horizontal = CS.UnityEngine.Input.GetAxis("Horizontal")
  if math.abs(horizontal) > 0 then
    Move(horizontal * 0.2)
  end
  UpdateLinkedItemPosition()
  AutoDestroyOutOfBoundsItem()
  AutoAdjustPosition()
  if hp <= 0 and type(__ongameover) == "function" then
    __ongameover()
  end
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if tray then
    DestroyItem(tray)
  end
  if droppedItems then
    for i, v in pairs(droppedItems) do
      DestroyItem(v)
    end
    table.clear(droppedItems)
  end
  if linkedItems then
    for i, v in pairs(linkedItems) do
      DestroyItem(v)
    end
    table.clear(linkedItems)
  end
  tray = nil
end
local Initialize = function(center, width, height, onCreate, onDestroy, onUpdate, onCaught, onGameOver)
  Release()
  __oncreate = onCreate
  __ondestroy = onDestroy
  __onupdate = onUpdate
  __oncaught = onCaught
  __ongameover = onGameOver
  spawnTimer = 0
  phaseTimer = 0
  leftSideCounter = 0
  rightSideCounter = 0
  itemIndex = 0
  elapse = 0
  phase = 1
  moveDist = 0
  phaseDroppedCount = 0
  hp = DEFAULT_HP
  pause = 0
  waitforseconds = nil
  worldCenter = center
  worldWidth = width
  worldHeight = height
  tray = CreateTray(worldCenter.x, worldCenter.y - 0.5 * worldHeight + 0.5 * AdaptScale(TRAY_HEIGHT))
  linkedItems = linkedItems or {}
  droppedItems = droppedItems or {}
  table.clear(linkedItems)
  table.clear(droppedItems)
  table.insert(linkedItems, tray)
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local GetElapse = function()
  return elapse
end
local GetScore = function()
  return linkedItems and #linkedItems - 1 or 0
end
local GetHp = function()
  return hp
end
local Pause = function(flag)
  if flag then
    pause = pause + 1
  else
    pause = pause - 1
  end
  for _, inst in ipairs(droppedItems) do
    inst.rigidbody.simulated = 0 == pause
    inst.collider.enabled = 0 == pause
  end
end
local ClearDroppedItems = function()
  if droppedItems then
    local n = #droppedItems
    for i = n, 1, -1 do
      DestroyItem(table.remove(droppedItems))
    end
  end
end
local WaitForSeconds = function(seconds)
  waitforseconds = seconds
end
return {
  Release = Release,
  Initialize = Initialize,
  Move = Move,
  MovePosition = MovePosition,
  GetElapse = GetElapse,
  GetScore = GetScore,
  GetHp = GetHp,
  Pause = Pause,
  ClearDroppedItems = ClearDroppedItems,
  WaitForSeconds = WaitForSeconds
}
