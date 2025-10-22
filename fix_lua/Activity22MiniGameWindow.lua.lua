require("ActivityDungeon1022_MiniGameStartWindowByName")
local Activity22MiniGameWindow = {}
local uis, contentPane
local gameId = 70441027
local mapGridInfo, mapRoot, lineCom, lineComPool, cellLineList, curLineColor
local pageGridCtr = {
  [4] = 0,
  [5] = 1,
  [6] = 2,
  [7] = 3
}
local stageId = 0
local lastPath, radius, swipeGesture
local directionEnum = {
  Up = 0,
  Down = 1,
  Left = 2,
  Right = 3
}

function Activity22MiniGameWindow.ReInitData()
end

function Activity22MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity22MiniGameWindow.package, WinResConfig.Activity22MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1022_MiniGameStartWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1022/MiniGame_1001"
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    lineComPool = {}
    for i = 1, 6 do
      lineComPool[i] = {}
    end
    Activity22MiniGameWindow.InitBtn()
    Activity22MiniGameWindow.UpdateInfo()
  end)
end

local GetDirection = function(a, b)
  local rowDiff = a.x - b.x
  local colDiff = a.y - b.y
  if -1 == rowDiff and 0 == colDiff then
    return directionEnum.Up
  elseif 1 == rowDiff and 0 == colDiff then
    return directionEnum.Down
  elseif 0 == rowDiff and -1 == colDiff then
    return directionEnum.Left
  elseif 0 == rowDiff and 1 == colDiff then
    return directionEnum.Right
  end
end

