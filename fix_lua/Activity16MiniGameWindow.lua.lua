require("ActivityDungeon1016_MiniGameStartWindowByName")
local Activity16MiniGameWindow = {}
local uis, contentPane
local controller = require("Activity16_MiniGameController")
local cellObjs, score, displayScore
local CLEAR_ALL_BLOCKS_SCORE = 300
local SHAKE_MAGNITUDE = 5
local DEFAULT_SHAKE_DURATION = 0.05
local DRAG_OFFSET_Y = 120
local OUTLINE_EFFECT_LOOKUP = {
  [0] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_cyan.prefab",
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_blue.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_yellow.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_red.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_purple.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_orange.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/MiniGame018_outline_green.prefab"
}
local CELL_EFFECT_LOOKUP = {
  [0] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_cyan.prefab",
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_blue.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_yellow.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_red.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_purple.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_orange.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_cube_light_green.prefab"
}
local MATCHED_EFFECT_LOOKUP_HORIZONTAL = {
  [0] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_cyan.prefab",
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_blue.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_red.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_purple.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_orange.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_heng_green.prefab"
}
local MATCHED_EFFECT_LOOKUP_VERTICAL = {
  [0] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_cyan.prefab",
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_blue.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_red.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_purple.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_orange.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_shu_green.prefab"
}
local ROOT_POSITION, tweeners
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
local SyncCellPosition = function(cell)
  if cellObjs then
    local obj = cellObjs[cell]
    if obj then
      local parent = uis.Main.OperateRegion.root
      local sp = World2ScreenPosition(Vector3(cell.x, cell.y))
      local position = parent:GlobalToLocal(sp)
      obj.xy = position
    end
  end
end
local OnCreateTetromino = function(inst, ghost)
  local cells = inst.cells
  cellObjs = cellObjs or {}
  local parent = uis.Main.OperateRegion.root
  local color = inst.color
  for _, cell in ipairs(cells) do
    local obj = UIMgr:CreateObject("ActivityDungeon1016", "MiniStart_Block")
    obj.sortingOrder = ghost and 9 or 10
    ChangeUIController(obj, "c1", color)
    obj:SetPivot(0.5, 0.5, true)
    obj.alpha = ghost and 0.5 or 1
    local holder = GetOrCreateHolder(obj, "EFFECT_HOLDER")
    UIUtil.SetEffectToUI(CELL_EFFECT_LOOKUP[color], holder)
    parent:AddChild(obj)
    cellObjs[cell] = obj
    SyncCellPosition(cell)
  end
end
local OnDestroyCell = function(cell, matched)
  local obj = cellObjs[cell]
  cellObjs[cell] = nil
  if obj then
    obj:Dispose()
  end
end
local OnGameOver = function(elapse)
  Activity16_MiniGameService.MiniGameSubmitReq({}, score, Mathf.RoundToInt(elapse), nil, function()
    PlayUITrans(uis.Main.root, "tips2", function()
      OpenWindow(WinResConfig.Activity16MiniGameSubmitWindow.name, nil, score)
    end)
  end)
end
local scoreTweenId, comboTipsObj
local TweenScore = function(count)
  if scoreTweenId then
    LeanTween.cancel(scoreTweenId)
  end
  score = score + count
  scoreTweenId = LeanTween.value(displayScore, score, 0.2):setOnUpdate(function(val)
    displayScore = Mathf.RoundToInt(val)
  end):setOnComplete(function()
    scoreTweenId = nil
  end):setEaseInSine().id
end
local shakeDuration
local DEV_ASPECT = 1.7786666666666666
local AdaptLinewidth = function(camera, linewidth)
  local aspect = camera.aspect
  if aspect < DEV_ASPECT then
    linewidth = linewidth * (aspect / DEV_ASPECT)
  end
  return linewidth
end
local LoadPathRenderer = function(parent, path, sortingOrder, name)
  local pr = ResourceManager.Instantiate(path):GetOrAddComponent(typeof(CS.PathRenderer))
  pr.cachedLineRenderer.loop = true
  pr.positionCount = 0
  pr.lineWidth = AdaptLinewidth(StageCamera.main, 0.5)
  pr.density = 1
  pr.flowspeed = 0
  pr.numCornerVertices = 0
  local holder = GetOrCreateHolder(parent, name)
  UIUtil.SetObjectToUI(pr.cachedGameObject, holder)
  holder.sortingOrder = sortingOrder
  return pr, holder
