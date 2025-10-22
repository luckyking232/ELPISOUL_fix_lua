require("ActivityDungeon1018_MiniGameStartWindowByName")
local Activity18MiniGameWindow = {}
local uis, contentPane
local config = {
  gridSize = 5,
  dragY = 120,
  effectWaitTime = 0.65,
  pointsForExtraDice = 500,
  diceRanks = {
    1,
    2,
    3,
    4,
    5,
    6,
    7
  },
  diceWeights = {
    {
      30,
      30,
      30,
      10,
      0,
      0,
      0
    },
    {
      15,
      20,
      25,
      20,
      15,
      5,
      0
    }
  },
  probabilityStages = {200, 300},
  synthesisPoints = {
    [1] = 3,
    [2] = 4,
    [3] = 5,
    [4] = 6,
    [5] = 7,
    [6] = 8,
    [7] = 9,
    crystalBlast = 100
  },
  diceDirections = {
    HORIZONTAL_LEFT = 1,
    VERTICAL_UP = 2,
    HORIZONTAL_RIGHT = 3,
    VERTICAL_DOWN = 4
  }
}
local effectPath = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_purple.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_yellow.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_orange.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_cyan.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_white.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_bloom_green.prefab",
  [7] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_baoshi.prefab"
}
local gameState = {}
local curDrag, dragIcon, dragOff, dice, direction, mapPos, mapSize, extraDice, dragShadow, tempDiceInfo, destroyTween

function Activity18MiniGameWindow.ReInitData()
end

function Activity18MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity18MiniGameWindow.package, WinResConfig.Activity18MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1018_MiniGameStartWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1018/MiniGame_1001"
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity18MiniGameWindow.InitBtn()
    mapPos = uis.Main.OperateRegion.root.xy
    mapSize = uis.Main.OperateRegion.root.width
    DragDropManager.inst.dragAgent.onDragEnd:Add(Activity18MiniGameWindow.OnDragEnd)
    DragDropManager.inst.dragAgent.onDragMove:Add(Activity18MiniGameWindow.OnDragMove)
    dragShadow = {}
    dragShadow.oneItem = Activity18MiniGameWindow.CreateBlock()
    dragShadow.twoItem = Activity18MiniGameWindow.CreateBlock()
    Activity18MiniGameWindow.UpdateInfo()
  end)
end

function Activity18MiniGameWindow.CreateBlock(index)
  local block = UIMgr:CreateObject("ActivityDungeon1018", "MiniStart_Block")
  if index then
    uis.Main.OperateRegion.root:AddChildAt(block, index)
  else
    uis.Main.OperateRegion.root:AddChild(block)
  end
  UIUtil.SetHolderCenter(block)
  return block
end

function Activity18MiniGameWindow.GetOrCreateHolder(parent, name, index)
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

function Activity18MiniGameWindow.UpdateInfo()
  gameState = {
    grid = {},
    currentPoints = 0,
    currentExtraPoints = 0,
    extraDiceAvailable = false,
    diceCount = 0,
    lastGenerated = {}
  }
  dragShadow.oneItem.alpha = 0
  dragShadow.twoItem.alpha = 0
  Activity18MiniGameWindow.InitGrid()
  Activity18MiniGameWindow.InitInfo()
  Activity18MiniGameWindow.CreateNewDice()
end

function Activity18MiniGameWindow.CreateNewDice()
  dice, direction = Activity18MiniGameWindow.GenerateDice()
  tempDiceInfo = {
    dice = SimpleCopy(dice),
    direction = direction
  }
  Activity18MiniGameWindow.SetDicePage(uis.Main.Right.DragBlock.root)
end

function Activity18MiniGameWindow.SetDicePage(blockRoot)
  if dice then
    if 1 == #dice then
      ChangeUIController(blockRoot, "c1", 0)
      ChangeUIController(blockRoot:GetChild("Block1"), "c1", dice[1].rank - 1)
    else
      ChangeUIController(blockRoot, "c1", 1)
      ChangeUIController(blockRoot, "c2", direction - 1)
      ChangeUIController(blockRoot:GetChild("Block2"), "c1", dice[1].rank - 1)
      ChangeUIController(blockRoot:GetChild("Block3"), "c1", dice[2].rank - 1)
    end
  end
