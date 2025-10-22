local GRID_WIDTH, GRID_HEIGHT = 0.05, 0.05
local BLOCK_CELL_ROWS, BLOCK_CELL_COLUMN = 8, 8
local TETROMINO_DROP_INTERVAL = 0
local EXTRA_ROWS = 32
local DEFAULT_DROP_SPEED = 2
local PRESS_DROP_SPEED = 8
local PRESS_HORIZONTAL_SPEED = 2
local LONG_PRESS_HORIZONTAL_SPEED = 4
local FLOWING_SPEED = 1
local CELL_STATE = {
  DROPPING = "DROPPING",
  FLOWING = "FLOWING",
  STATIC = "STATIC"
}
local ACTIVITY21_MINIGAME_CONFIGS = require("Activity21_MiniGameConfigs")
local ACTIVITY21_MINIGAME_PHASE = {
  [1] = {
    score = 0,
    droppingSpeed = 1,
    flowingSpeed = 1
  },
  [2] = {
    score = 20000,
    droppingSpeed = 2,
    flowingSpeed = 1
  },
  [3] = {
    score = 40000,
    droppingSpeed = 2.5,
    flowingSpeed = 1
  },
  [4] = {
    score = 80000,
    droppingSpeed = 3,
    flowingSpeed = 1
  }
}
local worldOrigin, gridColumns, gridRows, grids, currentTetromino, flowingTetromino, tetrominos, dropTimer, flowingCells, elapse, pause, gameOver, hangup, score, combo, spawnInterval, frameDone, adaptedGridWidth, adaptedGridHeight, inv_adaptedGridWidth_100000, inv_adaptedGridHeight_100000, __oncreatetetromino, __ondestroycell, __oncandidateupdate, __syncpostioinimmediate, __onstep, __onmatched, __ongameover
local new_BinaryHeap = function(compareFunc)
  local BinaryHeap = {}
  BinaryHeap.__index = BinaryHeap
  
  function BinaryHeap:new()
    local obj = {
      m_array = {},
      m_lastIndex = 0,
      m_length = 0
    }
    setmetatable(obj, self)
    return obj
  end
  
  function BinaryHeap:insert(data)
    self.m_lastIndex = self.m_lastIndex + 1
    if self.m_length >= self.m_lastIndex then
      self.m_array[self.m_lastIndex] = data
    else
      table.insert(self.m_array, data)
      self.m_length = self.m_length + 1
    end
    if self.m_lastIndex > 1 then
      self:swimUp(self.m_lastIndex)
    end
  end
  
  function BinaryHeap:swimUp(index)
    local pindex = math.floor(index / 2)
    while pindex > 0 and self:compare(index, pindex) do
      self:swap(index, pindex)
      index = pindex
      pindex = math.floor(pindex / 2)
    end
  end
  
  function BinaryHeap:compare(n, m)
    local a = self.m_array[n]
    local b = self.m_array[m]
    if type(compareFunc) == "function" then
      return compareFunc(a, b)
    end
    return false
  end
  
  function BinaryHeap:swap(n, m)
    local temp = self.m_array[n]
    self.m_array[n] = self.m_array[m]
    self.m_array[m] = temp
  end
  
  function BinaryHeap:peek()
    return self.m_array[1]
  end
  
  function BinaryHeap:removeat(i)
    self:swap(i, self.m_lastIndex)
    local result = self.m_array[self.m_lastIndex]
    self.m_array[self.m_lastIndex] = false
    self.m_lastIndex = self.m_lastIndex - 1
    self:sinkDown(i)
    return result
  end
  
  function BinaryHeap:pop()
    return self:removeat(1)
  end
  
  function BinaryHeap:sinkDown(index)
    local cindex = index * 2
    while cindex <= self.m_lastIndex do
      if cindex + 1 <= self.m_lastIndex and self:compare(cindex + 1, cindex) then
        cindex = cindex + 1
      end
      if self:compare(cindex, index) then
        self:swap(cindex, index)
        index = cindex
        cindex = cindex * 2
      else
        break
      end
    end
  end
  
  function BinaryHeap:remove(data)
    for i = 1, self.m_lastIndex do
      if self.m_array[i] == data then
        return true, self:removeat(i)
      end
    end
    return false
  end
  
  function BinaryHeap:foreach(onforeach, desc)
    if type(onforeach) == "function" then
      local len = self.m_lastIndex
      local startIndex, endIndex, step = desc and len or 1, desc and 1 or len, desc and -1 or 1
      for i = startIndex, endIndex, step do
        local breakout = onforeach(self.m_array[i])
        if breakout then
          break
        end
      end
    end
  end
  
  function BinaryHeap:reset()
    self.m_lastIndex = 0
  end
  
  return BinaryHeap:new()