end
local OnMatched = function(color, rows, cols, combo, clear)
  local count = 0
  local numRows = rows and #rows or 0
  local numCols = cols and #cols or 0
  local parent = uis.Main.OperateRegion.root
  if numRows > 0 then
    local gridHeight = 72
    local centerX = parent.width * 0.5
    for _, row in ipairs(rows) do
      local holder = GetOrCreateHolder(parent, string.format("EFFECT_HOLDER_ROW_%s", row))
      local py = (8 - row + 0.5) * gridHeight
      holder:SetXY(centerX, py)
      holder.sortingOrder = 20
      local path = MATCHED_EFFECT_LOOKUP_HORIZONTAL[color]
      UIUtil.SetEffectToUI(path, holder, nil, true)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_xiaochu_0")
      if type(combo) == "number" and combo > 0 then
        SoundUtil.PlayUISfx(string.format("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_xiaochu_%s", math.min(combo, 4)))
      end
    end
  end
  if numCols > 0 then
    local gridWidth = 72
    local centerY = parent.height * 0.5
    for _, col in ipairs(cols) do
      local holder = GetOrCreateHolder(parent, string.format("EFFECT_HOLDER_COL_%s", col))
      local px = (col - 0.5) * gridWidth
      holder:SetXY(px, centerY)
      holder.sortingOrder = 20
      local path = MATCHED_EFFECT_LOOKUP_VERTICAL[color]
      UIUtil.SetEffectToUI(path, holder, nil, true)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_xiaochu_0")
      if type(combo) == "number" and combo > 0 then
        SoundUtil.PlayUISfx(string.format("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_xiaochu_%s", math.min(combo, 4)))
      end
    end
  end
  if type(combo) == "number" then
    count = (numRows + numCols) * 10 * (combo + 1) + (clear and CLEAR_ALL_BLOCKS_SCORE or 0)
    if combo > 0 then
      if not comboTipsObj then
        comboTipsObj = UIMgr:CreateObject("ActivityDungeon1016", "MiniStart_LatticeTipsAni")
        comboTipsObj.sortingOrder = 200
        comboTipsObj.touchable = false
        parent:AddChild(comboTipsObj)
      end
      comboTipsObj:Center()
      comboTipsObj.visible = true
      ChangeUIController(comboTipsObj:GetChild("Tips"), "c1", math.min(combo - 1, 3))
      PlayUITrans(comboTipsObj, "up")
      shakeDuration = DEFAULT_SHAKE_DURATION
    end
    if clear then
      if comboTipsObj then
        comboTipsObj.y = comboTipsObj.y - 78
      end
      uis.Main.Tips1.NumberTxt.NumberTxt.text = T(20780, CLEAR_ALL_BLOCKS_SCORE)
      PlayUITrans(uis.Main.root, "tips1")
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_16_hudi_finish_all")
    end
  else
    count = (numRows + numCols) * 10
  end
  TweenScore(count)
end
local OnCreatePreviewEntry = function(entry)
  local index = entry.index
  local parent = uis.Main.Preview.root
  local loader = uis.Main.Preview[string.format("Preview%sLoader", index)]
  local holder = GetOrCreateHolder(parent, string.format("EFFECT_HOLDER_%s", index))
  holder:SetXY(loader.x + loader.width * 0.5, loader.y + loader.height * 0.5)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_itemreflash.prefab", holder, nil, true)
end
local RefreshPreviewTypes = function()
  local entries = controller.GetPreviewEntries()
  for i = 1, 3 do
    local k = table.keyof(entries, i, "index")
    local loader = uis.Main.Preview[string.format("Preview%sLoader", i)]
    if k then
      local entry = entries[k]
      loader.url = string.format("ui://ActivityDungeon1016/MiniStart_Block%02d", entry.type)
      local cmp = loader.component
      loader.rotation = -entry.angle
      local color = entry.color
      for j = 1, cmp.numChildren do
        local child = cmp:GetChildAt(j - 1)
        ChangeUIController(child, "c1", color)
        local holder = GetOrCreateHolder(child, "EFFECT_HOLDER")
        UIUtil.SetEffectToUI(CELL_EFFECT_LOOKUP[color], holder)
      end
    else
      loader.url = nil
    end
  end
end
local OnUpdate = function()
  if cellObjs and (type(shakeDuration) ~= "number" or shakeDuration <= 0) then
    for cell, _ in pairs(cellObjs) do
      SyncCellPosition(cell)
    end
  end
  uis.Main.Integral.NumberTxt.text = displayScore
  if type(shakeDuration) == "number" and shakeDuration > 0 then
    local root = uis.Main.root
    local x = (math.random(0, 20000) / 10000 - 1) * SHAKE_MAGNITUDE
    local y = (math.random(0, 20000) / 10000 - 1) * SHAKE_MAGNITUDE
    root.xy = ROOT_POSITION + Vector2(x, y)
    shakeDuration = shakeDuration - Time.deltaTime
  else
    uis.Main.root.xy = ROOT_POSITION
  end
end
local Release = function()
  if scoreTweenId then
    LeanTween.cancel(scoreTweenId)
  end
  scoreTweenId = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  controller.Release()
  if tweeners then
    for _, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
  end
  tweeners = nil
