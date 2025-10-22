local GRID_WIDTH, GRID_HEIGHT = 1, 1
local NUM_PREVIEW_TYPES = 3
local COMBO_PLACE_INTERVAL = 3
local MAX_COMBO = 5
local CLEAR_ALL_BLOCKS_SCORE = 300
local ACTIVITY16_MINIGAME_CONFIGS = require("Activity16_MiniGameConfigs")
local worldCenter, gridColumns, gridRows, grids, currentTetromino, tetrominos, dropTimer, previewEntries, elapse, combo, remainComboChance, score, __oncreatetetromino, __ondestroycell, __ongameover, __onmatched, __oncreatepreviewentry
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
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local width = gridColumns * gridWidth
  local height = gridRows * gridHeight
  local startX = worldCenter.x - width * 0.5
  local startY = worldCenter.y - height * 0.5
  local px = startX + (column - 0.5) * gridWidth
  local py = startY + (row - 0.5) * gridHeight
  return px, py
end
local position2RC = function(x, y)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local width = gridColumns * gridWidth
  local height = gridRows * gridHeight
  local startX = worldCenter.x - width * 0.5
  local startY = worldCenter.y - height * 0.5
  local rx, ry = x - startX, y - startY
  local row, _ = math.modf(math.ceil(ry / gridHeight))
  local column, _ = math.modf(math.ceil(rx / gridWidth))
  return row, column
end
local UpdateTetrominoCellsPosition = function(tetromino)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  for _, cell in ipairs(tetromino.cells) do
    cell.x = tetromino.x + cell.localX * gridWidth
    cell.y = tetromino.y + cell.localY * gridHeight
  end
end
local GetGrid = function(row, column)
  for _, grid in ipairs(grids) do
    if grid.row == row and grid.column == column then
      return grid
    end
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
  local config = ACTIVITY16_MINIGAME_CONFIGS[tetrominoType]
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
local DestroyTetromino = function(tetromino)
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
        if type(__ondestroycell) == "function" then
          __ondestroycell(cell)
        end
      end
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
  for y = 1, gridRows do
    for x = 1, gridColumns do
      local grid = CreateGrid(y, x)
      table.insert(grids, grid)
    end
  end
end
local Movable = function(tetromino, stepX, stepY)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = tetromino.x + stepX * gridWidth, tetromino.y + stepY * gridHeight
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gridWidth
    local cellY = y + localY * gridHeight
    local grid = GetGrid(position2RC(cellX, cellY))
    if not grid or grid.cell then
      return false
    end
  end
  return true
end
local Rotatable = function(tetromino, angle)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local x, y = rotatePointAround(localX, localY, angle, 0, 0)
    x = tetromino.x + x * gridWidth
    y = tetromino.y + y * gridHeight
    local grid = GetGrid(position2RC(x, y))
    if not grid or grid.cell then
      return false
    end
  end
  return true
end
local Move = function(tetromino, stepX, stepY)
  if not Movable(tetromino, stepX, stepY) then
    return false
  end
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = tetromino.x + stepX * gridWidth, tetromino.y + stepY * gridHeight
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    cell.x = x + localX * gridWidth
    cell.y = y + localY * gridHeight
  end
  tetromino.x, tetromino.y = x, y
  return true
end
local ResetAnchorCell = function(tetromino, cellIndex)
  local config = ACTIVITY16_MINIGAME_CONFIGS[tetromino.type]
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
local Rotate = function(tetromino, angle)
  tetromino.angle = tetromino.angle or 0
  local len = #tetromino.cells
  local rotatable = false
  for i = 1, len do
    if Rotatable(tetromino, angle) then
      rotatable = true
      break
    end
    ResetAnchorCell(tetromino, i)
  end
  if rotatable then
    local targetAngle = tetromino.angle + angle
    for _, cell in ipairs(tetromino.cells) do
      local localX, localY = cell.localX, cell.localY
      cell.localX, cell.localY = rotatePointAround(localX, localY, angle, 0, 0)
    end
    tetromino.angle = targetAngle
    return true
  end
  return false
