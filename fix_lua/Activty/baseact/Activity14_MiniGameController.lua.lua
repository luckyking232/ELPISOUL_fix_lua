local GAP_VERTICAL, GAP_HORIZONTAL = 1, 0.75
local BLOCK_WIDTH, BLOCK_HEIGHT = 2, 2
local NUM_CHANNELS = 4
local PLAYER_PIVOT_Y = 0.5
local SCENE_OBJ_SCALE = 4.5
local VISIBLE_BLOCKS = 7
local VISIBLE_DISTANCE = 26
local JUMP_TIME_PERCENT = 0.5
local MAX_LONGITUDINAL_SEPARATION = 3
local MAX_HEIGHT = 2.5
local JUMP_HORIZONTAL_DURATION = 0.5
local START_JUMP_POINT_DIST = 2.5
local JUMPED_FRAME_COUNT = 1
local RELATIVE_POSITION = {LEFT = 1, RIGHT = 2}
local DIST_SPEED_ENTRIES = {
  {dist = 0, speed = 7},
  {dist = 50, speed = 8},
  {dist = 100, speed = 9},
  {dist = 200, speed = 10},
  {dist = 400, speed = 11},
  {dist = 800, speed = 12},
  {dist = 1200, speed = 13},
  {dist = 1600, speed = 14},
  {dist = 2000, speed = 15}
}
local DIST_PHASE = {
  [1] = 0,
  [2] = 50,
  [3] = 200
}
local PHASE_BLOCK_TYPE = {
  [1] = {
    1,
    2,
    3
  },
  [2] = {
    4,
    5,
    6
  },
  [3] = {
    7,
    8,
    9
  }
}
local PLAYER_STATE = {
  IDLE = 0,
  JUMP = 1,
  DROP = 2,
  LEFT = 4,
  RIGHT = 8
}
local blockIdAlloc, camera, gameStart, gameOver, player, movedDist, moveDirection, pause, elapse, blocks, worldPivot, playerJumpDropTween, playerHorizontalTween, sceneObj, startPoint, sceneItems, __oncreateplayer, __ondestroyplayer, __oncreateblock, __ondestroyblock, __ongameover, __onplayerstatechanged, __oncreatesceneitem, __ondestroysceneitem, __ontouchdown
local CreatePlayer = function(block)
  local inst = {}
  inst.block = block
  inst.state = PLAYER_STATE.IDLE
  inst.position = Vector3(block.x, PLAYER_PIVOT_Y, block.z)
  if type(__oncreateplayer) == "function" then
    __oncreateplayer(inst)
  end
  return inst
end
local DestroyPlayer = function(playerInst)
  if playerInst then
    if type(__ondestroyplayer) == "function" then
      __ondestroyplayer(playerInst)
    end
    playerInst.block = nil
  end
end
local CreateBlock = function(blockType, x, z, fadeIn)
  blockIdAlloc = (blockIdAlloc or 0) + 1
  local inst = {}
  inst.id = blockIdAlloc
  inst.type = blockType
  inst.x, inst.z = x, z
  if type(__oncreateblock) == "function" then
    __oncreateblock(inst, fadeIn)
  end
  table.insert(blocks, inst)
  return inst
end
local CreateBlockWithPreBlock = function(blockType, pre, relativePositionMask, fadeIn)
  local x, z
  if pre then
    x, z = pre.x, pre.z + BLOCK_HEIGHT + GAP_VERTICAL + math.random(0, 100) / 100 * MAX_LONGITUDINAL_SEPARATION
    if 0 ~= relativePositionMask & RELATIVE_POSITION.RIGHT then
      x = x + BLOCK_WIDTH + GAP_HORIZONTAL
    elseif 0 ~= relativePositionMask & RELATIVE_POSITION.LEFT then
      x = x - BLOCK_WIDTH - GAP_HORIZONTAL
    end
  end
  local inst = CreateBlock(blockType, x, z, fadeIn)
  inst.pre = pre
  if pre then
    pre.next = inst
  end
  inst.relativePosition = relativePositionMask
  return inst