end
local mathf = CS.UnityEngine.Mathf
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = mathf.Deg2Rad * angle
  local cos, sin = mathf.Cos(deg), mathf.Sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return newX, newY
end
local AdaptScale = function(value)
  return value * UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
end
local RC2Position = function(row, column)
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local startX, startY = worldOrigin.x, worldOrigin.y
  local px = startX + (column - 0.5) * gridWidth
  local py = startY + (row - 0.5) * gridHeight
  return px, py
end
local y2Row = function(y)
  local ry = y - worldOrigin.y
  local row = mathf.RoundToInt(ry * inv_adaptedGridHeight_100000)
  return row
end
local x2Col = function(x)
  local rx = x - worldOrigin.x
  local column = mathf.RoundToInt(rx * inv_adaptedGridWidth_100000)
  return column
end
local position2RC = function(x, y)
  return y2Row(y), x2Col(x)
end
local UpdateTetrominoCellsPosition = function(tetromino)
  tetromino.cellsLookup = tetromino.cellsLookup or {}
  table.clear(tetromino.cellsLookup)
  for _, cell in ipairs(tetromino.cells) do
    local row, column = position2RC(tetromino.x + cell.localX, tetromino.y + cell.localY)
    cell.x, cell.y = RC2Position(row, column)
    cell._tempRow, cell._tempColumn = row, column
    tetromino.cellsLookup[(row - 1) * gridColumns + column] = cell
  end
end
local GetGrid = function(row, column)
  if row > 0 and row <= gridRows and column > 0 and column <= gridColumns then
    local index = column + (row - 1) * gridColumns
    return grids[index]
  end
end
local CreateTetromino = function(tetrominoType, x, y, angle, color)
  local inst = {}
  inst.type = tetrominoType
  inst.angle = angle or 0
  inst.cells = {}
  inst.x = x
  inst.y = y
  inst.color = color
  local config = ACTIVITY21_MINIGAME_CONFIGS[tetrominoType]
  local blocks = config.blocks
  local anchor, anchorType = config.anchor, config.anchorType
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local anchorPointX, anchorPointY
  if 0 == anchorType then
    local cr = BLOCK_CELL_ROWS / 2
    local cc = BLOCK_CELL_COLUMN / 2
    anchorPointY = ((blocks[anchor].y - 1) * BLOCK_CELL_ROWS + cr) * gridHeight
    anchorPointX = ((blocks[anchor].x - 1) * BLOCK_CELL_COLUMN + cc) * gridWidth
  else
    anchorPointY = ((blocks[anchor].y - 1) * BLOCK_CELL_ROWS + BLOCK_CELL_ROWS) * gridHeight
    anchorPointX = ((blocks[anchor].x - 1) * BLOCK_CELL_COLUMN + BLOCK_CELL_COLUMN) * gridWidth
  end
  for _, block in ipairs(blocks) do
    local blockX, blockY = block.x, block.y
    for row = 1, BLOCK_CELL_ROWS do
      for column = 1, BLOCK_CELL_COLUMN do
        local cellY = ((blockY - 1) * BLOCK_CELL_ROWS + row - 0.5) * gridHeight
        local cellX = ((blockX - 1) * BLOCK_CELL_COLUMN + column - 0.5) * gridWidth
        local localX, localY = rotatePointAround(cellX - anchorPointX, cellY - anchorPointY, angle, 0, 0)
        local cell = {
          localX = localX,
          localY = localY,
          owner = inst,
          color = color,
          state = CELL_STATE.DROPPING,
          tetromino = inst
        }
        table.insert(inst.cells, cell)
      end
    end
  end
  inst.anchorPointX, inst.anchorPointY = anchorPointX, anchorPointY
  UpdateTetrominoCellsPosition(inst)
  table.insert(tetrominos, inst)
  if type(__oncreatetetromino) == "function" then
    __oncreatetetromino(inst)
  end
  return inst
