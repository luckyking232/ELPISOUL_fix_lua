require("ActivityDungeon1021_MiniGameStartWindowByName")
local Activity21MiniGameWindow = {}
local uis, contentPane
local controller = require("Activity21_MiniGameController")
local GAME_ROWS = 140
local GAME_COLUMNS = 80
local itemObjLookup
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
local SyncItemPosition = function(item, gobj, interpolation)
  local obj
  if type(gobj) == "userdata" then
    obj = gobj
  elseif itemObjLookup then
    obj = itemObjLookup[item]
  end
  if obj and not obj.isDisposed then
    local row, column = item._tempRow, item._tempColumn
    local parent = obj.parent
    local gridWidth, gridHeight = 5, 5
    local startX, startY = 0, parent.height
    local px = startX + (column - 0.5) * gridWidth
    local py = startY - (row - 0.5) * gridHeight
    if type(interpolation) == "number" then
      local localPosition = Vector2(px, py)
      localPosition = Vector2.Lerp(obj.xy, localPosition, interpolation)
      obj.xy = localPosition
    else
      obj:SetXY(px, py)
    end
  end
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
local reusableClosures, delayCreateObjs
local OnCreate = function(tetromino)
  local color = tetromino.color
  local parent = uis.Main.OperateRegion.root
  reusableClosures = reusableClosures or {}
  delayCreateObjs = delayCreateObjs or {}
  local len = #tetromino.cells
  tetromino.__loadedCount = 0
  for i = 1, len do
    local cell = tetromino.cells[i]
    local env
    if #reusableClosures > 0 then
      env = table.remove(reusableClosures)
    else
      env = {
        callback = function(obj)
          if not reusableClosures then
            return
          end
          obj:SetPivot(0.5, 0.5, true)
          obj.sortingOrder = 10
          parent:AddChild(obj)
          ChangeUIController(obj, "c1", env.cell.color)
          itemObjLookup[env.cell] = obj
          SyncItemPosition(env.cell, obj)
          table.insert(reusableClosures, env)
          env.cell.tetromino.__loadedCount = env.cell.tetromino.__loadedCount + 1
          if env.cell.tetromino.__loadedCount >= len then
            env.cell.tetromino.loaded = true
          end
        end
      }
    end
    env.cell = cell
    table.insert(delayCreateObjs, env)
  end
end
local matchedCellObjs
local Activity21_MiniGameDelayDestroy = require("Activity21_MiniGameDelayDestroy")
local OnDestroy = function(cell, matched)
  if itemObjLookup then
    local gobj = itemObjLookup[cell]
    itemObjLookup[cell] = nil
    if matched then
    else
      gobj.visible = false
      Activity21_MiniGameDelayDestroy.Destroy(gobj)
    end
  end
end
local OnCandidateUpdate = function(queue)
  local list = uis.Main.PreviewRegion.PreviewList
  for i = 1, list.numChildren do
    local child = list:GetChildAt(i - 1)
    local subchild = child:GetChild("Position")
    for j = subchild.numChildren, 1, -1 do
      subchild:GetChildAt(j - 1):Dispose()
    end
  end
  list:RemoveChildrenToPool()
  list.numItems = #queue
end
local OnGameOver = function()
  local score = math.floor(controller.GetScore() / 10)
  Activity21_MiniGameService.MiniGameSubmitReq({}, score, Mathf.FloorToInt(controller.GetElapse()), function()
    OpenWindow(WinResConfig.Activity21MiniGameSubmitWindow.name, nil, score)
  end)