end
local GetBounds = function(tetromino)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = tetromino.x, tetromino.y
  local minX, maxX, minY, maxY = math.huge, -math.huge, math.huge, -math.huge
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gridWidth
    local cellY = y + localY * gridHeight
    local minx, maxx = cellX - gridWidth * 0.5, cellX + gridWidth * 0.5
    local miny, maxy = cellY - gridHeight * 0.5, cellY + gridHeight * 0.5
    maxX = math.max(minx, math.max(maxx, maxX))
    minX = math.min(minx, math.min(maxx, minX))
    maxY = math.max(miny, math.max(maxy, maxY))
    minY = math.min(miny, math.min(maxy, minY))
  end
  return minX, maxX, minY, maxY
end
local FitInto = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = RC2Position(startGridRowWithAnchor, startGridColumnWithAnchor)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gridWidth
    local cellY = y + localY * gridHeight
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
local dl = CS.UnityEngine.Debug.DrawLine
local sidesBuffer
local GetGridsOutline = function(grids)
  local get_grid = function(row, col)
    for _, grid in pairs(grids) do
      if grid.row == row and grid.column == col then
        return grid
      end
    end
    return false
  end
  sidesBuffer = sidesBuffer or {}
  table.clear(sidesBuffer)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  for _, grid in ipairs(grids) do
    local row, col = grid.row, grid.column
    for step = -1, 1, 2 do
      for flag = 1, 2 do
        local vertical = 0 == flag % 2
        local x = vertical and 0 or step
        local y = vertical and step or 0
        local neighbor = get_grid(row + y, col + x, grids)
        if not neighbor then
          local v0, v1
          local sign = step > 0 and 1 or -1
          if vertical then
            v0 = Vector3(grid.x - 0.5 * gridWidth * -sign, grid.y + 0.5 * gridHeight * step)
            v1 = Vector3(grid.x + 0.5 * gridWidth * -sign, grid.y + 0.5 * gridHeight * step)
          else
            v0 = Vector3(grid.x + 0.5 * gridWidth * step, grid.y - 0.5 * gridHeight * sign)
            v1 = Vector3(grid.x + 0.5 * gridWidth * step, grid.y + 0.5 * gridHeight * sign)
          end
          table.insert(sidesBuffer, {v0 = v0, v1 = v1})
        end
      end
    end
  end
  local index = 1
  local epsilon = 0.001
  local orderSides
  local groupOrderSides = {}
  while #sidesBuffer > 0 do
    local side = table.remove(sidesBuffer, index)
    orderSides = orderSides or {}
    table.insert(orderSides, side)
    local flag = false
    for i, v in ipairs(sidesBuffer) do
      if epsilon > Vector3.Distance(v.v0, side.v1) or epsilon > Vector3.Distance(v.v1, side.v0) then
        index = i
        flag = true
        break
      end
    end
    if not flag then
      table.insert(groupOrderSides, orderSides)
      index = 1
      orderSides = nil
    end
  end
  return groupOrderSides
end
local Debug_DrawGrids = function(grids)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  for _, v in ipairs(grids) do
    local x, y = v.x, v.y
    local minX, maxX = x - gridWidth * 0.5, x + gridWidth * 0.5
    local minY, maxY = y - gridHeight * 0.5, y + gridHeight * 0.5
    local c = Color.white
    dl(Vector3(minX, minY), Vector3(maxX, minY), c)
    dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
    dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
    dl(Vector3(minX, maxY), Vector3(minX, minY), c)
  end
end
local Debug_DrawTetrominos = function(tetrominos)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  for _, v in ipairs(tetrominos) do
    for i, cell in ipairs(v.cells) do
      if not cell.destroyed then
        local x, y = cell.x, cell.y
        local minX, maxX = x - gridWidth * 0.5, x + gridWidth * 0.5
        local minY, maxY = y - gridHeight * 0.5, y + gridHeight * 0.5
        local c = v.anchor == i and Color.green or v.static and Color.green or Color.red
        dl(Vector3(minX, minY), Vector3(maxX, minY, 0.1), c)
        dl(Vector3(maxX, minY), Vector3(maxX, maxY, 0.1), c)
        dl(Vector3(maxX, maxY), Vector3(minX, maxY, 0.1), c)
        dl(Vector3(minX, maxY), Vector3(minX, minY, 0.1), c)
      end
    end
  end