end

function Activity18MiniGameWindow.InitInfo()
  Activity18MiniGameWindow.UpdatePoints(0)
  uis.Main.Integral.NumberWordTxt.text = T(2119)
  uis.Main.Integral.NumberWord1Txt.text = T(2117)
  local info = Activity18_MiniGameData.GetMiniGameInfo()
  if info then
    uis.Main.Integral.Number1Txt.text = info.miniHighScore
  end
  uis.Main.Left.LeftProgressBar.min = 0
  uis.Main.Left.LeftProgressBar.max = config.pointsForExtraDice
  uis.Main.Right.DragBlock.root.onClick:Set(Activity18MiniGameWindow.HandleDirectionClick)
  local longPress = LongPressGesture.GetLongPressGesture(uis.Main.Right.DragBlock.root)
  longPress.trigger = 0.1
  longPress.onBegin:Set(function(context)
    context:PreventDefault()
    extraDice = nil
    Activity18MiniGameWindow.OnDragStart()
  end)
  local longPressLeft = LongPressGesture.GetLongPressGesture(uis.Main.Left.DragBlock.root)
  longPressLeft.trigger = 0.1
  longPressLeft.onBegin:Set(function(context)
    context:PreventDefault()
    if gameState.extraDiceAvailable then
      extraDice = true
      dice[1].rank = 7
      dice[2] = nil
      direction = nil
      Activity18MiniGameWindow.OnDragStart()
    end
  end)
end

function Activity18MiniGameWindow.OnDragStart()
  Activity18MiniGameWindow.ClearDrag()
  DragDropManager.inst:StartDrag(nil, nil, 1, Vector2.zero)
  curDrag = UIMgr:CreateObject("ActivityDungeon1018", "MiniStart_DragBlock")
  FairyGUI.GearBase.disableAllTweenEffect = true
  Activity18MiniGameWindow.SetDicePage(curDrag)
  if dice[1] and dice[1].rank then
    ChangeUIController(dragShadow.oneItem, "c1", dice[1].rank - 1)
  end
  if dice[2] and dice[2].rank then
    ChangeUIController(dragShadow.twoItem, "c1", dice[2].rank - 1)
  end
  FairyGUI.GearBase.disableAllTweenEffect = false
  curDrag.touchable = false
  dragIcon = DragDropManager.inst.dragAgent.displayObject
  local root = uis.Main.root.parent
  dragOff = curDrag.width / 2
  root:AddChild(curDrag)
  curDrag:SetXY(dragIcon.x - dragOff, dragIcon.y - dragOff - config.dragY)
end

function Activity18MiniGameWindow.GetGridPosition(x, y)
  local cellSize = mapSize / config.gridSize
  if x < -cellSize or x > mapSize or y < -cellSize or y > mapSize then
    return
  end
  local centerOffset = cellSize / 2
  local gridX = math.floor((math.max(x, 1) + centerOffset) / cellSize)
  local gridY = math.floor((math.max(y, 1) + centerOffset) / cellSize)
  gridX = math.min(gridX + 1, 5)
  gridY = math.min(gridY + 1, 5)
  return {x = gridX, y = gridY}
end

function Activity18MiniGameWindow.OnDragMove()
  if curDrag then
    curDrag:SetXY(dragIcon.x - dragOff, dragIcon.y - dragOff - config.dragY)
    Activity18MiniGameWindow.CheckDragGrid()
  end
end