end
local FLOWING_SPEED = 10
local DROPPING_SPEED = 10
local interpolation
local input = CS.UnityEngine.Input
local MATCHED_CELL_FADE_OUT_PHASE = {WHITE = "WHITE", DESTROY = "DESTROY"}
local MATCHED_CELL_FADE_OUT_GAP = 0.005
local FADE_OUT_EFFECT_GAP = 10
local MAX_PER_FRAME_CREATE_COUNT = 20
local COLOR_LOOK_UP = {
  [0] = Color(0.737, 0.894, 0.314, 1.0),
  [1] = Color(0.925, 0.518, 0.271, 1.0),
  [2] = Color(0.729, 0.302, 0.871, 1.0),
  [3] = Color(0.882, 0.373, 0.302, 1.0),
  [4] = Color(0.243, 0.463, 0.827, 1.0)
}
local OnUpdate = function()
  local noDynamicTetromino = true
  if itemObjLookup and controller.FrameDone() then
    for item, gobj in pairs(itemObjLookup) do
      if item.state == "STATIC" then
        item.state = "NONE"
        SyncItemPosition(item, gobj)
      elseif item.state == "DROPPING" then
        SyncItemPosition(item, gobj)
        noDynamicTetromino = false
      elseif item.state == "FLOWING" then
        SyncItemPosition(item, gobj)
        noDynamicTetromino = false
      end
    end
  end
  uis.Main.Integral.NumberTxt.text = math.floor(controller.GetScore() / 10)
  local stepX, stepY = 0, 0
  if input.GetKeyDown(KeyCode.UpArrow) then
    stepY = 1
  end
  if input.GetKey(KeyCode.RightArrow) then
    stepX = 1
  end
  if input.GetKey(KeyCode.DownArrow) then
    stepY = -1
  end
  if input.GetKey(KeyCode.LeftArrow) then
    stepX = -1
  end
  if 0 ~= stepX or 0 ~= stepY then
    if stepY > 0 then
      controller.InputRotate(90)
    else
      if 0 ~= stepX then
        controller.InputStepX(stepX)
      end
      if 0 ~= stepY then
        controller.InputStepY(stepY)
      end
    end
  end
  local flag = false
  if matchedCellObjs then
    local deltaTime = Time.deltaTime
    local x, maxRowPosY = 0, math.huge
    local color
    for column, entries in pairs(matchedCellObjs) do
      for i = #entries, 1, -1 do
        flag = true
        noDynamicTetromino = false
        local entry = entries[i]
        entry.delay = entry.delay - deltaTime
        if entry.delay <= 0 then
          local obj = entry.obj
          if entry.phase == MATCHED_CELL_FADE_OUT_PHASE.WHITE then
            if obj then
              local image = obj:GetChild("n8")
              image.color = Color.white
            end
            entry.delay = entry.cell._tempColumn * MATCHED_CELL_FADE_OUT_GAP
            entry.phase = MATCHED_CELL_FADE_OUT_PHASE.DESTROY
          elseif entry.phase == MATCHED_CELL_FADE_OUT_PHASE.DESTROY then
            if obj then
              x = obj.x
              maxRowPosY = math.min(obj.y, maxRowPosY)
              obj.visible = false
              Activity21_MiniGameDelayDestroy.Destroy(obj)
            end
            color = entry.cell.color
            table.remove(entries, i)
          end
        end
      end
      if 0 == (column + 5) % FADE_OUT_EFFECT_GAP and maxRowPosY < math.huge then
        local holder = GetOrCreateHolder(uis.Main.OperateRegion.root, string.format("c_%s_des_eff", column))
        holder:SetXY(x, maxRowPosY)
        holder.sortingOrder = 15
        local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame026/MiniGame026_lizi.prefab", holder, nil, true)
        local helper = effect:GetComponent(typeof(MaterialPropertyHelper))
        helper:ChangeColorValue("_TintColor", COLOR_LOOK_UP[color])
      end
    end
  end
  if flag then
    local empty = true
    for _, entries in pairs(matchedCellObjs) do
      if #entries > 0 then
        empty = false
        break
      end
    end
    if empty then
      controller.Resume()
    end
  end
  local count = 0
  if delayCreateObjs then
    for i = #delayCreateObjs, 1, -1 do
      local env = table.remove(delayCreateObjs)
      env.callback(UIMgr:CreateObject("ActivityDungeon1021", "MiniStart_Block"))
      count = count + 1
      if count >= MAX_PER_FRAME_CREATE_COUNT then
        break
      end
    end
  end
end
local Release = function()
  controller.Release()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
