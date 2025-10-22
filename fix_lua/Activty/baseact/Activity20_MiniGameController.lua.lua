local ACTIVITY20_MINIGAME_CONFIGS = require("Activity20_MiniGameConfigs")
local NUM_PREVIEW_TYPES = 3
local GUGU_MOVE_SPEED = 5
local GUGU_MOVE_SPEED2 = 3
local GUGU_MOVE_SPEED3 = 4
local pathfinder, worldCenter, grids, gridRows, gridColumns, gridWidth, gridHeight, previewEntries, leftPositions, rightPositions, channels, gugus, tetrominos, guguRandomColors, randomTetrominos, guguIdx, motionTasks, filling, gameOver, elapse, score, winConditions, numRoads, gridsOfRoad, PopupGuguGotoSameColorCell, __oncreatetetromino, __ondestroycell, __oncreatepreviewentry, __oncreatechannel, __oncreategugu, __ondestroygugu, __onreached, __ongameover
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return Mathf.RoundToInt(newX), Mathf.RoundToInt(newY)
end
local AdaptScale = function(value)
  return value * UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
end
local RC2Position = function(row, column)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local width = gridColumns * gw
  local height = gridRows * gh
  local startX = worldCenter.x - width * 0.5
  local startY = worldCenter.y - height * 0.5
  local px = startX + (column - 0.5) * gw
  local py = startY + (row - 0.5) * gh
  return px, py
end
local position2RC = function(x, y)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local width = gridColumns * gw
  local height = gridRows * gh
  local startX = worldCenter.x - width * 0.5
  local startY = worldCenter.y - height * 0.5
  local rx, ry = x - startX, y - startY
  local row, _ = math.modf(math.ceil(ry / gh))
  local column, _ = math.modf(math.ceil(rx / gw))
  return row, column
end
local UpdateTetrominoCellsPosition = function(tetromino)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  for _, cell in ipairs(tetromino.cells) do
    cell.x = tetromino.x + cell.localX * gw
    cell.y = tetromino.y + cell.localY * gh
  end
end
local CreateGrid = function(row, column)
  local inst = {}
  inst.row = row
  inst.column = column
  inst.x, inst.y = RC2Position(row, column)
  return inst
end
local GetGrid = function(row, column)
  if row > 0 and row <= gridRows and column > 0 and column <= gridColumns then
    local index = (row - 1) * gridColumns + column
    return grids[index]
  end
end
local CreateGugu = function(channelPosition, color, specialPosition)
  guguIdx = (guguIdx or 0) + 1
  local inst = {}
  inst.color = color
  inst.x = specialPosition and specialPosition.x or channelPosition.x
  inst.y = specialPosition and specialPosition.y or channelPosition.y
  inst.id = guguIdx
  if type(__oncreategugu) == "function" then
    __oncreategugu(inst)
  end
  return inst
end
local DestroyGugu = function(gugu)
  if type(__ondestroygugu) == "function" then
    __ondestroygugu(gugu)
  end
end
local CreateTetromino = function(tetrominoType, x, y, angle, color, ghost)
  local inst = {}
  inst.type = tetrominoType
  inst.angle = angle or 0
  inst.cells = {}
  inst.x = x
  inst.y = y
  inst.color = color
  inst.ghost = ghost
  local config = ACTIVITY20_MINIGAME_CONFIGS[tetrominoType]
  local anchor = config.anchor
  local anchorCell = config.cells[anchor]
  for _, v in ipairs(config.cells) do
    local localX, localY = rotatePointAround(v.x - anchorCell.x, v.y - anchorCell.y, inst.angle, 0, 0)
    table.insert(inst.cells, {
      localX = localX,
      localY = localY,
      owner = inst,
      color = color
    })
  end
  inst.anchor = anchor
  UpdateTetrominoCellsPosition(inst)
  table.insert(tetrominos, inst)
  if type(__oncreatetetromino) == "function" then
    __oncreatetetromino(inst, ghost)
  end
  return inst