end
local DestroyCell = function(cell, matched)
  if cell and not cell.destroyed then
    local grid = GetGrid(position2RC(cell.x, cell.y))
    if grid and grid.cell == cell then
      grid.cell = false
    end
    if flowingCells then
      local key = (cell._tempRow - 1) * gridColumns + cell._tempColumn
      flowingCells[key] = nil
    end
    cell.destroyed = true
    if type(__ondestroycell) == "function" then
      __ondestroycell(cell, matched)
    end
  end
end
local DestroyTetromino = function(tetromino)
  local count = 0
  if not tetromino then
    return count
  end
  local k = table.keyof(tetrominos, tetromino)
  if k then
    table.remove(tetrominos, k)
  end
  for _, cell in ipairs(tetromino.cells) do
    if not cell.destroyed then
      count = count + 1
      DestroyCell(cell)
    end
  end
  return count
end
local CreateGrid = function(row, column)
  local inst = {}
  inst.row = row
  inst.column = column
  inst.x, inst.y = RC2Position(row, column)
  return inst
end
local InitializeGrids = function()
  grids = grids or {}
  table.clear(grids)
  for row = 1, gridRows do
    for column = 1, gridColumns do
      local grid = CreateGrid(row, column)
      table.insert(grids, grid)
    end
  end
end
local ResetAnchorCell = function(tetromino, cellIndex)
  local config = ACTIVITY21_MINIGAME_CONFIGS[tetromino.type]
  local angle = tetromino.angle
  local blocks = config.blocks
  local index = 1
  local anchorX, anchorY
  for _, block in ipairs(blocks) do
    local blockX, blockY = block.x, block.y
    for row = 1, BLOCK_CELL_ROWS do
      local cellY = (blockY - 1) * BLOCK_CELL_ROWS + row
      if not anchorX and not anchorY then
        for column = 1, BLOCK_CELL_COLUMN do
          local cellX = (blockX - 1) * BLOCK_CELL_COLUMN + column
          if index == cellIndex then
            anchorX = cellX
            anchorY = cellY
            index = 1
            break
          end
          index = index + 1
        end
      end
      if 1 == index then
        break
      end
    end
  end
  for _, block in ipairs(blocks) do
    local blockX, blockY = block.x, block.y
    for row = 1, BLOCK_CELL_ROWS do
      local cellY = (blockY - 1) * BLOCK_CELL_ROWS + row
      for column = 1, BLOCK_CELL_COLUMN do
        local cellX = (blockX - 1) * BLOCK_CELL_COLUMN + column
        local cell = tetromino.cells[index]
        cell.localX, cell.localY = rotatePointAround(cellX - anchorX, cellY - anchorY, angle, 0, 0)
        index = index + 1
      end
    end
  end
  tetromino.anchor = cellIndex
  tetromino.x = tetromino.cells[cellIndex].x
  UpdateTetrominoCellsPosition(tetromino)
end
local IsFlowing = function(row, column)
  if flowingCells and row > 0 and row <= gridRows and column > 0 and column <= gridColumns then
    local key = column + (row - 1) * gridColumns
    return flowingCells[key], key
  end
end
local IsDropping = function(row, column)
  if currentTetromino and currentTetromino.cellsLookup then
    local result = currentTetromino.cellsLookup[(row - 1) * gridColumns + column]
    return nil ~= result
  end
end
local Movable = function(tetromino, stepX, stepY)
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local x, y = tetromino.x + stepX * gridWidth, tetromino.y + stepY * gridHeight
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX
    local cellY = y + localY
    local row, column = position2RC(cellX, cellY)
    local grid = GetGrid(row, column)
    if not grid or grid.cell or IsFlowing(row, column) then
      return false
    end
  end
  return true
end
local Move = function(tetromino, stepX, stepY)
  local result = true
  local signX, signY = stepX > 0 and 1 or -1, stepY > 0 and 1 or -1
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local flag = false
  for _ = 1, math.abs(stepY) do
    if not Movable(tetromino, 0, signY) then
      result = false
      break
    end
    flag = true
    tetromino.y = tetromino.y + signY * gridHeight
  end
  for _ = 1, math.abs(stepX) do
    if not Movable(tetromino, signX, 0) then
      result = false
      break
    end
    flag = true
    tetromino.x = tetromino.x + signX * gridWidth
  end
  if flag then
    UpdateTetrominoCellsPosition(tetromino)
  end
  return result