end
local gridsBuffer
local TryGetMatchedCells = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = RC2Position(startGridRowWithAnchor, startGridColumnWithAnchor)
  local tempGrids = {}
  gridsBuffer = gridsBuffer or {}
  table.clear(gridsBuffer)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    local cellX = x + localX * gridWidth
    local cellY = y + localY * gridHeight
    local grid = GetGrid(position2RC(cellX, cellY))
    table.insert(tempGrids, grid)
  end
  local rows, cols
  for row = 1, gridRows do
    local flag = true
    for column = 1, gridColumns do
      local grid = GetGrid(row, column)
      if not grid.cell and not table.keyof(tempGrids, grid) then
        flag = false
        break
      end
    end
    if flag then
      rows = rows or {}
      table.insert(rows, row)
      for column = 1, gridColumns do
        local grid = GetGrid(row, column)
        table.insert(gridsBuffer, grid)
      end
    end
  end
  for column = 1, gridColumns do
    local flag = true
    for row = 1, gridRows do
      local grid = GetGrid(row, column)
      if not grid.cell and not table.keyof(tempGrids, grid) then
        flag = false
        break
      end
    end
    if flag then
      cols = cols or {}
      table.insert(cols, column)
      for row = 1, gridRows do
        local grid = GetGrid(row, column)
        if not table.keyof(gridsBuffer, grid) then
          table.insert(gridsBuffer, grid)
        end
      end
    end
  end
  return gridsBuffer, rows, cols