function Activity18MiniGameWindow.CheckDragGrid()
  local radius = dragOff * 0.5
  local x = dragIcon.x - mapPos.x - radius - uis.Main.root.x
  local y = dragIcon.y - mapPos.y - radius - config.dragY
  if dice[2] then
    local pos1, pos2
    if direction == config.diceDirections.HORIZONTAL_LEFT then
      pos1 = Activity18MiniGameWindow.GetGridPosition(x - radius, y)
      pos2 = Activity18MiniGameWindow.GetGridPosition(x + radius, y)
    elseif direction == config.diceDirections.VERTICAL_UP then
      pos1 = Activity18MiniGameWindow.GetGridPosition(x, y - radius)
      pos2 = Activity18MiniGameWindow.GetGridPosition(x, y + radius)
    elseif direction == config.diceDirections.HORIZONTAL_RIGHT then
      pos1 = Activity18MiniGameWindow.GetGridPosition(x + radius, y)
      pos2 = Activity18MiniGameWindow.GetGridPosition(x - radius, y)
    elseif direction == config.diceDirections.VERTICAL_DOWN then
      pos1 = Activity18MiniGameWindow.GetGridPosition(x, y + radius)
      pos2 = Activity18MiniGameWindow.GetGridPosition(x, y - radius)
    end
    local hide = true
    if pos1 and pos2 and (pos1.x == pos2.x and pos1.y ~= pos2.y or pos1.x ~= pos2.x and pos1.y == pos2.y) and Activity18MiniGameWindow.CanPlaceDice(pos1.x, pos1.y) and Activity18MiniGameWindow.CanPlaceDice(pos2.x, pos2.y) then
      hide = nil
      dragShadow.oneItem.alpha = 0.5
      dragShadow.oneItem:SetXY(pos1.x * dragOff - radius, pos1.y * dragOff - radius)
      dragShadow.onePos = pos1
      dragShadow.twoPos = pos2
      dragShadow.twoItem.alpha = 0.5
      dragShadow.twoItem:SetXY(pos2.x * dragOff - radius, pos2.y * dragOff - radius)
    end
    if hide then
      dragShadow.oneItem.alpha = 0
      dragShadow.twoItem.alpha = 0
    end
  else
    local pos1 = Activity18MiniGameWindow.GetGridPosition(x, y)
    if pos1 and Activity18MiniGameWindow.CanPlaceDice(pos1.x, pos1.y) then
      dragShadow.oneItem.alpha = 0.5
      dragShadow.oneItem:SetXY(pos1.x * dragOff - radius, pos1.y * dragOff - radius)
      dragShadow.onePos = pos1
    else
      dragShadow.oneItem.alpha = 0
    end
    dragShadow.twoItem.alpha = 0
  end
end

function Activity18MiniGameWindow.OnDragEnd()
  Activity18MiniGameWindow.CheckDragGrid()
  local newDice
  if dragShadow.oneItem.alpha > 0 and dragShadow.twoItem.alpha > 0 then
    local block1 = Activity18MiniGameWindow.CreateBlock()
    if dice[1] and dice[1].rank then
      ChangeUIController(block1, "c1", dice[1].rank - 1)
    end
    block1:SetXY(dragShadow.oneItem.x, dragShadow.oneItem.y)
    Activity18MiniGameWindow.PlaceDice(dragShadow.onePos.x, dragShadow.onePos.y, dice[1], block1, dragShadow.oneItem.xy)
    local block2 = Activity18MiniGameWindow.CreateBlock()
    if dice[2] and dice[2].rank then
      ChangeUIController(block2, "c1", dice[2].rank - 1)
    end
    block2:SetXY(dragShadow.twoItem.x, dragShadow.twoItem.y)
    Activity18MiniGameWindow.PlaceDice(dragShadow.twoPos.x, dragShadow.twoPos.y, dice[2], block2, dragShadow.twoItem.xy)
    newDice = true
  elseif dragShadow.oneItem.alpha > 0 and 0 == dragShadow.twoItem.alpha then
    local block1 = Activity18MiniGameWindow.CreateBlock()
    if dice[1] and dice[1].rank then
      ChangeUIController(block1, "c1", dice[1].rank - 1)
    end
    block1:SetXY(dragShadow.oneItem.x, dragShadow.oneItem.y)
    Activity18MiniGameWindow.PlaceDice(dragShadow.onePos.x, dragShadow.onePos.y, dice[1], block1, dragShadow.oneItem.xy)
    newDice = true
    dragShadow.twoPos = nil
  end
  Activity18MiniGameWindow.ClearDrag()
  if newDice then
    if gameState.extraDiceAvailable and extraDice then
      gameState.currentExtraPoints = 0
      gameState.extraDiceAvailable = false
      local holder = uis.Main.Left.DragBlock.Block1.root:GetChild("tipsEffect")
      if holder then
        holder:SetNativeObject(nil)
      end
    end
    local x2 = dragShadow.twoPos and dragShadow.twoPos.x
    local y2 = dragShadow.twoPos and dragShadow.twoPos.y
    Activity18MiniGameWindow.CheckSynthesis(dragShadow.onePos.x, dragShadow.onePos.y, x2, y2, function(pointsGained)
      Activity18MiniGameWindow.UpdatePoints(pointsGained)
      if gameState.diceCount < config.gridSize * config.gridSize or pointsGained and pointsGained > 0 then
        local holder = Activity18MiniGameWindow.GetOrCreateHolder(uis.Main.Right.DragBlock.root, "CreateEffect")
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_reflash.prefab", holder, 2)
        Activity18MiniGameWindow.CreateNewDice()
      else
        Activity18MiniGameWindow.OnGameOver()
      end
    end)
  elseif gameState.extraDiceAvailable and extraDice then
    dice = SimpleCopy(tempDiceInfo.dice)
    direction = tempDiceInfo.direction
  end