end
local Rotatable = function(tetromino, angle)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local x, y = rotatePointAround(localX, localY, angle, 0, 0)
    x = tetromino.x + x
    y = tetromino.y + y
    local row, column = position2RC(x, y)
    local grid = GetGrid(row, column)
    if not grid and (row <= 0 or row >= gridRows) then
      return false
    end
    if grid and grid.cell or IsFlowing(row, column) then
      return false
    end
  end
  return true
end
local dl = CS.UnityEngine.Debug.DrawLine
local Rotate = function(tetromino, angle)
  tetromino.angle = tetromino.angle or 0
  if Rotatable(tetromino, angle) then
    local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
    local worldWidth = gridWidth * gridColumns
    local maxX, maxY, minX, minY = -math.huge, -math.huge, math.huge, math.huge
    local targetAngle = tetromino.angle + angle
    for _, cell in ipairs(tetromino.cells) do
      local localX, localY = rotatePointAround(cell.localX, cell.localY, angle, 0, 0)
      maxX = math.max(maxX, localX + gridWidth)
      minX = math.min(minX, localX - gridWidth)
      cell.localX, cell.localY = localX, localY
    end
    local rightBoundary = worldOrigin.x + worldWidth - maxX
    local leftBoundary = worldOrigin.x - minX
    tetromino.x = math.max(math.min(rightBoundary, tetromino.x), leftBoundary)
    tetromino.angle = targetAngle
    UpdateTetrominoCellsPosition(tetromino)
    return true
  end
  return false
end
local MoveCurrentTetromino = function(stepX, stepY)
  if currentTetromino then
    Move(currentTetromino, stepX * PRESS_HORIZONTAL_SPEED, stepY * PRESS_DROP_SPEED)
    return currentTetromino
  end
end
local RotateCurrentTetromino = function(angle)
  if currentTetromino then
    Rotate(currentTetromino, angle)
  end
end
local Debug_DrawGrids = function(grids, bounds)
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local boundsMinx, boundsMaxx, boundsMiny, boundsMaxy = math.huge, -math.huge, math.huge, -math.huge
  for _, v in ipairs(grids) do
    local x, y = v.x, v.y
    local minX, maxX = x - gridWidth * 0.5, x + gridWidth * 0.5
    local minY, maxY = y - gridHeight * 0.5, y + gridHeight * 0.5
    if not bounds then
      local c = Color.white
      dl(Vector3(minX, minY), Vector3(maxX, minY), c)
      dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
      dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
      dl(Vector3(minX, maxY), Vector3(minX, minY), c)
    end
    boundsMinx = math.min(boundsMinx, minX)
    boundsMinx = math.min(boundsMinx, maxX)
    boundsMaxx = math.max(boundsMaxx, minX)
    boundsMaxx = math.max(boundsMaxx, maxX)
    boundsMiny = math.min(boundsMiny, minY)
    boundsMiny = math.min(boundsMiny, maxY)
    boundsMaxy = math.max(boundsMaxy, minY)
    boundsMaxy = math.max(boundsMaxy, maxY)
  end
  if bounds then
    local c = Color.white
    dl(Vector3(boundsMinx, boundsMiny), Vector3(boundsMaxx, boundsMiny), c)
    dl(Vector3(boundsMaxx, boundsMiny), Vector3(boundsMaxx, boundsMaxy), c)
    dl(Vector3(boundsMaxx, boundsMaxy), Vector3(boundsMinx, boundsMaxy), c)
    dl(Vector3(boundsMinx, boundsMaxy), Vector3(boundsMinx, boundsMiny), c)
  end
end
local DEBUG_COLOR_LOOKUP = {
  [0] = Color.yellow,
  [1] = Color.red,
  [2] = Color.blue,
  [3] = Color.green,
  [4] = Color.cyan,
  [5] = Color.yellow,
  [6] = Color.red
}
local Debug_DrawTetrominos = function(tetrominos)
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  for _, v in ipairs(tetrominos) do
    for i, cell in ipairs(v.cells) do
      if not cell.destroyed then
        local x, y = cell.x, cell.y
        local minX, maxX = x - gridWidth * 0.5, x + gridWidth * 0.5
        local minY, maxY = y - gridHeight * 0.5, y + gridHeight * 0.5
        local c = cell.state == "NONE" and Color.green or Color.white
        dl(Vector3(minX, minY), Vector3(maxX, minY, 0.1), c)
        dl(Vector3(maxX, minY), Vector3(maxX, maxY, 0.1), c)
        dl(Vector3(maxX, maxY), Vector3(minX, maxY, 0.1), c)
        dl(Vector3(minX, maxY), Vector3(minX, minY, 0.1), c)
      end
    end
  end
