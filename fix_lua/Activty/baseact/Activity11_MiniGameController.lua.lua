ld("Physics")
local direction_differences = {
  [0] = {
    {-1, 0},
    {1, 0},
    {-1, -1},
    {0, -1},
    {-1, 1},
    {0, 1}
  },
  [1] = {
    {-1, 0},
    {1, 0},
    {0, -1},
    {1, -1},
    {0, 1},
    {1, 1}
  }
}
local BALL_COLOR = {
  NONE = -1,
  BLUE = 1,
  GREEN = 2,
  RED = 4,
  CYAN = 8,
  YELLOW = 16,
  GRAY = 32,
  STONE = 64,
  PINK = 128
}
BALL_COLOR.BLUE_GREEN = BALL_COLOR.BLUE | BALL_COLOR.GREEN
BALL_COLOR.BLUE_PINK = BALL_COLOR.BLUE | BALL_COLOR.PINK
BALL_COLOR.RED_GREEN = BALL_COLOR.RED | BALL_COLOR.GREEN
BALL_COLOR.RED_PINK = BALL_COLOR.RED | BALL_COLOR.PINK
BALL_COLOR.YELLOW_GREEN = BALL_COLOR.YELLOW | BALL_COLOR.GREEN
BALL_COLOR.CYAN_GREEN = BALL_COLOR.CYAN | BALL_COLOR.GREEN
BALL_COLOR.RED_BLUE = BALL_COLOR.RED | BALL_COLOR.BLUE
BALL_COLOR.YELLOW_BLUE = BALL_COLOR.YELLOW | BALL_COLOR.BLUE
BALL_COLOR.CYAN_BLUE = BALL_COLOR.CYAN | BALL_COLOR.BLUE
BALL_COLOR.YELLOW_RED = BALL_COLOR.YELLOW | BALL_COLOR.RED
BALL_COLOR.YELLOW_PINK = BALL_COLOR.YELLOW | BALL_COLOR.PINK
BALL_COLOR.CYAN_RED = BALL_COLOR.CYAN | BALL_COLOR.RED
BALL_COLOR.CYAN_YELLOW = BALL_COLOR.CYAN | BALL_COLOR.YELLOW
BALL_COLOR.CYAN_PINK = BALL_COLOR.CYAN | BALL_COLOR.PINK
BALL_COLOR.PINK_GREEN = BALL_COLOR.PINK | BALL_COLOR.GREEN
local ITEM_TYPE = {
  BALL = "BALL",
  BOMB = "BOMB",
  FIREWORKS = "FIREWORKS"
}
local ITEM_STATE = {
  NONE = "NONE",
  PROJECTILE = "PROJECTILE",
  STATIC = "STATIC",
  DROP = "DROP"
}
local BALL_EFFECT = {
  NONE = 0,
  CHAIN = 1,
  CHAIN_X2 = 2,
  FREEZE = 4,
  ICE = 8
}
local MIN_BOOM_SAME_BALL_NUM = 3
local BALL_RADIUS = 0.29
local BOMB_RADIUS = 0.5
local SQRT3 = math.sqrt(3)
local OUTER_CIRCLE_RADIUS = BALL_RADIUS * 2 / SQRT3
local GRAVITY = -10
local SHOOT_VELOCITY = 26.0
local DROP_VELOCITY = 13
local BOOM_RADIUS = 2
local FIREWORKS_CONDITION = 7
local BOMB_CONDITION = 10
local BOUNCE_SCALES = 0.3
local DEFAULT_MOVE_SPEED = 7
local GAME_START_MOVE_SPEED = 14
local world, grids, minGridRow, minGridCol, maxGridRow, maxGridCol, allItems, bodyItemLookup, candidateItemType, candidateBallColor, nextCandidateBallColor, getReadyPointFunc, worldCenter, worldWidth, worldHeight, worldEdges, bombCount, fireworksCount, remainedShootCount
local colOffset, rowOffset = 0, 0
local elapse, combo, simulate, __oncreateitem, __ondestroyitem, __onupdate, __onballeffectchanged, __ongameover, __onfinishedshooting, pooledBuffers
local GetBuffer = function()
  local buffer
  if pooledBuffers and #pooledBuffers > 0 then
    buffer = table.remove(pooledBuffers)
  else
    buffer = {}
  end
  table.clear(buffer)
  return buffer
end
local PoolBuffer = function(buffer)
  pooledBuffers = pooledBuffers or {}
  if table.keyof(pooledBuffers, buffer) then
    return
  end
  table.insert(pooledBuffers, buffer)
end
local Scale = function(value)
  return value * UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
end
local offset_neighbor = function(col, row, dir)
  local direction = direction_differences[row & 1][dir]
  return col + direction[1], row + direction[2]
end
local position = function(x, y)
  local ox = worldCenter.x - worldWidth * 0.5 + colOffset
  local oy = worldCenter.y + worldHeight * 0.5
  local outerCircleRadius = Scale(OUTER_CIRCLE_RADIUS)
  local px = ox + SQRT3 * (x - 0.5 * (y - 1 & 1)) * outerCircleRadius
  local py = oy + (0.5 - 1.5 * y) * outerCircleRadius + rowOffset
  return px, py
end
local tweeners
local InsertTween = function(tween)
  tweeners = tweeners or {}
  table.insert(tweeners, tween)
end
local RemoveTween = function(tween)
  local k = table.keyof(tweeners, tween)
  if k then
    table.remove(tweeners, k)
  end
end

local function FillPositions(collection, numColumns, numRows, x, y)
  local uniqueId = x << 8 | y
  if not table.keyof(collection, uniqueId, "id") and x > 0 and x <= numColumns and y > 0 and y <= numRows then
    if 0 ~= y & 1 or x > 1 then
      table.insert(collection, {
        id = uniqueId,
        x = x,
        y = y
      })
    end
    for i = 1, 6 do
      FillPositions(collection, numColumns, numRows, offset_neighbor(x, y, i))
    end
  end
end

local GetGrid = function(x, y)
  local index = table.keyof(grids, x << 8 | y, "id")
  if index then
    return grids[index]
  end
end
local GetBallsByEffect = function(effect, buffer)
  buffer = buffer or {}
  for _, grid in ipairs(grids) do
    if grid.ball and 0 ~= grid.ball.effect & effect then
      table.insert(buffer, grid.ball)
    end
  end
  return buffer
end
local RecordBodyItem = function(body, item)
  bodyItemLookup = bodyItemLookup or {}
  bodyItemLookup[body] = item
  table.insert(allItems, item)
end
local CreateCircleBody = function(x, y, radius)
  local circle = Circle.New(x, y, radius)
  circle.ignoreG = true
  circle.isTrigger = true
  circle:setMass(1)
  circle:init()
  return circle
end
local CreateRectangleBody = function(x, y, width, height, angle)
  local vertices = {
    {
      -width / 2 + x,
      -height / 2 + y
    },
    {
      width / 2 + x,
      -height / 2 + y
    },
    {
      width / 2 + x,
      height / 2 + y
    },
    {
      -width / 2 + x,
      height / 2 + y
    }
  }
  local rectangle = Rectangle.New()
  rectangle.vertices = vertices
  rectangle.ignoreG = true
  rectangle.isTrigger = true
  rectangle:setMass(1)
  rectangle:init()
  rectangle:setAngle(angle)
  return rectangle
end
local CreateItem = function(itemType, itemState)
  local inst = {}
  inst.type = itemType
  inst.state = itemState or ITEM_STATE.NONE
  return inst
