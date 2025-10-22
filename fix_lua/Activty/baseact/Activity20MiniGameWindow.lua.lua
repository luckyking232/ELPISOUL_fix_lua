require("ActivityDungeon1020_MiniGameStartWindowByName")
local Activity20MiniGameWindow = {}
local uis, contentPane
local DRAG_OFFSET_Y = 120
local gameId = 70441025
local controller = require("Activity20_MiniGameController")
local cellObjs, guguObjs, positionObjs, levelIndex, displayNumber
local Screen2WorldPosition = function(global)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
  return position
end
local World2ScreenPosition = function(position)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(position)
  return Vector2(sp.x, Screen.height - sp.y)
end
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return Mathf.RoundToInt(newX), Mathf.RoundToInt(newY)
end
local GetOrCreateHolder = function(parent, name, index)
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
local SyncCellPosition = function(cell, obj)
  if type(obj) ~= "userdata" and cellObjs then
    obj = cellObjs[cell]
  end
  if obj then
    local parent = uis.Main.OperateRegion.root
    local sp = World2ScreenPosition(Vector3(cell.x, cell.y))
    local position = parent:GlobalToLocal(sp)
    obj.xy = position
  end
end
local OnCreateTetromino = function(inst, ghost)
  local cells = inst.cells
  cellObjs = cellObjs or {}
  local parent = uis.Main.OperateRegion.root
  local color = inst.color
  for _, cell in ipairs(cells) do
    local obj = UIMgr:CreateObject("ActivityDungeon1020", "MiniStart_Block")
    obj.sortingOrder = ghost and 9 or 10
    ChangeUIController(obj, "c1", color)
    obj:SetPivot(0.5, 0.5, true)
    obj.alpha = ghost and 0.5 or 1
    ChangeUIController(obj, "number", displayNumber and 0 or 1)
    parent:AddChild(obj)
    cellObjs[cell] = obj
    SyncCellPosition(cell, obj)
  end
end
local OnDestroyCell = function(cell, matched)
  local obj = cellObjs[cell]
  cellObjs[cell] = nil
  if obj then
    if matched then
      local parent = uis.Main.OperateRegion.root
      local holder = GetOrCreateHolder(parent, string.format("HOLDER_%s", cell))
      holder.sortingOrder = 15
      holder:SetXY(obj.x, obj.y)
      local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame025/MiniGame025_dis.prefab", holder, nil, true, function()
        obj:Dispose()
      end)
      local duration = EffectUtil.GetEffectDuration(effect)
      obj:TweenFade(0, duration * 2)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_20_xiaochu")
    else
      obj:Dispose()
    end
  end
end
local OnCreatePreviewEntry = function(entry)
  local index = entry.index
  local parent = uis.Main.Preview.root
  local loader = uis.Main.Preview[string.format("Preview%sLoader", index)]
  local holder = GetOrCreateHolder(parent, string.format("EFFECT_HOLDER_%s", index))
  holder:SetXY(loader.x + loader.width * 0.5, loader.y + loader.height * 0.5)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame025/MiniGame025_reflash.prefab", holder, nil, true)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_20_flash")
end
local OnCreateChannel = function(position)
  positionObjs = positionObjs or {}
  local x, y = position.x, position.y
  local obj = UIMgr:CreateObject("ActivityDungeon1020", "MiniStart_GuGuPosition")
  obj:SetPivot(0.5, 0.5, true)
  local sp = World2ScreenPosition(Vector3(x, y))
  local parent = uis.Main.root
  parent:AddChild(obj)
  local localPosition = parent:GlobalToLocal(sp)
  obj.xy = localPosition
  table.insert(positionObjs, obj)