end
local rotatePointAround = function(x, y, angle, aroundx, aroundy)
  local deg = math.rad(angle)
  local cos, sin = math.cos(deg), math.sin(deg)
  local newX = (x - aroundx) * cos - (y - aroundy) * sin + aroundx
  local newY = (x - aroundx) * sin + (y - aroundy) * cos + aroundy
  return Mathf.RoundToInt(newX), Mathf.RoundToInt(newY)
end
local ACTIVITY21_MINIGAME_CONFIGS = require("Activity21_MiniGameConfigs")
local PreviewItemRenderer = function(i, gcmp)
  local list = controller.GetTetrominoQueue()
  local item = list[i + 1]
  local index, angle, color = item.index, item.angle, item.color
  local config = ACTIVITY21_MINIGAME_CONFIGS[index]
  local blocks = config.blocks
  local child = gcmp:GetChild("Position")
  local targetPosition = Vector2(child.width * 0.5, child.height * 0.5)
  local scale = 7
  local width, height = 6 * scale, 6 * scale
  local bounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
  local anchorBlockX, anchorBlockY
  for _, block in ipairs(blocks) do
    local blockX, blockY = block.x, block.y
    anchorBlockX = anchorBlockX or blockX
    anchorBlockY = anchorBlockY or blockY
    local localX, localY = rotatePointAround(blockX - anchorBlockX, blockY - anchorBlockY, angle, 0, 0)
    local minX, maxX = localX * width - width * 0.5, localX * width + width * 0.5
    local minY, maxY = localY * height - height * 0.5, localY * height + height * 0.5
    bounds:Encapsulate(Vector3(minX, minY))
    bounds:Encapsulate(Vector3(maxX, maxY))
  end
  local center = bounds.center
  for _, block in ipairs(blocks) do
    local obj = UIMgr:CreateObject("ActivityDungeon1021", "MiniStart_Block")
    obj:SetPivot(0.5, 0.5, true)
    obj:SetScale(scale, scale)
    local blockX, blockY = block.x, block.y
    local localX, localY = rotatePointAround(blockX - anchorBlockX, blockY - anchorBlockY, angle, 0, 0)
    child:AddChild(obj)
    obj.sortingOrder = 10
    ChangeUIController(obj, "c1", color)
    local width, height = obj.width * scale, obj.height * scale
    obj.x = localX * width - center.x + targetPosition.x
    obj.y = child.height - (localY * height - center.y + targetPosition.y)
  end
end
local SyncItemPositionImmediate = function(tetromino)
  for i, v in ipairs(tetromino.cells) do
    SyncItemPosition(v)
  end
end
local OnStep = function(time, nextStepTime)
  interpolation = Time.deltaTime / (nextStepTime - time)
end
local comboEffectLookup = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword1.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword4.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword2.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword3.prefab"
}
local comboTipsObj
local DisplayComboTips = function(combo, callback)
  if combo >= 1 then
    if not comboTipsObj then
      local parent = uis.Main.OperateRegion.root
      comboTipsObj = UIMgr:CreateObject("ActivityDungeon1021", "MiniStart_LatticeTipsAni")
      comboTipsObj.sortingOrder = 200
      comboTipsObj.touchable = false
      parent:AddChild(comboTipsObj)
      comboTipsObj:Center()
    end
    comboTipsObj.visible = true
    local comboIndex = math.min(combo, 4)
    if 1 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_1")
    elseif 2 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_2")
    elseif 3 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_3")
    elseif 4 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_4")
    end
    ChangeUIController(comboTipsObj:GetChild("Tips"), "c1", math.min(combo - 1, 3))
    PlayUITrans(comboTipsObj, "up")
  elseif type(callback) == "function" then
    callback()
  end
end
local OnMatched = function(cells, combo)
  matchedCellObjs = matchedCellObjs or {}
  DisplayComboTips(combo or 1)
  for i, v in pairs(cells) do
    SyncItemPosition(v)
    local obj = itemObjLookup[v]
    itemObjLookup[v] = nil
    local tempColumn = v._tempColumn
    if not matchedCellObjs[tempColumn] then
      matchedCellObjs[tempColumn] = {}
    end
    table.insert(matchedCellObjs[tempColumn], {
      cell = v,
      delay = tempColumn * MATCHED_CELL_FADE_OUT_GAP,
      obj = obj,
      phase = MATCHED_CELL_FADE_OUT_PHASE.WHITE
    })
  end