end
local CreateBall = function(x, y, color, effect, state, angle)
  local inst = CreateItem(ITEM_TYPE.BALL, state)
  inst.color = color
  inst.effect = effect or BALL_EFFECT.NONE
  local circle = CreateCircleBody(x, y, Scale(BALL_RADIUS))
  circle.sleeping = true
  inst.body = circle
  inst.body.angle = angle or 0
  world:addBody(circle)
  RecordBodyItem(circle, inst)
  if type(__oncreateitem) == "function" then
    __oncreateitem(inst)
  end
  return inst
end
local CreateBomb = function(x, y, state, angle)
  local inst = CreateItem(ITEM_TYPE.BOMB, state)
  local circle = CreateCircleBody(x, y, BOMB_RADIUS)
  inst.body = circle
  inst.body.angle = angle or 0
  world:addBody(circle)
  RecordBodyItem(circle, inst)
  if type(__oncreateitem) == "function" then
    __oncreateitem(inst)
  end
  return inst
end
local CreateFireworks = function(x, y, angle, state)
  local inst = CreateItem(ITEM_TYPE.FIREWORKS, state)
  local FIREWORKS_WIDTH, FIREWORKS_HEIGHT = 0.4, 0.58
  local rectangle = CreateRectangleBody(x, y, Scale(FIREWORKS_WIDTH), Scale(FIREWORKS_HEIGHT), math.rad(angle))
  inst.body = rectangle
  world:addBody(rectangle)
  RecordBodyItem(rectangle, inst)
  if type(__oncreateitem) == "function" then
    __oncreateitem(inst)
  end
  return inst
end
local Detach = function(ball)
  local x, y = ball.gridX, ball.gridY
  if x and y then
    local grid = GetGrid(x, y)
    if grid and grid.ball == ball then
      ball.gridX, ball.gridY = nil, nil
      grid.ball = nil
    end
  end
end
local DestroyItem = function(item, boom, firework)
  if item.type == ITEM_TYPE.BALL and item.gridX and item.gridY then
    Detach(item)
  end
  if type(__ondestroyitem) == "function" then
    __ondestroyitem(item, boom, firework)
  end
  if bodyItemLookup then
    local body = item.body
    item.body = nil
    bodyItemLookup[body] = nil
    world:removeBody(body)
  end
  if allItems then
    local k = table.keyof(allItems, item)
    if k then
      table.remove(allItems, k)
    end
  end
end
local CreateWall = function(x, y, width, height)
  local vertices = {
    {
      -width / 2 + x,
      -height / 2 + y
    },
    {
      width / 2 + x,
      -height / 2 + y
    },
    {
      width / 2 + x,
      height / 2 + y
    },
    {
      -width / 2 + x,
      height / 2 + y
    }
  }
  local rectangle = Rectangle.New()
  rectangle.vertices = vertices
  rectangle.ignoreG = true
  rectangle:setMass(MathConst.Infinity)
  rectangle:init()
  world:addBody(rectangle)
end
local PutBallInGrid = function(ball, gridx, gridy)
  local grid = GetGrid(gridx, gridy)
  if grid then
    if grid.ball then
      printError("Put Ball In Grid", gridx, gridy)
      DestroyItem(grid.ball)
    end
    grid.ball = ball
    ball.gridX, ball.gridY = gridx, gridy
    ball.state = ITEM_STATE.STATIC
    local px, py = position(gridx, gridy)
    ball.body:setAngle(0)
    ball.body:setPos(px, py)
    ball.body:update()
    ball.body.layer = 1
    ball.body.layerMask = -2
  end
end
local CreateGrid = function(gridx, gridy)
  local grid = {
    id = gridx << 8 | gridy,
    x = gridx,
    y = gridy
  }
  maxGridRow = math.max(maxGridRow, gridy)
  minGridRow = math.min(minGridRow, gridy)
  maxGridCol = math.max(maxGridCol, gridx)
  minGridCol = math.min(minGridCol, gridx)
  table.insert(grids, grid)
  return grid
end
local InsertBall = function(ball, gridx, gridy)
  local grid = GetGrid(gridx, gridy)
  if not grid then
    CreateGrid(gridx, gridy)
  end
  PutBallInGrid(ball, gridx, gridy)
end
local PlayShakeAnimation = function(cx, cy, ball, shakeScale, onComplete)
  local shakeSize = shakeScale * Scale(BALL_RADIUS)
  local body = ball.body
  local upvalueX, upvalueY = body.x, body.y
  local dir = Vector2(upvalueX - cx, upvalueY - cy).normalized * shakeSize
  local tweenId
  tweenId = LeanTween.value(0, 1, 0.1):setOnUpdate(function(value)
    body:setPos(upvalueX + dir.x * value, upvalueY + dir.y * value)
  end):setOnComplete(function()
    RemoveTween(tweenId)
    tweenId = LeanTween.value(1, -0.3, 0.1):setOnUpdate(function(value)
      body:setPos(upvalueX + dir.x * value, upvalueY + dir.y * value)
    end):setOnComplete(function()
      RemoveTween(tweenId)
      tweenId = LeanTween.value(-0.3, 0, 0.1):setOnUpdate(function(value)
        body:setPos(upvalueX + dir.x * value, upvalueY + dir.y * value)
      end):setOnComplete(function()
        RemoveTween(tweenId)
        if type(onComplete) == "function" then
          onComplete()
        end
      end):setEase(LeanTweenType.easeInOutSine).id
      InsertTween(tweenId)
    end):setEase(LeanTweenType.easeInOutSine).id
    InsertTween(tweenId)
  end):setEase(LeanTweenType.easeInOutSine).id
  InsertTween(tweenId)
end
local PlayInsertAnimation = function(gridx, gridy, callback)
  local px, py = position(gridx, gridy)
  local count = 0
  for i = 1, 6 do
    local nx, ny = offset_neighbor(gridx, gridy, i)
    local neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball then
      count = count + 1
    end
  end
  if count > 0 then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_add")
    local progress = 0
    for i = 1, 6 do
      local nx, ny = offset_neighbor(gridx, gridy, i)
      local neighbor = GetGrid(nx, ny)
      if neighbor and neighbor.ball then
        PlayShakeAnimation(px, py, neighbor.ball, BOUNCE_SCALES, function()
          progress = progress + 1
          if progress >= count and type(callback) == "function" then
            callback()
          end
        end)
      end
    end
  elseif type(callback) == "function" then
    callback()
  end
end
local epsilon = 0.01
local GetGridsAround = function(x, y, circles, filter)
  local results
  local minx, maxx = x - circles, x + circles
  local miny, maxy = y - circles, y + circles
  local cx, cy = position(x, y)
  local comparedVal = circles * 2 * Scale(OUTER_CIRCLE_RADIUS)
  for dx = minx, maxx do
    for dy = miny, maxy do
      local px, py = position(dx, dy)
      local dist = math.sqrt((px - cx) ^ 2 + (py - cy) ^ 2)
      if (dx ~= x or dy ~= y) and (comparedVal > dist or math.abs(comparedVal - dist) < epsilon) then
        local grid = GetGrid(dx, dy)
        if grid and (type(filter) ~= "function" or filter(grid)) then
          results = results or {}
          table.insert(results, grid)
        end
      end
    end
  end
  return results
end
local GetNeighbors = function(x, y, buffer, filter)
  buffer = buffer or {}
  for i = 1, 6 do
    local nx, ny = offset_neighbor(x, y, i)
    local neighbor = GetGrid(nx, ny)
    if neighbor and (type(filter) ~= "function" or filter(neighbor)) then
      table.insert(buffer, neighbor)
    end
  end
  return buffer