end

function Activity18MiniGameWindow.ClearDrag()
  if curDrag then
    curDrag:Dispose()
    curDrag = nil
  end
  dragIcon = nil
  dragShadow.oneItem.alpha = 0
  dragShadow.twoItem.alpha = 0
end

function Activity18MiniGameWindow.InitGrid()
  gameState.grid = {}
  for y = 1, config.gridSize do
    gameState.grid[y] = {}
    for x = 1, config.gridSize do
      gameState.grid[y][x] = nil
    end
  end
end

function Activity18MiniGameWindow.GenerateDice()
  local canGenerateTwo = Activity18MiniGameWindow:HasAdjacentEmptySpaces()
  local dice = {}
  local lastDirection
  local currentStage = Activity18MiniGameWindow:GetCurrentProbabilityStage()
  if not canGenerateTwo then
    table.insert(dice, Activity18MiniGameWindow:CreateDice(currentStage))
  elseif math.random() > 0.5 then
    for i = 1, 2 do
      table.insert(dice, Activity18MiniGameWindow:CreateDice(currentStage))
    end
    lastDirection = math.random(1, 4)
  else
    table.insert(dice, Activity18MiniGameWindow:CreateDice(currentStage))
  end
  gameState.lastGenerated = dice
  gameState.lastDirection = lastDirection
  return dice, lastDirection
end

function Activity18MiniGameWindow:HasAdjacentEmptySpaces()
  for y = 1, config.gridSize do
    for x = 1, config.gridSize - 1 do
      if gameState.grid[y][x] == nil and gameState.grid[y][x + 1] == nil then
        return true
      end
    end
  end
  return false
end

function Activity18MiniGameWindow:CreateDice(stage)
  local weights = config.diceWeights[stage]
  local totalWeight = 0
  for _, weight in ipairs(weights) do
    totalWeight = totalWeight + weight
  end
  local randomValue = math.random(1, totalWeight)
  local cumulativeWeight = 0
  for i, weight in ipairs(weights) do
    cumulativeWeight = cumulativeWeight + weight
    if randomValue <= cumulativeWeight then
      return {
        rank = config.diceRanks[i]
      }
    end
  end
  return {
    rank = config.diceRanks[1]
  }
end

function Activity18MiniGameWindow:GetCurrentProbabilityStage()
  local currentScore = gameState.currentPoints or 0
  for i, threshold in ipairs(config.probabilityStages) do
    if threshold > currentScore then
      return i
    end
  end
  return #config.probabilityStages
end

function Activity18MiniGameWindow.IsValidPosition(x, y)
  return x >= 1 and x <= config.gridSize and y >= 1 and y <= config.gridSize
end