end
local DestroyBlock = function(block)
  if block then
    local k = table.keyof(blocks, block)
    if k then
      table.remove(blocks, k)
    end
    if type(__ondestroyblock) == "function" then
      __ondestroyblock(block)
    end
  end
end
local CreateSceneItem = function(itemType, dist, scale)
  local inst = {
    type = itemType,
    scale = scale,
    z = dist,
    initialZ = dist,
    initialScale = scale
  }
  local leftOrRight = math.random(0, 100) > 50
  local leftBoundary = worldPivot.x
  local rightBoundary = worldPivot.x + NUM_CHANNELS * BLOCK_WIDTH + (NUM_CHANNELS - 1) * GAP_HORIZONTAL
  local randomOffset = math.random(0, 500) / 100
  local randomX = leftOrRight and leftBoundary - randomOffset or rightBoundary + randomOffset
  local randomY = math.random(0, 500) / 1000
  inst.x = randomX
  inst.y = randomY
  if type(__oncreatesceneitem) == "function" then
    __oncreatesceneitem(inst)
  end
  table.insert(sceneItems, inst)
  return inst
end
local DestroySceneItem = function(item)
  local i = table.keyof(sceneItems, item)
  if i then
    table.remove(sceneItems, i)
    if type(__ondestroysceneitem) == "function" then
      __ondestroysceneitem(item)
    end
  end
end
local Move = function(playerInst, direction)
  local block = playerInst.block
  local nextBlock = block.next
  if not nextBlock then
    return true
  end
  if nextBlock.relativePosition == direction then
    playerInst.block = nextBlock
    return true
  end
  return false
end
local MovePlayer = function(direction)
  if gameOver then
    return
  end
  if (player.state == PLAYER_STATE.JUMP or player.state == PLAYER_STATE.DROP) and not moveDirection then
    moveDirection = direction
    playerHorizontalTween = playerHorizontalTween or {}
    playerHorizontalTween.done = false
  end
end
local GetMoveDist = function()
  local position = player.position
  local diff = movedDist + position.z - startPoint
  return diff
end
local GetMoveDirection = function()
  return moveDirection
end
local GetElapse = function()
  return elapse
end
local Pause = function(flag)
  pause = flag
  local fun
  if pause then
    fun = LeanTween.pause
  else
    fun = LeanTween.resume
  end
  if playerJumpDropTween and playerJumpDropTween.tweenId then
    fun(playerJumpDropTween.tweenId)
  end
  if playerHorizontalTween and playerHorizontalTween.tweenId then
    fun(playerHorizontalTween.tweenId)
  end