end
local RANDOM_COL_LIST = {
  BALL_COLOR.BLUE,
  BALL_COLOR.GREEN,
  BALL_COLOR.RED
}
local RANDOM_EFF_LIST = {
  BALL_EFFECT.FREEZE,
  BALL_EFFECT.ICE,
  BALL_EFFECT.CHAIN,
  BALL_EFFECT.CHAIN_X2
}
local UNI_COLOR_LIST = {
  BALL_COLOR.BLUE,
  BALL_COLOR.GREEN,
  BALL_COLOR.RED,
  BALL_COLOR.CYAN,
  BALL_COLOR.YELLOW,
  BALL_COLOR.PINK
}
local DUAL_COLOR_LIST = {
  BALL_COLOR.BLUE_GREEN,
  BALL_COLOR.RED_GREEN,
  BALL_COLOR.YELLOW_GREEN,
  BALL_COLOR.CYAN_GREEN,
  BALL_COLOR.RED_BLUE,
  BALL_COLOR.YELLOW_BLUE,
  BALL_COLOR.CYAN_BLUE,
  BALL_COLOR.YELLOW_RED,
  BALL_COLOR.CYAN_RED,
  BALL_COLOR.CYAN_YELLOW,
  BALL_COLOR.BLUE_PINK,
  BALL_COLOR.RED_PINK,
  BALL_COLOR.YELLOW_PINK,
  BALL_COLOR.CYAN_PINK,
  BALL_COLOR.PINK_GREEN
}
local FillBalls = function(balls)
  if balls then
    local getEntry = function(col, row)
      for _, entry in ipairs(balls) do
        if entry.col + 1 == col and entry.row + 1 == row then
          return entry
        end
      end
    end
    local uniColors = {}
    local dualColors = {}
    for _, entry in ipairs(balls) do
      local color = entry.color
      if 1024 ~= color and 2048 ~= color then
        local dual = false
        for _, v in ipairs(DUAL_COLOR_LIST) do
          if color == v then
            dual = true
            break
          end
        end
        if dual then
          if not table.keyof(dualColors, color) then
            table.insert(dualColors, color)
          end
        elseif color ~= BALL_COLOR.GRAY and color ~= BALL_COLOR.STONE and not table.keyof(uniColors, color) then
          table.insert(uniColors, color)
        end
      end
    end
    for _, entry in ipairs(balls) do
      local x, y = entry.col + 1, entry.row + 1
      local px, py = position(x, y)
      local color = entry.color
      if 1024 == color or 2048 == color then
        if 1024 == color then
        end
        local templateColors = #uniColors > 0 and uniColors or UNI_COLOR_LIST or #dualColors > 0 and dualColors or DUAL_COLOR_LIST
        local buffer = GetBuffer()
        for _, v in ipairs(templateColors) do
          table.insert(buffer, v)
        end
        for i = 1, 6 do
          local nx, ny = offset_neighbor(x, y, i)
          local e = getEntry(nx, ny)
          if e then
            local k = table.keyof(buffer, e.color)
            if k then
              table.remove(buffer, k)
            end
          end
        end
        if #buffer > 0 then
          color = buffer[math.random(1, #buffer)]
        else
          color = templateColors[math.random(1, #templateColors)]
        end
        PoolBuffer(buffer)
      end
      local ball = CreateBall(px, py, color, entry.effect)
      InsertBall(ball, x, y)
    end
  else
    for _, grid in ipairs(grids) do
      local x, y = grid.x, grid.y
      local px, py = position(x, y)
      local randomColor = RANDOM_COL_LIST[math.random(1, #RANDOM_COL_LIST)]
      local randomEffect = RANDOM_EFF_LIST[math.random(1, #RANDOM_EFF_LIST)]
      local percent = math.random(1, 1000) / 1000
      local ball = CreateBall(px, py, randomColor, percent <= 0.1 and randomEffect)
      PutBallInGrid(ball, x, y)
    end
  end
end

local function CollectNeighborSameBalls(ball, color, buffer)
  buffer = buffer or {}
  local x, y = ball.gridX, ball.gridY
  for i = 1, 6 do
    local neighbor = GetGrid(offset_neighbor(x, y, i))
    if neighbor and neighbor.ball and 0 ~= neighbor.ball.color & color then
      local neighborBall = neighbor.ball
      if not table.keyof(buffer, neighborBall) then
        table.insert(buffer, neighborBall)
        CollectNeighborSameBalls(neighborBall, color, buffer)
      end
    end
  end
  return buffer
end

local function CollectNeighborSameEffectBalls(ball, effect, buffer)
  buffer = buffer or {}
  local x, y = ball.gridX, ball.gridY
  for i = 1, 6 do
    local neighbor = GetGrid(offset_neighbor(x, y, i))
    if neighbor and neighbor.ball and 0 ~= neighbor.ball.effect & effect then
      local neighborBall = neighbor.ball
      if not table.keyof(buffer, neighborBall) then
        table.insert(buffer, neighborBall)
        CollectNeighborSameEffectBalls(neighborBall, effect, buffer)
      end
    end
  end
  return buffer
end

local CollectBoomBalls = function(sameBalls, buffer)
  buffer = buffer or {}
  for _, ball in ipairs(sameBalls) do
    if not table.keyof(buffer, ball) then
      table.insert(buffer, ball)
    end
  end
  return buffer
end
local SpreadICE = function(gridX, gridY, filter, spreadNum)
  local spreadBuffer = GetBuffer()
  local sameEffectBuffer = GetBuffer()
  local effect = BALL_EFFECT.ICE
  for i = 1, 6 do
    local nx, ny = offset_neighbor(gridX, gridY, i)
    local grid = GetGrid(nx, ny)
    if grid and grid.ball and 0 == grid.ball.effect & effect and not table.keyof(spreadBuffer, grid.ball) and not grid.ball.spreadFlag and (type(filter) ~= "function" or filter(grid.ball)) then
      table.insert(spreadBuffer, grid.ball)
    end
  end
  for _ = 1, spreadNum do
    if 0 == #spreadBuffer then
      break
    end
    local spread = table.remove(spreadBuffer, math.random(1, #spreadBuffer))
    if spread then
      local prev = spread.effect
      spread.effect = spread.effect | effect
      if type(__onballeffectchanged) == "function" then
        __onballeffectchanged(spread, prev, spread.effect)
      end
    end
  end
  PoolBuffer(sameEffectBuffer)
  PoolBuffer(spreadBuffer)
end
local SpreadFreeze = function(spreadNum)
  local effect = BALL_EFFECT.FREEZE
  local sameEffectBalls = GetBallsByEffect(effect, GetBuffer())
  spreadNum = spreadNum or 1
  while #sameEffectBalls > 0 do
    local ball = sameEffectBalls[#sameEffectBalls]
    local spreadBuffer = GetBuffer()
    local sameEffectBuffer = GetBuffer()
    table.insert(sameEffectBuffer, ball)
    CollectNeighborSameEffectBalls(ball, effect, sameEffectBuffer)
    for _, v in ipairs(sameEffectBuffer) do
      local k = table.keyof(sameEffectBalls, v)
      if k then
        table.remove(sameEffectBalls, k)
      end
      for i = 1, 6 do
        local nx, ny = offset_neighbor(v.gridX, v.gridY, i)
        local grid = GetGrid(nx, ny)
        if grid and grid.ball and 0 == grid.ball.effect & effect and not table.keyof(spreadBuffer, grid.ball) then
          table.insert(spreadBuffer, grid.ball)
        end
      end
    end
    if #spreadBuffer > 0 then
      for _ = 1, spreadNum do
        local spread = table.remove(spreadBuffer, math.random(1, #spreadBuffer))
        if spread then
          local prev = spread.effect
          spread.effect = spread.effect | effect
          if type(__onballeffectchanged) == "function" then
            __onballeffectchanged(spread, prev, spread.effect)
          end
        end
      end
    end
    PoolBuffer(sameEffectBuffer)
    PoolBuffer(spreadBuffer)
  end
  PoolBuffer(sameEffectBalls)
end
local MoveAllGrids = function(offset, tween, duration, complete)
  rowOffset = offset
  local count = 0
  local progress = 0
  local flag = false
  for _, grid in ipairs(grids) do
    local ball = grid.ball
    if ball then
      count = count + 1
      local body = ball.body
      local px, py = position(grid.x, grid.y)
      if not tween then
        body:setPos(px, py)
      else
        flag = true
        local tweenId
        tweenId = LeanTween.value(body.y, py, duration):setOnUpdate(function(val)
          body:setPos(body.x, val)
        end):setOnComplete(function()
          body:setPos(body.x, py)
          body:update()
          RemoveTween(tweenId)
          if complete then
            progress = progress + 1
            if progress >= count then
              complete()
            end
          end
        end):setEase(LeanTweenType.easeInOutSine).id
        InsertTween(tweenId)
      end
    end
  end
  if not flag and complete then
    complete()
  end
end
local GameOver = function()
  local gameOver = false
  local allDestroyed = true
  for _, grid in ipairs(grids) do
    if grid.ball then
      allDestroyed = false
    end
  end
  gameOver = allDestroyed or candidateBallColor == BALL_COLOR.NONE and remainedShootCount <= 0 and bombCount <= 0 and fireworksCount <= 0
  return gameOver, allDestroyed
end
local drawline = CS.UnityEngine.Debug.DrawLine
local AutoCorrectGridPositions = function(tween, speed, complete)
  speed = speed or DEFAULT_MOVE_SPEED
  local ballRadius = Scale(BALL_RADIUS)
  local firstRowY, lastRowY
  local minRow, maxRow = math.huge, -math.huge
  for _, grid in ipairs(grids) do
    local ball = grid.ball
    if ball then
      local body = ball.body
      if maxRow < grid.y then
        lastRowY = body.y - body.radius
        maxRow = grid.y
      end
      if minRow > grid.y then
        minRow = grid.y
        firstRowY = body.y + body.radius
      end
    end
  end
  if firstRowY and lastRowY then
    local topBoundary = worldCenter.y + worldHeight * 0.5
    local maxRowUnderTopBoundary = 9
    local outerCircleRadius = Scale(OUTER_CIRCLE_RADIUS)
    local py = (0.5 - 1.5 * maxRowUnderTopBoundary) * outerCircleRadius
    local bottom = topBoundary + py - ballRadius + (outerCircleRadius - ballRadius)
    local topDiff = firstRowY - worldCenter.y - worldHeight * 0.5
    local bottomDiff = bottom - lastRowY
    if bottomDiff > epsilon then
      local duration = bottomDiff / speed
      MoveAllGrids(rowOffset + bottomDiff, tween, duration, complete)
      return true
    elseif bottomDiff < 0 and math.abs(bottomDiff) / ballRadius >= 1 then
      local offset = bottomDiff
      offset = math.max(-math.max(0, topDiff), offset)
      if 0 ~= offset then
        local duration = math.abs(offset / speed)
        MoveAllGrids(rowOffset + offset, tween, duration, complete)
        return true
      end
    end
  end
  if type(complete) == "function" then
    complete()
  end
end
local candidateColors, randomColors
local UpdateCandidateColors = function()
  candidateColors = candidateColors or {}
  table.clear(candidateColors)
  local buffer = GetBuffer()
  local topBoundary = worldCenter.y + worldHeight * 0.5
  local ballRadius = Scale(BALL_RADIUS)
  for _, grid in ipairs(grids) do
    local _, py = position(grid.x, grid.y)
    local ball = grid.ball
    if ball and py - topBoundary <= -ballRadius + epsilon then
      buffer[ball.color] = true
    end
  end
  for color, _ in pairs(buffer) do
    for _, uniColor in ipairs(UNI_COLOR_LIST) do
      if 0 ~= color & uniColor and not table.keyof(candidateColors, uniColor) then
        table.insert(candidateColors, uniColor)
      end
    end
  end
  PoolBuffer(buffer)
end
local duplicateCount
local MAX_DUPLICATE_COUNT = 1
local UpdateCandidateColor = function()
  UpdateCandidateColors()
  local numCandidates = #candidateColors
  if numCandidates > 0 then
    for i = #randomColors, 1, -1 do
      if not table.keyof(candidateColors, randomColors[i]) then
        table.remove(randomColors, i)
      end
    end
    local reset = false
    if 0 == #randomColors then
      reset = true
      for i, v in ipairs(candidateColors) do
        table.insert(randomColors, v)
      end
    end
    local prevCandidateType = candidateItemType
    if prevCandidateType ~= ITEM_TYPE.BALL then
      candidateItemType = ITEM_TYPE.BALL
      local temp = candidateBallColor
      candidateBallColor = nextCandidateBallColor
      nextCandidateBallColor = temp
      if candidateBallColor ~= BALL_COLOR.NONE and not table.keyof(candidateColors, candidateBallColor) then
        duplicateCount = 0
        candidateBallColor = table.remove(randomColors, math.random(1, #randomColors))
      end
      if nextCandidateBallColor ~= BALL_COLOR.NONE and not table.keyof(candidateColors, nextCandidateBallColor) then
        nextCandidateBallColor = BALL_COLOR.NONE
      end
    else
      if table.keyof(candidateColors, nextCandidateBallColor) or nextCandidateBallColor == BALL_COLOR.NONE then
        candidateBallColor = nextCandidateBallColor
      else
        duplicateCount = 0
        candidateBallColor = table.remove(randomColors, math.random(1, #randomColors))
      end
      nextCandidateBallColor = BALL_COLOR.NONE
    end
    remainedShootCount = math.max(0, remainedShootCount - 1)
    if remainedShootCount > 0 then
      if nextCandidateBallColor == BALL_COLOR.NONE then
        local percent = math.random(0, numCandidates * 100) / (numCandidates * 100)
        local duplicate = percent <= 1 / numCandidates
        if not reset and duplicateCount < MAX_DUPLICATE_COUNT and duplicate then
          nextCandidateBallColor = candidateBallColor
          duplicateCount = duplicateCount + 1
        else
          duplicateCount = 0
          if 0 == #randomColors then
            reset = true
            for i, v in ipairs(candidateColors) do
              table.insert(randomColors, v)
            end
          end
          local randomIndex = math.random(1, #randomColors)
          if reset and #randomColors > 1 and randomColors[randomIndex] == candidateBallColor then
            local buffer = GetBuffer()
            for i, v in ipairs(randomColors) do
              if i ~= randomIndex then
                table.insert(buffer, v)
              end
            end
            local color = table.remove(buffer, math.random(1, #buffer))
            PoolBuffer(buffer)
            nextCandidateBallColor = table.remove(randomColors, table.keyof(randomColors, color))
          else
            nextCandidateBallColor = table.remove(randomColors, randomIndex)
          end
        end
      end
    elseif candidateBallColor == BALL_COLOR.NONE then
      if bombCount > 0 then
        candidateItemType = ITEM_TYPE.BOMB
      elseif fireworksCount > 0 then
        candidateItemType = ITEM_TYPE.FIREWORKS
      end
    end
  end
end
local DestroyOutOfBoundsItems = function()
  local flag = false
  for body, item in pairs(bodyItemLookup) do
    local radius = body.radius
    local x, y = body.x, body.y
    if item.type == ITEM_TYPE.BALL or item.type == ITEM_TYPE.BOMB then
      local maxX, maxY = x + radius, y + radius
      local minX, minY = x - radius, y - radius
      local bottomBoundary = worldCenter.y - worldHeight * 1.2
      local topBoundary = worldCenter.y + worldHeight * 0.6
      local leftBoundary = worldCenter.x - worldWidth * 0.6
      local rightBoundary = worldCenter.x + worldWidth * 0.6
      if item.state == ITEM_STATE.DROP then
        flag = true
        if maxY < bottomBoundary or minY > topBoundary or maxX < leftBoundary or minX > rightBoundary then
          if item.tweenId then
            LeanTween.cancel(item.tweenId)
            local k = table.keyof(tweeners, item.tweenId)
            if k then
              table.remove(tweeners, k)
            end
            item.tweenId = nil
          end
          DestroyItem(item, false)
        end
      end
    elseif item.type == ITEM_TYPE.FIREWORKS then
      flag = true
      local box = body.aabb
      local minX, maxX = worldCenter.x - worldWidth * 0.5, worldCenter.x + worldWidth * 0.5
      local minY, maxY = worldCenter.y - worldHeight * 0.5, worldCenter.y + worldHeight * 0.65
      if not (maxX > box[1] and minX < box[3]) or not (maxY > box[2]) then
        if item.combo then
          combo = (combo or 0) + 1
          if combo >= FIREWORKS_CONDITION then
            fireworksCount = fireworksCount + 1
            combo = 0
          end
        else
          combo = 0
        end
        DestroyItem(item, false)
        AutoCorrectGridPositions(true, nil, function()
          UpdateCandidateColor()
          if type(__onfinishedshooting) == "function" then
            __onfinishedshooting()
          end
          if type(__ongameover) == "function" then
            local gameOver, win = GameOver()
            if gameOver then
              __ongameover(win, elapse)
              __ongameover = nil
            end
          end
        end)
      end
    end
  end
  if not flag then
    simulate = false
  end
end
local Iterate = function(x, y, overFunc)
  local grid = GetGrid(x, y)
  local openlist = GetBuffer()
  local closelist = GetBuffer()
  if grid and grid.ball then
    table.insert(openlist, grid)
  end
  local result = false
  while #openlist > 0 do
    local removed = table.remove(openlist)
    table.insert(closelist, removed)
    if overFunc(x, y, removed) then
      result = true
      break
    end
    local nx, ny = offset_neighbor(removed.x, removed.y, 4)
    local neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
    nx, ny = offset_neighbor(removed.x, removed.y, 3)
    neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
    nx, ny = offset_neighbor(removed.x, removed.y, 6)
    neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
    nx, ny = offset_neighbor(removed.x, removed.y, 5)
    neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
    nx, ny = offset_neighbor(removed.x, removed.y, 1)
    neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
    nx, ny = offset_neighbor(removed.x, removed.y, 2)
    neighbor = GetGrid(nx, ny)
    if neighbor and neighbor.ball and not table.keyof(closelist, neighbor) then
      table.insert(openlist, neighbor)
    end
  end
  PoolBuffer(openlist)
  PoolBuffer(closelist)
  return result
end
local ExistsHangingPoint = function(x, y)
  if 1 == y then
    return true
  end
  for i = 3, 4 do
    local neighborX, neighborY = offset_neighbor(x, y, i)
    local grid = GetGrid(neighborX, neighborY)
    if grid and grid.ball then
      return true
    end
  end
  return false
end
local WithBall = function(grid)
  return grid and grid.ball ~= nil
end
local ReachPrevRow = function(startX, startY, neighbor)
  return neighbor.y <= startY - 1
end
local SearchPath = function(sx, sy, ex, ey)
  local callback = function(_, _, node)
    if node.x == ex and node.y == ey then
      return true
    end
  end
  return Iterate(sx, sy, callback)
end
local NeighborIsGrayOrStone = function(x, y, neighbor)
  return neighbor.ball.color ~= BALL_COLOR.GRAY and neighbor.ball.color ~= BALL_COLOR.STONE
end
local DropBall = function(ball)
  local rdmX = (math.random(0, 100) / 100 - 0.5) * 0.5
  local rdmY = math.random(0, 100) / 100 * Scale(BALL_RADIUS)
  local dropTargetY = worldCenter.y - worldHeight * 2
  local body = ball.body
  local point = Vector2(body.x, body.y)
  local targetPosition = Vector2(body.x + rdmX, body.y + rdmY)
  local dist = math.sqrt(rdmX ^ 2 + rdmY ^ 2)
  local tweenId
  tweenId = LeanTween.value(0, 1, dist / 1.3):setOnUpdate(function(val)
    local pos = point + (targetPosition - point) * val
    body:setPos(pos.x, pos.y)
  end):setOnComplete(function()
    RemoveTween(tweenId)
    local nowY = body.y
    tweenId = LeanTween.value(0, 1, (nowY - dropTargetY) / DROP_VELOCITY):setOnUpdate(function(val)
      local y = nowY + (dropTargetY - nowY) * val
      body:setPos(body.x, y)
    end):setOnComplete(function()
      ball.tweenId = nil
      RemoveTween(tweenId)
    end):setEase(LeanTweenType.easeInCubic).id
    ball.tweenId = tweenId
    InsertTween(tweenId)
  end):setEase(LeanTweenType.easeInOutQuad).id
  ball.tweenId = tweenId
  InsertTween(tweenId)
end
local DropWithoutHangingPointGrids = function()
  local dropCount = 0
  for col = minGridCol, maxGridCol do
    local firstRowGrid = GetGrid(col, 1)
    if firstRowGrid and firstRowGrid.ball then
      local ball = firstRowGrid.ball
      if (ball.color == BALL_COLOR.GRAY or ball.color == BALL_COLOR.STONE) and not Iterate(firstRowGrid.x, firstRowGrid.y, NeighborIsGrayOrStone) then
        ball.state = ITEM_STATE.DROP
        DropBall(ball)
        Detach(ball)
        dropCount = dropCount + 1
      end
    end
  end
  for y = 1, maxGridRow do
    local dropBalls = GetBuffer()
    local colIndex
    for x = minGridCol, maxGridCol do
      local grid = GetGrid(x, y)
      if grid and grid.ball then
        if ExistsHangingPoint(x, y) or type(colIndex) == "number" and x == colIndex + 1 then
          colIndex = x
          for i = #dropBalls, 1, -1 do
            local ball = dropBalls[i]
            if SearchPath(ball.gridX, ball.gridY, colIndex, y) then
              table.remove(dropBalls, i)
              colIndex = ball.gridX
            end
          end
        elseif type(colIndex) == "number" then
          if not SearchPath(x, y, colIndex, y) then
            table.insert(dropBalls, grid.ball)
          end
        else
          table.insert(dropBalls, grid.ball)
        end
      end
    end
    dropCount = dropCount + #dropBalls
    for _, ball in ipairs(dropBalls) do
      ball.state = ITEM_STATE.DROP
      DropBall(ball)
      Detach(ball)
    end
    PoolBuffer(dropBalls)
  end
  if dropCount >= BOMB_CONDITION then
    bombCount = bombCount + 1
  end
  return dropCount > 0
end
local Eliminate = function(ball, spreadIceFilter, fireworks)
  local effect = ball.effect
  local gridX, gridY = ball.gridX, ball.gridY
  local changed = false
  local destroyed = false
  if effect == BALL_EFFECT.NONE then
    destroyed = true
  elseif 0 ~= effect & BALL_EFFECT.FREEZE then
    changed = true
    ball.effect = ball.effect ~ BALL_EFFECT.FREEZE
  elseif 0 ~= effect & BALL_EFFECT.CHAIN then
    changed = true
    ball.effect = ball.effect ~ BALL_EFFECT.CHAIN
  elseif 0 ~= effect & BALL_EFFECT.CHAIN_X2 then
    changed = true
    ball.effect = ball.effect ~ BALL_EFFECT.CHAIN_X2 | BALL_EFFECT.CHAIN
  elseif 0 ~= effect & BALL_EFFECT.ICE then
    changed = true
    ball.effect = ball.effect ~ BALL_EFFECT.ICE
    ball.spreadFlag = true
    SpreadICE(gridX, gridY, spreadIceFilter, 2)
  end
  if destroyed then
    DestroyItem(ball, true, fireworks)
  end
  if changed and type(__onballeffectchanged) == "function" then
    __onballeffectchanged(ball, effect, ball.effect)
  end
  return destroyed, changed
end
local Boom = function(balls, callback)
  local animations = GetBuffer()
  local bounds = CS.UnityEngine.Bounds(worldCenter, Vector3.negativeInfinity)
  local notWillBeDestroyed = function(ball)
    return not table.keyof(balls, ball)
  end
  local boomed = false
  for _, ball in ipairs(balls) do
    local effect = ball.effect
    local gridX, gridY = ball.gridX, ball.gridY
    local destroyed, _ = Eliminate(ball, notWillBeDestroyed)
    if destroyed then
      local px, py = position(gridX, gridY)
      local radius = Scale(BALL_RADIUS)
      bounds:Encapsulate(Vector3(px + radius, py + radius))
      bounds:Encapsulate(Vector3(px - radius, py - radius))
      local buffer = GetBuffer()
      local neighbors = GetNeighbors(gridX, gridY, buffer, WithBall)
      for _, neighbor in ipairs(neighbors) do
        if not table.keyof(balls, neighbor.ball) then
          table.insert(animations, neighbor.ball)
        end
      end
      PoolBuffer(buffer)
      boomed = true
    end
  end
  if boomed then
    combo = (combo or 0) + 1
  end
  if combo >= FIREWORKS_CONDITION then
    fireworksCount = fireworksCount + 1
    combo = 0
  end
  local drop = DropWithoutHangingPointGrids()
  if not drop and type(__ongameover) == "function" then
    local gameOver, win = GameOver()
    if gameOver then
      __ongameover(win, elapse)
      __ongameover = nil
    end
  end
  local center = bounds.center
  local progress = 0
  local count = 0
  local onShakeAnimationComplete = type(callback) == "function" and function()
    progress = progress + 1
    if progress >= count then
      callback(drop)
    end
  end
  local flag = false
  for _, ball in ipairs(animations) do
    if ball.gridX and ball.gridY then
      flag = true
      count = count + 1
      PlayShakeAnimation(center.x, center.y, ball, BOUNCE_SCALES, onShakeAnimationComplete)
    end
  end
  if not flag and type(callback) == "function" then
    callback(drop)
  end
  return drop
end
local SwitchCandidateType = function(itemType)
  local prevCandidate = candidateItemType
  candidateItemType = itemType
  if prevCandidate == ITEM_TYPE.BALL and itemType ~= ITEM_TYPE.BALL then
    local temp = candidateBallColor
    candidateBallColor = nextCandidateBallColor
    nextCandidateBallColor = temp
    remainedShootCount = remainedShootCount + 1
  end
end
local SwitchCandidateColor = function()
  local prevCandidateType = candidateItemType
  if prevCandidateType ~= ITEM_TYPE.BALL then
    remainedShootCount = remainedShootCount - 1
  end
  candidateItemType = ITEM_TYPE.BALL
  local temp = candidateBallColor
  candidateBallColor = nextCandidateBallColor
  nextCandidateBallColor = temp
end
local RayCastCircle = function(origin, direction, center, radius)
  local diff = center - origin
  local magnitude = diff.magnitude
  local dot = Vector2.Dot(diff, direction)
  local val = radius ^ 2 - (magnitude ^ 2 - dot ^ 2)
  if val >= 0 then
    local sqrtVal = math.sqrt(val)
    local t = dot - sqrtVal
    local point = origin + direction * t
    return true, point
  end
  return false
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
local RayCastBall = function(origin, direction)
  local point, target
  local normalizedDirection = direction.normalized
  local ballRadius = Scale(BALL_RADIUS)
  local topBoundary = worldCenter.y + worldHeight * 0.5
  for _, grid in ipairs(grids) do
    local ball = grid.ball
    if ball then
      local px, py = position(grid.x, grid.y)
      local cast, intersection = RayCastCircle(origin, normalizedDirection, Vector2(px, py), ballRadius + epsilon)
      if cast and py - topBoundary <= ballRadius + epsilon and (not point or Vector2.Distance(origin, point) > Vector2.Distance(origin, intersection)) then
        point = intersection
        target = grid
      end
    end
  end
  return point, target
end

local function RayCastEdges(origin, direction, pointsBuffer, castNum)
  castNum = castNum or 1
  if castNum > 4 then
    return
  end
  pointsBuffer = pointsBuffer or {}
  local len = #worldEdges
  local normalizedDirection = direction.normalized
  for i = 1, len do
    local nextI = i + 1
    if len >= nextI then
      local e0, e1 = worldEdges[i], worldEdges[nextI]
      local cast, intersection = Intersects(worldEdges[i], worldEdges[nextI], origin, normalizedDirection)
      if cast then
        local exists = false
        for _, v in ipairs(pointsBuffer) do
          if Vector2.Distance(v, intersection) < 0.01 then
            exists = true
            break
          end
        end
        if not exists then
          table.insert(pointsBuffer, intersection)
          local diff = e1 - e0
          local reflection
          if math.abs(diff.y) > 0 then
            reflection = Vector2(-normalizedDirection.x, normalizedDirection.y)
          else
            reflection = Vector2(normalizedDirection.x, -normalizedDirection.y)
          end
          local point, target = RayCastBall(intersection, reflection, pointsBuffer)
          if not target then
            point, target = RayCastEdges(intersection, reflection, pointsBuffer, castNum + 1)
          end
          if target then
            return point, target, pointsBuffer
          end
        end
      end
    end
  end
end

local onsegment = function(q, pi, pj)
  return (q.x - pi.x) * (pj.y - pi.y) == (q.y - pi.y) * (pj.x - pi.x) and math.min(pi.x, pj.x) <= q.x and q.x <= math.max(pi.x, pj.x) and math.min(pi.y, pj.y) <= q.y and q.y <= math.max(pi.y, pj.y)
end
local RayCast = function(origin, direction, positionBuffer, castNum)
  local isGrid = false
  local point, target = RayCastBall(origin, direction)
  if not target then
    point, target = RayCastEdges(origin, direction, positionBuffer, castNum)
  end
  if not target then
    local result
    local p0, p1 = worldEdges[2], worldEdges[3]
    for i, q in ipairs(positionBuffer) do
      if onsegment(q, p0, p1) then
        result = i
        break
      end
    end
    local intersection = positionBuffer[result]
    local x, y = position(1, 1)
    local radius = Scale(BALL_RADIUS)
    if result and y - intersection.y <= -radius + epsilon then
      isGrid = true
      local minDist = math.huge
      local leftDist = x - radius - (worldCenter.x - worldWidth * 0.5)
      local rightDist = worldCenter.x + worldWidth * 0.5 - (x + radius)
      local leftCnt = math.ceil(leftDist / (radius * 2))
      local rightCnt = math.ceil(rightDist / (radius * 2))
      minDist = math.huge
      local targetCol
      for col = 1 - leftCnt, 1 + rightCnt do
        local px, py = position(col, 1)
        local dist = (intersection.x - px) ^ 2 + (intersection.y - py) ^ 2
        if minDist > dist then
          minDist = dist
          targetCol = col
        end
      end
      if targetCol then
        target = GetGrid(targetCol, 1)
        target = target or CreateGrid(targetCol, 1)
        point = intersection
        for i = #positionBuffer, result, -1 do
          table.remove(positionBuffer, i)
        end
      end
    else
    end
  end
  return isGrid, point, target, positionBuffer
end

local function TweenTrack(track, item, index, endCallback)
  local len = #track
  if track and index <= len then
    local body = item.body
    local point = Vector2(body.x, body.y)
    local targetPosition = track[index]
    local dist = Vector2.Distance(point, targetPosition)
    local duration = dist / SHOOT_VELOCITY
    local tweenId
    tweenId = LeanTween.value(0, 1, duration):setOnUpdate(function(val)
      local pos = point + (targetPosition - point) * val
      body:setPos(pos.x, pos.y)
    end):setOnComplete(function()
      RemoveTween(tweenId)
      if index < len then
        TweenTrack(track, item, index + 1, endCallback)
      elseif type(endCallback) == "function" then
        endCallback()
      end
    end):setEase(LeanTweenType.linear).id
    InsertTween(tweenId)
  end
end

local Shoot = function(direction)
  if not GameOver() and candidateItemType and (not tweeners or 0 == #tweeners) then
    if candidateItemType == ITEM_TYPE.BALL and candidateBallColor == BALL_COLOR.NONE then
      return
    end
    local point = getReadyPointFunc()
    local origin, rayDirection = Vector2(point.x, point.y), Vector2(direction.x, direction.y)
    if candidateItemType == ITEM_TYPE.BALL or candidateItemType == ITEM_TYPE.BOMB then
      local track = GetBuffer()
      local isGrid, intersection, grid = RayCast(origin, rayDirection, track)
      local item
      local angle = math.rad(Vector2.SignedAngle(Vector2.up, rayDirection))
      if candidateItemType == ITEM_TYPE.BALL then
        item = CreateBall(point.x, point.y, candidateBallColor, BALL_EFFECT.NONE, ITEM_STATE.PROJECTILE, angle)
      elseif candidateItemType == ITEM_TYPE.BOMB then
        bombCount = bombCount - 1
        item = CreateBomb(point.x, point.y, ITEM_STATE.PROJECTILE, angle)
      end
      if candidateItemType == ITEM_TYPE.BALL then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_11_wh")
      end
      if intersection and grid then
        local body = item.body
        local gridX, gridY = grid.x, grid.y
        local x, y
        if not isGrid then
          local px, py = position(gridX, gridY)
          local right = px <= intersection.x
          local angle = Vector2.Angle(intersection - Vector2(px, py), Vector2.down)
          if angle < 50 then
            local dir = right and 6 or 5
            x, y = offset_neighbor(gridX, gridY, dir)
            local neighbor = GetGrid(x, y)
            if neighbor and neighbor.ball then
              dir = right and 5 or 6
              x, y = offset_neighbor(gridX, gridY, dir)
              neighbor = GetGrid(x, y)
              if neighbor and neighbor.ball then
                dir = right and 2 or 1
                x, y = offset_neighbor(gridX, gridY, dir)
              end
            end
          elseif angle < 180 and angle > 125 and gridY > 1 then
            local dir = right and 4 or 3
            x, y = offset_neighbor(gridX, gridY, dir)
            local neighbor = GetGrid(x, y)
            if neighbor and neighbor.ball then
              dir = right and 3 or 4
              x, y = offset_neighbor(gridX, gridY, dir)
              neighbor = GetGrid(x, y)
              if neighbor and neighbor.ball then
                dir = right and 2 or 1
                x, y = offset_neighbor(gridX, gridY, dir)
              end
            end
          else
            local dir = right and 2 or 1
            x, y = offset_neighbor(gridX, gridY, dir)
            local neighbor = GetGrid(x, y)
            if neighbor and neighbor.ball then
              dir = right and 6 or 5
              x, y = offset_neighbor(gridX, gridY, dir)
              neighbor = GetGrid(x, y)
              if neighbor and neighbor.ball then
                dir = right and 4 or 3
                x, y = offset_neighbor(gridX, gridY, dir)
              end
            end
          end
        else
          x, y = grid.x, grid.y
        end
        table.insert(track, intersection)
        local p0 = point
        for i = 1, #track do
          local p1 = track[i]
          p0 = p1
        end
        TweenTrack(track, item, 1, function()
          local tx, ty = position(x, y)
          body:setPos(tx, ty)
          local complete = function(drop)
            if not drop then
              AutoCorrectGridPositions(true, nil, function()
                UpdateCandidateColor()
                if type(__onfinishedshooting) == "function" then
                  __onfinishedshooting()
                end
                if type(__ongameover) == "function" then
                  local gameOver, win = GameOver()
                  if gameOver then
                    __ongameover(win, elapse)
                    __ongameover = nil
                  end
                end
              end)
            else
              local tweenId
              tweenId = LeanTween.delayedCall(0.5, function()
                RemoveTween(tweenId)
                AutoCorrectGridPositions(true, nil, function()
                  UpdateCandidateColor()
                  if type(__onfinishedshooting) == "function" then
                    __onfinishedshooting()
                  end
                  if type(__ongameover) == "function" then
                    local gameOver, win = GameOver()
                    if gameOver then
                      __ongameover(win, elapse)
                      __ongameover = nil
                    end
                  end
                end)
              end).id
              InsertTween(tweenId)
            end
          end
          if item.type == ITEM_TYPE.BALL then
            InsertBall(item, x, y, true)
            local sameBallsBuffer = GetBuffer()
            local sameBalls = CollectNeighborSameBalls(item, item.color, sameBallsBuffer)
            if #sameBalls >= MIN_BOOM_SAME_BALL_NUM then
              local boomBallsBuffer = GetBuffer()
              table.clear(boomBallsBuffer)
              local balls = CollectBoomBalls(sameBalls, boomBallsBuffer)
              Boom(balls, complete)
              PoolBuffer(boomBallsBuffer)
              PoolBuffer(sameBallsBuffer)
            else
              combo = 0
              SpreadFreeze()
              PlayInsertAnimation(x, y, complete)
            end
            PoolBuffer(track)
          elseif item.type == ITEM_TYPE.BOMB then
            local boomGrids = GetGridsAround(x, y, BOOM_RADIUS, WithBall)
            if boomGrids then
              local buffer = GetBuffer()
              for _, v in ipairs(boomGrids) do
                if v.ball.color ~= BALL_COLOR.STONE then
                  table.insert(buffer, v.ball)
                end
              end
              Boom(buffer, complete)
              PoolBuffer(buffer)
            else
              combo = 0
              complete()
            end
            DestroyItem(item, true)
          end
        end)
        return true
      else
        local len = #track
        local lastPoint = track[len]
        local velocityDirection
        if len > 1 then
          velocityDirection = lastPoint - track[len - 1]
        else
          velocityDirection = lastPoint - Vector2(point.x, point.y)
        end
        local normalized = velocityDirection.normalized
        TweenTrack(track, item, 1, function()
          simulate = true
          local body = item.body
          body:applyImpulse(normalized.x * SHOOT_VELOCITY, normalized.y * SHOOT_VELOCITY)
          item.state = ITEM_STATE.DROP
          combo = 0
          UpdateCandidateColor()
          if type(__onfinishedshooting) == "function" then
            __onfinishedshooting()
          end
          if type(__ongameover) == "function" then
            local gameOver, win = GameOver()
            if gameOver then
              __ongameover(win, elapse)
              __ongameover = nil
            end
          end
        end)
        return true
      end
    elseif candidateItemType == ITEM_TYPE.FIREWORKS then
      simulate = true
      local item = CreateFireworks(point.x, point.y, Vector2.SignedAngle(Vector2.up, rayDirection), ITEM_STATE.PROJECTILE)
      local vel = rayDirection.normalized * SHOOT_VELOCITY
      item.body.layerMask = -1
      item.body:applyImpulse(vel.x, vel.y)
      fireworksCount = fireworksCount - 1
      return true
    end
  end
  return false
end
local OnCollide = function(_, bodyA, bodyB, _, _)
  local itemA, itemB = bodyItemLookup[bodyA], bodyItemLookup[bodyB]
  if itemA and itemB then
    local stateA, stateB = itemA.state, itemB.state
    if stateA == ITEM_STATE.DROP or stateB == ITEM_STATE.DROP or stateA == ITEM_STATE.NONE or stateB == ITEM_STATE.NONE then
      return
    end
    if stateA == stateB then
      return
    end
    local staticBall = stateA == ITEM_STATE.PROJECTILE and itemB or itemA
    local projectileItem = stateA == ITEM_STATE.PROJECTILE and itemA or itemB
    local itemType = projectileItem.type
    if itemType == ITEM_TYPE.FIREWORKS then
      local topBoundary = worldCenter.y + worldHeight * 0.5
      if staticBall.color ~= BALL_COLOR.STONE and staticBall.body.y - topBoundary <= -Scale(BALL_RADIUS) + epsilon then
        local destroyed, changed = Eliminate(staticBall, nil, true)
        if destroyed or changed then
          projectileItem.combo = true
        end
        DropWithoutHangingPointGrids()
      end
    end
  else
  end
end
local Update = function()
  if type(__onupdate) == "function" then
    __onupdate(allItems)
  end
end
local FixedUpdate = function()
  local timestep = Time.fixedDeltaTime
  elapse = elapse + timestep
  if simulate and world then
    world:step(timestep)
  end
  DestroyOutOfBoundsItems()
end
local RecalculateColumnOffset = function()
  local radius = Scale(OUTER_CIRCLE_RADIUS)
  local bounds = CS.UnityEngine.Bounds(Vector3.zero, Vector3.negativeInfinity)
  local minx, maxx, miny, maxy = math.huge, -math.huge, math.huge, -math.huge
  for _, grid in ipairs(grids) do
    local x, y = position(grid.x, grid.y)
    maxx = math.max(x + radius, maxx)
    maxx = math.max(x - radius, maxx)
    minx = math.min(x - radius, minx)
    minx = math.min(x + radius, minx)
    maxy = math.max(y + radius, maxy)
    maxy = math.max(y - radius, maxy)
    miny = math.min(y - radius, miny)
    miny = math.min(y + radius, miny)
    bounds:Encapsulate(Vector3(x + radius, y + radius))
    bounds:Encapsulate(Vector3(x - radius, y - radius))
  end
  local width, height = maxx - minx, maxy - miny
  colOffset = (worldWidth - width) * 0.5 - SQRT3 * radius * 0.5
end
local Release = function()
  if tweeners then
    for _, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
    table.clear(tweeners)
  end
  if allItems then
    if type(__ondestroyitem) == "function" then
      for _, ball in ipairs(allItems) do
        __ondestroyitem(ball)
      end
    end
    table.clear(allItems)
  end
  if bodyItemLookup then
    table.clear(bodyItemLookup)
  end
  grids = nil
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.RemoveFixedUpdateHandler(FixedUpdate)
end
local Initialize = function(ROW, COL, maxShootNum, balls, center, width, height, OnUpdate, onCreateItem, onDestroyItem, onBallEffectChanged, onFinishedShooting, getReadyPoint, onGameOver)
  Release()
  __onupdate = OnUpdate
  __oncreateitem = onCreateItem
  __ondestroyitem = onDestroyItem
  __onfinishedshooting = onFinishedShooting
  __onballeffectchanged = onBallEffectChanged
  __ongameover = onGameOver
  world = World.New(nil, OnCollide, nil)
  world.gravityY = GRAVITY
  grids = {}
  allItems = {}
  simulate = false
  combo = 0
  elapse = 0
  bombCount = 0
  fireworksCount = 0
  colOffset, rowOffset = 0, 0
  minGridRow, minGridCol = 1, 1
  maxGridRow, maxGridCol = ROW, COL
  remainedShootCount = maxShootNum + 5
  worldCenter = center
  worldWidth = width
  worldHeight = height
  worldEdges = {
    Vector2(worldCenter.x - worldWidth * 0.5, worldCenter.y - worldHeight * 0.5),
    Vector2(worldCenter.x - worldWidth * 0.5, worldCenter.y + worldHeight * 0.5),
    Vector2(worldCenter.x + worldWidth * 0.5, worldCenter.y + worldHeight * 0.5),
    Vector2(worldCenter.x + worldWidth * 0.5, worldCenter.y - worldHeight * 0.5)
  }
  FillPositions(grids, COL, ROW, minGridRow, minGridCol)
  table.sort(grids, function(a, b)
    return a.id < b.id
  end)
  RecalculateColumnOffset()
  FillBalls(balls)
  getReadyPointFunc = getReadyPoint
  randomColors = {}
  candidateItemType = ITEM_TYPE.BALL
  candidateBallColor = BALL_COLOR.NONE
  nextCandidateBallColor = 0
  UpdateCandidateColor()
  local tweenId
  tweenId = LeanTween.delayedCall(0.5, function()
    RemoveTween(tweenId)
    AutoCorrectGridPositions(true, GAME_START_MOVE_SPEED)
  end).id
  InsertTween(tweenId)
  UpdateManager.AddUpdateHandler(Update)
  UpdateManager.AddFixedUpdateHandler(FixedUpdate)
end
local GetCandidateType = function()
  return candidateItemType
end
local GetCandidateColor = function()
  return candidateBallColor
end
local GetNextCandidateColor = function()
  return nextCandidateBallColor
end
local GetBombCount = function()
  return bombCount
end
local GetFireworksCount = function()
  return fireworksCount
end
local GetComboCount = function()
  return combo
end
local GetRemainedShootCount = function()
  return remainedShootCount
end
local GetElapse = function()
  return elapse
end
return {
  Release = Release,
  Initialize = Initialize,
  Shoot = Shoot,
  SwitchCandidateColor = SwitchCandidateColor,
  SwitchCandidateType = SwitchCandidateType,
  RayCast = RayCast,
  GetCandidateType = GetCandidateType,
  GetCandidateColor = GetCandidateColor,
  GetNextCandidateColor = GetNextCandidateColor,
  GetBombCount = GetBombCount,
  GetFireworksCount = GetFireworksCount,
  GetRemainedShootCount = GetRemainedShootCount,
  GetElapse = GetElapse,
  GetComboCount = GetComboCount,
  ITEM_TYPE = ITEM_TYPE,
  BALL_COLOR = BALL_COLOR,
  BALL_EFFECT = BALL_EFFECT
}