function Activity22MiniGameWindow.UpdateInfo(refresh)
  local info = Activity22_MiniGameData.GetMiniGameInfo()
  if info then
    local difficultyData = Activity22MiniGameWindow.GetCurDifficulty(info.extraCount)
    if stageId then
      local testData = TableData.GetConfig(stageId, "BaseActivityGame")
      if testData then
        difficultyData = testData
      end
    end
    if difficultyData then
      stageId = difficultyData.id
      print(">>>>>>>>>difficultyData.id>>>>>>>>>>>>>", difficultyData.id)
      mapGridInfo = {}
      lastPath = {}
      mapGridInfo.grid = {}
      lineCom = {}
      mapGridInfo.gridNum = difficultyData.grid[1]
      ChangeController(uis.Main.c1Ctr, pageGridCtr[mapGridInfo.gridNum])
      for y = 1, #difficultyData.item_num do
        mapGridInfo.grid[y] = {}
        local xArr = Split(difficultyData.item_num[y], ":")
        for x = 1, #xArr do
          mapGridInfo.grid[y][x] = {
            type = tonumber(xArr[x]) or 0
          }
        end
      end
      if not refresh then
        Activity22MiniGameWindow.RandomItem()
      end
      mapRoot = Activity22MiniGameWindow.GetMapRoot()
      if mapGridInfo and mapRoot then
        Activity22MiniGameWindow.GenerateItem()
        local currentHoverCell
        if swipeGesture then
          swipeGesture:Dispose()
          swipeGesture = nil
        end
        swipeGesture = FairyGUI.SwipeGesture(mapRoot)
        swipeGesture.onBegin:Set(function(context)
          local touchPos = mapRoot:GlobalToLocal(Vector2(context.inputEvent.x, context.inputEvent.y))
          local touchX, touchY = touchPos.x, touchPos.y
          cellLineList = {}
          local grid = Activity22MiniGameWindow.GetCellAtPosition(touchX, touchY)
          if grid then
            if 0 == grid.type then
              context:StopPropagation()
              return
            end
            curLineColor = grid.type - 1
            currentHoverCell = grid
            Activity22MiniGameWindow.AddLineGrid(grid, curLineColor)
            Activity22MiniGameWindow.CanHideLine(cellLineList)
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_22_gezi")
          end
        end)
        swipeGesture.onMove:Set(function(context)
          if nil == currentHoverCell then
            return
          end
          local touchPos = mapRoot:GlobalToLocal(Vector2(context.inputEvent.x, context.inputEvent.y))
          local touchX, touchY = touchPos.x, touchPos.y
          local grid = Activity22MiniGameWindow.GetCellAtPosition(touchX, touchY)
          if grid then
            local targetIndex
            for i, cell in ipairs(cellLineList) do
              if grid.item == cell.item then
                targetIndex = i
                break
              end
            end
            if targetIndex and targetIndex < #cellLineList then
              local removeCount = #cellLineList - targetIndex
              for i = #cellLineList, targetIndex + 1, -1 do
                local removedCell = table.remove(cellLineList, i)
                Activity22MiniGameWindow.ShowColorBlack(removedCell.item, curLineColor, 0)
                mapGridInfo.grid[removedCell.y][removedCell.x].line = -1
              end
              currentHoverCell = grid
              Activity22MiniGameWindow.ShowLine()
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_22_gezi")
            elseif curLineColor and currentHoverCell and grid.item ~= currentHoverCell.item and (0 == mapGridInfo.grid[grid.y][grid.x].type or mapGridInfo.grid[grid.y][grid.x].type == curLineColor + 1) and (0 == grid.type or curLineColor + 1 == grid.type) and Activity22MiniGameWindow.IsAdjacent(grid, currentHoverCell) then
              currentHoverCell = grid
              Activity22MiniGameWindow.AddLineGrid(grid, curLineColor)
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_22_gezi")
              Activity22MiniGameWindow.ShowLine()
            end
          end
        end)
        swipeGesture.onEnd:Set(function(context)
          local touchPos = mapRoot:GlobalToLocal(Vector2(context.inputEvent.x, context.inputEvent.y))
          local touchX, touchY = touchPos.x, touchPos.y
          local grid = Activity22MiniGameWindow.GetCellAtPosition(touchX, touchY)
          if grid and grid.type > 0 and #cellLineList > 1 and cellLineList[#cellLineList].x == grid.x and cellLineList[#cellLineList].y == grid.y and grid.type == cellLineList[1].type and #cellLineList > 1 then
            Activity22MiniGameWindow.CanHideLine(cellLineList)
            for i = #lastPath, 1, -1 do
              if lastPath[i].show == false then
                Activity22MiniGameWindow.ResetHideLine(lastPath[i])
                table.remove(lastPath, i)
              end
            end
            table.insert(lastPath, {
              colorBg = SimpleCopy(cellLineList),
              line = SimpleCopy(lineCom),
              show = true
            })
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_22_lianjie")
            Activity22MiniGameWindow.ShowEffect(cellLineList[1])
            Activity22MiniGameWindow.ShowEffect(cellLineList[#cellLineList])
            Activity22MiniGameWindow.ShowLineLayer(cellLineList[1].item, lineCom[1], GetDirection(cellLineList[1], cellLineList[2]))
            Activity22MiniGameWindow.ShowLineLayer(cellLineList[#cellLineList].item, lineCom[#lineCom], GetDirection(cellLineList[#cellLineList], cellLineList[#cellLineList - 1]))
            for i = 1, #lineCom do
              ChangeUIController(lineCom[i], "c1", 1)
            end
            if Activity22MiniGameWindow.CheckGameOver() then
              uis.Main.root.touchable = false
              LeanTween.delayedCall(0.35, function()
                OpenWindow(WinResConfig.Activity22MiniGameSubmitWindow.name, nil, stageId)
                uis.Main.root.touchable = true
              end)
            end
          else
            if cellLineList[1] and Activity22MiniGameWindow.IsOldLine(cellLineList[1].line) then
              table.remove(cellLineList, 1)
            end
            Activity22MiniGameWindow.RemoveGridColor(cellLineList)
            Activity22MiniGameWindow.RemoveLine(lineCom)
            cellLineList = {}
            Activity22MiniGameWindow.CanHideLine(cellLineList)
          end
          curLineColor = nil
          currentHoverCell = nil
          cellLineList = {}
          lineCom = {}
          Activity22MiniGameWindow.ResetGrid()
        end)
      end
    end
  end
end

function Activity22MiniGameWindow.CanHideLine(lineGrids)
  local Contain = function(name)
    for i, v in pairs(lineGrids) do
      if v.item.name == name then
        return true
      end
    end
  end
  local Check = function(colorBg)
    for i, v in pairs(colorBg) do
      if Contain(v.item.name) then
        return v
      end
    end
  end
  for i, v in pairs(lastPath) do
    if Check(v.colorBg) then
      if v.show then
        Activity22MiniGameWindow.SetItemLine(i, false)
        lastPath[i].show = false
      end
    elseif not v.show then
      Activity22MiniGameWindow.SetItemLine(i, true)
      lastPath[i].show = true
    end
  end
end

function Activity22MiniGameWindow.ResetHideLine(info)
  if info and info.line then
    for i, v in pairs(info.line) do
      v.visible = false
      v.alpha = 1
      uis.Main.root:AddChild(v)
    end
  end
end

function Activity22MiniGameWindow.ResetGrid()
  for y = 1, mapGridInfo.gridNum do
    for x = 1, mapGridInfo.gridNum do
      mapGridInfo.grid[y][x].line = -1
    end
  end
  for i, v in pairs(lastPath) do
    for _, grid in pairs(v.colorBg) do
      mapGridInfo.grid[grid.y][grid.y].line = grid.line
    end
  end
end

function Activity22MiniGameWindow.ShowEffect(gridInfo)
  if gridInfo and gridInfo.item and gridInfo.type > 0 then
    local bgHolder = Activity22MiniGameWindow.GetGraph(gridInfo.item, "effectBg")
    if bgHolder.visible == false then
      bgHolder.visible = true
    else
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame027/MiniGame027_fangkuang_light.prefab", bgHolder)
    end
    local itemHolder = Activity22MiniGameWindow.GetGraph(gridInfo.item, "effectItem")
    if itemHolder.visible == false then
      itemHolder.visible = true
    else
      UIUtil.SetEffectToUI(string.format("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame027/MiniGame027_icon%s_light.prefab", gridInfo.type), itemHolder)
    end
  end
end

function Activity22MiniGameWindow.ShowLineLayer(item, lineObj, dir)
  if dir and item and lineObj then
    item:AddChildAt(lineObj, 2)
    if dir == directionEnum.Up then
      lineObj:SetXY(radius, radius)
    elseif dir == directionEnum.Down then
      lineObj:SetXY(radius, 0)
    elseif dir == directionEnum.Left then
      lineObj:SetXY(radius, radius)
    elseif dir == directionEnum.Right then
      lineObj:SetXY(0, radius)
    end
  end
end

function Activity22MiniGameWindow.SetItemLine(index, show)
  if lastPath[index] then
    for i, v in pairs(lastPath[index].line) do
      v.alpha = show and 1 or 0
    end
    local Contain = function(name)
      for i, v in pairs(cellLineList) do
        if v.item.name == name then
          return true
        end
      end
    end
    local items = lastPath[index].colorBg
    if items[1] and items[1].type > 0 then
      local typePage = items[1].type - 1
      for i = #items, 1, -1 do
        if show then
          mapGridInfo.grid[items[i].y][items[i].x].line = typePage
          ChangeUIController(items[i].item, "color", typePage)
          ChangeUIController(items[i].item, "c1", 1)
        elseif Contain(items[i].item.name) then
          ChangeUIController(items[i].item, "c1", 1)
        else
          ChangeUIController(items[i].item, "c1", 0)
        end
        local effectBg = items[i].item:GetChild("effectBg")
        local effectItem = items[i].item:GetChild("effectItem")
        if effectBg then
          effectBg.visible = show
        end
        if effectItem then
          effectItem.visible = show
        end
      end
    end
  end
end

function Activity22MiniGameWindow.GetGraph(component, name)
  local oldHolder = component:GetChild(name)
  if oldHolder then
    return oldHolder
  end
  local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
  component:AddChild(holder)
  holder:SetPivot(0.5, 0.5, true)
  holder:Center()
  holder.name = name
  return holder
end

function Activity22MiniGameWindow.IsOldLine(line)
  for i, v in pairs(lastPath) do
    if v.colorBg[1] and line and v.colorBg[1].line == line then
      return i
    end
  end
end

function Activity22MiniGameWindow.ShowLine()
  Activity22MiniGameWindow.RemoveLine(lineCom)
  lineCom = {}
  for i = 1, #cellLineList do
    Activity22MiniGameWindow.LoadLine(cellLineList[i - 1], cellLineList[i], cellLineList[i + 1])
  end
  Activity22MiniGameWindow.CanHideLine(cellLineList)
end

function Activity22MiniGameWindow.CheckGameOver()
  local number = 0
  for i, v in pairs(lastPath) do
    for _, grid in pairs(v.colorBg) do
      number = number + 1
    end
  end
  return number >= mapGridInfo.gridNum * mapGridInfo.gridNum
end

function Activity22MiniGameWindow.RemoveGridColor(lineList)
  if lineList then
    for i = #lineList, 1, -1 do
      local removedCell = table.remove(lineList, i)
      Activity22MiniGameWindow.ShowColorBlack(removedCell.item, mapGridInfo.grid[removedCell.y][removedCell.x].type - 1, 0)
      mapGridInfo.grid[removedCell.y][removedCell.x].line = -1
      local effectBg = removedCell.item:GetChild("effectBg")
      local effectItem = removedCell.item:GetChild("effectItem")
      if effectBg then
        effectBg:Dispose()
      end
      if effectItem then
        effectItem:Dispose()
      end
    end
  end
end

function Activity22MiniGameWindow.AddLineGrid(grid, line)
  if line and grid then
    Activity22MiniGameWindow.ShowColorBlack(grid.item, line, 1)
    local find
    for i = 1, #cellLineList do
      if grid.x == cellLineList[i].x and grid.y == cellLineList[i].y then
        find = true
      end
    end
    if nil == find then
      table.insert(cellLineList, grid)
    end
    mapGridInfo.grid[grid.y][grid.x].line = line
  end
end

function Activity22MiniGameWindow.GetCellAtPosition(touchX, touchY)
  for y = 1, mapGridInfo.gridNum do
    for x = 1, mapGridInfo.gridNum do
      local info = mapGridInfo.grid[y][x]
      if touchX >= info.item.x and touchX <= info.item.x + info.item.width and touchY >= info.item.y and touchY <= info.item.y + info.item.height then
        return info
      end
    end
  end
end

function Activity22MiniGameWindow.ShowColorBlack(item, pageCtr, showCtr)
  if showCtr and pageCtr then
    ChangeUIController(item, "c1", showCtr)
    ChangeUIController(item, "color", pageCtr)
  end
end

function Activity22MiniGameWindow.LoadLine(cellA, cellB, cellC)
  local line, lineType, size
  if nil == cellA and cellB and cellC then
    local dirBC = GetDirection(cellB, cellC)
    if dirBC then
      lineType = (dirBC == directionEnum.Left or dirBC == directionEnum.Right) and 6 or 1
      line = Activity22MiniGameWindow.GetLineCom(lineType)
      mapRoot:AddChild(line)
      if dirBC == directionEnum.Left or dirBC == directionEnum.Up then
        line:SetXY(cellB.pos.x + radius, cellB.pos.y + radius)
      elseif dirBC == directionEnum.Right then
        line:SetXY(cellB.pos.x, cellB.pos.y + radius)
      elseif dirBC == directionEnum.Down then
        line:SetXY(cellB.pos.x + radius, cellB.pos.y)
      end
    end
  elseif cellA and cellB and nil == cellC then
    local dirAB = GetDirection(cellA, cellB)
    if dirAB then
      lineType = (dirAB == directionEnum.Left or dirAB == directionEnum.Right) and 6 or 1
      line = Activity22MiniGameWindow.GetLineCom(lineType)
      mapRoot:AddChild(line)
      if dirAB == directionEnum.Right or dirAB == directionEnum.Down then
        line:SetXY(cellB.pos.x + radius, cellB.pos.y + radius)
      elseif dirAB == directionEnum.Left then
        line:SetXY(cellB.pos.x, cellB.pos.y + radius)
      elseif dirAB == directionEnum.Up then
        line:SetXY(cellB.pos.x + radius, cellB.pos.y)
      end
    end
  elseif cellA and cellB and cellC then
    local dirAB = GetDirection(cellA, cellB)
    local dirBC = GetDirection(cellB, cellC)
    if not dirAB or not dirBC then
      return nil
    end
    if dirAB == directionEnum.Left and dirBC == directionEnum.Left or dirAB == directionEnum.Right and dirBC == directionEnum.Right then
      line = Activity22MiniGameWindow.GetLineCom(6)
      mapRoot:AddChild(line)
      size = {
        x = line.width,
        y = line.height
      }
      line:SetSize(radius * 2, line.height)
      line:SetXY(cellB.pos.x, cellB.pos.y + radius)
    elseif dirAB == directionEnum.Up and dirBC == directionEnum.Up or dirAB == directionEnum.Down and dirBC == directionEnum.Down then
      line = Activity22MiniGameWindow.GetLineCom(1)
      mapRoot:AddChild(line)
      size = {
        x = line.width,
        y = line.height
      }
      line:SetSize(line.width, radius * 2)
      line:SetXY(cellB.pos.x + radius, cellB.pos.y)
    elseif dirAB == directionEnum.Left and dirBC == directionEnum.Up then
      line = Activity22MiniGameWindow.GetLineCom(4)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x, cellB.pos.y + radius - 8)
    elseif dirAB == directionEnum.Left and dirBC == directionEnum.Down then
      line = Activity22MiniGameWindow.GetLineCom(5)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x, cellB.pos.y)
    elseif dirAB == directionEnum.Right and dirBC == directionEnum.Down then
      line = Activity22MiniGameWindow.GetLineCom(2)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x + radius - 8, cellB.pos.y)
    elseif dirAB == directionEnum.Right and dirBC == directionEnum.Up then
      line = Activity22MiniGameWindow.GetLineCom(3)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x + radius - 8, cellB.pos.y + radius - 8)
    elseif dirAB == directionEnum.Up and dirBC == directionEnum.Right then
      line = Activity22MiniGameWindow.GetLineCom(5)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x, cellB.pos.y)
    elseif dirAB == directionEnum.Up and dirBC == directionEnum.Left then
      line = Activity22MiniGameWindow.GetLineCom(2)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x + radius - 8, cellB.pos.y)
    elseif dirAB == directionEnum.Down and dirBC == directionEnum.Right then
      line = Activity22MiniGameWindow.GetLineCom(4)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x, cellB.pos.y + radius - 8)
    elseif dirAB == directionEnum.Down and dirBC == directionEnum.Left then
      line = Activity22MiniGameWindow.GetLineCom(3)
      mapRoot:AddChild(line)
      line:SetXY(cellB.pos.x + radius - 8, cellB.pos.y + radius - 8)
    end
  end
  if line then
    if curLineColor then
      ChangeUIController(line, "color", curLineColor)
    end
    table.insert(lineCom, line)
  end
  return line