end
local Place = function(tetromino, startGridRowWithAnchor, startGridColumnWithAnchor)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local x, y = RC2Position(startGridRowWithAnchor, startGridColumnWithAnchor)
  for _, cell in ipairs(tetromino.cells) do
    local localX, localY = cell.localX, cell.localY
    cell.x = x + localX * gridWidth
    cell.y = y + localY * gridHeight
    local grid = GetGrid(position2RC(cell.x, cell.y))
    grid.cell = cell
  end
  tetromino.x, tetromino.y = x, y
  tetromino.static = true
  local buffer = {}
  local rows, cols
  for row = 1, gridRows do
    local flag = true
    for column = 1, gridColumns do
      local grid = GetGrid(row, column)
      if not grid.cell then
        flag = false
        break
      end
    end
    if flag then
      rows = rows or {}
      table.insert(rows, row)
      for column = 1, gridColumns do
        local grid = GetGrid(row, column)
        table.insert(buffer, grid)
      end
    end
  end
  for column = 1, gridColumns do
    local flag = true
    for row = 1, gridRows do
      local grid = GetGrid(row, column)
      if not grid.cell then
        flag = false
        break
      end
    end
    if flag then
      cols = cols or {}
      table.insert(cols, column)
      for row = 1, gridRows do
        local grid = GetGrid(row, column)
        if not table.keyof(buffer, grid) then
          table.insert(buffer, grid)
        end
      end
    end
  end
  for _, grid in ipairs(buffer) do
    local cell = grid.cell
    grid.cell = false
    cell.destroyed = true
    if type(__ondestroycell) == "function" then
      __ondestroycell(cell, true)
    end
  end
  local clear = true
  for _, grid in ipairs(grids) do
    if grid.cell then
      clear = false
    end
  end
  score = score + #tetromino.cells
  if rows or cols then
    local numRows = rows and #rows or 0
    local numCols = cols and #cols or 0
    score = score + (numRows + numCols) * 10 * (combo + 1) + (clear and CLEAR_ALL_BLOCKS_SCORE or 0)
    if type(remainComboChance) == "number" and remainComboChance > 0 then
      combo = math.min(MAX_COMBO, (combo or 0) + 1)
      if type(__onmatched) == "function" then
        __onmatched(tetromino.color, rows, cols, combo, clear)
      end
    elseif type(__onmatched) == "function" then
      __onmatched(tetromino.color, rows, cols, 0, clear)
    end
    remainComboChance = COMBO_PLACE_INTERVAL
  else
    remainComboChance = math.max((remainComboChance or 0) - 1, 0)
    if remainComboChance <= 0 then
      combo = 0
    end
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
local AnySuitable = function()
  local result = false
  for _, entry in ipairs(previewEntries) do
    local config = ACTIVITY16_MINIGAME_CONFIGS[entry.type]
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
local columnDropCells
local InsertTetromino = function(tetromino)
  local gridWidth, gridHeight = AdaptScale(GRID_WIDTH), AdaptScale(GRID_HEIGHT)
  local cells = tetromino.cells
  for _, cell in ipairs(cells) do
    local localX, localY = cell.localX, cell.localY
    local x = tetromino.x + localX * gridWidth
    local y = tetromino.y + localY * gridHeight
    local grid = GetGrid(position2RC(x, y))
    grid.cell = cell
    cell.gridRow = grid.row
    cell.gridColumn = grid.column
  end
  tetromino.static = true
  local nothingBoomed
  nothingBoomed = true
  local columnMatchedCells = {}
  for row = 1, gridRows do
    local flag = true
    for column = 1, gridColumns do
      local grid = GetGrid(row, column)
      if not grid.cell then
        flag = false
        break
      end
    end
    if flag then
      nothingBoomed = false
      if type(__onmatched) == "function" then
        __onmatched(row)
      end
      for column = 1, gridColumns do
        local grid = GetGrid(row, column)
        local cell = grid.cell
        grid.cell = false
        cell.destroyed = true
        local matchedCells = columnMatchedCells[column] or {}
        table.insert(matchedCells, cell)
        columnMatchedCells[column] = matchedCells
        if type(__ondestroycell) == "function" then
          __ondestroycell(cell)
        end
      end
    end
  end
  columnDropCells = columnDropCells or {}
  for column = 1, gridColumns do
    table.clear(columnDropCells)
    for row = 1, gridRows do
      local grid = GetGrid(row, column)
      if grid.cell then
        table.insert(columnDropCells, grid)
      end
    end
    for _, grid in ipairs(columnDropCells) do
      local droppedRows = 0
      local cell = grid.cell
      local hashset = {}
      for _, matchedCells in pairs(columnMatchedCells) do
        for _, v in ipairs(matchedCells) do
          local matchedRow = v.gridRow
          if v.owner == cell.owner and not hashset[matchedRow] and grid.column ~= v.gridColumn and matchedRow < grid.row then
            hashset[matchedRow] = true
            droppedRows = droppedRows + 1
          end
        end
      end
      local matchedCells = columnMatchedCells[grid.column]
      if matchedCells then
        for _, v in ipairs(matchedCells) do
          local matchedRow = v.gridRow
          if matchedRow < grid.row and not hashset[matchedRow] then
            hashset[matchedRow] = true
            droppedRows = droppedRows + 1
          end
        end
      end
      if droppedRows > 0 then
        local targetRow = cell.gridRow - droppedRows
        grid.cell = nil
        local targetGrid = GetGrid(targetRow, grid.column)
        local tr, tc = targetGrid.row, targetGrid.column
        cell.x, cell.y = RC2Position(tr, tc)
        targetGrid.cell = cell
        cell.gridRow = targetGrid.row
        cell.gridColumn = targetGrid.column
      end
    end
  end