end
local DestroyTetromino = function(tetromino, matched)
  local count = 0
  if not tetromino then
    return count
  end
  local k = table.keyof(tetrominos, tetromino)
  if k then
    table.remove(tetrominos, k)
    for _, cell in ipairs(tetromino.cells) do
      if not cell.destroyed then
        count = count + 1
        local grid = GetGrid(position2RC(cell.x, cell.y))
        if grid and grid.cell == cell then
          grid.cell = false
        end
        cell.destroyed = true
        if cell.gugu then
          DestroyGugu(cell.gugu)
        end
        cell.gugu = false
        if type(__ondestroycell) == "function" then
          __ondestroycell(cell, matched)
        end
        if matched and type(winConditions) == "number" and winConditions > 0 then
          winConditions = winConditions - 1
          if winConditions <= 0 then
            gameOver = true
            if type(__ongameover) == "function" then
              __ongameover(true)
            end
          end
        end
      end
    end
  end
  return count
end
local ResetAnchorCell = function(tetromino, cellIndex)
  local config = ACTIVITY20_MINIGAME_CONFIGS[tetromino.type]
  local configCells = config.cells
  local angle = tetromino.angle
  for i, v in ipairs(configCells) do
    local cell = tetromino.cells[i]
    cell.localX, cell.localY = rotatePointAround(v.x - configCells[cellIndex].x, v.y - configCells[cellIndex].y, angle, 0, 0)
  end
  tetromino.anchor = cellIndex
  tetromino.x = tetromino.cells[cellIndex].x
  UpdateTetrominoCellsPosition(tetromino)
end
local GetBounds = function(tetromino)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local x, y = tetromino.x, tetromino.y
  local minX, maxX, minY, maxY = math.huge, -math.huge, math.huge, -math.huge
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gw
    local cellY = y + localY * gh
    local minx, maxx = cellX - gw * 0.5, cellX + gw * 0.5
    local miny, maxy = cellY - gh * 0.5, cellY + gh * 0.5
    maxX = math.max(minx, math.max(maxx, maxX))
    minX = math.min(minx, math.min(maxx, minX))
    maxY = math.max(miny, math.max(maxy, maxY))
    minY = math.min(miny, math.min(maxy, minY))
  end
  return minX, maxX, minY, maxY
end
local FitInto = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local x, y = RC2Position(startGridRowWithAnchor, startGridColumnWithAnchor)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gw
    local cellY = y + localY * gh
    local grid = GetGrid(position2RC(cellX, cellY))
    if not grid or grid.cell then
      return false
    end
  end
  return true
end
local GetAutoFitGrid = function(tetromino)
  local minDist, closest = math.huge
  local x, y = tetromino.x, tetromino.y
  for _, grid in ipairs(grids) do
    local distSqr = (x - grid.x) ^ 2 + (y - grid.y) ^ 2
    if not grid.cell and minDist > distSqr then
      minDist = distSqr
      closest = grid
    end
  end
  if closest then
    for _, cell in ipairs(tetromino.cells) do
      local localX, localY = cell.localX, cell.localY
      local row = closest.row + localY
      local column = closest.column + localX
      local grid = GetGrid(row, column)
      if not grid or grid.cell then
        return false
      end
    end
    return closest.row, closest.column
  end
  return false
end
local FindClosestGrid = function(position)
  local minDist, result = math.huge, false
  for i, v in ipairs(grids) do
    local dist = Vector2.Distance(position, Vector2(v.x, v.y))
    if minDist > dist then
      minDist = dist
      result = v
    end
  end
  return result