end

function Activity22MiniGameWindow.IsAdjacent(cellA, cellB)
  if cellA and cellB then
    local rowDiff = math.abs(cellA.y - cellB.y)
    local colDiff = math.abs(cellA.x - cellB.x)
    return 1 == rowDiff and 0 == colDiff or 0 == rowDiff and 1 == colDiff
  end
end

function Activity22MiniGameWindow.GenerateItem()
  for y = 1, mapGridInfo.gridNum do
    for x = 1, mapGridInfo.gridNum do
      local block = UIMgr:CreateObject("ActivityDungeon1022", "MiniStart_Block")
      local posX = (y - 1) * block.width
      local posY = (x - 1) * block.height
      mapRoot:AddChild(block)
      block:SetXY(posX, posY)
      mapGridInfo.grid[y][x].line = -1
      mapGridInfo.grid[y][x].pos = Vector2(posX, posY)
      mapGridInfo.grid[y][x].x = x
      mapGridInfo.grid[y][x].y = y
      mapGridInfo.grid[y][x].item = block
      block.touchable = false
      block.name = mapRoot.numChildren - 1
      block.gameObjectName = block.name
      radius = block.width * 0.5
      if mapGridInfo.grid[y][x].type > 0 then
        ChangeUIController(block, "c2", 1)
        ChangeUIController(block:GetChild("Item"), "color", mapGridInfo.grid[y][x].type - 1)
      else
        ChangeUIController(block, "c2", 0)
      end
      ChangeUIController(block, "c1", 0)
    end
  end