end
local AddCellToFlowing = function(cell)
  local row, column = position2RC(cell.x, cell.y)
  local key = (row - 1) * gridColumns + column
  if flowingCells[key] then
    printError(string.format([[
Exists (%s,%s) 
%s]], row, column, debug.traceback()))
    DestroyCell(cell)
    return
  end
  cell._tempRow = row
  cell._tempColumn = column
  flowingCells[key] = cell
  cell.state = CELL_STATE.FLOWING
end
local RemoveCellFromFlowing = function(cell)
  local row, column = position2RC(cell.x, cell.y)
  local key = (row - 1) * gridColumns + column
  if flowingCells[key] ~= cell then
    printError(string.format([[
Not Exists (%s,%s) 
%s %s]], row, column, cell.destroyed, debug.traceback()))
  end
  flowingCells[key] = false
end
local RowFirstComparer = function(cell_a, cell_b)
  local row_a, column_a = cell_a._tempRow, cell_a._tempColumn
  local row_b, column_b = cell_b._tempRow, cell_b._tempColumn
  return row_a * gridColumns + column_a < row_b * gridColumns + column_b
end
local WALK_VERSION = 0
local COLLECT_DIRECTION = {
  {1, 0},
  {-1, 0},
  {0, 1},
  {0, -1}
}

local function CollectNeighborSameColorCells(cell, color, collection)
  local minCol, maxCol = math.huge, -math.huge
  if cell and not cell.destroyed and cell._version ~= WALK_VERSION and cell.color == color and not collection[cell] then
    collection[cell] = cell
    cell._version = WALK_VERSION
    local row, column = position2RC(cell.x, cell.y)
    cell._tempRow, cell._tempColumn = row, column
    minCol = math.min(column, minCol)
    maxCol = math.max(column, maxCol)
    for _, v in ipairs(COLLECT_DIRECTION) do
      local dx, dy = v[1], v[2]
      local neighbor
      local grid = GetGrid(row + dy, column + dx)
      if grid then
        if grid.cell then
          neighbor = grid.cell
        else
          local result, index = IsFlowing(row + dy, column + dx)
          if result then
            neighbor = flowingCells[index]
          end
        end
      end
      local min, max = CollectNeighborSameColorCells(neighbor, color, collection)
      minCol = math.min(min, minCol)
      maxCol = math.max(max, maxCol)
    end
  end
  return minCol, maxCol
end

local CollectSameCellAndDestroyIfNecessary = function(center, buffer)
  buffer = buffer or {}
  local minCol, maxCol = CollectNeighborSameColorCells(center, center.color, buffer)
  if 1 == minCol and maxCol == gridColumns then
    combo = combo + 1
    if flowingTetromino and flowingTetromino.color == center.color then
      for i, v in ipairs(flowingTetromino.cells) do
        v._tempRow, v._tempColumn = position2RC(v.x, v.y)
        buffer[v] = v
      end
    end
    if type(__onmatched) == "function" then
      __onmatched(buffer, combo)
    end
    for _, v in pairs(buffer) do
      DestroyCell(v, true)
      score = score + 1
    end
    return true
  end
  return false
end
local flowingCellHeap, cellsBuffer
local CollectSameCellAndDestroy = function(cell)
  cellsBuffer = cellsBuffer or {}
  table.clear(cellsBuffer)
  if CollectSameCellAndDestroyIfNecessary(cell, cellsBuffer) then
    hangup = true
    for _, grid in ipairs(grids) do
      if grid.cell then
        local cell = grid.cell
        grid.cell = nil
        cell.gridRow = nil
        cell.gridColumn = nil
        AddCellToFlowing(cell)
      end
    end
    return true
  end