end
local StartGame = function()
  Release()
  itemObjLookup = itemObjLookup or {}
  table.clear(itemObjLookup)
  local container = uis.Main.OperateRegion.root
  container.width = container.width + 1
  local info = Activity21_MiniGameData.GetMiniGameInfo()
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
  local list = uis.Main.PreviewRegion.PreviewList
  list.itemRenderer = PreviewItemRenderer
  local origin = Screen2WorldPosition(container:LocalToGlobal(Vector2(0, container.height)))
  controller.Initialize(origin, GAME_ROWS, GAME_COLUMNS, OnCreate, OnDestroy, OnCandidateUpdate, SyncItemPositionImmediate, OnStep, OnMatched, OnGameOver)
  UpdateManager.AddUpdateHandler(OnUpdate)
end

function Activity21MiniGameWindow.ReInitData()
end

function Activity21MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21MiniGameWindow.package, WinResConfig.Activity21MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1021_MiniGameStartWindowUis(contentPane)
    uis.root.fairyBatching = false
    local uilayer = GRoot.inst:GetChildAt(0)
    uilayer.fairyBatching = false
    Activity21MiniGameWindow.UpdateInfo()
    Activity21MiniGameWindow.InitBtn()
  end)
end

function Activity21MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1021/MiniGame_1001"
  uis.Main.Integral.NumberWordTxt.text = T(20877)
  uis.Main.Integral.NumberWord1Txt.text = T(20875)
  uis.Main.PreviewRegion.WordTxt.text = T(20878)
  local holder = uis.Main.BackGround.BackGroundHolder
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", holder)
  StartGame()
end

local cancelBtnParam = {
  touchCallback = function()
    controller.Pause(false)
  end
}

function Activity21MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    controller.Pause(true)
    MessageBox.Show(T(20533), {
      touchCallback = function()
        local score = math.floor(controller.GetScore() / 10)
        local consumeSeconds = math.ceil(controller.GetElapse())
        Activity21_MiniGameService.MiniGameSubmitReq({}, score, consumeSeconds, function()
          UIMgr:CloseToWindow(WinResConfig.Activity21MiniGameMainWindow.name)
        end)
      end
    }, cancelBtnParam, cancelBtnParam)
  end)
  uis.Main.LeftBtn.onClick:Set(function()
    controller.InputStepX(-1)
  end)
  uis.Main.RightBtn.onClick:Set(function()
    controller.InputStepX(1)
  end)
  local gesture = LongPressGesture.GetLongPressGesture(uis.Main.LeftBtn)
  gesture.trigger = 0.1
  gesture.interval = 0
  gesture.onAction:Set(function()
    controller.InputStepX(-1, true)
  end)
  gesture = LongPressGesture.GetLongPressGesture(uis.Main.RightBtn)
  gesture.trigger = 0.1
  gesture.interval = 0
  gesture.onAction:Set(function()
    controller.InputStepX(1, true)
  end)
  gesture = LongPressGesture.GetLongPressGesture(uis.Main.DownBtn)
  gesture.trigger = 0
  gesture.interval = 0
  gesture.onAction:Set(function()
    controller.InputStepY(-1)
  end)
  uis.Main.RotateBtn.onClick:Set(function()
    controller.InputRotate(90)
  end)
end

function Activity21MiniGameWindow.OnClose()
  local uilayer = GRoot.inst:GetChildAt(0)
  uilayer.fairyBatching = true
  Release()
  if comboTipsObj then
    comboTipsObj:Dispose()
  end
  comboTipsObj = nil
  matchedCellObjs = nil
  reusableClosures = nil
  uis = nil
  contentPane = nil
end

function Activity21MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity21_MiniGame.RESET then
    StartGame()
  end
end

return Activity21MiniGameWindow