end
local dragContext
local StartGame = function()
  local info = Activity16_MiniGameData.GetMiniGameInfo()
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
  uis.Main.Tips1.NumberTxt.text = ""
  Release()
  local container = uis.Main.OperateRegion.root
  local min = Screen2WorldPosition(container:LocalToGlobal(Vector2.zero))
  local max = Screen2WorldPosition(container:LocalToGlobal(container.size))
  score = 0
  displayScore = 0
  tweeners = {}
  if comboTipsObj then
    comboTipsObj.visible = false
  end
  controller.SetGridSize(0.72, 0.72)
  controller.Initialize((max + min) * 0.5, 8, 8, OnCreateTetromino, OnDestroyCell, OnMatched, OnCreatePreviewEntry, OnGameOver)
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
          local matchedGrids
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
            local grids, rows, cols = controller.TryGetMatchedCells(dragContext.ghost, row, column)
            if dragContext.matchedGrids then
              for _, grid in ipairs(dragContext.matchedGrids) do
                if grid.cell then
                  local obj = cellObjs[grid.cell]
                  ChangeUIController(obj, "c1", grid.cell.color)
                end
              end
            end
            matchedGrids = grids
            if _G.next(grids) then
              local groupSides = controller.GetGridsOutline(grids)
              local path = OUTLINE_EFFECT_LOOKUP[dragContext.color]
              local parent = uis.Main.OperateRegion.root
              dragContext.holders = dragContext.holders or {}
              for gid, sides in ipairs(groupSides) do
                local key = string.format("OUTLINE_%s_%s_%s_%s", dragContext.type, row, column, gid)
                local index = table.keyof(dragContext.holders, key, "key")
                if not index then
                  local pathRenderer, holder = LoadPathRenderer(parent, path, 100, key)
                  pathRenderer:ClearPositionsBuffer()
                  for _, v in ipairs(sides) do
                    pathRenderer:AddPositionToBuffer(v.v0)
                    pathRenderer:ApplyPositionsBuffer(false)
                  end
                  table.insert(dragContext.holders, {
                    key = key,
                    holder = holder,
                    version = version
                  })
                else
                  dragContext.holders[index].version = version
                end
              end
              if rows then
                local gridHeight = 72
                local centerX = parent.width * 0.5
                for _, row in ipairs(rows) do
                  local key = string.format("EFFECT_HOLDER_ROW_B_%s", row)
                  local index = table.keyof(dragContext.holders, key, "key")
                  if not index then
                    local holder = GetOrCreateHolder(parent, key)
                    local py = (8 - row + 0.5) * gridHeight
                    holder:SetXY(centerX, py)
                    holder.sortingOrder = 20
                    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_lizi_heng.prefab", holder, nil, true)
                    table.insert(dragContext.holders, {
                      key = key,
                      holder = holder,
                      version = version
                    })
                  else
                    dragContext.holders[index].version = version
                  end
                end
              end
              if cols then
                do
                  local gridWidth = 72
                  local centerY = parent.height
                  for _, col in ipairs(cols) do
                    local key = string.format("EFFECT_HOLDER_COL_B_%s", col)
                    local index = table.keyof(dragContext.holders, key, "key")
                    if not index then
                      local holder = GetOrCreateHolder(parent, key)
                      local px = (col - 0.5) * gridWidth
                      holder:SetXY(px, centerY)
                      holder.sortingOrder = 20
                      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame018/Minigame018_dis_lizi_shu.prefab", holder, nil, true)
                      table.insert(dragContext.holders, {
                        key = key,
                        holder = holder,
                        version = version
                      })
                    else
                      dragContext.holders[index].version = version
                    end
                  end
                end
              end
              dragContext.matchedGrids = dragContext.matchedGrids or {}
              table.clear(dragContext.matchedGrids)
              for _, grid in ipairs(grids) do
                if grid.cell then
                  table.insert(dragContext.matchedGrids, grid)
                  local obj = cellObjs[grid.cell]
                  ChangeUIController(obj, "c1", dragContext.color)
                end
              end
            else
              dragContext.matchedGrids = nil
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
          TweenScore(#dragContext.inst.cells)
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
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
end

function Activity16MiniGameWindow.ReInitData()
end

function Activity16MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity16MiniGameWindow.package, WinResConfig.Activity16MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1016_MiniGameStartWindowUis(contentPane)
    Activity16MiniGameWindow.UpdateInfo()
    Activity16MiniGameWindow.InitBtn()
  end)
end

function Activity16MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1016/MiniGame_1001"
  uis.Main.Integral.NumberWordTxt.text = T(20526)
  uis.Main.Integral.NumberWord1Txt.text = T(20527)
  uis.Main.Tips2.WordTxt.text = T(20779)
  uis.Main.Preview.root.sortingOrder = 0
  uis.Main.OperateRegion.root.sortingOrder = 5
  uis.Main.Tips1.root.sortingOrder = 50
  uis.Main.Tips2.root.sortingOrder = 50
  ROOT_POSITION = uis.Main.root.xy
  StartGame()
end

function Activity16MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(20533), {
      touchCallback = function()
        local elapse = controller.GetElapse()
        Activity16_MiniGameService.MiniGameSubmitReq({}, score, Mathf.RoundToInt(elapse), nil, function()
          UIMgr:CloseWindow(WinResConfig.Activity16MiniGameWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity16MiniGameWindow.OnClose()
  if dragContext then
    table.clear(dragContext)
  end
  Release()
  dragContext = nil
  uis = nil
  contentPane = nil
  comboTipsObj = nil
end

function Activity16MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity16_MiniGame.RESET then
    StartGame()
  end
end

return Activity16MiniGameWindow