end
local GUGU_COLOR_PATH_LOOKUP = {
  [0] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_red.prefab",
  [1] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_blue.prefab",
  [2] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_orange.prefab",
  [3] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_purple.prefab",
  [4] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_cyan.prefab",
  [5] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_green.prefab",
  [6] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_yellow.prefab",
  [7] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_pink.prefab",
  [8] = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame025/MiniGame025_char_gray.prefab"
}
local OnCreateGugu = function(gugu)
  guguObjs = guguObjs or {}
  local obj = UIMgr:CreateObject("ActivityDungeon1020", "MiniStart_GuGu")
  obj:SetPivot(0.5, 0.5, true)
  local holder = obj:GetChild("EffectHolder")
  local guguColor = gugu.color
  local path = GUGU_COLOR_PATH_LOOKUP[guguColor]
  local go = ResourceManager.Instantiate(path)
  local sp = World2ScreenPosition(Vector3(gugu.x, gugu.y))
  local parent = uis.Main.root
  local localPosition = parent:GlobalToLocal(sp)
  local center = uis.Main.OperateRegion.root.x + uis.Main.OperateRegion.root.width * 0.5
  local leftOrRight = localPosition.x - center < 0
  parent:AddChild(obj)
  obj.xy = localPosition
  guguObjs[gugu] = {gobj = obj, go = go}
  ChangeUIController(obj, "number", displayNumber and 0 or 1)
  UIUtil.SetText(obj:GetChild("Left"), guguColor + 1, "NumberTxt")
  ChangeUIController(obj:GetChild("Left"), "c1", guguColor)
  UIUtil.SetText(obj:GetChild("Right"), guguColor + 1, "NumberTxt")
  ChangeUIController(obj:GetChild("Right"), "c1", guguColor)
  ChangeUIController(obj, "c1", 1)
  SkeletonAnimationUtil.SetAnimation(go, 0, "idle", true)
  UIUtil.SetObjectToUI(go, holder, 1800)
  holder.y = holder.y * 0.85
  holder.scaleX = leftOrRight and -1 or 1
end
local OnDestroyGugu = function(gugu)
  if guguObjs then
    local entry = guguObjs[gugu]
    guguObjs[gugu] = nil
    if entry then
      local go = entry.go
      entry.go = nil
      SkeletonAnimationUtil.SetAnimation(go, 0, "die", false, function()
        entry.gobj:Dispose()
      end)
    end
  end
end
local holders
local OnReached = function(cell)
  local obj = cellObjs[cell]
  if obj then
    local parent = uis.Main.OperateRegion.root
    local holder = GetOrCreateHolder(parent, string.format("HOLDER_%s", cell))
    holder.sortingOrder = 15
    holder:SetXY(obj.x, obj.y)
    holders = holders or {}
    table.insert(holders, holder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame025/MiniGame025_maydisloop.prefab", holder)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_20_daoda")
  end
end
local winCondition
local OnGameOver = function(win)
  local map = {}
  local info = Activity20_MiniGameData.GetMiniGameInfo(gameId)
  local remoteMap = info.extraCount
  local oldVal = remoteMap and remoteMap[1] or 0
  if win then
    map[1] = math.max(levelIndex or 1, oldVal)
    map[2] = (remoteMap[2] or 0) + 1
  else
    map[1] = oldVal
    map[2] = remoteMap[2] or 0
  end
  local score = controller.GetScore()
  local progress = math.floor(100 * controller.GetScore() / winCondition)
  Activity20_MiniGameService.MiniGameSubmitReq(map, score, math.floor(controller.GetElapse()), nil, function()
    LeanTween.delayedCall(0.8, function()
      OpenWindow(WinResConfig.Activity20MiniGameSubmitWindow.name, nil, progress, win)
    end)
  end)