end
local AutoSpawnTetromino = function()
  if currentTetromino then
    return
  end
  local len = #ACTIVITY16_MINIGAME_CONFIGS
  local index = math.random(1, len)
  local config = ACTIVITY16_MINIGAME_CONFIGS[index]
  local anchorCell = config.cells[config.anchor]
  local maxX, maxY, minX, minY = -math.huge, -math.huge, math.huge, math.huge
  for _, cell in ipairs(config.cells) do
    local localX, localY = cell.x - anchorCell.x, cell.y - anchorCell.y
    maxX = math.max(localX, maxX)
    minX = math.min(localX, minX)
    maxY = math.max(localY, maxY)
    minY = math.min(localY, minY)
  end
  local minCol, maxCol = 1 - minX, gridColumns - maxX
  local minRow, maxRow = 1 - minY, gridRows - maxY
  local x, y = RC2Position(maxRow, math.random(minCol, maxCol))
  currentTetromino = CreateTetromino(index, x, y, 0, math.random(0, 6))
end
local AutoCreatePreviewEntry = function()
  previewEntries = previewEntries or {}
  if #previewEntries <= 0 then
    local buffer = {}
    for i = 1, NUM_PREVIEW_TYPES do
      if not table.keyof(previewEntries, i, "index") then
        table.clear(buffer)
        for j = 1, #ACTIVITY16_MINIGAME_CONFIGS do
          local config = ACTIVITY16_MINIGAME_CONFIGS[j]
          if type(config.score) ~= "number" or score >= config.score then
            table.insert(buffer, j)
          end
        end
        for _, entry in ipairs(previewEntries) do
          local k = table.keyof(buffer, entry.type)
          if k then
            table.remove(buffer, k)
          end
        end
        local entry = {
          index = i,
          type = buffer[math.random(1, #buffer)],
          color = math.random(0, 6),
          angle = math.random(0, 3) * 90
        }
        table.insert(previewEntries, entry)
        if type(__oncreatepreviewentry) == "function" then
          __oncreatepreviewentry(entry)
        end
      end
    end
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_new")
  end
  if not AnySuitable() and type(__ongameover) == "function" then
    __ongameover(elapse)
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
local SetTetrominoPositionWithPivot = function(tetromino, x, y, pivotx, pivoty)
  local minx, maxx, miny, maxy = GetBounds(tetromino)
  local centerX, centerY = (maxx + minx) * (pivotx or 0.5), (maxy + miny) * (pivoty or 0.5)
  local diffx, diffy = tetromino.x - centerX, tetromino.y - centerY
  tetromino.x = x + diffx
  tetromino.y = y + diffy
  UpdateTetrominoCellsPosition(tetromino)
end
local GetElapse = function()
  return elapse
end
local input = CS.UnityEngine.Input
local OnUpdate = function()
  Debug_DrawGrids(grids)
  Debug_DrawTetrominos(tetrominos)
  elapse = (elapse or 0) + Time.deltaTime
end
local Release = function()
  currentTetromino = nil
  previewEntries = nil
  if tetrominos then
    local len = #tetrominos
    for i = len, 1, -1 do
      DestroyTetromino(tetrominos[i])
    end
  end
  tetrominos = nil
  grids = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
end
local Initialize = function(center, rows, columns, onCreateTetromino, onDestroyCell, onMatched, onCreatePreviewEntry, onGameOver)
  Release()
  score = 0
  elapse = 0
  grids = grids or {}
  tetrominos = tetrominos or {}
  table.clear(grids)
  table.clear(tetrominos)
  worldCenter = center
  gridRows = rows
  gridColumns = columns
  __oncreatetetromino = onCreateTetromino
  __ondestroycell = onDestroyCell
  __onmatched = onMatched
  __oncreatepreviewentry = onCreatePreviewEntry
  __ongameover = onGameOver
  InitializeGrids()
  AutoCreatePreviewEntry()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local SetGridSize = function(width, height)
  GRID_WIDTH = width
  GRID_HEIGHT = height
end
return {
  Release = Release,
  Initialize = Initialize,
  SetGridSize = SetGridSize,
  GetPreviewEntries = GetPreviewEntries,
  GetPreviewEntry = GetPreviewEntry,
  RemovePreview = RemovePreview,
  FitInto = FitInto,
  Place = Place,
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
  TryGetMatchedCells = TryGetMatchedCells,
  GetGridsOutline = GetGridsOutline,
  GetElapse = GetElapse
}
