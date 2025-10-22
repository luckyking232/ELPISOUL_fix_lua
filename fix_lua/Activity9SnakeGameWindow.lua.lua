require("ActivityDungeon1008_MiniGameStart2WindowByName")
local Activity9SnakeGameWindow = {}
local uis, contentPane

function Activity9SnakeGameWindow.ReInitData()
end

local MOVE_SPEED = 0.12
local curSnake, curSnakeDirection, foodList
local gridWH = 28
local mapXCount, mapYCount, mapContainer, gridList, baseFoodId, randomFoodCreateConditionCount, randomFoodIdList, foodCreateRangeList, eatBaseFoodCount, gameState, gameTimer
local ctrRoot = {}
local JoyTypeEnum = {
  Four = 1,
  Left_Right = 2,
  UP_Down = 3
}
local PART_TYPE_ENUM = {
  HEAD = 1,
  BODY = 2,
  TAIL = 3
}
local DIRECTION_ENUM = {
  UP = 0,
  DOWN = 1,
  LEFT = 2,
  RIGHT = 3,
  NONE = 4
}
local GAME_STATE_ENUM = {
  INIT = 1,
  PLAYING = 2,
  PAUSE = 3,
  STOP = 4
}
local FOOD_CREATE_RANGE = {
  {max = 10, range = 5},
  {max = 20, range = 7},
  {max = 40, range = 10}
}

function Activity9SnakeGameWindow.CreateGrid(x, y)
  local grid = {
    x = nil,
    y = nil,
    snake = nil,
    food = false
  }
  
  function grid:Init()
    self.xIndex = x
    self.yIndex = y
    self.x = (x - 1) * gridWH
    self.y = (y - 1) * gridWH
    self.snake = nil
    self.food = nil
  end
  
  function grid:GetNextGrid()
    local xIndex, yIndex
    local direction = curSnake.moveDirection
    if direction == DIRECTION_ENUM.RIGHT then
      xIndex = self.xIndex + 1
      if xIndex > mapXCount then
        xIndex = 1
      end
      yIndex = self.yIndex
    elseif direction == DIRECTION_ENUM.LEFT then
      xIndex = self.xIndex - 1
      if xIndex < 1 then
        xIndex = mapXCount
      end
      yIndex = self.yIndex
    elseif direction == DIRECTION_ENUM.DOWN then
      yIndex = self.yIndex + 1
      if yIndex > mapYCount then
        yIndex = 1
      end
      xIndex = self.xIndex
    elseif direction == DIRECTION_ENUM.UP then
      yIndex = self.yIndex - 1
      if yIndex < 1 then
        yIndex = mapYCount
      end
      xIndex = self.xIndex
    end
    return gridList[xIndex][yIndex]
  end
  
  grid:Init()
  return grid
end