end
local previewObjs
local ACTIVITY20_MINIGAME_CONFIGS = require("Activity20_MiniGameConfigs")
local RefreshPreviewTypes = function()
  previewObjs = previewObjs or {}
  local entries = controller.GetPreviewEntries()
  local scale = 0.4
  for i = 1, 3 do
    local n = #previewObjs
    for j = n, 1, -1 do
      local entry = previewObjs[j]
      if entry.key == i then
        entry.obj:Dispose()
        table.remove(previewObjs, j)
      end
    end
    local k = table.keyof(entries, i, "index")
    local loader = uis.Main.Preview[string.format("Preview%sLoader", i)]
    if k then
      loader.sortingOrder = 10
      local entry = entries[k]
      local type, color, angle = entry.type, entry.color, entry.angle
      local config = ACTIVITY20_MINIGAME_CONFIGS[type]
      local targetPosition = loader.xy + Vector2(loader.width * 0.5, loader.height * 0.5)
      local width, height = 66 * scale, 66 * scale
      local bounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
      local anchorCellX, anchorCellY
      local cells = config.cells
      local parent = uis.Main.Preview.root
      for _, cell in ipairs(cells) do
        local cellX, cellY = cell.x, cell.y
        anchorCellX = anchorCellX or cellX
        anchorCellY = anchorCellY or cellY
        local localX, localY = rotatePointAround(cellX - anchorCellX, cellY - anchorCellY, angle, 0, 0)
        local minX, maxX = localX * width - width * 0.5, localX * width + width * 0.5
        local minY, maxY = localY * height - height * 0.5, localY * height + height * 0.5
        bounds:Encapsulate(Vector3(minX, minY))
        bounds:Encapsulate(Vector3(maxX, maxY))
      end
      local center = bounds.center
      for _, cell in ipairs(cells) do
        local obj = UIMgr:CreateObject("ActivityDungeon1020", "MiniStart_Block")
        obj:SetPivot(0.5, 0.5, true)
        obj:SetScale(scale, scale)
        local cellX, cellY = cell.x, cell.y
        local localX, localY = rotatePointAround(cellX - anchorCellX, cellY - anchorCellY, angle, 0, 0)
        parent:AddChild(obj)
        obj.sortingOrder = 5
        ChangeUIController(obj, "c1", color)
        local sw, sh = obj.width * scale, obj.height * scale
        obj.x = localX * sw - center.x + targetPosition.x
        obj.y = center.y - localY * sh + targetPosition.y
        table.insert(previewObjs, {obj = obj, key = i})
        ChangeUIController(obj, "number", displayNumber and 0 or 1)
      end
    end
  end
end
local DEBUG_GUGU_COLOR = {
  [0] = CS.UnityEngine.Color(1.0, 0.427, 0.427, 1.0),
  [1] = CS.UnityEngine.Color(0.463, 0.565, 1.0, 1.0),
  [2] = CS.UnityEngine.Color(0.98, 0.455, 0.847, 1.0),
  [3] = CS.UnityEngine.Color(0.733, 0.318, 1.0, 1.0),
  [4] = CS.UnityEngine.Color(0.318, 0.878, 1.0, 1.0),
  [5] = CS.UnityEngine.Color(0.318, 1.0, 0.824, 1.0),
  [6] = CS.UnityEngine.Color(0.702, 1.0, 0.318, 1.0),
  [7] = CS.UnityEngine.Color(1.0, 0.91, 0.318, 1.0),
  [8] = CS.UnityEngine.Color(1.0, 0.624, 0.318, 1.0)
}
local dl = CS.UnityEngine.Debug.DrawLine
local OnUpdate = function()
  if cellObjs then
    for i, v in pairs(cellObjs) do
      SyncCellPosition(i, v)
    end
  end
  if guguObjs then
    for gugu, entry in pairs(guguObjs) do
      local holder = entry.gobj
      local go = entry.go
      local sp = World2ScreenPosition(Vector3(gugu.x, gugu.y))
      SkeletonAnimationUtil.SetAnimation(go, 0, gugu.moving and "move" or "idle", true)
      local bounds = CS.SkeletonAnimationUtil.GetBounds(go)
      local x, y = bounds.center.x, bounds.center.y
      local minX, maxX = x - bounds.extents.x, x + bounds.extents.x
      local minY, maxY = y - bounds.extents.y * 0.5, y + bounds.extents.y
      local c = DEBUG_GUGU_COLOR[gugu.color]
      dl(Vector3(minX, minY), Vector3(maxX, minY), c)
      dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
      dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
      dl(Vector3(minX, maxY), Vector3(minX, minY), c)
      local parent = uis.Main.root
      local localPosition = parent:GlobalToLocal(sp)
      holder.xy = localPosition
    end
  end
  if type(winCondition) == "number" then
    uis.Main.Integral.WordTxt.text = T(20866, math.floor(100 * controller.GetScore() / winCondition))
  end
end
local Release = function()
  controller.Release()
  if positionObjs then
    for i, v in pairs(positionObjs) do
      v:Dispose()
    end
  end
  if holders then
    for i, v in ipairs(holders) do
      v:Dispose()
    end
    table.clear(holders)
  end
  positionObjs = nil
  guguObjs = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