end
local epsilon = 0.001
local randomRelativePositions
local AutoCreateBlock = function(fadeIn)
  if blocks then
    while (blocks[#blocks] and blocks[#blocks].z - player.position.z or 0) < VISIBLE_DISTANCE do
      local lastBlock = blocks[#blocks]
      local leftBoundary = worldPivot.x - epsilon
      local rightBoundary = worldPivot.x + NUM_CHANNELS * BLOCK_WIDTH + (NUM_CHANNELS - 1) * GAP_HORIZONTAL - epsilon
      randomRelativePositions = randomRelativePositions or {}
      table.clear(randomRelativePositions)
      local nextLeft = lastBlock.x - BLOCK_WIDTH - GAP_HORIZONTAL
      local nextRight = lastBlock.x + BLOCK_WIDTH + GAP_HORIZONTAL
      for _, v in pairs(RELATIVE_POSITION) do
        if (rightBoundary > nextRight or v ~= RELATIVE_POSITION.RIGHT) and (leftBoundary < nextLeft or v ~= RELATIVE_POSITION.LEFT) then
          table.insert(randomRelativePositions, v)
        end
      end
      local result = 1
      local nextBlockZ = lastBlock.z + BLOCK_HEIGHT + GAP_VERTICAL
      local diff = movedDist + nextBlockZ - worldPivot.z
      for phase, dist in ipairs(DIST_PHASE) do
        if dist <= diff then
          result = phase
        end
      end
      local randomType = PHASE_BLOCK_TYPE[result][math.random(1, #PHASE_BLOCK_TYPE[result])]
      local relativePosition = randomRelativePositions[math.random(1, #randomRelativePositions)]
      CreateBlockWithPreBlock(randomType, lastBlock, relativePosition, fadeIn)
    end
  end
end
local DestroyOutOfBoundsItem = function()
  if blocks then
    local len = #blocks
    local bottomBoundary = worldPivot.z - epsilon - BLOCK_HEIGHT * 2
    for i = len, 1, -1 do
      local block = blocks[i]
      if bottomBoundary >= block.z + BLOCK_HEIGHT * 0.5 and block ~= player.block then
        DestroyBlock(block)
      end
    end
  end
  if sceneItems then
    local len = #sceneItems
    local bottomBoundary = camera.transform.position.z
    for i = len, 1, -1 do
      local sceneItem = sceneItems[i]
      if bottomBoundary >= sceneItem.z then
        DestroySceneItem(sceneItem)
      end
    end
  end
end
local spawnSceneItemTimer
local SPAWN_SCENE_ITEM_INTERVAL = 2.5
local UpdateMoveDist = function(deltaDist)
  movedDist = movedDist + deltaDist
  if blocks then
    for _, v in ipairs(blocks) do
      v.z = v.z - deltaDist
    end
  end
  if sceneItems then
    local origin = worldPivot.z
    for _, v in ipairs(sceneItems) do
      local z = v.z - deltaDist
      v.z = z
      local scale = (1 + (1 - (z - origin) / (v.initialZ - origin)) * 0.2) * v.initialScale
      v.scale = scale
    end
  end
  spawnSceneItemTimer = (spawnSceneItemTimer or 0) + Time.deltaTime
  if spawnSceneItemTimer > SPAWN_SCENE_ITEM_INTERVAL then
    spawnSceneItemTimer = 0
    CreateSceneItem(math.random(1, 4), worldPivot.z + math.random(200, 300) / 10, 1 + (math.random(0, 200) - 100) / 1000)
  end
end
local SetPlayerState = function(state)
  local oldState = player.state
  player.state = state
  if type(__onplayerstatechanged) == "function" then
    __onplayerstatechanged(oldState, state)
  end
end
local snapshots
local OnTweenCompleted = function()
  if playerJumpDropTween.done and (not playerHorizontalTween or playerHorizontalTween.done) then
    local next = player.block.next
    if moveDirection == next.relativePosition then
      player.block = next
      SetPlayerState(PLAYER_STATE.IDLE)
    else
      gameOver = true
    end
    moveDirection = nil
  end
end

local function TweenPlayerJumpAndDrop(state, duration, blockMoveSpeed)
  if playerJumpDropTween and playerJumpDropTween.tweenId then
    LeanTween.cancel(playerJumpDropTween.tweenId)
  end
  playerJumpDropTween = playerJumpDropTween or {}
  playerJumpDropTween.elapse = 0
  playerJumpDropTween.duration = duration
  local oldState = player.state
  local leftOrRight = player.state & 12
  SetPlayerState(state | leftOrRight)
  if oldState ~= state and type(__onplayerstatechanged) == "function" then
    __onplayerstatechanged(oldState, state)
  end
  if state & PLAYER_STATE.JUMP > 0 then
    local upvalue = player.height
    playerJumpDropTween.tweenId = LeanTween.value(0, 1, duration):setOnUpdate(function(val)
      player.height = upvalue + (MAX_HEIGHT - upvalue) * val
      local deltaTime = Time.deltaTime
      playerJumpDropTween.elapse = playerJumpDropTween.elapse + deltaTime
      UpdateMoveDist(deltaTime * blockMoveSpeed)
    end):setOnComplete(function()
      player.height = MAX_HEIGHT
      local block = player.block
      local nextBlock = block.next
      local diff = nextBlock.z - player.startZ
      local consume = diff / blockMoveSpeed
      TweenPlayerJumpAndDrop(PLAYER_STATE.DROP, consume, blockMoveSpeed)
    end):setEaseOutCirc().id
  elseif state & PLAYER_STATE.DROP > 0 then
    local upvalue = player.height
    playerJumpDropTween.tweenId = LeanTween.value(1, 0, duration):setOnUpdate(function(val)
      player.height = upvalue * val
      local deltaTime = Time.deltaTime
      playerJumpDropTween.elapse = playerJumpDropTween.elapse + deltaTime
      UpdateMoveDist(deltaTime * blockMoveSpeed)
    end):setOnComplete(function()
      player.height = 0
      playerJumpDropTween.tweenId = nil
      playerJumpDropTween.done = true
      if type(__ontouchdown) == "function" then
        __ontouchdown(player, moveDirection == player.block.next.relativePosition)
      end
      OnTweenCompleted()
    end):setEaseInCirc().id
  end
  playerJumpDropTween.blockMoveSpeed = blockMoveSpeed
end

local TweenPlayerX = function(duration, blockMoveSpeed)
  if playerHorizontalTween and playerHorizontalTween.tweenId then
    LeanTween.cancel(playerHorizontalTween.tweenId)
  end
  playerHorizontalTween = playerHorizontalTween or {}
  playerHorizontalTween.elapse = 0
  playerHorizontalTween.duration = duration
  playerHorizontalTween.blockMoveSpeed = blockMoveSpeed
  local upvalue = player.position.x
  local targetX = player.block.next.x
  if moveDirection == player.block.next.relativePosition then
    targetX = player.block.next.x
  elseif moveDirection == RELATIVE_POSITION.LEFT then
    targetX = player.block.x - BLOCK_WIDTH - GAP_HORIZONTAL
  elseif moveDirection == RELATIVE_POSITION.RIGHT then
    targetX = player.block.x + BLOCK_WIDTH + GAP_HORIZONTAL
  end
  if moveDirection == RELATIVE_POSITION.LEFT then
    SetPlayerState(player.state | PLAYER_STATE.LEFT)
  elseif moveDirection == RELATIVE_POSITION.RIGHT then
    SetPlayerState(player.state | PLAYER_STATE.RIGHT)
  end
  playerHorizontalTween.tweenId = LeanTween.value(0, 1, duration):setOnUpdate(function(val)
    player.position.x = upvalue + (targetX - upvalue) * val
  end):setOnComplete(function()
    SetPlayerState(player.state & 3)
    playerHorizontalTween.done = true
    playerHorizontalTween.tweenId = nil
    OnTweenCompleted()
  end):setEase(LeanTweenType.linear).id
end
local jumpFramecounter
local UpdatePlayer = function()
  local deltaTime = Time.deltaTime
  local speed = 0.5
  local dist = GetMoveDist()
  for _, entry in ipairs(DIST_SPEED_ENTRIES) do
    if dist >= entry.dist then
      speed = entry.speed
    end
  end
  local delta = speed * deltaTime
  local block = player.block
  local nextBlock = block.next
  if player.state == PLAYER_STATE.IDLE then
    player.position = Vector3(player.position.x, PLAYER_PIVOT_Y, player.position.z)
    jumpFramecounter = (jumpFramecounter or 0) + 1
    if jumpFramecounter >= JUMPED_FRAME_COUNT and (not playerHorizontalTween or not playerHorizontalTween.tweenId) and (not playerJumpDropTween or not playerJumpDropTween.tweenId) then
      jumpFramecounter = 0
      player.height = 0
      player.startZ = player.position.z
      local diff = nextBlock.z - player.startZ
      local t = diff / speed
      local duration = t * JUMP_TIME_PERCENT
      playerJumpDropTween = playerJumpDropTween or {}
      playerJumpDropTween.done = false
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_14_junp")
      TweenPlayerJumpAndDrop(PLAYER_STATE.JUMP, duration, speed)
    end
  elseif player.state & PLAYER_STATE.JUMP > 0 then
    player.position = Vector3(player.position.x, player.height + PLAYER_PIVOT_Y, player.startZ)
    if speed > playerJumpDropTween.blockMoveSpeed then
      local diff = nextBlock.z - player.startZ
      local t = diff / speed
      local percent = playerJumpDropTween.elapse / playerJumpDropTween.duration
      local remainPercent = JUMP_TIME_PERCENT * (1 - percent)
      local duration = remainPercent * (t + playerJumpDropTween.elapse)
      TweenPlayerJumpAndDrop(PLAYER_STATE.JUMP, duration, speed)
    end
  elseif player.state & PLAYER_STATE.DROP > 0 then
    player.position = Vector3(player.position.x, player.height + PLAYER_PIVOT_Y, player.startZ)
    if speed > playerJumpDropTween.blockMoveSpeed then
      local diff = nextBlock.z - player.startZ
      local t = diff / speed
      local percent = playerJumpDropTween.elapse / playerJumpDropTween.duration
      local remainPercent = 1 - percent
      local duration = remainPercent * (t + playerJumpDropTween.elapse)
      TweenPlayerJumpAndDrop(PLAYER_STATE.DROP, duration, speed)
    end
  end
  if (player.state & PLAYER_STATE.JUMP > 0 or player.state & PLAYER_STATE.DROP > 0) and moveDirection and playerJumpDropTween and not playerHorizontalTween.done then
    if not playerHorizontalTween or not playerHorizontalTween.tweenId then
      local duration = (nextBlock.z - player.startZ) / speed
      TweenPlayerX(math.min(JUMP_HORIZONTAL_DURATION, duration), speed)
    elseif speed > playerHorizontalTween.blockMoveSpeed then
      local duration = (nextBlock.z - player.startZ) / speed
      local remain = playerHorizontalTween.duration - playerHorizontalTween.elapse
      TweenPlayerX(math.min(remain, duration), speed)
    end
  end
  return delta
end
local OnUpdate = function()
  if gameOver then
    if type(__ongameover) == "function" then
      __ongameover()
    end
    __ongameover = nil
    return
  end
  if pause then
    return
  end
  elapse = (elapse or 0) + Time.deltaTime
  AutoCreateBlock(true)
  if gameStart then
    DestroyOutOfBoundsItem()
    UpdatePlayer()
    if snapshots then
      for i = 1, #snapshots - 1 do
        local nextI = i + 1
        CS.UnityEngine.Debug.DrawLine(snapshots[i], snapshots[nextI], Color.green)
      end
    end
  else
    local speed = 1
    local dist = GetMoveDist()
    for _, entry in ipairs(DIST_SPEED_ENTRIES) do
      if dist >= entry.dist then
        speed = entry.speed
      end
    end
    UpdateMoveDist(speed * Time.deltaTime)
    local block = player.block
    player.position = Vector3(block.x, PLAYER_PIVOT_Y, block.z)
    if block.z - worldPivot.z < START_JUMP_POINT_DIST then
      gameStart = true
    end
  end
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if player then
    DestroyPlayer(player)
  end
  player = nil
  if blocks then
    local len = #blocks
    for i = len, 1, -1 do
      DestroyBlock(blocks[i])
    end
    table.clear(blocks)
  end
  if camera then
    local rt = camera.targetTexture
    camera.targetTexture = nil
    if rt and not rt:IsNull() then
      CS.RTManager.ReleaseTemporary(rt)
    end
    GameObject.Destroy(camera.gameObject)
  end
  camera = nil
  if sceneObj then
    ResourceManager.DestroyGameObject(sceneObj)
  end
  sceneObj = nil
  if playerJumpDropTween and playerJumpDropTween.tweenId then
    LeanTween.cancel(playerJumpDropTween.tweenId)
  end
  playerJumpDropTween = nil
  if playerHorizontalTween and playerHorizontalTween.tweenId then
    LeanTween.cancel(playerHorizontalTween.tweenId)
  end
  playerHorizontalTween = nil
  if sceneItems then
    local len = #sceneItems
    for i = len, 1, -1 do
      DestroySceneItem(sceneItems[i])
    end
  end
  sceneItems = nil
end
local DEV_ASPECT = 1.7786666666666666
local CAMERA_EULERANGLE_X = 20
local InitializeCamera = function(loader)
  if not camera then
    local go = GameObject("ACTIVITY14_CAMERA")
    local component = go:GetOrAddComponent(typeof(CS.UnityEngine.Camera))
    local fieldOfView = 55
    local eulerAngleX = CAMERA_EULERANGLE_X
    component.orthographic = false
    component.fieldOfView = fieldOfView
    local camTrans = component.transform
    local height = 7
    local width = NUM_CHANNELS * BLOCK_WIDTH + (NUM_CHANNELS - 1) * GAP_HORIZONTAL
    local worldCenter = worldPivot + Vector3(width * 0.5, 0)
    local offsetZ = -8
    camTrans.position = Vector3(worldCenter.x, height, worldCenter.z + offsetZ)
    camTrans.eulerAngles = Vector3.right * eulerAngleX
    component.cullingMask = component.cullingMask & -33
    component.depth = -2
    component.clearFlags = CS.UnityEngine.CameraClearFlags.SolidColor
    component.backgroundColor = CS.UnityEngine.Color.black
    camera = component
  end
  if not camera.targetTexture then
    local size = loader.size
  end
end
local Initialize = function(pivot, projectLoader, onCreatePlayer, onDestroyPlayer, onCreateBlock, onDestroyBlock, onGameOver, onPlayerStateChanged, onCreateSceneItem, onDestroySceneItem, onTouchdown)
  Release()
  blockIdAlloc = 0
  blocks = blocks or {}
  sceneItems = {}
  table.clear(blocks)
  worldPivot = pivot
  __oncreateplayer = onCreatePlayer
  __ondestroyplayer = onDestroyPlayer
  __oncreateblock = onCreateBlock
  __ondestroyblock = onDestroyBlock
  __ongameover = onGameOver
  __onplayerstatechanged = onPlayerStateChanged
  __oncreatesceneitem = onCreateSceneItem
  __ondestroysceneitem = onDestroySceneItem
  __ontouchdown = onTouchdown
  gameOver = false
  gameStart = false
  pause = false
  movedDist = 0
  elapse = 0
  moveDirection = nil
  sceneObj = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_bg_1.prefab")
  local channel = math.random(1, NUM_CHANNELS)
  local x, z = worldPivot.x + BLOCK_WIDTH * (channel - 0.5) + (channel - 1) * GAP_HORIZONTAL, worldPivot.z
  local newbieBlocks = 5
  for i = 1, newbieBlocks do
    CreateBlock(math.random(1, 3), x, z + (i - 1) * BLOCK_HEIGHT)
  end
  player = CreatePlayer(blocks[newbieBlocks])
  startPoint = player.position.z
  AutoCreateBlock(false)
  InitializeCamera(projectLoader)
  local width = NUM_CHANNELS * BLOCK_WIDTH + (NUM_CHANNELS - 1) * GAP_HORIZONTAL
  local worldCenter = worldPivot + Vector3(width * 0.5, 0)
  sceneObj.transform.position = Vector3(worldCenter.x, -4, 115)
  sceneObj.transform.localScale = Vector3.one * SCENE_OBJ_SCALE
  sceneObj.transform.localEulerAngles = Vector3.zero
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end
return {
  RELATIVE_POSITION = RELATIVE_POSITION,
  PLAYER_STATE = PLAYER_STATE,
  Release = Release,
  Initialize = Initialize,
  MovePlayer = MovePlayer,
  GetMovedDist = GetMoveDist,
  GetMoveDirection = GetMoveDirection,
  GetElapse = GetElapse,
  Pause = Pause
}