function Activity18MiniGameWindow.CanPlaceDice(x, y)
  return Activity18MiniGameWindow.IsValidPosition(x, y) and gameState.grid[y][x] == nil
end

function Activity18MiniGameWindow.PlaceDice(x, y, dice, block, v2)
  if Activity18MiniGameWindow.CanPlaceDice(x, y) then
    gameState.grid[y][x] = {
      rank = dice.rank,
      v2 = v2,
      item = block
    }
    gameState.diceCount = gameState.diceCount + 1
  else
    print(">>>>>>>>>>>放置骰子错误>>>>>>>>>>>>>>>>>>>>>>>>", y, x, dice.rank)
  end
end

function Activity18MiniGameWindow.HandleDirectionClick()
  if 2 ~= #gameState.lastGenerated then
    return false
  end
  direction = gameState.lastDirection % 4 + 1
  gameState.lastDirection = direction
  ChangeController(uis.Main.Right.DragBlock.c2Ctr, gameState.lastDirection - 1)
end

function Activity18MiniGameWindow.CheckSynthesis(x1, y1, x2, y2, complete)
  local function findAdjacentDice(x, y, rank, visited)
    visited = visited or {}
    
    local key = x .. "," .. y
    if not (not visited[key] and Activity18MiniGameWindow.IsValidPosition(x, y) and gameState.grid[y][x]) or gameState.grid[y][x].rank ~= rank then
      return {}
    end
    visited[key] = true
    local result = {
      {x = x, y = y}
    }
    local directions = {
      {-1, 0},
      {1, 0},
      {0, -1},
      {0, 1}
    }
    for _, dir in ipairs(directions) do
      local newX, newY = x + dir[1], y + dir[2]
      for _, pos in ipairs(findAdjacentDice(newX, newY, rank, visited)) do
        table.insert(result, pos)
      end
    end
    return result
  end
  
  local PlayEffect = function(gridx, gridy, showDispose, callback)
    if gameState.grid[gridy][gridx] then
      local block = Activity18MiniGameWindow.CreateBlock()
      Activity18MiniGameWindow.HideImage(block)
      local holder = Activity18MiniGameWindow.GetOrCreateHolder(block, "DisposeEffect")
      block:SetXY(gameState.grid[gridy][gridx].v2.x, gameState.grid[gridy][gridx].v2.y)
      local path = 7 == gameState.grid[gridy][gridx].rank and showDispose and effectPath[1] or effectPath[gameState.grid[gridy][gridx].rank]
      UIUtil.SetEffectToUI(path, holder, nil, true, function()
        block:Dispose()
      end)
      if callback then
        LeanTween.delayedCall(config.effectWaitTime, function()
          if uis then
            callback()
          end
        end)
      end
    end
  end
  local findAllSynthesisGroups = function()
    local groups = {}
    local visited = {}
    for y = 1, config.gridSize do
      for x = 1, config.gridSize do
        local key = x .. "," .. y
        if not visited[key] and gameState.grid[y][x] then
          local diceRank = gameState.grid[y][x].rank
          local group = findAdjacentDice(x, y, diceRank, {})
          if #group >= 3 then
            for _, pos in ipairs(group) do
              visited[pos.x .. "," .. pos.y] = true
            end
            table.insert(groups, {rank = diceRank, positions = group})
          end
        end
      end
    end
    table.sort(groups, function(a, b)
      return a.rank < b.rank
    end)
    return groups
  end
  local getotherPosition = function(placedDicePositions, placedPos)
    for i = 1, #placedDicePositions do
      if placedDicePositions[i].x ~= placedPos.x or placedDicePositions[i].y ~= placedPos.y then
        return placedDicePositions[i]
      end
    end
  end
  local getNewPosition = function(placedDicePositions, groupRank)
    if 1 == #placedDicePositions then
      return placedDicePositions[1]
    end
    local adjacentPositions = {}
    for _, pos in ipairs(placedDicePositions) do
      local isAdjacent = false
      if gameState.grid[pos.y][pos.x] and gameState.grid[pos.y][pos.x].rank == groupRank then
        for _, dir in ipairs({
          {-1, 0},
          {1, 0},
          {0, -1},
          {0, 1}
        }) do
          local checkX, checkY = pos.x + dir[1], pos.y + dir[2]
          if Activity18MiniGameWindow.IsValidPosition(checkX, checkY) and gameState.grid[checkY][checkX] and gameState.grid[checkY][checkX].rank == groupRank then
            local pos2 = getotherPosition(placedDicePositions, pos)
            if nil == pos2 or checkX ~= pos2.x or checkY ~= pos2.y then
              isAdjacent = true
              break
            end
          end
        end
      end
      if isAdjacent then
        table.insert(adjacentPositions, pos)
      end
    end
    if #adjacentPositions > 0 then
      if 1 == #adjacentPositions then
        return adjacentPositions[1]
      else
        table.sort(adjacentPositions, function(a, b)
          if a.y == b.y then
            return a.x < b.x
          end
          return a.y < b.y
        end)
        return adjacentPositions[1]
      end
    end
    return placedDicePositions[1]
  end
  local pointsGained = 0
  local placedDicePositions = {}
  if x1 and y1 then
    table.insert(placedDicePositions, {x = x1, y = y1})
  end
  if x2 and y2 then
    table.insert(placedDicePositions, {x = x2, y = y2})
  end
  if 0 == #placedDicePositions then
    return
  end
  local synthesisGroups = findAllSynthesisGroups()
  if #synthesisGroups > 0 then
    local group = synthesisGroups[1]
    local groupRank = group.rank
    local adjacentDice = group.positions
    local basePoints = config.synthesisPoints[groupRank]
    pointsGained = pointsGained + basePoints * #adjacentDice
    if 7 == groupRank then
      local newPos = getNewPosition(placedDicePositions, groupRank)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_activity18_xiaochu_red_pr")
      PlayEffect(newPos.x, newPos.y, nil, function()
        for _, pos in ipairs(adjacentDice) do
          if pos.x ~= newPos.x or pos.y ~= newPos.y then
            PlayEffect(pos.x, pos.y, true)
          end
          gameState.grid[pos.y][pos.x].item:Dispose()
          gameState.grid[pos.y][pos.x] = nil
          gameState.diceCount = gameState.diceCount - 1
        end
        local blastPoints = 0
        for dy = -1, 1 do
          for dx = -1, 1 do
            local blastX, blastY = newPos.x + dx, newPos.y + dy
            if Activity18MiniGameWindow.IsValidPosition(blastX, blastY) and gameState.grid[blastY][blastX] then
              local removedRank = gameState.grid[blastY][blastX].rank
              blastPoints = blastPoints + config.synthesisPoints[removedRank]
              if 7 ~= removedRank then
                PlayEffect(blastX, blastY)
              end
              gameState.grid[blastY][blastX].item:Dispose()
              gameState.grid[blastY][blastX] = nil
              gameState.diceCount = gameState.diceCount - 1
            end
          end
        end
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_activity18_xiaochu_red")
        pointsGained = pointsGained + config.synthesisPoints.crystalBlast + blastPoints
        complete(pointsGained)
      end)
    else
      local newRank = groupRank + 1
      local newPos = getNewPosition(placedDicePositions, groupRank)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_activity18_xiaochu")
      for _, pos in pairs(adjacentDice) do
        PlayEffect(pos.x, pos.y)
        gameState.grid[pos.y][pos.x].item:Dispose()
        gameState.grid[pos.y][pos.x] = nil
        gameState.diceCount = gameState.diceCount - 1
      end
      if newRank <= #config.diceRanks then
        local newBlock = Activity18MiniGameWindow.CreateBlock(0)
        ChangeUIController(newBlock, "c1", newRank - 1)
        newBlock:SetXY(newPos.x * dragOff - dragOff / 2, newPos.y * dragOff - dragOff / 2)
        Activity18MiniGameWindow.PlaceDice(newPos.x, newPos.y, {rank = newRank}, newBlock, newBlock.xy)
      end
      local newGroups = findAllSynthesisGroups()
      if newGroups[1] and table.getLen(newGroups[1].positions) >= 3 then
        if destroyTween then
          LeanTween.cancel(destroyTween.uniqueId)
          destroyTween = nil
        end
        destroyTween = LeanTween.delayedCall(0.5, function()
          Activity18MiniGameWindow.UpdatePoints(pointsGained)
          Activity18MiniGameWindow.CheckSynthesis(x1, y1, x2, y2, complete)
          destroyTween = nil
        end)
      else
        complete(pointsGained)
      end
    end
  else
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_activity18_set")
    complete(pointsGained)
  end
