local ITEM_TYPE = {
  A = 70076502,
  B = 70076503,
  C = 70076504,
  D = 70076505,
  E = 70076506,
  F = 70076507,
  G = 70076508,
  RAINBOW = 70076501
}
local ITEM_RANDOM_LIST = {
  [1] = ITEM_TYPE.A,
  [2] = ITEM_TYPE.B,
  [3] = ITEM_TYPE.C,
  [4] = ITEM_TYPE.D,
  [5] = ITEM_TYPE.E,
  [6] = ITEM_TYPE.F,
  [7] = ITEM_TYPE.G
}
local ROW_BOOM_NUM, COL_BOOM_NUM = 2, 2
local row, col, ItemsDrop, CreateNewItems, CreateSpecialItems, AllBoom, CheckBoomEffect, enableCoroutine, grids, specialItems, colDropItemsDict, colNewDropItemsDict, colCreatedNewItemsDict, isOperation, step, combo, __oncreategrid
ACTIVITY5_STATUS = {
  SWAP = "SWAP",
  BOOM = "BOOM",
  BOOM_FINAL = "BOOM_FINAL",
  ITEMS_DROP = "ITEMS_DROP",
  CREATE_NEW_ITEMS = "CREATE_NEW_ITEMS",
  REVERT = "REVERT",
  SET_EFFECT = "SET_EFFECT",
  RANDOM_SET_EFFECT = "RANDOM_SET_EFFECT",
  OVER = "OVER"
}
ACTIVITY5_BOOM_MODE = {
  SINGLE = 0,
  ROW = 1,
  COL = 2
}
local BOOM_EFFECT = {
  NONE = "NONE",
  HORIZONTAL = "HORIZONTAL",
  VERTICAL = "VERTICAL",
  MATRIX = "MATRIX"
}
local Pos2Index = function(x, y)
  return (y - 1) * col + x
end
local ClampCol = function(c)
  return math.max(1, math.min(col, c))
end
local ClampRow = function(r)
  return math.max(1, math.min(row, r))
end
local reusableItems = {}
local reusableItemBuffers = {}
local CreateItem = function(itemType, x, y, effect)
  local item
  if #reusableItems > 0 then
    item = table.remove(reusableItems)
  else
    item = {}
  end
  item.type = itemType
  item.x = x
  item.y = y
  item.hasCheck = false
  item.effect = effect or BOOM_EFFECT.NONE
  item.__same_col = 0
  item.__same_row = 0
  item.__combo_effect = nil
  return item