function Activity9SnakeGameWindow.CreateSnake()
  local snake = {
    partList = {},
    waitDealAddPartNum = 0,
    moveFrame = 0
  }
  
  function snake:AddPart(partNum)
    self.waitDealAddPartNum = self.waitDealAddPartNum + (partNum or 1)
  end
  
  function snake:Init()
    local head = Activity9SnakeGameWindow.CreateSnakePart(3, 12, PART_TYPE_ENUM.HEAD)
    table.insert(self.partList, head)
    local body = Activity9SnakeGameWindow.CreateSnakePart(2, 12, PART_TYPE_ENUM.BODY)
    table.insert(self.partList, body)
    local tail = Activity9SnakeGameWindow.CreateSnakePart(1, 12, PART_TYPE_ENUM.TAIL)
    table.insert(self.partList, tail)
  end
  
  function snake:Move()
    local list = self.partList
    if 0 == self.moveFrame then
      local beforeTail = list[#list - 1]
      beforeTail:SetVisible(false)
      local tail = list[#list]
      if tail.extraImageTail then
        tail.extraImageTail.height = gridWH
      end
      if tail.extraImage2Tail then
        tail.extraImage2Tail.height = gridWH
      end
    end
    for _, part in ipairs(list) do
      part:Move(1)
    end
    self.moveFrame = self.moveFrame + 1
    local head = list[1]
    if head.moveTargetX == nil and nil == head.moveTargetY then
      local tailPart = list[#list]
      local tailPrePrePart = list[#list - 1]
      if tailPrePrePart.xIndex == tailPart.xIndex + 1 then
        tailPart:ChangeUIController("c1", 3)
      elseif tailPrePrePart.xIndex == tailPart.xIndex - 1 then
        tailPart:ChangeUIController("c1", 2)
      elseif tailPrePrePart.yIndex == tailPart.yIndex + 1 then
        tailPart:ChangeUIController("c1", 1)
      elseif tailPrePrePart.yIndex == tailPart.yIndex - 1 then
        tailPart:ChangeUIController("c1", 0)
      elseif tailPrePrePart.xIndex < tailPart.xIndex then
        tailPart:ChangeUIController("c1", 3)
      elseif tailPrePrePart.xIndex > tailPart.xIndex then
        tailPart:ChangeUIController("c1", 2)
      elseif tailPrePrePart.yIndex > tailPart.yIndex then
        tailPart:ChangeUIController("c1", 0)
      elseif tailPrePrePart.yIndex < tailPart.yIndex then
        tailPart:ChangeUIController("c1", 1)
      end
      self.moveFrame = 0
      for _, part in ipairs(list) do
        part:Move(2)
      end
      local beforeTail = list[#list - 1]
      beforeTail:SetVisible(true)
      self:MoveToNext()
    end
  end
  
  function snake:MoveToNext()
    self.moveDirection = curSnakeDirection
    if self.waitDealAddPartNum <= 0 then
      local list = self.partList
      local part, partPre
      for i = #list, 2, -1 do
        part = list[i]
        if i == #list then
          local curGrid = gridList[part.xIndex][part.yIndex]
          curGrid.snake = nil
        end
        partPre = list[i - 1]
        local grid = gridList[partPre.xIndex][partPre.yIndex]
        part:SetMoveTargetGrid(grid)
      end
    else
      local beforeTail = self.partList[#self.partList - 1]
      local body = Activity9SnakeGameWindow.CreateSnakePart(beforeTail.xIndex, beforeTail.yIndex, PART_TYPE_ENUM.BODY)
      local list = self.partList
      local part, partPre
      for i = #list - 1, 2, -1 do
        part = list[i]
        partPre = list[i - 1]
        local grid = gridList[partPre.xIndex][partPre.yIndex]
        part:SetMoveTargetGrid(grid)
      end
      table.insert(self.partList, #self.partList, body)
      Activity9SnakeGameWindow.UpdateScore()
      self.waitDealAddPartNum = self.waitDealAddPartNum - 1
    end
    local head = self.partList[1]
    head:ChangeUIController("c1", self.moveDirection)
    local grid = gridList[head.xIndex][head.yIndex]
    local nextGrid = grid:GetNextGrid()
    if nextGrid.food then
      curSnake:EatFood(nextGrid.food)
      nextGrid.food = nil
    elseif nextGrid.snake then
      Activity9SnakeGameWindow.GameOver()
      return
    end
    head:SetMoveTargetGrid(nextGrid)
    nextGrid.snake = self
  end
  
  function snake:EatFood(food)
    local foodConfig = food.itemConfig
    if 1 == foodConfig.type then
      eatBaseFoodCount = eatBaseFoodCount + 1
      if 0 == eatBaseFoodCount % randomFoodCreateConditionCount then
        local randomId = randomFoodIdList[math.random(1, #randomFoodIdList)]
        Activity9SnakeGameWindow.CreateFood(randomId)
      end
    end
    self:AddPart(foodConfig.points)
    food:Destroy()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_tanchishe_eat")
  end
  
  function snake:ChangeDirection(direction)
    local head = self.partList[1]
    if head then
      local snakeMoveDirection = self.moveDirection
      if snakeMoveDirection == direction or snakeMoveDirection == DIRECTION_ENUM.RIGHT and direction == DIRECTION_ENUM.LEFT or snakeMoveDirection == DIRECTION_ENUM.LEFT and direction == DIRECTION_ENUM.RIGHT or snakeMoveDirection == DIRECTION_ENUM.DOWN and direction == DIRECTION_ENUM.UP or snakeMoveDirection == DIRECTION_ENUM.UP and direction == DIRECTION_ENUM.DOWN then
        return
      end
      curSnakeDirection = direction
    end
  end
  
  function snake:Destroy()
    local partList = self.partList
    if partList then
      for i, v in ipairs(partList) do
        v:Destroy()
      end
    end
    self = nil
  end
  
  snake:Init()
  return snake
end

function Activity9SnakeGameWindow.CreateSnakePart(x, y, type)
  local part = {
    moveTargetX = nil,
    moveTargetY = nil,
    moveTargetX_2 = nil,
    moveTargetY_2 = nil
  }
  
  function part:Init()
    self.xIndex = x
    self.yIndex = y
    self.type = type
    if x and y then
      local grid = gridList[x][y]
      grid.snake = self
      grid.food = nil
    end
    self:CreateModel()
    self:UpdatePosition()
  end
  
  function part:CreateModel()
    if self.type == PART_TYPE_ENUM.HEAD then
      self.model = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu01")
      self.model2 = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu01")
      self:ChangeUIController("c1", curSnakeDirection)
      self.extraImage = self.model:GetChild("ExtraImage")
      self.extraImage2 = self.model2:GetChild("ExtraImage")
    elseif self.type == PART_TYPE_ENUM.BODY then
      self.model = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu02")
      self.model2 = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu02")
    elseif self.type == PART_TYPE_ENUM.TAIL then
      self.model = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu03")
      self.model2 = UIMgr:CreateComponent("ActivityDungeon1008", "MiniStart2_Gu03")
      self:ChangeUIController("c1", curSnakeDirection)
      self.extraImageTail = self.model:GetChild("ExtraImage")
      self.extraImage2Tail = self.model2:GetChild("ExtraImage")
    end
    mapContainer:AddChild(self.model)
    mapContainer:AddChild(self.model2)
    mapContainer:SetChildIndex(self.model, 0)
    mapContainer:SetChildIndex(self.model2, 0)
    self.model2.visible = false
  end
  
  function part:SetMoveTargetGrid(grid)
    if math.abs(self.xIndex - grid.xIndex) > 1 then
      self.model2.visible = true
      self.model2:SetXY(self.x, self.y)
      self.x2 = self.x
      self.y2 = self.y
      if self.xIndex > grid.xIndex then
        local totalWidth = gridWH * mapXCount
        self.x = self.x - totalWidth
        self.model:SetXY(self.x, self.y)
        self.moveTargetX_2 = grid.x + totalWidth
        self.moveTargetY_2 = grid.y
      elseif self.xIndex < grid.xIndex then
        local totalWidth = gridWH * mapXCount
        self.x = self.x + totalWidth
        self.model:SetXY(self.x, self.y)
        self.moveTargetX_2 = grid.x - totalWidth
        self.moveTargetY_2 = grid.y
      end
    elseif math.abs(self.yIndex - grid.yIndex) > 1 then
      self.model2.visible = true
      self.model2:SetXY(self.x, self.y)
      self.x2 = self.x
      self.y2 = self.y
      if self.yIndex > grid.yIndex then
        local totalHeight = gridWH * mapYCount
        self.y = self.y - totalHeight
        self.model:SetXY(self.x, self.y)
        self.moveTargetX_2 = grid.x
        self.moveTargetY_2 = grid.y + totalHeight
      elseif self.yIndex < grid.yIndex then
        local totalHeight = gridWH * mapYCount
        self.y = self.y + totalHeight
        self.model:SetXY(self.x, self.y)
        self.moveTargetX_2 = grid.x
        self.moveTargetY_2 = grid.y - totalHeight
      end
    else
      self.model2.visible = false
      self.moveTargetX_2 = nil
      self.moveTargetY_2 = nil
    end
    self.xIndex = grid.xIndex
    self.yIndex = grid.yIndex
    self.moveTargetX = grid.x
    self.moveTargetY = grid.y
  end
  
  function part:ChangeUIController(name, index)
    ChangeUIController(self.model, name, index)
    ChangeUIController(self.model2, name, index)
  end
  
  function part:SetVisible(visible)
    self.model.visible = visible
  end
  
  function part:Move(index)
    if 1 == index and self.type == PART_TYPE_ENUM.BODY then
      return
    end
    if 2 == index and self.type ~= PART_TYPE_ENUM.BODY then
      return
    end
    local moveUnit = 1
    if 2 == index then
      moveUnit = gridWH
    end
    if self.moveTargetX and self.moveTargetY then
      local moveX, moveY = 0, 0
      if self.moveTargetX > self.x then
        moveX = moveUnit
      elseif self.moveTargetX < self.x then
        moveX = -moveUnit
      end
      if self.moveTargetY > self.y then
        moveY = moveUnit
      elseif self.moveTargetY < self.y then
        moveY = -moveUnit
      end
      if 0 ~= moveX or 0 ~= moveY then
        self.x = self.x + moveX
        self.y = self.y + moveY
        self.model:TweenMove(Vector2(self.x, self.y), MOVE_SPEED / gridWH)
        if self.extraImage then
          self.extraImage.height = self.extraImage.height + moveUnit
        end
        if self.extraImageTail then
          self.extraImageTail.height = self.extraImageTail.height - moveUnit
        end
      else
        self.moveTargetX = nil
        self.moveTargetY = nil
        if self.extraImage then
          self.extraImage.height = 0
        end
        if self.extraImageTail then
          self.extraImageTail.height = 0
        end
      end
    end
    if self.moveTargetX_2 and self.moveTargetY_2 then
      local moveX, moveY = 0, 0
      if self.moveTargetX_2 > self.x2 then
        moveX = moveUnit
      elseif self.moveTargetX_2 < self.x2 then
        moveX = -moveUnit
      end
      if self.moveTargetY_2 > self.y2 then
        moveY = moveUnit
      elseif self.moveTargetY_2 < self.y2 then
        moveY = -moveUnit
      end
      if 0 ~= moveX or 0 ~= moveY then
        self.x2 = self.x2 + moveX
        self.y2 = self.y2 + moveY
        self.model2:TweenMove(Vector2(self.x2, self.y2), MOVE_SPEED / gridWH)
        if self.extraImage2 then
          self.extraImage2.height = self.extraImage2.height + moveUnit
        end
        if self.extraImage2Tail then
          self.extraImage2Tail.height = self.extraImage2Tail.height - moveUnit
        end
      else
        self.moveTargetX_2 = nil
        self.moveTargetY_2 = nil
        if self.extraImage2 then
          self.extraImage2.height = 0
        end
        if self.extraImage2Tail then
          self.extraImage2Tail.height = 0
        end
      end
    end
  end
  
  function part:UpdatePosition()
    local grid = gridList[self.xIndex][self.yIndex]
    self.model:SetXY(grid.x, grid.y)
    self.x = grid.x
    self.y = grid.y
    self.model2:SetXY(grid.x, grid.y)
    self.x2 = grid.x
    self.y2 = grid.y
  end
  
  function part:Destroy()
    if self.model then
      self.model:Dispose()
    end
    if self.model2 then
      self.model2:Dispose()
    end
    self = nil
  end
  
  part:Init()
  return part
end

function Activity9SnakeGameWindow.CreateFood(foodId, x, y)
  local food = {}
  
  function food:Init()
    self.id = foodId
    if nil == x or nil == y then
      self:ChoosePosition()
    else
      self.xIndex = x
      self.yIndex = y
    end
    local grid = gridList[self.xIndex][self.yIndex]
    grid.snake = nil
    grid.food = self
    self.itemConfig = TableData.GetConfig(self.id, "BaseActivityGameItem")
    self:CreateModel()
    self:UpdatePosition()
  end
  
  function food:ChoosePosition()
    local range = foodCreateRangeList[#curSnake.partList] or math.floor(mapXCount / 2)
    local head = curSnake.partList[1]
    local headX, headY = head.xIndex, head.yIndex
    local rangeGridList = {}
    for i = -range, range do
      local tempRangeX = headX + i
      if tempRangeX > mapXCount then
        tempRangeX = tempRangeX - mapXCount
      elseif tempRangeX < 1 then
        tempRangeX = mapXCount + tempRangeX
      end
      for j = -range, range do
        local tempRangeY = headY + j
        if tempRangeY > mapYCount then
          tempRangeY = tempRangeY - mapYCount
        elseif tempRangeY < 1 then
          tempRangeY = mapYCount + tempRangeY
        end
        local grid = gridList[tempRangeX][tempRangeY]
        if grid.snake == nil and nil == grid.food then
          table.insert(rangeGridList, grid)
        end
      end
    end
    if #rangeGridList > 0 then
      local randomGrid = rangeGridList[math.random(1, #rangeGridList)]
      self.xIndex = randomGrid.xIndex
      self.yIndex = randomGrid.yIndex
    end
  end
  
  function food:CreateModel()
    self.model = UIMgr:CreateComponentFromURL(UIUtil.GetResUrl(self.itemConfig.icon))
    mapContainer:AddChild(self.model)
    if 2 == self.itemConfig.type then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame011/FX_minigame011_itemlight.prefab", self.model:GetChild("EffectHolder"))
    elseif 1 == self.itemConfig.type then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame011/FX_minigame011_itemreflash.prefab", self.model:GetChild("EffectHolder"))
    end
  end
  
  function food:UpdatePosition()
    local grid = gridList[self.xIndex][self.yIndex]
    self.model:SetXY(grid.x, grid.y)
  end
  
  function food:Destroy()
    if self.model then
      self.model:Dispose()
      self.model = nil
    end
    if foodList then
      for i, v in ipairs(foodList) do
        if v == self then
          table.remove(foodList, i)
          break
        end
      end
    end
    self = nil
  end
  
  food:Init()
  return food
end

function Activity9SnakeGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9SnakeGameWindow.package, WinResConfig.Activity9SnakeGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniGameStart2WindowUis(contentPane)
    Activity9SnakeGameWindow.UpdateInfo()
    Activity9SnakeGameWindow.InitBtn()
    Activity9SnakeGameWindow.InitGameInfo()
    UpdateManager.AddUpdateHandler(Activity9SnakeGameWindow.Update)
  end)
end

function Activity9SnakeGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1008", "MiniGame1_1001")
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
end

function Activity9SnakeGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity9SnakeGameWindow.PauseGame()
    MessageBox.Show(T(11811), {
      touchCallback = function()
        local point = #curSnake.partList
        Activity9_MiniGameService.MiniGameSubmitReq(Activity9_MiniGameData.snakeGameId, {}, point, nil, function()
          if UIMgr:IsWindowInList(WinResConfig.Activity9SnakeGameMainWindow.name) then
            UIMgr:CloseToWindow(WinResConfig.Activity9SnakeGameMainWindow.name)
          else
            UIMgr:CloseWindow(WinResConfig.Activity9SnakeGameWindow.name)
          end
        end)
      end
    }, {
      touchCallback = function()
        Activity9SnakeGameWindow.ResumeGame()
      end
    })
  end)
  uis.Main.SetBtn.onClick:Set(function()
    Activity9SnakeGameWindow.PauseGame()
    OpenWindow(WinResConfig.Activity9MiniOperateChoiceWindow.name, nil, WinResConfig.Activity9SnakeGameWindow.name)
  end)
  uis.Main.Integral.NumberWordTxt.text = T(11801)
  uis.Main.Integral.NumberWord1Txt.text = T(11802)
  local info = Activity9_MiniGameData.GetMiniGameInfo(Activity9_MiniGameData.snakeGameId)
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
  uis.Main.TipsWord.WordTxt.text = T(11800)
  uis.Main.TipsWord.TouchScreenBtn.onClick:Add(Activity9SnakeGameWindow.StartGame)
end

function Activity9SnakeGameWindow.UpdateScore()
  if curSnake then
    uis.Main.Integral.NumberTxt.text = #curSnake.partList
  else
    uis.Main.Integral.NumberTxt.text = 0
  end
end

function Activity9SnakeGameWindow.InitGameInfo()
  local itemConfig = TableData.GetTable("BaseActivityGameItem")
  randomFoodIdList = {}
  for id, info in pairs(itemConfig) do
    if info.game_id == Activity9_MiniGameData.snakeGameId then
      if 1 == info.type then
        baseFoodId = id
        randomFoodCreateConditionCount = info.time
      else
        table.insert(randomFoodIdList, id)
      end
    end
  end
  foodList = {}
  foodCreateRangeList = {}
  eatBaseFoodCount = 0
  for _, rangeInfo in ipairs(FOOD_CREATE_RANGE) do
    local startIndex = #foodCreateRangeList + 1
    for i = startIndex, rangeInfo.max do
      foodCreateRangeList[i] = rangeInfo.range
    end
  end
  Activity9SnakeGameWindow.InitMap()
  Activity9SnakeGameWindow.InitSnake()
  Activity9SnakeGameWindow.RefreshJoystick()
  gameState = GAME_STATE_ENUM.INIT
  uis.Main.c1Ctr.selectedIndex = 1
end

function Activity9SnakeGameWindow.InitMap()
  mapContainer = uis.Main.MapRegion.MapLattice.root
  mapXCount = math.floor(mapContainer.width / gridWH)
  mapYCount = math.floor(mapContainer.height / gridWH)
  gridList = {}
  for i = 1, mapXCount do
    if nil == gridList[i] then
      gridList[i] = {}
    end
    for j = 1, mapYCount do
      local grid = Activity9SnakeGameWindow.CreateGrid(i, j)
      gridList[i][j] = grid
    end
  end
end

function Activity9SnakeGameWindow.InitSnake()
  curSnakeDirection = DIRECTION_ENUM.RIGHT
  curSnake = Activity9SnakeGameWindow.CreateSnake()
  Activity9SnakeGameWindow.UpdateScore()
end

function Activity9SnakeGameWindow.StartGame()
  if gameState == GAME_STATE_ENUM.INIT then
    gameState = GAME_STATE_ENUM.PLAYING
    uis.Main.c1Ctr.selectedIndex = 0
    Activity9SnakeGameWindow.StartTimer()
    curSnake:MoveToNext()
  end
end

function Activity9SnakeGameWindow.StartTimer()
  if nil == gameTimer then
    gameTimer = TimerUtil.setInterval(MOVE_SPEED / gridWH, -1, Activity9SnakeGameWindow.UpdateGame)
  else
    gameTimer:start()
  end
end

function Activity9SnakeGameWindow.StopTimer()
  if gameTimer then
    gameTimer:stop()
    gameTimer = nil
  end
end

function Activity9SnakeGameWindow.UpdateGame(timer, count)
  if gameState == GAME_STATE_ENUM.PLAYING then
    if curSnake then
      curSnake:Move()
    end
    if #foodList <= 0 then
      local food = Activity9SnakeGameWindow.CreateFood(baseFoodId)
      table.insert(foodList, food)
    end
  end
end

function Activity9SnakeGameWindow.PauseGame()
  gameState = GAME_STATE_ENUM.PAUSE
  if gameTimer then
    gameTimer:pause()
  end
end

function Activity9SnakeGameWindow.ResumeGame()
  gameState = GAME_STATE_ENUM.PLAYING
  if gameTimer then
    gameTimer:resume()
  end
end

function Activity9SnakeGameWindow.StopGame()
  gameState = GAME_STATE_ENUM.STOP
  Activity9SnakeGameWindow.StopTimer()
end

function Activity9SnakeGameWindow.GameOver()
  local point = #curSnake.partList
  local info = Activity9_MiniGameData.GetMiniGameInfo(Activity9_MiniGameData.snakeGameId)
  local highScore = info and info.miniHighScore or 0
  Activity9_MiniGameService.MiniGameSubmitReq(Activity9_MiniGameData.snakeGameId, {}, point, nil, function()
    OpenWindow(WinResConfig.Activity9SnakeGameResultWindow.name, nil, point, highScore)
  end)
  Activity9SnakeGameWindow.StopGame()
end

function Activity9SnakeGameWindow.OnClose()
  UpdateManager.RemoveUpdateHandler(Activity9SnakeGameWindow.Update)
  Activity9SnakeGameWindow.ClearCache()
  ctrRoot = {}
  uis = nil
  contentPane = nil
end

function Activity9SnakeGameWindow.RefreshJoystick()
  local selectedNum = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_SNAKE_SETTER_INDEX)
  ChangeController(uis.Main.joystickCtr, selectedNum)
  ctrRoot = {}
  if 0 == selectedNum then
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick1Left, JoyTypeEnum.Four)
  elseif 1 == selectedNum then
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick2Right, JoyTypeEnum.Four)
  elseif 2 == selectedNum then
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick3Left, JoyTypeEnum.Left_Right)
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick3Right, JoyTypeEnum.UP_Down)
  elseif 3 == selectedNum then
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick4Light, JoyTypeEnum.UP_Down)
    Activity9SnakeGameWindow:InitJoystick(uis.Main.Joystick4Right, JoyTypeEnum.Left_Right)
  end
end

local ShowDir = function(dir, notChangeDirection)
  for i = 1, #ctrRoot do
    ChangeController(ctrRoot[i].ctr, dir == ctrRoot[i].dir and 1 or 0)
  end
  if true ~= notChangeDirection and curSnake then
    curSnake:ChangeDirection(dir)
  end
end

function Activity9SnakeGameWindow:InitJoystick(joyRoot, joyType)
  local _startStageX = 0
  local _startStageY = 0
  local _lastStageX = 0
  local _lastStageY = 0
  local touchId = -1
  local radius = 150
  local _touchArea = joyRoot.root:GetChild("RegionImage")
  joyRoot.root:SetChildIndex(_touchArea, joyRoot.root.numChildren - 1)
  local _center = joyRoot.root:GetChild("TouchImage")
  _center.alpha = 0
  local radiusPos = {
    x = _center.width / 2,
    y = _center.height / 2
  }
  local _InitX = _center.x + radiusPos.x
  local _InitY = _center.y + radiusPos.y
  if joyType == JoyTypeEnum.Four then
    ctrRoot = {
      {
        ctr = joyRoot.Right.c1Ctr,
        dir = DIRECTION_ENUM.RIGHT
      },
      {
        ctr = joyRoot.Down.c1Ctr,
        dir = DIRECTION_ENUM.DOWN
      },
      {
        ctr = joyRoot.Left.c1Ctr,
        dir = DIRECTION_ENUM.LEFT
      },
      {
        ctr = joyRoot.Up.c1Ctr,
        dir = DIRECTION_ENUM.UP
      }
    }
  elseif joyType == JoyTypeEnum.Left_Right then
    table.insert(ctrRoot, {
      ctr = joyRoot.Right.c1Ctr,
      dir = DIRECTION_ENUM.RIGHT
    })
    table.insert(ctrRoot, {
      ctr = joyRoot.Left.c1Ctr,
      dir = DIRECTION_ENUM.LEFT
    })
  elseif joyType == JoyTypeEnum.UP_Down then
    table.insert(ctrRoot, {
      ctr = joyRoot.Down.c1Ctr,
      dir = DIRECTION_ENUM.DOWN
    })
    table.insert(ctrRoot, {
      ctr = joyRoot.Up.c1Ctr,
      dir = DIRECTION_ENUM.UP
    })
  end
  local GetDir = function(degrees)
    if joyType == JoyTypeEnum.Four then
      if degrees > -45 and degrees <= 45 then
        return DIRECTION_ENUM.RIGHT
      elseif degrees > 45 and degrees <= 135 then
        return DIRECTION_ENUM.DOWN
      elseif degrees > 135 or degrees <= -135 then
        return DIRECTION_ENUM.LEFT
      elseif degrees > -135 and degrees <= -45 then
        return DIRECTION_ENUM.UP
      end
    elseif joyType == JoyTypeEnum.Left_Right then
      if degrees > -90 and degrees <= 90 then
        return DIRECTION_ENUM.RIGHT
      else
        return DIRECTION_ENUM.LEFT
      end
    elseif joyType == JoyTypeEnum.UP_Down then
      if degrees > 0 and degrees <= 180 then
        return DIRECTION_ENUM.DOWN
      else
        return DIRECTION_ENUM.UP
      end
    end
  end
  _touchArea.onTouchBegin:Set(function(context)
    if -1 == touchId then
      local evt = context.data
      touchId = evt.touchId
      local pt = joyRoot.root:GlobalToLocal({
        x = evt.x,
        y = evt.y
      })
      local bx = pt.x
      local by = pt.y
      if bx < 0 then
        bx = 0
      elseif bx > _touchArea.width then
        bx = _touchArea.width
      end
      if by > joyRoot.root.height then
        by = joyRoot.root.height
      elseif by < _touchArea.y then
        by = _touchArea.y
      end
      _lastStageX = bx
      _lastStageY = by
      _startStageX = bx
      _startStageY = by
      _center:SetXY(bx - radiusPos.x, by - radiusPos.y)
      local degrees = Mathf.Atan2(by - _InitY, bx - _InitX) * 180 / Mathf.PI
      ShowDir(GetDir(degrees))
      context:CaptureTouch()
    end
  end)
  _touchArea.onTouchEnd:Set(function(context)
    local inputEvt = context.data
    if -1 ~= touchId and inputEvt.touchId == touchId then
      touchId = -1
      _center:SetXY(_InitX - radiusPos.x, _InitY - radiusPos.y)
    end
    ShowDir(DIRECTION_ENUM.None, true)
  end)
end

function Activity9SnakeGameWindow.Update()
  if gameState == GAME_STATE_ENUM.PLAYING then
    if Input.GetKeyDown(KeyCode.LeftArrow) then
      ShowDir(DIRECTION_ENUM.LEFT)
    elseif Input.GetKeyDown(KeyCode.RightArrow) then
      ShowDir(DIRECTION_ENUM.RIGHT)
    elseif Input.GetKeyDown(KeyCode.UpArrow) then
      ShowDir(DIRECTION_ENUM.UP)
    elseif Input.GetKeyDown(KeyCode.DownArrow) then
      ShowDir(DIRECTION_ENUM.DOWN)
    else
      ShowDir(DIRECTION_ENUM.None, true)
    end
  end
end

function Activity9SnakeGameWindow.OnNext()
  Activity9SnakeGameWindow.ClearCache()
  Activity9SnakeGameWindow.InitGameInfo()
  local info = Activity9_MiniGameData.GetMiniGameInfo(Activity9_MiniGameData.snakeGameId)
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
end

function Activity9SnakeGameWindow.ClearCache()
  Activity9SnakeGameWindow.StopTimer()
  if curSnake then
    curSnake:Destroy()
  end
  curSnake = nil
  curSnakeDirection = nil
  if foodList then
    for _, food in ipairs(foodList) do
      food:Destroy()
    end
  end
  foodList = nil
  mapXCount = nil
  mapYCount = nil
  if mapContainer then
    mapContainer:RemoveChildren()
  end
  mapContainer = nil
  gridList = nil
  baseFoodId = nil
  randomFoodCreateConditionCount = nil
  randomFoodIdList = nil
  foodCreateRangeList = nil
  eatBaseFoodCount = nil
  gameState = nil
  ctrRoot = {}
end

function Activity9SnakeGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity9_MiniGame.RESET then
    Activity9SnakeGameWindow.OnNext()
  elseif msgId == WindowMsgEnum.Activity9_MiniGame.REFRESH_JOYSTICK then
    Activity9SnakeGameWindow.RefreshJoystick()
    Activity9SnakeGameWindow.ResumeGame()
  end
end

return Activity9SnakeGameWindow