end
local CreateRandomColorGugu = function(channel, specialPosition)
  if guguRandomColors and #guguRandomColors > 0 then
    local color = table.remove(guguRandomColors, math.random(1, #guguRandomColors))
    return CreateGugu(channel, color, specialPosition)
  end
end
local AddTask = function(task)
  local len = #motionTasks
  for i = len, 1, -1 do
    if motionTasks[i].gugu == task.gugu then
      table.remove(motionTasks, i)
    end
  end
  table.insert(motionTasks, task)
end
local GUGU_MOTION_DELAY_ON_START = 0.2
local AutoFillGugu = function()
  filling = true
  local flag = false
  local progress = 0
  local count = 0
  local oncomplete = function()
    progress = progress + 1
    if progress >= count then
      filling = false
      for _, entry in ipairs(channels) do
        PopupGuguGotoSameColorCell(entry.leftOrRight, entry.channel)
      end
    end
  end
  for _, entry in ipairs(channels) do
    local channel = entry.channel
    local leftOrRight = entry.leftOrRight
    local n = #channel
    for i = n, 1, -1 do
      if not channel[i].gugu then
        count = count + 1
        flag = true
        local pos = Vector2(channel[n].x, channel[n].y) + (leftOrRight and Vector2.left or Vector2.right) * AdaptScale(gridWidth) * 1.5
        local gugu = CreateRandomColorGugu(channel[i], pos)
        if gugu then
          channel[i].gugu = gugu
          table.insert(gugus, gugu)
          local t = {
            gugu = gugu,
            delay = GUGU_MOTION_DELAY_ON_START * (i - 1),
            movespeed = GUGU_MOVE_SPEED3,
            points = {},
            oncomplete = oncomplete
          }
          for j = n, i, -1 do
            table.insert(t.points, Vector2(channel[j].x, channel[j].y))
          end
          AddTask(t)
        end
      end
    end
  end
  return flag
end

function PopupGuguGotoSameColorCell(leftOrRight, channel)
  if filling then
    return
  end
  local flag = false
  local firstIndex = false
  for i, v in ipairs(channel) do
    if v.gugu then
      firstIndex = i
      break
    end
  end
  if firstIndex then
    local gugu = channel[firstIndex].gugu
    local color = gugu.color
    for _, tetromino in ipairs(tetrominos) do
      if tetromino.static and tetromino.color == color then
        for _, cell in ipairs(tetromino.cells) do
          if not cell.gugu then
            cell.gugu = gugu
            channel[firstIndex].gugu = false
            gugu.channel = nil
            tetromino.numTasks = (tetromino.numTasks or 0) + 1
            local grid = FindClosestGrid(Vector2(channel[1].x, channel[1].y))
            local task = {
              gugu = gugu,
              points = {},
              movespeed = GUGU_MOVE_SPEED,
              oncomplete = function()
                score = score + 1
                if __onreached then
                  __onreached(cell)
                end
                tetromino.numTasks = (tetromino.numTasks or 0) - 1
              end
            }
            if firstIndex > 1 then
              for i = firstIndex - 1, 1, -1 do
                table.insert(task.points, Vector2(channel[i].x, channel[i].y))
              end
            end
            local row, col = position2RC(cell.x, cell.y)
            local _, results = pathfinder:search(grid, GetGrid(row, col))
            local cnt = #results
            for i = cnt, 1, -1 do
              local v = results[i]
              table.insert(task.points, Vector2(v.x, v.y))
            end
            AddTask(task)
            flag = true
            local n = #channel
            local first = false
            for i = firstIndex, n do
              local gg = channel[i].gugu
              if gg then
                channel[i].gugu = false
                local index = i - firstIndex
                channel[index].gugu = gg
                local t = {
                  gugu = gg,
                  movespeed = GUGU_MOVE_SPEED2,
                  points = {}
                }
                if not first then
                  function t.oncomplete()
                    PopupGuguGotoSameColorCell(leftOrRight, channel)
                  end
                  
                  first = true
                end
                for j = i - 1, index, -1 do
                  table.insert(t.points, Vector2(channel[j].x, channel[j].y))
                end
                AddTask(t)
              end
            end
            local pos = Vector2(channel[n].x, channel[n].y) + (leftOrRight and Vector2.left or Vector2.right) * AdaptScale(gridWidth) * 1.5
            local channelPosition = channel[n - firstIndex + 1]
            local o = CreateRandomColorGugu(channelPosition, pos)
            if o then
              channelPosition.gugu = o
              local t = {
                gugu = o,
                movespeed = GUGU_MOVE_SPEED2,
                points = {}
              }
              local index = n + 1 - firstIndex
              for j = n, index, -1 do
                table.insert(t.points, Vector2(channel[j].x, channel[j].y))
              end
              AddTask(t)
            end
            break
          end
        end
      end
      if flag then
        break
      end
    end
  end
  return flag
end

local Place = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local x, y = RC2Position(startGridRowWithAnchor, startGridColumnWithAnchor)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    cell.x = x + localX * gw
    cell.y = y + localY * gh
    local grid = GetGrid(position2RC(cell.x, cell.y))
    grid.cell = cell
  end
  table.sort(tetromino.cells, function(a, b)
    local ra, ca = position2RC(a.x, a.y)
    local rb, cb = position2RC(b.x, b.y)
    if ra > rb then
      return true
    end
    if ra == rb then
      return ca < cb
    end
    return false
  end)
  tetromino.x, tetromino.y = x, y
  tetromino.static = true
  for _, entry in ipairs(channels) do
    PopupGuguGotoSameColorCell(entry.leftOrRight, entry.channel)
  end
end
local AutoPlace = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local len = #tetromino.cells
  local flag = false
  for i = 1, len do
    if FitInto(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor) then
      flag = true
      break
    end
    ResetAnchorCell(tetromino, i)
  end
  if flag then
    Place(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
    return true
  end
  return false
end
local randomColorList
local AutoCreatePreviewEntry = function()
  previewEntries = previewEntries or {}
  if #previewEntries <= 0 then
    local buffer = {}
    for i = 1, NUM_PREVIEW_TYPES do
      if not table.keyof(previewEntries, i, "index") then
        table.clear(buffer)
        randomColorList = randomColorList or {}
        if 0 == #randomColorList then
          local bucket = {}
          for _, entry in ipairs(channels) do
            for _, v in ipairs(entry.channel) do
              if v.gugu then
                bucket[v.gugu.color] = true
              end
            end
          end
          for color, _ in pairs(bucket) do
            table.insert(randomColorList, color)
          end
        end
        if randomTetrominos and #randomTetrominos > 0 then
          local color = table.remove(randomColorList, math.random(1, #randomColorList))
          local k = table.keyof(randomTetrominos, color, "color")
          local rt = table.remove(randomTetrominos, k)
          local entry = {
            index = i,
            type = rt.type,
            color = rt.color,
            angle = math.random(0, 3) * 90
          }
          table.insert(previewEntries, entry)
          if type(__oncreatepreviewentry) == "function" then
            __oncreatepreviewentry(entry)
          end
        end
      end
    end
  end
end
local DestroyFilledTetromino = function()
  local len = #tetrominos
  for i = len, 1, -1 do
    local tetromino = tetrominos[i]
    if not tetromino.ghost then
      local full = true
      for _, cell in ipairs(tetromino.cells) do
        if not cell.gugu then
          full = false
          break
        end
      end
      if full and (type(tetromino.numTasks) ~= "number" or 0 == tetromino.numTasks) then
        DestroyTetromino(tetromino, true)
      end
    end
  end
end
local AnySuitable = function()
  local result = false
  for _, entry in ipairs(previewEntries) do
    local config = ACTIVITY20_MINIGAME_CONFIGS[entry.type]
    local anchorCell = config.cells[config.anchor]
    for _, grid in ipairs(grids) do
      local row, column = grid.row, grid.column
      if not grid.cell then
        local fitinto = true
        for _, cell in ipairs(config.cells) do
          local localX, localY = rotatePointAround(cell.x - anchorCell.x, cell.y - anchorCell.y, entry.angle, 0, 0)
          local o = GetGrid(row + localY, column + localX)
          if not o or o.cell then
            fitinto = false
            break
          end
        end
        result = fitinto
      end
      if result then
        break
      end
    end
    if result then
      break
    end
  end
  return result
end
local epsilon = 0.01
local MoveStep = function(task, movedelta)
  local movedist = 0
  local points = task.points
  local numPoints = #points
  local index = task.index or 1
  if index > 0 and numPoints >= index then
    local position = Vector2(task.gugu.x, task.gugu.y)
    local targetPosition = points[index]
    local newPosition = Vector2.MoveTowards(position, targetPosition, movedelta)
    movedist = Vector2.Distance(position, newPosition)
    task.gugu.x = newPosition.x
    task.gugu.y = newPosition.y
    if Vector2.Distance(newPosition, targetPosition) < epsilon then
      task.index = index + 1
      if numPoints < task.index then
        task.complete = true
        return movedist
      end
      return movedist
    end
  else
    task.complete = true
  end
  return movedist
end
local Motion = function()
  local count = #motionTasks
  local deltaTime = Time.deltaTime
  for i = count, 1, -1 do
    local task = motionTasks[i]
    task.elapse = (task.elapse or 0) + deltaTime
    if type(task.delay) ~= "number" or task.elapse > task.delay then
      local movespeed = task.movespeed
      local movedelta = movespeed * deltaTime
      task.gugu.moving = true
      while true do
        movedelta = movedelta - MoveStep(task, movedelta)
        if task.complete or math.abs(movedelta) < epsilon then
          break
        end
      end
      if task.complete then
        task.gugu.moving = false
        table.remove(motionTasks, i)
        if type(task.oncomplete) == "function" then
          task.oncomplete()
        end
        DestroyFilledTetromino()
      end
    end
  end
  if gameOver then
    return
  end
  if 0 == count and not AnySuitable() and not AnySuitable() then
    gameOver = true
    if type(__ongameover) == "function" then
      __ongameover(false)
    end
  end
end
local GetPreviewEntries = function()
  return previewEntries
end
local GetPreviewEntry = function(index)
  local k = table.keyof(previewEntries, index, "index")
  if k then
    return previewEntries[k]
  end
end
local RemovePreview = function(index)
  local k = table.keyof(previewEntries, index, "index")
  if k then
    table.remove(previewEntries, k)
    AutoCreatePreviewEntry()
  end
end
local dl = CS.UnityEngine.Debug.DrawLine
local Debug_DrawGrids = function(grids)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  for _, v in ipairs(grids) do
    local x, y = v.x, v.y
    local minX, maxX = x - gw * 0.5, x + gw * 0.5
    local minY, maxY = y - gh * 0.5, y + gh * 0.5
    local c = Color.white
    dl(Vector3(minX, minY), Vector3(maxX, minY), c)
    dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
    dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
    dl(Vector3(minX, maxY), Vector3(minX, minY), c)
  end
end
local Debug_DrawTetrominos = function(tetrominos)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  for _, v in ipairs(tetrominos) do
    for i, cell in ipairs(v.cells) do
      if not cell.destroyed then
        local x, y = cell.x, cell.y
        local minX, maxX = x - gw * 0.5, x + gw * 0.5
        local minY, maxY = y - gh * 0.5, y + gh * 0.5
        local c = Color.black
        if cell.gugu then
          c = Color.yellow
        end
        dl(Vector3(minX, minY), Vector3(maxX, minY, 0.1), c)
        dl(Vector3(maxX, minY), Vector3(maxX, maxY, 0.1), c)
        dl(Vector3(maxX, maxY), Vector3(minX, maxY, 0.1), c)
        dl(Vector3(minX, maxY), Vector3(minX, minY, 0.1), c)
      end
    end
  end
end
local Debug_DrawPositions = function(positions)
  local dl = CS.UnityEngine.Debug.DrawLine
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  for _, v in ipairs(positions) do
    if v.occupied then
      local x, y = v.x, v.y
      local minX, maxX = x - gw * 0.5, x + gw * 0.5
      local minY, maxY = y - gh * 0.5, y + gh * 0.5
      local c = v.gugu and Color.yellow or Color.white
      dl(Vector3(minX, minY), Vector3(maxX, minY), c)
      dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
      dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
      dl(Vector3(minX, maxY), Vector3(minX, minY), c)
    end
  end
end
local Debug_DrawMotionTasks = function()
  for _, task in ipairs(motionTasks) do
    if task.index then
      for i = task.index, #task.points - 1 do
        local p0 = task.points[i]
        local p1 = task.points[i + 1]
        dl(Vector3(p0.x, p0.y), Vector3(p1.x, p1.y), Color.green)
      end
    end
  end
end
local leftDirection = {
  {-1, 0},
  {1, 0},
  {0, 1},
  {0, -1}
}
local rightDirection = {
  {1, 0},
  {-1, 0},
  {0, 1},
  {0, -1}
}
local CreatePresetChannel = function(leftOrRight, minRow, maxRow, length)
  local MAX_COLUMN = 6
  local positions = leftOrRight and SimpleCopy(leftPositions) or SimpleCopy(rightPositions)
  local getPosition = function(r, c)
    if r > 0 and r <= gridRows and c > 0 and c <= MAX_COLUMN then
      return positions[(r - 1) * MAX_COLUMN + c]
    end
  end
  local direction = leftOrRight and leftDirection or rightDirection
  local startRow = math.random(minRow, maxRow)
  local position = positions[(startRow - 1) * MAX_COLUMN + (leftOrRight and MAX_COLUMN or 1)]
  position.occupied = true
  local channel = {}
  local directionBuffer = {}
  table.insert(channel, position)
  for _ = 1, length - 1 do
    local row, column = position.row, position.column
    local founded, r, c = false
    table.clear(directionBuffer)
    for _, v in ipairs(direction) do
      table.insert(directionBuffer, v)
    end
    while #directionBuffer > 0 do
      local dir = table.remove(directionBuffer, math.random(1, #directionBuffer))
      local nextRow, nextCol = row + dir[1], column + dir[2]
      if maxRow >= nextRow and minRow <= nextRow and nextRow > 0 and nextRow <= gridRows and nextCol > (leftOrRight and 0 or 1) and nextCol <= (leftOrRight and MAX_COLUMN - 1 or MAX_COLUMN) and not getPosition(nextRow, nextCol).occupied then
        founded = true
        r = nextRow
        c = nextCol
        break
      end
    end
    if founded then
      position = getPosition(r, c)
      position.occupied = true
      table.insert(channel, position)
    else
      break
    end
  end
  return channel
end
local SaveChannel = function(channel)
  local list = {}
  local len = #channel
  local start = channel[1]
  local filename = "Activity20_MiniGameConfigs2.lua"
  table.insert(list, {localRow = 0, localColumn = 0})
  for i = 2, len do
    local localRow = channel[i].row - start.row
    local localColumn = channel[i].column - start.column
    table.insert(list, {localRow = localRow, localColumn = localColumn})
  end
  local minRow, maxRow, minCol, maxCol = math.huge, -math.huge, math.huge, -math.huge
  for i, v in ipairs(list) do
    minRow = math.min(minRow, v.localRow)
    maxRow = math.max(maxRow, v.localRow)
    minCol = math.min(minCol, v.localColumn)
    maxCol = math.max(maxCol, v.localColumn)
  end
  local rapidjson = require("rapidjson")
  local file = io.open(filename, "r")
  local lines = {}
  local linesFunc = file:lines()
  local line = linesFunc()
  while line do
    local inst = rapidjson.decode(line)
    table.insert(lines, inst)
    line = linesFunc()
  end
  file:close()
  local flag = true
  for _, line in ipairs(lines) do
    local same = true
    for i, v in ipairs(line.list) do
      if list[i].localRow ~= v.localRow or list[i].localColumn ~= v.localColumn then
        same = false
        break
      end
    end
    if same then
      flag = false
      printError("return duplicate----")
      return
    end
  end
  printError("Write New Channel")
  local info = {
    list = list,
    minRow = minRow,
    maxRow = maxRow,
    minCol = minCol,
    maxCol = maxCol,
    length = #list
  }
  local result = rapidjson.encode(info)
  file = io.open(filename, "w+")
  for i, v in ipairs(lines) do
    file:write(string.format("%s\n", rapidjson.encode(v)))
  end
  file:write(string.format("%s\n", result))
  file:close()
end
local OnUpdate = function()
  if gameOver then
    return
  end
  elapse = Time.deltaTime + elapse
  if CS.UnityEngine.Input.GetKey(KeyCode.D) then
    Debug_DrawGrids(grids)
    Debug_DrawTetrominos(tetrominos)
    Debug_DrawPositions(leftPositions)
    Debug_DrawPositions(rightPositions)
  end
  if CS.UnityEngine.Input.GetKeyDown(KeyCode.Space) then
    for _ = 1, 1 do
      local channel = CreatePresetChannel(false, 1, 7, 10)
      local minCol, maxCol = math.huge, -math.huge
      for _, v in ipairs(channel) do
        minCol = math.min(v.column, minCol)
        maxCol = math.max(v.column, maxCol)
      end
      if 5 == maxCol - minCol and 6 == channel[#channel].column then
        SaveChannel(channel)
      end
    end
  end
  Debug_DrawMotionTasks()
  Motion()
end
local SetTetrominoPositionWithPivot = function(tetromino, x, y, pivotx, pivoty)
  local minx, maxx, miny, maxy = GetBounds(tetromino)
  local centerX, centerY = (maxx + minx) * (pivotx or 0.5), (maxy + miny) * (pivoty or 0.5)
  local diffx, diffy = tetromino.x - centerX, tetromino.y - centerY
  tetromino.x = x + diffx
  tetromino.y = y + diffy
  UpdateTetrominoCellsPosition(tetromino)
end
local InitializeGrids = function()
  grids = grids or {}
  table.clear(grids)
  for y = 1, gridRows do
    for x = 1, gridColumns do
      local grid = CreateGrid(y, x)
      table.insert(grids, grid)
    end
  end
end
local InitializePositions = function(leftOrRight, row, column)
  local gw, gh = AdaptScale(gridWidth), AdaptScale(gridHeight)
  local width = gridColumns * gw
  local gap = 0.2
  local centerX = leftOrRight and worldCenter.x - width * 0.5 - gap - gw * column * 0.5 or worldCenter.x + width * 0.5 + gap + gw * column * 0.5
  local center = Vector2(centerX, worldCenter.y)
  for y = 1, row do
    for x = 1, column do
      local startX = center.x - column * gw * 0.5
      local startY = center.y - row * gh * 0.5
      local px = startX + (x - 0.5) * gw
      local py = startY + (y - 0.5) * gh
      local list = leftOrRight and leftPositions or rightPositions
      table.insert(list, {
        x = px,
        y = py,
        row = y,
        column = x
      })
    end
  end
end
local InitializeChannel = function(leftOrRight, minRow, maxRow, length)
  local MAX_COLUMN = 6
  local positions = leftOrRight and SimpleCopy(leftPositions) or SimpleCopy(rightPositions)
  local getPosition = function(r, c)
    if r > 0 and r <= gridRows and c > 0 and c <= MAX_COLUMN then
      return positions[(r - 1) * MAX_COLUMN + c]
    end
  end
  local json = require("Activity20_MiniGameConfigs2")
  local rapidjson = require("rapidjson")
  local configs = rapidjson.decode(json)
  local config
  while #configs > 0 do
    config = table.remove(configs, math.random(1, #configs))
    local diff = config.maxRow - config.minRow
    if diff <= maxRow - minRow then
      break
    end
  end
  local startRow = math.random(minRow - config.minRow, maxRow - config.maxRow)
  local channel = {}
  local position = positions[(startRow - 1) * MAX_COLUMN + (leftOrRight and MAX_COLUMN or 1)]
  local startColumn = position.column
  table.insert(channel, position)
  if type(__oncreatechannel) == "function" then
    __oncreatechannel(position)
  end
  for i = 2, #config.list do
    local entry = config.list[i]
    local localRow, localColumn = entry.localRow, entry.localColumn
    if leftOrRight then
      localColumn = -localColumn
    end
    local r, c = localRow + startRow, localColumn + startColumn
    position = getPosition(r, c)
    if type(__oncreatechannel) == "function" then
      __oncreatechannel(position)
    end
    table.insert(channel, position)
  end
  table.insert(channels, {channel = channel, leftOrRight = leftOrRight})
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if tetrominos then
    local len = #tetrominos
    for i = len, 1, -1 do
      local tetromino = tetrominos[i]
      DestroyTetromino(tetromino)
    end
    table.clear(tetrominos)
    for _, entry in ipairs(channels) do
      local channel = entry.channel
      for i, v in ipairs(channel) do
        if v.gugu and type(__ondestroygugu) == "function" then
          __ondestroygugu(v.gugu)
        end
        v.gugu = nil
      end
    end
    table.clear(channels)
  end
  randomColorList = nil
end
local Initialize = function(center, rows, columns, gw, gh, onCreateTetromino, onDestroyCell, onCreatePreview, onCreateChannel, onCreateGugu, onDestroyGugu, onReached, onGameOver)
  Release()
  worldCenter = center
  gridRows = rows
  gridColumns = columns
  gridWidth = gw
  gridHeight = gh
  grids = grids or {}
  tetrominos = tetrominos or {}
  previewEntries = previewEntries or {}
  leftPositions = leftPositions or {}
  rightPositions = rightPositions or {}
  channels = channels or {}
  gugus = gugus or {}
  motionTasks = motionTasks or {}
  guguIdx = 0
  gameOver = false
  elapse = 0
  score = 0
  pathfinder = require("pathfinder").new(function(ga, gb)
    local a, b = math.abs(ga.row - gb.row), math.abs(ga.column - gb.column)
    return a + b
  end, function(ga, gb)
    return ga == gb
  end, function(g)
    local neighbors = {}
    local row, column = g.row, g.column
    for dt = -1, 1, 2 do
      local v = row + dt
      if v > 0 and v <= gridRows then
        table.insert(neighbors, GetGrid(v, column))
      end
    end
    for dt = -1, 1, 2 do
      local v = column + dt
      if v > 0 and v <= gridColumns then
        table.insert(neighbors, GetGrid(row, v))
      end
    end
    return neighbors
  end, function(ga, gb)
    local a, b = math.abs(ga.row - gb.row), math.abs(ga.column - gb.column)
    return a + b
  end)
  table.clear(grids)
  table.clear(previewEntries)
  table.clear(tetrominos)
  table.clear(leftPositions)
  table.clear(rightPositions)
  table.clear(channels)
  table.clear(gugus)
  table.clear(motionTasks)
  __oncreatetetromino = onCreateTetromino
  __ondestroycell = onDestroyCell
  __oncreatepreviewentry = onCreatePreview
  __oncreatechannel = onCreateChannel
  __oncreategugu = onCreateGugu
  __ondestroygugu = onDestroyGugu
  __onreached = onReached
  __ongameover = onGameOver
  InitializeGrids()
  InitializePositions(true, gridRows, 6)
  InitializePositions(false, gridRows, 6)
  if 1 == numRoads then
    InitializeChannel(math.random(0, 100) > 50, 1, 7, gridsOfRoad)
  elseif 2 == numRoads then
    InitializeChannel(true, 1, 7, gridsOfRoad)
    InitializeChannel(false, 1, 7, gridsOfRoad)
  elseif 3 == numRoads then
    if math.random(0, 100) > 50 then
      InitializeChannel(false, 1, 7, gridsOfRoad)
      InitializeChannel(true, 1, 3, gridsOfRoad)
      InitializeChannel(true, 4, 7, gridsOfRoad)
    else
      InitializeChannel(true, 1, 7, gridsOfRoad)
      InitializeChannel(false, 1, 3, gridsOfRoad)
      InitializeChannel(false, 4, 7, gridsOfRoad)
    end
  end
  AutoFillGugu()
  AutoCreatePreviewEntry()
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local GetElapse = function()
  return elapse
end
local GetScore = function()
  return score
end
local SetLevelInfo = function(types, colors, roads, gOfRoad, rescueCount)
  numRoads = roads
  gridsOfRoad = gOfRoad
  winConditions = rescueCount
  guguRandomColors = {}
  randomTetrominos = {}
  local count = rescueCount
  while count > 0 do
    local randomBuffer = {}
    for _, v in ipairs(types) do
      local config = ACTIVITY20_MINIGAME_CONFIGS[v]
      local cellsCount = #config.cells
      if count >= cellsCount and cellsCount > 1 then
        table.insert(randomBuffer, v)
      end
    end
    if 0 == #randomBuffer then
      table.insert(randomBuffer, 1)
    end
    local t = randomBuffer[math.random(1, #randomBuffer)]
    local config = ACTIVITY20_MINIGAME_CONFIGS[t]
    count = count - #config.cells
    table.insert(randomTetrominos, {
      type = t,
      color = math.random(0, colors - 1)
    })
  end
  local len = #randomTetrominos
  for i = 1, len do
    local randomIndex = math.random(1, len)
    local temp = randomTetrominos[i]
    randomTetrominos[i] = randomTetrominos[randomIndex]
    randomTetrominos[randomIndex] = temp
  end
  for _, v in ipairs(randomTetrominos) do
    local config = ACTIVITY20_MINIGAME_CONFIGS[v.type]
    for _ = 1, #config.cells do
      table.insert(guguRandomColors, v.color)
    end
  end
  len = #guguRandomColors
  for i = 1, len do
    local randomIndex = math.random(1, len)
    local temp = guguRandomColors[i]
    guguRandomColors[i] = guguRandomColors[randomIndex]
    guguRandomColors[randomIndex] = temp
  end
end
return {
  Release = Release,
  Initialize = Initialize,
  GetPreviewEntries = GetPreviewEntries,
  GetPreviewEntry = GetPreviewEntry,
  RemovePreview = RemovePreview,
  AutoPlace = AutoPlace,
  CreateTetromino = CreateTetromino,
  CreateGhostTetromino = function(type, row, column, angle, color)
    local x, y = RC2Position(row, column)
    return CreateTetromino(type, x, y, angle, color, true)
  end,
  DestroyTetromino = DestroyTetromino,
  GetAutoFitGrid = GetAutoFitGrid,
  GetBounds = GetBounds,
  SetTetrominoPositionWithPivot = SetTetrominoPositionWithPivot,
  SetTetrominoRowColumn = function(tetromino, row, column)
    local x, y = RC2Position(row, column)
    tetromino.x, tetromino.y = x, y
    UpdateTetrominoCellsPosition(tetromino)
  end,
  GetElapse = GetElapse,
  GetScore = GetScore,
  SetLevelInfo = SetLevelInfo
}