end
local RandomCreateItem = function(x, y, effect)
  local rdmType = ITEM_RANDOM_LIST[math.random(1, #ITEM_RANDOM_LIST)]
  return CreateItem(rdmType, x, y, effect)
end
local MoveItem = function(item, x, y)
  local index = Pos2Index(x, y)
  grids[index].item = item
  item.x = x
  item.y = y
end
local PooledItem = function(item)
  if not item then
    return
  end
  item.hasCheck = false
  table.insert(reusableItems, item)
end
local GetItem = function(current, deltaX, deltaY)
  local x = current.x + deltaX
  local y = current.y + deltaY
  if x > 0 and x <= col and y > 0 and y <= row then
    return grids[Pos2Index(x, y)].item
  end
end
local PooledBuffer = function(buffer)
  if buffer then
    table.clear(buffer)
    table.insert(reusableItemBuffers, buffer)
  end
end
local GetBuffer = function()
  local buffer
  if #reusableItemBuffers > 0 then
    buffer = table.remove(reusableItemBuffers, 1)
  else
    buffer = {}
  end
  return buffer
end
local CollectItems = function(col0, col1, row0, row1, filter, buffer, ...)
  if type(filter) == "table" and not buffer then
    buffer = filter
  end
  local startCol, endCol = ClampCol(math.min(col0, col1)), ClampCol(math.max(col0, col1))
  local startRow, endRow = ClampRow(math.min(row0, row1)), ClampRow(math.max(row0, row1))
  for y = startRow, endRow do
    for x = startCol, endCol do
      local grid = grids[Pos2Index(x, y)]
      local gridItem = grid.item
      if gridItem and (type(filter) ~= "function" or filter(gridItem, buffer, ...)) then
        buffer = buffer or {}
        if not table.keyof(buffer, gridItem) then
          table.insert(buffer, gridItem)
        end
      end
    end
  end
  return buffer
end
local CollectColItems = function(colIndex, filter, buffer, ...)
  if colIndex > 0 and colIndex <= col then
    return CollectItems(colIndex, colIndex, 1, row, filter, buffer, ...)
  end
  return buffer
end
local CollectRowItems = function(rowIndex, filter, buffer, ...)
  if rowIndex > 0 and rowIndex <= row then
    return CollectItems(1, col, rowIndex, rowIndex, filter, buffer, ...)
  end
  return buffer
end

local function CollectSameItems(item, buffer)
  local collection = buffer or {}
  if table.keyof(collection, item) then
    return
  end
  table.insert(collection, item)
  local o = GetItem(item, 0, 1)
  if o and o.type == item.type then
    CollectSameItems(o, collection)
  end
  o = GetItem(item, 0, -1)
  if o and o.type == item.type then
    CollectSameItems(o, collection)
  end
  o = GetItem(item, -1, 0)
  if o and o.type == item.type then
    CollectSameItems(o, collection)
  end
  o = GetItem(item, 1, 0)
  if o and o.type == item.type then
    CollectSameItems(o, collection)
  end
  return collection
end

local CheckItemsInterval = function(beginItem, endItem, horizontal)
  local itemType = beginItem.type
  if horizontal then
    local beginx = beginItem.x
    local endx = endItem.x
    if beginx > endx then
      local temp = beginx
      beginx = endx
      endx = temp
    end
    for x = beginx + 1, endx do
      local index = Pos2Index(x, beginItem.y)
      local grid = grids[index]
      if not grid.item then
        return false
      end
      if grid.item.type ~= itemType then
        return false
      end
    end
  else
    local beginy = beginItem.y
    local endy = endItem.y
    if beginy > endy then
      local temp = beginy
      beginy = endy
      endy = temp
    end
    for y = beginy + 1, endy do
      local index = Pos2Index(beginItem.x, y)
      local grid = grids[index]
      if not grid.item then
        return false
      end
      if grid.item.type ~= itemType then
        return false
      end
    end
  end
  return true
end
local Boom = function(items, scoreLookup, final)
  combo = combo + 1
  for _, v in ipairs(items) do
    local index = Pos2Index(v.x, v.y)
    local item = grids[index].item
    if item then
      item.hasCheck = true
      grids[index].item = false
      PooledItem(item)
    else
      printError("NIL ITEM", v.x, v.y)
    end
  end
  if enableCoroutine then
    coroutine.yield(final and ACTIVITY5_STATUS.BOOM_FINAL or ACTIVITY5_STATUS.BOOM, items, scoreLookup)
  end
end
local SelectBestItem = function(items)
  local result, maxScore = nil, 0
  for _, v in ipairs(items) do
    v.__same_col = 0
    v.__same_row = 0
    for _, w in ipairs(items) do
      if v ~= w then
        if v.x == w.x and CheckItemsInterval(v, w, false) then
          v.__same_col = v.__same_col + 1
        end
        if v.y == w.y and CheckItemsInterval(v, w, true) then
          v.__same_row = v.__same_row + 1
        end
      end
    end
    local score = v.__same_row + v.__same_col
    if not result or maxScore < score then
      result = v
      maxScore = score
    end
  end
  return result
end
local FillBoomItems = function(item, sameItems)
  local boomItems
  local rowTempItems, colTempItems = GetBuffer(), GetBuffer()
  local rowCnt, colCnt = 0, 0
  for _, v in ipairs(sameItems) do
    if v.y == item.y and CheckItemsInterval(item, v, true) then
      rowCnt = rowCnt + 1
      table.insert(rowTempItems, v)
    end
    if v.x == item.x and CheckItemsInterval(item, v, false) then
      colCnt = colCnt + 1
      table.insert(colTempItems, v)
    end
  end
  local horizontal = false
  if rowCnt > ROW_BOOM_NUM then
    horizontal = true
    boomItems = GetBuffer()
    for _, v in ipairs(rowTempItems) do
      table.insert(boomItems, v)
    end
  end
  if colCnt > COL_BOOM_NUM then
    boomItems = boomItems or GetBuffer()
    if horizontal then
      local k = table.keyof(boomItems, item)
      table.remove(boomItems, k)
    end
    for _, v in ipairs(colTempItems) do
      table.insert(boomItems, v)
    end
  end
  PooledBuffer(rowTempItems)
  PooledBuffer(colTempItems)
  return boomItems and #boomItems > 0, boomItems, rowCnt, colCnt
end
local Swap = function(itemA, itemB)
  local ax, ay = itemA.x, itemA.y
  local bx, by = itemB.x, itemB.y
  MoveItem(itemA, bx, by)
  MoveItem(itemB, ax, ay)
end
local OnCollectBoomEffectItem = function(item, buffer, origin, scoreLookup)
  if item ~= origin and not table.keyof(buffer, item) and scoreLookup then
    local key = string.format("%s_%s_%s", origin.effect, origin.x, origin.y)
    scoreLookup[key] = (scoreLookup[key] or 0) + 1
  end
  return true
end
local OnCollectExtraBoomItem_SetScoreLookup = function(item, buffer, scoreLookup, key)
  if not table.keyof(buffer, item) then
    scoreLookup[key] = (scoreLookup[key] or 0) + 1
  end
  return true
end

function CheckBoomEffect(item, buffer, scoreLookup)
  local effect = item.effect
  local collected = false
  local tempBuffer = GetBuffer()
  if effect == BOOM_EFFECT.VERTICAL then
    collected = true
    CollectColItems(item.x, OnCollectBoomEffectItem, tempBuffer, item, scoreLookup)
  elseif effect == BOOM_EFFECT.HORIZONTAL then
    collected = true
    CollectRowItems(item.y, OnCollectBoomEffectItem, tempBuffer, item, scoreLookup)
  elseif effect == BOOM_EFFECT.MATRIX then
    collected = true
    local x, y = item.x, item.y
    CollectItems(x - 1, x + 1, y - 1, y + 1, OnCollectBoomEffectItem, tempBuffer, item, scoreLookup)
  elseif item.type == ITEM_TYPE.RAINBOW then
    collected = true
    local typesBuffer = GetBuffer()
    for _, grid in ipairs(grids) do
      local gridItem = grid.item
      if gridItem and not table.keyof(typesBuffer, gridItem.type) and gridItem.type ~= ITEM_TYPE.RAINBOW then
        table.insert(typesBuffer, gridItem.type)
      end
    end
    local randomType = typesBuffer[math.random(1, #typesBuffer)]
    PooledBuffer(typesBuffer)
    table.insert(tempBuffer, item)
    local key = string.format("RAINBOW_%s_%s", item.x, item.y)
    CollectItems(1, col, 1, row, function(o, subBuffer)
      scoreLookup[key] = (scoreLookup[key] or 0) + 1
      if o.type == randomType then
        CheckBoomEffect(o, subBuffer, scoreLookup)
        return true
      end
    end, tempBuffer)
  end
  if collected and tempBuffer and _G.next(tempBuffer) then
    for _, v in ipairs(tempBuffer) do
      if not table.keyof(buffer, v) then
        table.insert(buffer, v)
        if v ~= item then
          CheckBoomEffect(v, buffer, scoreLookup)
        end
      end
    end
  end
  PooledBuffer(tempBuffer)
end

local CheckAroundBoom = function(item, buffer, scoreLookup)
  local bestItem = SelectBestItem(CollectSameItems(item, buffer))
  local result, boomItems, rowCnt, colCnt = FillBoomItems(bestItem, buffer)
  if result then
    local type, x, y = item.type, item.x, item.y
    if not table.keyof(boomItems, item) then
      type, x, y = bestItem.type, bestItem.x, bestItem.y
    end
    if rowCnt >= 5 or colCnt >= 5 then
      specialItems = specialItems or {}
      table.insert(specialItems, {
        x = x,
        y = y,
        type = ITEM_TYPE.RAINBOW,
        effect = BOOM_EFFECT.NONE
      })
    elseif rowCnt >= 3 and colCnt >= 3 then
      specialItems = specialItems or {}
      table.insert(specialItems, {
        x = x,
        y = y,
        type = type,
        effect = BOOM_EFFECT.MATRIX
      })
    elseif rowCnt >= 4 then
      specialItems = specialItems or {}
      table.insert(specialItems, {
        x = x,
        y = y,
        type = type,
        effect = BOOM_EFFECT.HORIZONTAL
      })
    elseif colCnt >= 4 then
      specialItems = specialItems or {}
      table.insert(specialItems, {
        x = x,
        y = y,
        type = type,
        effect = BOOM_EFFECT.VERTICAL
      })
    end
    local key = string.format("%s_%s_%s", "NORMAL", x, y)
    for _, _ in ipairs(boomItems) do
      scoreLookup[key] = (scoreLookup[key] or 0) + 1
    end
    local cnt = #boomItems
    for i = 1, cnt do
      CheckBoomEffect(boomItems[i], boomItems, scoreLookup)
    end
    return true, boomItems, scoreLookup
  end
  return false
end

function CreateSpecialItems()
  if specialItems then
    colCreatedNewItemsDict = colCreatedNewItemsDict or {}
    for _, v in pairs(colCreatedNewItemsDict) do
      table.clear(v)
    end
    for _, v in ipairs(specialItems) do
      local origin = grids[Pos2Index(v.x, v.y)].item
      if origin then
        printError(v.x, v.y, "already has item ", origin.type, "new type is ", v.type)
      end
      local item = CreateItem(v.type, v.x, v.y, v.effect)
      grids[Pos2Index(v.x, v.y)].item = item
      colCreatedNewItemsDict[v.x] = colCreatedNewItemsDict[v.x] or {}
      table.insert(colCreatedNewItemsDict[v.x], item)
    end
    if enableCoroutine then
      coroutine.yield(ACTIVITY5_STATUS.CREATE_NEW_ITEMS, colCreatedNewItemsDict)
    end
  end
end

function ItemsDrop()
  colDropItemsDict = colDropItemsDict or {}
  for _, v in pairs(colDropItemsDict) do
    table.clear(v)
  end
  colNewDropItemsDict = colNewDropItemsDict or {}
  for _, v in pairs(colNewDropItemsDict) do
    table.clear(v)
  end
  for x = 1, col do
    local cnt = 0
    local newItemCnt = 0
    local max = -1
    for y = 1, row do
      local grid = grids[Pos2Index(x, y)]
      if grid.item and y > max then
        cnt = cnt + 1
        colDropItemsDict[x] = colDropItemsDict[x] or {}
        table.insert(colDropItemsDict[x], grid.item)
      end
    end
    for y = 1, row do
      local grid = grids[Pos2Index(x, y)]
      if not grid.item and y > max then
        colNewDropItemsDict[x] = colNewDropItemsDict[x] or {}
        local item = RandomCreateItem(x, row + #colNewDropItemsDict[x] + 1)
        table.insert(colNewDropItemsDict[x], item)
        newItemCnt = newItemCnt + 1
      end
    end
    for i = 1, cnt do
      local current = colDropItemsDict[x][i]
      local cx, cy = current.x, current.y
      local index = Pos2Index(cx, cy)
      grids[index].item = false
      if max > -1 then
        MoveItem(current, x, max + i)
      else
        MoveItem(current, x, i)
      end
      current.__oldy = cy
    end
    for i = 1, newItemCnt do
      local current = colNewDropItemsDict[x][i]
      current.__tempy = current.y
      if max > -1 then
        MoveItem(current, x, max + i + cnt)
      else
        MoveItem(current, x, i + cnt)
      end
    end
  end
  if specialItems then
    table.clear(specialItems)
  end
  if enableCoroutine then
    coroutine.yield(ACTIVITY5_STATUS.ITEMS_DROP, colDropItemsDict, colNewDropItemsDict)
  end
end

function CreateNewItems()
  colCreatedNewItemsDict = colCreatedNewItemsDict or {}
  for _, v in pairs(colCreatedNewItemsDict) do
    table.clear(v)
  end
  for x = 1, col do
    local cnt = 0
    for y = 1, row do
      if not grids[Pos2Index(x, y)].item then
        cnt = cnt + 1
        local newItem = RandomCreateItem(x, y)
        grids[Pos2Index(x, y)].item = newItem
        colCreatedNewItemsDict[x] = colCreatedNewItemsDict[x] or {}
        table.insert(colCreatedNewItemsDict[x], newItem)
      end
    end
    for i = 1, cnt do
      local current = colCreatedNewItemsDict[x][i]
      grids[Pos2Index(current.x, current.y)].item = current
    end
  end
  if enableCoroutine then
    coroutine.yield(ACTIVITY5_STATUS.CREATE_NEW_ITEMS, colCreatedNewItemsDict)
  end
  AllBoom()
end

function AllBoom()
  local boomed = false
  for _, v in pairs(grids) do
    if v.item and not v.item.hasCheck then
      local items = GetBuffer()
      local scoreLookup = GetBuffer()
      local result, boomItems, _ = CheckAroundBoom(v.item, items, scoreLookup)
      if result then
        boomed = true
        Boom(boomItems, scoreLookup)
        PooledBuffer(boomItems)
      end
    end
  end
  if boomed then
    CreateSpecialItems()
    ItemsDrop()
    CreateNewItems()
  end
end

local CheckExtraEffect = function(itemA, itemB, buffer, scoreLookup)
  local result, tempBoomItems = false, buffer or {}
  local ax, ay = itemA.x, itemA.y
  local bx, by = itemB.x, itemB.y
  local ta, tb = itemA.type, itemB.type
  local effect_a, effect_b = itemA.effect, itemB.effect
  local changeEffectItems
  if ta == ITEM_TYPE.RAINBOW or tb == ITEM_TYPE.RAINBOW then
    result = true
    if ta == tb then
      local prefix = "RAINBOW_RAINBOW"
      local key = string.format("%s_%s_%s", prefix, ax, ay)
      CollectItems(1, col, 1, row, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
    elseif ta == ITEM_TYPE.RAINBOW then
      table.insert(tempBoomItems, itemA)
      local prefix = string.format("RAINBOW_%s", effect_b)
      local key = string.format("%s_%s_%s", prefix, ax, ay)
      CollectItems(1, col, 1, row, function(o, buffer)
        scoreLookup[key] = (scoreLookup[key] or 0) + 1
        if o.type == tb then
          if effect_b ~= BOOM_EFFECT.NONE then
            o.effect = effect_b
            changeEffectItems = changeEffectItems or GetBuffer()
            if not table.keyof(changeEffectItems, o) then
              table.insert(changeEffectItems, o)
            end
          end
          CheckBoomEffect(o, buffer, scoreLookup)
          return true
        end
      end, tempBoomItems)
    elseif tb == ITEM_TYPE.RAINBOW then
      table.insert(tempBoomItems, itemB)
      local prefix = string.format("RAINBOW_%s", effect_a)
      local key = string.format("%s_%s_%s", prefix, bx, by)
      CollectItems(1, col, 1, row, function(o, buffer)
        scoreLookup[key] = (scoreLookup[key] or 0) + 1
        if o.type == ta then
          if effect_a ~= BOOM_EFFECT.NONE then
            o.effect = effect_a
            changeEffectItems = changeEffectItems or GetBuffer()
            if not table.keyof(changeEffectItems, o) then
              table.insert(changeEffectItems, o)
            end
          end
          CheckBoomEffect(o, buffer, scoreLookup)
          return true
        end
      end, tempBoomItems)
    end
  elseif effect_a ~= BOOM_EFFECT.NONE and effect_b ~= BOOM_EFFECT.NONE then
    local prefix = string.format("%s_%s", effect_a, effect_b)
    if effect_a == BOOM_EFFECT.MATRIX then
      local key = string.format("%s_%s_%s", prefix, ax, ay)
      if effect_b == BOOM_EFFECT.VERTICAL then
        result = true
        for i = bx - 1, bx + 1 do
          CollectColItems(i, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      elseif effect_b == BOOM_EFFECT.HORIZONTAL then
        result = true
        for i = by - 1, by + 1 do
          CollectRowItems(i, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      elseif effect_b == BOOM_EFFECT.MATRIX then
        result = true
        CollectItems(ax - 2, ax + 2, ay - 2, ay + 2, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
      end
    elseif effect_b == BOOM_EFFECT.MATRIX then
      local key = string.format("%s_%s_%s", prefix, bx, by)
      if effect_a == BOOM_EFFECT.VERTICAL then
        result = true
        for i = ax - 1, ax + 1 do
          CollectColItems(i, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      elseif effect_a == BOOM_EFFECT.HORIZONTAL then
        result = true
        for i = ay - 1, ay + 1 do
          CollectRowItems(i, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      end
    elseif effect_a == BOOM_EFFECT.HORIZONTAL or effect_a == BOOM_EFFECT.VERTICAL then
      local key = string.format("%s_%s_%s", prefix, ax, by)
      if effect_b == BOOM_EFFECT.VERTICAL then
        result = true
        CollectColItems(bx, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
      elseif effect_b == BOOM_EFFECT.HORIZONTAL then
        result = true
        CollectRowItems(by, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
      end
      if result then
        if effect_a == BOOM_EFFECT.HORIZONTAL then
          CollectRowItems(ay, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        else
          CollectColItems(ax, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      end
    elseif effect_b == BOOM_EFFECT.HORIZONTAL or effect_b == BOOM_EFFECT.VERTICAL then
      local key = string.format("%s_%s_%s", prefix, bx, ay)
      if effect_a == BOOM_EFFECT.VERTICAL then
        result = true
        CollectColItems(ax, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
      elseif effect_a == BOOM_EFFECT.HORIZONTAL then
        result = true
        CollectRowItems(ay, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
      end
      if result then
        if effect_b == BOOM_EFFECT.HORIZONTAL then
          CollectRowItems(by, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        else
          CollectColItems(bx, OnCollectExtraBoomItem_SetScoreLookup, tempBoomItems, scoreLookup, key)
        end
      end
    end
  end
  if result then
    for i, item in ipairs(tempBoomItems) do
      if item ~= itemA and item ~= itemB then
        CheckBoomEffect(item, buffer, scoreLookup)
      end
    end
  end
  return result, tempBoomItems, changeEffectItems
end
local Exchange = function(x1, y1, x2, y2, useAllStep)
  if step <= 0 then
    return
  end
  combo = 0
  local itemA, itemB
  local g1 = grids[Pos2Index(x1, y1)]
  local g2 = grids[Pos2Index(x2, y2)]
  if g1 then
    itemA = g1.item
  end
  if g2 then
    itemB = g2.item
  end
  if type(itemA) ~= "table" or type(itemB) ~= "table" or itemA == itemB or math.abs(itemA.x - itemB.x) + math.abs(itemA.y - itemB.y) >= 2 then
    return
  end
  isOperation = true
  Swap(itemA, itemB)
  coroutine.yield(ACTIVITY5_STATUS.SWAP, itemA, itemB, useAllStep)
  local buffer = GetBuffer()
  local scoreLookup = GetBuffer()
  local extraEffect, extraEffectBoomItems, changeEffectItems = CheckExtraEffect(itemA, itemB, buffer, scoreLookup)
  local revert = false
  if not extraEffect then
    local boomItems = GetBuffer()
    local items = GetBuffer()
    local result_A, boomItems_A, _ = CheckAroundBoom(itemA, items, scoreLookup)
    PooledBuffer(items)
    if not result_A then
      revert = true
    else
      for _, v in ipairs(boomItems_A) do
        if not table.keyof(boomItems, v) then
          table.insert(boomItems, v)
        end
      end
      PooledBuffer(boomItems_A)
    end
    items = GetBuffer()
    local result_B, boomItems_B, _ = CheckAroundBoom(itemB, items, scoreLookup)
    PooledBuffer(items)
    if result_B then
      revert = false
      for _, v in ipairs(boomItems_B) do
        if not table.keyof(boomItems, v) then
          table.insert(boomItems, v)
        end
      end
      PooledBuffer(boomItems_B)
    end
    if boomItems and #boomItems > 0 then
      revert = false
      Boom(boomItems, scoreLookup)
    end
    PooledBuffer(boomItems)
    if revert then
      Swap(itemA, itemB)
      coroutine.yield(ACTIVITY5_STATUS.REVERT, itemA, itemB)
    end
  else
    if changeEffectItems then
      coroutine.yield(ACTIVITY5_STATUS.SET_EFFECT, changeEffectItems)
      PooledBuffer(changeEffectItems)
    end
    if (itemA.effect == BOOM_EFFECT.VERTICAL or itemA.effect == BOOM_EFFECT.HORIZONTAL) and itemB.effect == BOOM_EFFECT.MATRIX then
      local ax, ay = itemA.x, itemA.y
      if itemA.effect == BOOM_EFFECT.VERTICAL then
        for i = ax - 1, ax + 1 do
          for _, v in ipairs(extraEffectBoomItems) do
            if v.x == i then
              v.__combo_effect = BOOM_EFFECT.VERTICAL
            end
          end
        end
      else
        for i = ay - 1, ay + 1 do
          for _, v in ipairs(extraEffectBoomItems) do
            if v.y == i then
              v.__combo_effect = BOOM_EFFECT.HORIZONTAL
            end
          end
        end
      end
    elseif (itemB.effect == BOOM_EFFECT.VERTICAL or itemB.effect == BOOM_EFFECT.HORIZONTAL) and itemA.effect == BOOM_EFFECT.MATRIX then
      local bx, by = itemB.x, itemB.y
      if itemB.effect == BOOM_EFFECT.VERTICAL then
        for i = bx - 1, bx + 1 do
          for _, v in ipairs(extraEffectBoomItems) do
            if v.x == i then
              v.__combo_effect = BOOM_EFFECT.VERTICAL
            end
          end
        end
      else
        for i = by - 1, by + 1 do
          for _, v in ipairs(extraEffectBoomItems) do
            if v.y == i then
              v.__combo_effect = BOOM_EFFECT.HORIZONTAL
            end
          end
        end
      end
    end
    Boom(extraEffectBoomItems, scoreLookup)
  end
  if not revert then
    step = step - 1
    CreateSpecialItems()
    ItemsDrop()
    CreateNewItems()
  end
  PooledBuffer(extraEffectBoomItems)
  PooledBuffer(scoreLookup)
  isOperation = false
  if not useAllStep then
    coroutine.yield(ACTIVITY5_STATUS.OVER)
  end
end
local ExchangeCoroutine = function()
  return coroutine.create(Exchange)
end
local AllBoomCoroutine = function()
  isOperation = true
  AllBoom()
  isOperation = false
  coroutine.yield(ACTIVITY5_STATUS.OVER)
end
local CheckAnyBoomItems = function()
  if isOperation then
    return
  end
  for _, a in ipairs(grids) do
    for _, b in ipairs(grids) do
      if a ~= b then
        local itemA, itemB = a.item, b.item
        if itemA and itemB and 1 == math.abs(itemA.x - itemB.x) + math.abs(itemA.y - itemB.y) then
          Swap(itemA, itemB)
          local items = GetBuffer()
          CollectSameItems(itemA, items)
          local result_a, boomItems_a = FillBoomItems(itemA, items)
          PooledBuffer(items)
          PooledBuffer(boomItems_a)
          items = GetBuffer()
          CollectSameItems(itemB, items)
          local result_b, boomItems_b = FillBoomItems(itemB, items)
          PooledBuffer(items)
          PooledBuffer(boomItems_b)
          Swap(itemA, itemB)
          if result_a or result_b then
            return itemA.x, itemA.y, itemB.x, itemB.y
          end
        end
      end
    end
  end
end
local BoomAllEffectItems = function(final)
  while true do
    local flag = false
    local boomItems = GetBuffer()
    local scoreLookup = GetBuffer()
    for _, grid in ipairs(grids) do
      local item = grid.item
      if item.effect ~= BOOM_EFFECT.NONE or item.type == ITEM_TYPE.RAINBOW then
        flag = true
        CheckBoomEffect(item, boomItems, scoreLookup)
      end
    end
    if flag then
      Boom(boomItems, scoreLookup, final)
      ItemsDrop()
      CreateNewItems()
      PooledBuffer(boomItems)
      PooledBuffer(scoreLookup)
    else
      break
    end
  end
end
local RandomSetEffect = function(num)
  local n = num or 0
  local buffer = GetBuffer()
  local numGrids = #grids
  while n > 0 or numGrids <= #buffer do
    local grid = grids[math.random(1, numGrids)]
    local item = grid.item
    if not table.keyof(buffer, item) then
      table.insert(buffer, item)
      item.effect = math.random(1, 1000) * 0.001 > 0.5 and BOOM_EFFECT.VERTICAL or BOOM_EFFECT.HORIZONTAL
      n = n - 1
    end
  end
  coroutine.yield(ACTIVITY5_STATUS.RANDOM_SET_EFFECT, buffer)
  PooledBuffer(buffer)
end
local UseAllStep = function()
  isOperation = true
  BoomAllEffectItems()
  RandomSetEffect(step)
  BoomAllEffectItems(true)
  step = 0
  isOperation = false
  coroutine.yield(ACTIVITY5_STATUS.OVER)
end
local UseAllStepCoroutine = function()
  return coroutine.create(UseAllStep)
end
local ResetAllItems = function(onCreateItem)
  for y = 1, row do
    for x = 1, col do
      local index = (y - 1) * col + x
      local grid = grids[index]
      grid = grid or {
        row = y,
        col = x,
        item = false
      }
      grids[index] = grid
      __oncreategrid(x, y)
      local item = grids[Pos2Index(x, y)].item
      if item then
        PooledItem(item)
      end
      local newItem = RandomCreateItem(x, y)
      grids[Pos2Index(x, y)].item = newItem
      if onCreateItem then
        onCreateItem(newItem.type, x, y, newItem.effect)
      end
    end
  end
  return coroutine.create(AllBoomCoroutine)
end
local InitGame = function(r, c)
  row = r
  col = c
  combo = 0
  grids = grids or {}
  if specialItems then
    table.clear(specialItems)
  end
  table.clear(grids)
  for y = 1, row do
    for x = 1, col do
      local index = (y - 1) * col + x
      local grid = grids[index]
      grid = grid or {
        row = y,
        col = x,
        item = false
      }
      grids[index] = grid
      __oncreategrid(x, y)
      local item = RandomCreateItem(x, y)
      grids[Pos2Index(x, y)].item = item
    end
  end
end
local Start = function(gameRow, gameCol, gameStep, list, onCreateGrid, createItemOnInitialize)
  step = gameStep
  ITEM_RANDOM_LIST = list
  __oncreategrid = onCreateGrid
  isOperation = false
  InitGame(gameRow, gameCol)
  enableCoroutine = false
  AllBoom()
  enableCoroutine = true
  if type(createItemOnInitialize) == "function" then
    for _, grid in ipairs(grids) do
      local item = grid.item
      createItemOnInitialize(item.type, item.x, item.y, item.effect)
    end
  end
end
local Release = function()
end
local IsOperation = function()
  return isOperation
end
local GetStep = function()
  return step
end
local GetCombo = function()
  return combo
end
local ChangeItemType = function(x, y, type)
  local grid = grids[Pos2Index(x, y)]
  grid.item.type = type
end
local ChangeItemEffect = function(x, y, effect)
  local grid = grids[Pos2Index(x, y)]
  grid.item.effect = effect
end
return {
  Start = Start,
  Release = Release,
  ExchangeCoroutine = ExchangeCoroutine,
  CheckAnyBoomItems = CheckAnyBoomItems,
  UseAllStepCoroutine = UseAllStepCoroutine,
  ResetAllItems = ResetAllItems,
  IsOperation = IsOperation,
  GetStep = GetStep,
  GetCombo = GetCombo,
  ChangeItemType = ChangeItemType,
  ChangeItemEffect = ChangeItemEffect
}