end
local dragContext
local StartGame = function()
  Release()
  local container = uis.Main.OperateRegion.root
  local min = Screen2WorldPosition(container:LocalToGlobal(Vector2.zero))
  local max = Screen2WorldPosition(container:LocalToGlobal(container.size))
  local tbl = TableData.GetTable("BaseActivityGame")
  local info = Activity20_MiniGameData.GetMiniGameInfo()
  local remoteMap = info and info.extraCount
  local configs = {}
  for i, v in pairs(tbl) do
    if v.game_id == gameId then
      table.insert(configs, v)
    end
  end
  table.sort(configs, function(x, y)
    return x.id < y.id
  end)
  levelIndex = math.min(remoteMap and (remoteMap[1] or 0) + 1 or 1, #configs)
  local config = configs[levelIndex]
  local randomTypes = config.item
  local numColors = config.type_item
  local numRoads = config.totality
  local gridsOfRoad = config.grid[1]
  winCondition = tonumber(config.win_int)
  controller.SetLevelInfo(SimpleCopy(randomTypes), numColors, numRoads, gridsOfRoad, winCondition)
  controller.Initialize((max + min) * 0.5, 7, 7, 0.66, 0.66, OnCreateTetromino, OnDestroyCell, OnCreatePreviewEntry, OnCreateChannel, OnCreateGugu, OnDestroyGugu, OnReached, OnGameOver)
  RefreshPreviewTypes()
  for i = 1, 3 do
    local loader = uis.Main.Preview[string.format("Preview%sLoader", i)]
    loader.onTouchBegin:Set(function(context)
      local entry = controller.GetPreviewEntry(i)
      if entry then
        context:CaptureTouch()
        dragContext = dragContext or {}
        local previewType = entry.type
        local color = entry.color
        local angle = entry.angle
        dragContext.previewIndex = entry.index
        dragContext.type = previewType
        dragContext.color = color
        dragContext.angle = angle
        local worldPosition = Screen2WorldPosition(context.inputEvent.position + Vector2.down * DRAG_OFFSET_Y)
        dragContext.inst = controller.CreateTetromino(previewType, 999, 888, angle, color)
        controller.SetTetrominoPositionWithPivot(dragContext.inst, worldPosition.x, worldPosition.y)
      end
    end)
    local version = 0
    loader.onTouchMove:Set(function(context)
      if dragContext and dragContext.inst then
        local position = context.inputEvent.position + Vector2.down * DRAG_OFFSET_Y
        local worldPosition = Screen2WorldPosition(position)
        local minx, maxx, miny, maxy = controller.GetBounds(dragContext.inst)
        controller.SetTetrominoPositionWithPivot(dragContext.inst, worldPosition.x, worldPosition.y)
        version = version + 1
        if maxx >= min.x and minx <= max.x and maxy >= max.y and miny <= min.y then
          local row, column = controller.GetAutoFitGrid(dragContext.inst)
          if row and column then
            dragContext.row, dragContext.column = row, column
            local color = dragContext.color
            if not dragContext.ghost then
              local previewType = dragContext.type
              local angle = dragContext.angle
              dragContext.ghost = controller.CreateGhostTetromino(previewType, row, column, angle, color)
            else
              controller.SetTetrominoRowColumn(dragContext.ghost, row, column)
            end
          elseif dragContext.ghost then
            controller.DestroyTetromino(dragContext.ghost)
            dragContext.ghost = nil
          end
          if dragContext.holders then
            for j = #dragContext.holders, 1, -1 do
              local v = dragContext.holders[j]
              if v.version ~= version then
                v.holder:Dispose()
                table.remove(dragContext.holders, j)
              end
            end
          end
        elseif dragContext.ghost then
          if dragContext.holders then
            for _, v in ipairs(dragContext.holders) do
              v.holder:Dispose()
            end
            table.clear(dragContext.holders)
          end
          if dragContext.matchedGrids then
            for _, grid in ipairs(dragContext.matchedGrids) do
              if grid.cell then
                local obj = cellObjs[grid.cell]
                ChangeUIController(obj, "c1", grid.cell.color)
              end
            end
          end
          controller.DestroyTetromino(dragContext.ghost)
          dragContext.ghost = nil
        end
      end
    end)
    loader.onTouchEnd:Set(function(context)
      if dragContext and dragContext.inst then
        local minx, maxx, miny, maxy = controller.GetBounds(dragContext.inst)
        if maxx >= min.x and minx <= max.x and maxy >= max.y and miny <= min.y and dragContext.row and dragContext.column then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_set")
          controller.AutoPlace(dragContext.inst, dragContext.row, dragContext.column)
          for _, v in ipairs(dragContext.inst.cells) do
            SyncCellPosition(v)
          end
          local index = dragContext.previewIndex
          local parent = uis.Main.Preview.root
          local holder = GetOrCreateHolder(parent, string.format("EFFECT_HOLDER_%s", index))
          holder:SetXY(loader.x + loader.width * 0.5, loader.y + loader.height * 0.5)
          UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_itemuse.prefab", holder, nil, true)
          controller.RemovePreview(index)
          RefreshPreviewTypes()
        else
          controller.DestroyTetromino(dragContext.inst)
          if dragContext.matchedGrids then
            for _, grid in ipairs(dragContext.matchedGrids) do
              if grid.cell then
                local obj = cellObjs[grid.cell]
                ChangeUIController(obj, "c1", grid.cell.color)
              end
            end
          end
        end
        controller.DestroyTetromino(dragContext.ghost)
        if dragContext.holders then
          for _, v in ipairs(dragContext.holders) do
            v.holder:Dispose()
          end
        end
        table.clear(dragContext)
      end
    end)
  end
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local DisplayNumber = function(display)
  if cellObjs then
    for _, obj in pairs(cellObjs) do
      ChangeUIController(obj, "number", display and 0 or 1)
    end
  end
  if previewObjs then
    for _, entry in pairs(previewObjs) do
      ChangeUIController(entry.obj, "number", display and 0 or 1)
    end
  end
  if guguObjs then
    for i, v in pairs(guguObjs) do
      ChangeUIController(v.gobj, "number", display and 0 or 1)
    end
  end
end

function Activity20MiniGameWindow.ReInitData()
end

function Activity20MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity20MiniGameWindow.package, WinResConfig.Activity20MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1020_MiniGameStartWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1020/MiniGame_1001"
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity20MiniGameWindow.InitBtn()
    Activity20MiniGameWindow.UpdateInfo()
  end)