end
local SimulateFlowing = function(cell)
  if cell.destroyed then
    return
  end
  local x, y = cell.x, cell.y
  local row, column = position2RC(x, y)
  local down = GetGrid(row - 1, column)
  local insert = false
  if down then
    if down.cell or IsFlowing(row - 1, column) then
      local flag, wait = 0, false
      local left = GetGrid(row, column - 1)
      if left and not left.cell then
        if not IsFlowing(row, column - 1) then
          local leftDown = GetGrid(row - 1, column - 1)
          if leftDown and not leftDown.cell then
            if not IsFlowing(row - 1, column - 1) and not IsDropping(row - 1, column - 1) then
              flag = flag + 1
            else
              wait = true
            end
          end
        else
          local leftDown = GetGrid(row - 1, column - 1)
          if leftDown and not leftDown.cell then
            wait = true
          end
        end
      end
      local right = GetGrid(row, column + 1)
      if right and not right.cell then
        if not IsFlowing(row, column + 1) then
          local rightDown = GetGrid(row - 1, column + 1)
          if rightDown and not rightDown.cell then
            if not IsFlowing(row - 1, column + 1) and not IsDropping(row - 1, column + 1) then
              flag = flag + 2
            else
              wait = true
            end
          end
        else
          local rightDown = GetGrid(row - 1, column + 1)
          if rightDown and not rightDown.cell then
            wait = true
          end
        end
      end
      if 3 == flag then
        flag = math.random(1, 2)
      end
      if 2 == flag then
        RemoveCellFromFlowing(cell)
        cell.x, cell.y = RC2Position(row - 1, column + 1)
        AddCellToFlowing(cell)
      elseif 1 == flag then
        RemoveCellFromFlowing(cell)
        cell.x, cell.y = RC2Position(row - 1, column - 1)
        AddCellToFlowing(cell)
      elseif not wait then
        insert = true
      end
    elseif not IsFlowing(row - 1, column) then
      RemoveCellFromFlowing(cell)
      cell.x, cell.y = RC2Position(row - 1, column)
      AddCellToFlowing(cell)
    end
  else
    insert = true
  end
  if insert then
    RemoveCellFromFlowing(cell)
    local grid = GetGrid(row, column)
    grid.cell = cell
    cell.gridRow = grid.row
    cell.gridColumn = grid.column
    cell.x, cell.y = grid.x, grid.y
    cell.state = CELL_STATE.STATIC
  end
end
local _Gnext = _G.next
local MAX_PROCESS_PER_FRAME = math.huge
local ComputeFlowingCells = function()
  if not flowingCells or hangup then
    return
  end
  flowingCellHeap = flowingCellHeap or new_BinaryHeap(RowFirstComparer)
  local flowed = false
  local flowingspeed = FLOWING_SPEED
  for _, phase in ipairs(ACTIVITY21_MINIGAME_PHASE) do
    if score >= (phase.score or 0) then
      flowingspeed = phase.flowingSpeed
    end
  end
  local process = 0
  for _ = 1, flowingspeed do
    if _Gnext(flowingCells) and process < MAX_PROCESS_PER_FRAME then
      flowed = true
      WALK_VERSION = WALK_VERSION + 1
      if hangup then
        break
      end
      if frameDone then
        flowingCellHeap:reset()
        for _, v in pairs(flowingCells) do
          if v then
            flowingCellHeap:insert(v)
          end
        end
      end
      local count = flowingCellHeap.m_lastIndex
      local time = os.clock()
      while count > 0 and process < MAX_PROCESS_PER_FRAME do
        local cell = flowingCellHeap:pop()
        SimulateFlowing(cell)
        if CollectSameCellAndDestroy(cell) then
          break
        end
        count = count - 1
        process = process + 1
        if os.clock() - time > 0.05 then
          break
        end
      end
      frameDone = 0 == count
      if frameDone then
        process = 0
      end
    else
      flowingTetromino = nil
      break
    end
  end
  return not flowed