end

function Activity22MiniGameWindow.GetMapRoot()
  if 4 == mapGridInfo.gridNum then
    return uis.Main.OperateRegion4.root
  elseif 5 == mapGridInfo.gridNum then
    return uis.Main.OperateRegion5.root
  elseif 6 == mapGridInfo.gridNum then
    return uis.Main.OperateRegion6.root
  elseif 7 == mapGridInfo.gridNum then
    return uis.Main.OperateRegion7.root
  end
end

function Activity22MiniGameWindow.RandomItem()
  local allTypes = {}
  local typePositions = {}
  for row = 1, mapGridInfo.gridNum do
    for col = 1, mapGridInfo.gridNum do
      local t = mapGridInfo.grid[row][col].type
      if t > 0 then
        if not typePositions[t] then
          typePositions[t] = {}
          table.insert(allTypes, t)
        end
        table.insert(typePositions[t], {row, col})
      end
    end
  end
  if #allTypes < 2 then
    return
  else
    local idx1 = math.random(#allTypes)
    local idx2 = math.random(#allTypes)
    while idx2 == idx1 do
      idx2 = math.random(#allTypes)
    end
    local typeA = allTypes[idx1]
    local typeB = allTypes[idx2]
    local positionsA = typePositions[typeA]
    local positionsB = typePositions[typeB]
    local tempMarker = -1
    for _, pos in ipairs(positionsA) do
      local row, col = pos[1], pos[2]
      mapGridInfo.grid[row][col].type = tempMarker
    end
    for _, pos in ipairs(positionsB) do
      local row, col = pos[1], pos[2]
      mapGridInfo.grid[row][col].type = typeA
    end
    for _, pos in ipairs(positionsA) do
      local row, col = pos[1], pos[2]
      mapGridInfo.grid[row][col].type = typeB
    end
  end
end

function Activity22MiniGameWindow.GetCurDifficulty(haveData)
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  local randomTb = {}
  for i, v in pairs(data) do
    if v.game_id == gameId then
      table.insert(difficulty, v)
      if v.totality and 2 == v.totality then
        table.insert(randomTb, v.id)
      end
    end
  end
  table.sort(difficulty, function(a, b)
    return a.id < b.id
  end)
  local len = #difficulty
  for i = 1, len do
    if not haveData[difficulty[i].id] then
      return difficulty[i]
    end
  end
  local randomId = randomTb[math.random(1, #randomTb)]
  return TableData.GetConfig(randomId, "BaseActivityGame")
end

function Activity22MiniGameWindow.RemoveLine(lineTb)
  for i, v in pairs(lineTb) do
    v.visible = false
    v.alpha = 1
    ChangeUIController(v, "c1", 0)
    uis.Main.root:AddChild(v)
  end
end

function Activity22MiniGameWindow.Next(refresh)
  for _, tbCom in pairs(lineComPool) do
    for i, v in pairs(tbCom) do
      v.visible = false
      ChangeUIController(v, "c1", 0)
      uis.Main.root:AddChild(v)
    end
  end
  lineCom = {}
  for y = 1, mapGridInfo.gridNum do
    for x = 1, mapGridInfo.gridNum do
      local info = mapGridInfo.grid[y][x]
      if info.item then
        info.item:Dispose()
      end
    end
  end
  if not refresh then
    stageId = 0
  end
  mapGridInfo = {}
  lastPath = {}
  cellLineList = {}
  Activity22MiniGameWindow.UpdateInfo(refresh)
end

function Activity22MiniGameWindow.GetLineCom(type)
  local typeName = {
    "MiniStart_Line1",
    "MiniStart_Line2-1",
    "MiniStart_Line2-2",
    "MiniStart_Line2-3",
    "MiniStart_Line2-4",
    "MiniStart_Line3"
  }
  local allCom = lineComPool[type]
  for i, v in pairs(allCom) do
    if v.visible == false then
      v.visible = true
      v.alpha = 1
      ChangeUIController(v, "c1", 0)
      if 1 == type then
        v:SetSize(20, 46)
      end
      if 6 == type then
        v:SetSize(46, 20)
      end
      return v
    end
  end
  local line = UIMgr:CreateObject("ActivityDungeon1022", typeName[type])
  if type > 1 and type < 6 then
    line:SetSize(54, 54)
  end
  if 1 == type then
    line:SetSize(20, 46)
    line:GetChild("n1"):SetXY(-10, 0)
    line:GetChild("n2"):SetXY(-10, 0)
  end
  if 6 == type then
    line:SetSize(46, 20)
    line:GetChild("n2"):SetXY(0, -10)
    line:GetChild("n3"):SetXY(0, -10)
  end
  table.insert(lineComPool[type], line)
  uis.Main.root:AddChild(line)
  return line
end

function Activity22MiniGameWindow.HideLineCom(com)
  com.visible = false
  uis.Main.root:AddChild(com)
end

function Activity22MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(2202), {
      touchCallback = function()
        local info = Activity22_MiniGameData.GetMiniGameInfo(gameId)
        local remoteMap = info.extraCount
        Activity22_MiniGameService.MiniGameSubmitReq({}, 0, 0, nil, function()
          UIMgr:CloseWindow(WinResConfig.Activity22MiniGameWindow.name)
        end)
      end
    }, {})
  end)
  UIUtil.SetText(uis.Main.ResetBtn, T(2191))
  UIUtil.SetText(uis.Main.RevokeBtn, T(2192))
  uis.Main.ResetBtn.onClick:Set(function()
    Activity22MiniGameWindow.Next(true)
  end)
  uis.Main.RevokeBtn.onClick:Set(function()
    if lastPath and table.getLen(lastPath) > 0 then
      Activity22MiniGameWindow.RemoveGridColor(lastPath[#lastPath].colorBg)
      Activity22MiniGameWindow.RemoveLine(lastPath[#lastPath].line)
      table.remove(lastPath, #lastPath)
    end
  end)
  uis.Main.Word.WordTxt.text = T(2205)
end

function Activity22MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity22_MiniGame.RESET then
    Activity22MiniGameWindow.Next()
  end
end

function Activity22MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  mapGridInfo = nil
  mapRoot = nil
  cellLineList = nil
  curLineColor = nil
  stageId = nil
  lastPath = nil
  lineCom = nil
  lineComPool = nil
  swipeGesture = nil
end

return Activity22MiniGameWindow