end

function Activity20MiniGameWindow.UpdateInfo()
  local switchBtnDefaultTxt = T(20864)
  local switchBtnDisplayNumberTxt = T(20865)
  UIUtil.SetText(uis.Main.SwitchBtn, switchBtnDefaultTxt, "Word1Txt")
  UIUtil.SetText(uis.Main.SwitchBtn, switchBtnDisplayNumberTxt, "Word2Txt")
  displayNumber = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY20_DISPLAY_NUMBER, 0) > 0
  local ctrl = uis.Main.SwitchBtn:GetController("button")
  ctrl.selectedIndex = displayNumber and 1 or 0
  StartGame()
end

function Activity20MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(2121), {
      touchCallback = function()
        local info = Activity20_MiniGameData.GetMiniGameInfo(gameId)
        local remoteMap = info.extraCount
        Activity20_MiniGameService.MiniGameSubmitReq({
          [1] = remoteMap and remoteMap[1] or 0,
          [2] = remoteMap and remoteMap[2] or 0
        }, 0, 0, nil, function()
          UIMgr:CloseWindow(WinResConfig.Activity20MiniGameWindow.name)
        end)
      end
    }, {})
  end)
  local ctrl = uis.Main.SwitchBtn:GetController("button")
  ctrl.onChanged:Set(function()
    displayNumber = 1 == ctrl.selectedIndex
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY20_DISPLAY_NUMBER, displayNumber and 1 or 0)
    DisplayNumber(displayNumber)
  end)
end

function Activity20MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity20_MiniGame.START_GAME then
    StartGame()
  elseif msgId == WindowMsgEnum.Activity20_MiniGame.RESET then
    local info = Activity20_MiniGameData.GetMiniGameInfo()
    if info then
      uis.Main.Integral.WordTxt.text = info.miniHighScore
    end
  end
end

function Activity20MiniGameWindow.OnClose()
  Release()
  displayNumber = nil
  uis = nil
  contentPane = nil
end

return Activity20MiniGameWindow