end
local RANDOM_ANGLE_LOOKUP = {
  0,
  90,
  180,
  270,
  360
}
local AutoCreateTetromino = function(index, angle, color)
  local config = ACTIVITY21_MINIGAME_CONFIGS[index]
  local blocks = config.blocks
  local maxX, maxY, minX, minY = -math.huge, -math.huge, math.huge, math.huge
  local anchor, anchorType = config.anchor, config.anchorType
  local gridWidth, gridHeight = adaptedGridWidth, adaptedGridHeight
  local anchorPointX, anchorPointY
  if 0 == anchorType then
    local cr = BLOCK_CELL_ROWS / 2
    local cc = BLOCK_CELL_COLUMN / 2
    anchorPointY = ((blocks[anchor].y - 1) * BLOCK_CELL_ROWS + cr) * gridHeight
    anchorPointX = ((blocks[anchor].x - 1) * BLOCK_CELL_COLUMN + cc) * gridWidth
  else
    anchorPointY = ((blocks[anchor].y - 1) * BLOCK_CELL_ROWS + BLOCK_CELL_ROWS) * gridHeight
    anchorPointX = ((blocks[anchor].x - 1) * BLOCK_CELL_COLUMN + BLOCK_CELL_COLUMN) * gridWidth
  end
  for _, block in ipairs(blocks) do
    local blockX, blockY = block.x, block.y
    for row = 1, BLOCK_CELL_ROWS do
      for column = 1, BLOCK_CELL_COLUMN do
        local cellY = ((blockY - 1) * BLOCK_CELL_ROWS + row - 0.5) * gridHeight
        local cellX = ((blockX - 1) * BLOCK_CELL_COLUMN + column - 0.5) * gridWidth
        local localX, localY = rotatePointAround(cellX - anchorPointX, cellY - anchorPointY, angle, 0, 0)
        maxX = math.max(maxX, math.ceil(localX / gridWidth))
        minX = math.min(minX, math.floor(localX / gridWidth))
        maxY = math.max(maxY, math.ceil(localY / gridHeight))
        minY = math.min(minY, math.floor(localY / gridHeight))
      end
    end
  end
  local minCol, maxCol = 1 - math.floor(minX), gridColumns - math.ceil(maxX)
  local minRow, maxRow = gridRows - EXTRA_ROWS + 1 - math.floor(minY), gridRows - math.ceil(maxY)
  local rdmCol = math.random(minCol, maxCol)
  local x, y = RC2Position(minRow, rdmCol)
  return CreateTetromino(index, x, y, angle, color)