end

function Activity18MiniGameWindow.HideImage(root)
  for i = 1, 7 do
    local image = root:GetChild("n" .. i)
    if image then
      image.alpha = 0
    end
  end
end

function Activity18MiniGameWindow.UpdatePoints(points)
  gameState.currentPoints = gameState.currentPoints + points
  uis.Main.Integral.NumberTxt.text = gameState.currentPoints
  gameState.currentExtraPoints = gameState.currentExtraPoints + points
  if gameState.currentExtraPoints >= config.pointsForExtraDice then
    gameState.currentExtraPoints = config.pointsForExtraDice
    if not gameState.extraDiceAvailable then
      local holder = Activity18MiniGameWindow.GetOrCreateHolder(uis.Main.Left.DragBlock.Block1.root, "tipsEffect")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame023/FX_ui_minigame023_active.prefab", holder, 2)
    end
    gameState.extraDiceAvailable = true
  end
  uis.Main.Left.NumberTxt.text = T(1580, gameState.currentExtraPoints, config.pointsForExtraDice)
  uis.Main.Left.LeftProgressBar.value = gameState.currentExtraPoints
  ChangeController(uis.Main.Left.c1Ctr, gameState.extraDiceAvailable and 1 or 0)
  ChangeController(uis.Main.Left.DragBlock.Block1.c1Ctr, 6)