end
local MAX_CANDIDATE_COUNT = 3
local tetrominoQueue
local AutoFillQueue = function()
  tetrominoQueue = tetrominoQueue or {}
  local flag = false
  while #tetrominoQueue < MAX_CANDIDATE_COUNT do
    flag = true
    local len = #ACTIVITY21_MINIGAME_CONFIGS
    local index = math.random(1, len)
    local angle = RANDOM_ANGLE_LOOKUP[math.random(1, #RANDOM_ANGLE_LOOKUP)]
    table.insert(tetrominoQueue, {
      index = index,
      color = math.random(0, 4),
      angle = angle
    })
  end
  if flag and type(__oncandidateupdate) == "function" then
    __oncandidateupdate(tetrominoQueue)
  end
end
local SPAWN_INTERVAL = 0
local FRAME_COUNT = 24
local GAME_TIME_STEP = 1 / FRAME_COUNT
local gameTime
local AutoSpawnTetromino = function()
  if currentTetromino then
    return
  end
  spawnInterval = (spawnInterval or 0) + GAME_TIME_STEP
  if spawnInterval > SPAWN_INTERVAL then
    local item = table.remove(tetrominoQueue, 1)
    combo = 0
    currentTetromino = AutoCreateTetromino(item.index, item.angle, item.color)
  end
end
local GetElapse = function()
  return elapse
end
local input = CS.UnityEngine.Input
local OnFixedUpdate = function()
  if gameOver then
    return
  end
  if pause then
    return
  end
  elapse = (elapse or 0) + Time.smoothDeltaTime
  while elapse >= gameTime do
    gameTime = gameTime + GAME_TIME_STEP
    if currentTetromino and currentTetromino.loaded and not hangup and frameDone then
      dropTimer = (dropTimer or 0) + GAME_TIME_STEP
      if dropTimer >= TETROMINO_DROP_INTERVAL then
        dropTimer = 0
        local dropSpeed = DEFAULT_DROP_SPEED
        for _, phase in ipairs(ACTIVITY21_MINIGAME_PHASE) do
          if score >= (phase.score or 0) then
            dropSpeed = phase.droppingSpeed
          end
        end
        if not Move(currentTetromino, 0, -dropSpeed) then
          if type(__syncpostioinimmediate) == "function" then
            __syncpostioinimmediate(currentTetromino)
          end
          local maxRow = -math.huge
          for _, cell in pairs(currentTetromino.cells) do
            local row, _ = position2RC(cell.x, cell.y)
            maxRow = math.max(maxRow, row)
          end
          if maxRow > gridRows - EXTRA_ROWS then
            gameOver = true
            if type(__ongameover) == "function" then
              __ongameover()
            end
            return
          end
          for _, cell in ipairs(currentTetromino.cells) do
            AddCellToFlowing(cell)
          end
          flowingTetromino = currentTetromino
          currentTetromino = nil
          spawnInterval = 0
        end
      end
    end
    AutoFillQueue()
    if not hangup then
      AutoSpawnTetromino()
      ComputeFlowingCells()
      if type(__onstep) == "function" then
        __onstep(elapse, gameTime)
      end
    end
  end
end
local Release = function()
  flowingTetromino = nil
  currentTetromino = nil
  if tetrominos then
    local len = #tetrominos
    for i = len, 1, -1 do
      DestroyTetromino(tetrominos[i])
    end
  end
  tetrominos = nil
  grids = nil
  UpdateManager.RemoveUpdateHandler(OnFixedUpdate)
end
local Initialize = function(origin, rows, columns, onCreateTetromino, onDestroyCell, onCandidateUpdate, syncPositionImmediate, onStep, onMatched, onGameOver)
  Release()
  score = 0
  elapse = 0
  gameTime = 0
  combo = 0
  pause = false
  gameOver = false
  hangup = false
  frameDone = true
  local precision = 100000
  adaptedGridWidth = AdaptScale(GRID_WIDTH)
  adaptedGridHeight = AdaptScale(GRID_HEIGHT)
  inv_adaptedGridWidth_100000 = precision / mathf.FloorToInt(AdaptScale(GRID_WIDTH) * precision)
  inv_adaptedGridHeight_100000 = precision / mathf.FloorToInt(AdaptScale(GRID_HEIGHT) * precision)
  grids = grids or {}
  tetrominoQueue = tetrominoQueue or {}
  tetrominos = tetrominos or {}
  flowingCells = flowingCells or {}
  table.clear(tetrominoQueue)
  table.clear(grids)
  table.clear(tetrominos)
  table.clear(flowingCells)
  spawnInterval = SPAWN_INTERVAL
  worldOrigin = origin
  gridRows = rows + EXTRA_ROWS
  gridColumns = columns
  __oncreatetetromino = onCreateTetromino
  __ondestroycell = onDestroyCell
  __oncandidateupdate = onCandidateUpdate
  __onstep = onStep
  __onmatched = onMatched
  __ongameover = onGameOver
  __syncpostioinimmediate = syncPositionImmediate
  InitializeGrids()
  UpdateManager.AddUpdateHandler(OnFixedUpdate)
end
local SetGridSize = function(width, height)
  GRID_WIDTH = width
  GRID_HEIGHT = height
end
local Pause = function(flag)
  pause = flag
end
local Resume = function()
  hangup = false
end
local GetScore = function()
  return score
end
local GetTetrominoQueue = function()
  return tetrominoQueue
end
local InputStepX = function(val, longpress)
  if gameOver then
    return
  end
  if currentTetromino and currentTetromino.loaded and not hangup and frameDone and val then
    Move(currentTetromino, val * (longpress and LONG_PRESS_HORIZONTAL_SPEED or PRESS_HORIZONTAL_SPEED), 0)
    if type(__syncpostioinimmediate) == "function" then
      __syncpostioinimmediate(currentTetromino)
    end
  end
end
local InputStepY = function(val)
  if gameOver then
    return
  end
  if currentTetromino and currentTetromino.loaded and not hangup and frameDone and val then
    Move(currentTetromino, 0, val * PRESS_DROP_SPEED)
  end
end
local InputRotate = function(val)
  if gameOver then
    return
  end
  if currentTetromino and currentTetromino.loaded and not hangup and frameDone and val then
    Rotate(currentTetromino, val)
    if type(__syncpostioinimmediate) == "function" then
      __syncpostioinimmediate(currentTetromino)
    end
  end
end
local FrameDone = function()
  return frameDone
end
return {
  Release = Release,
  Initialize = Initialize,
  SetGridSize = SetGridSize,
  DestroyTetromino = DestroyTetromino,
  MoveCurrentTetromino = MoveCurrentTetromino,
  RotateCurrentTetromino = RotateCurrentTetromino,
  GetElapse = GetElapse,
  Pause = Pause,
  GetScore = GetScore,
  GetTetrominoQueue = GetTetrominoQueue,
  InputStepX = InputStepX,
  InputStepY = InputStepY,
  InputRotate = InputRotate,
  Resume = Resume,
  AutoSpawnTetromino = AutoSpawnTetromino,
  FrameDone = FrameDone
}