end

function Activity18MiniGameWindow.OnGameOver()
  uis.Main.root.touchable = false
  LeanTween.delayedCall(0.5, function()
    OpenWindow(WinResConfig.Activity18MiniGameSubmitWindow.name, nil, gameState.currentPoints)
    uis.Main.root.touchable = true
  end)
end

function Activity18MiniGameWindow.OnNext()
  for y = 1, config.gridSize do
    for x = 1, config.gridSize do
      if gameState.grid[y][x] and gameState.grid[y][x].item then
        gameState.grid[y][x].item:Dispose()
      end
      gameState.grid[y][x] = nil
    end
  end
  local holder = uis.Main.Left.DragBlock.Block1.root:GetChild("tipsEffect")
  if holder then
    holder:SetNativeObject(nil)
  end
  Activity18MiniGameWindow.UpdateInfo()
end

function Activity18MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(2121), {
      touchCallback = function()
        Activity18_MiniGameService.MiniGameSubmitReq({}, gameState.currentPoints, nil, 0, function()
          UIMgr:CloseWindow(WinResConfig.Activity18MiniGameWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity18MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity18_MiniGame.START_GAME then
    Activity18MiniGameWindow.OnNext()
  elseif msgId == WindowMsgEnum.Activity18_MiniGame.RESET then
    local info = Activity18_MiniGameData.GetMiniGameInfo()
    if info then
      uis.Main.Integral.Number1Txt.text = info.miniHighScore
    end
  end
end

function Activity18MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  gameState = nil
  curDrag = nil
  dragIcon = nil
  dragOff = nil
  dice = nil
  direction = nil
  mapPos = nil
  mapSize = nil
  extraDice = nil
  dragShadow = nil
  tempDiceInfo = nil
  if destroyTween then
    LeanTween.cancel(destroyTween.uniqueId)
    destroyTween = nil
  end
  DragDropManager.inst.dragAgent.onDragEnd:Remove(Activity18MiniGameWindow.OnDragEnd)
  DragDropManager.inst.dragAgent.onDragMove:Remove(Activity18MiniGameWindow.OnDragMove)
end

return Activity18MiniGameWindow
