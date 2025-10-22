require("ActivityDungeon1004_MiniGameStartWindowByName")
local Activity5MiniGameWindow = {}
local uis, contentPane, controller, startCoroutine
local ITEM_URL_LOOKUP = {
  [1] = "MiniStart_Item02",
  [2] = "MiniStart_Item03",
  [3] = "MiniStart_Item04",
  [4] = "MiniStart_Item05",
  [5] = "MiniStart_Item06",
  [6] = "MiniStart_Item07",
  [7] = "MiniStart_Item08",
  [8] = "MiniStart_Item01"
}
local ResumeCoroutine
local GRID_WIDTH, GRID_HEIGHT = 82, 82
local MARGIN_X, MARGIN_Y = 8, 8
local COL_GAP, ROW_GAP = -2, -2
local BOOM_DURATION = 0.2
local DROP_GAP = 0.05
local DROP_MINITIME = 0.2
local FINAL_EFF_FLY_GAP = 0.1
local FINAL_EFF_FLY_DURATION = 0.2
local ROW, COL = 9, 9
local gridObjs, itemObjs, swapItems, combo, score
local gameId = 70441005
local exchangeTipsObj, comboTipsObj, allAccomplish, conditions, alreadyBoomedItems, tweeners, CreateItem
local AddTween = function(tweenId)
  tweeners = tweeners or {}
  table.insert(tweeners, tweenId)
end
local RemoveTween = function(tweenId)
  if tweeners then
    local k = table.keyof(tweeners, tweenId)
    if k then
      table.remove(tweeners, k)
    end
  end
end
local GetItemName = function(x, y)
  return string.format("ITEM_OBJ_%s_%s", x, y)
end
local ClearAllItems = function()
  for _, itemObj in ipairs(itemObjs) do
    itemObj:Dispose()
  end
  table.clear(itemObjs)
end
local elapse, interval = 0, 0
local Pos2Index = function(x, y)
  return (y - 1) * COL + x
end
local curX, curY, beginPos
local ResetItemInputCallback = function(itemObj, x, y)
  itemObj.onClick:Set(function(context)
    if controller.IsOperation() then
      return
    end
    swapItems = swapItems or {}
    for i, v in ipairs(swapItems) do
      if x == v.x and y == v.y then
        return
      end
    end
    table.insert(swapItems, {x = x, y = y})
    if #swapItems >= 2 then
      combo = 0
      ResumeCoroutine(controller.ExchangeCoroutine(), swapItems[1].x, swapItems[1].y, swapItems[2].x, swapItems[2].y)
      table.clear(swapItems)
      return
    end
  end)
  itemObj.onTouchBegin:Set(function(context)
    curX = x
    curY = y
    beginPos = context.inputEvent.position
  end)
  itemObj.onTouchEnd:Set(function(context)
    local direction = context.inputEvent.position - beginPos
    if direction.magnitude < 40 then
      return
    end
    if not (curX and curY) or controller.IsOperation() then
      return
    end
    local dx, dy
    if math.abs(direction.x) > math.abs(direction.y) then
      dx = direction.x > 0 and 1 or -1
      dy = 0
    else
      dy = direction.y < 0 and 1 or -1
      dx = 0
    end
    combo = 0
    ResumeCoroutine(controller.ExchangeCoroutine(), curX, curY, curX + dx, curY + dy)
    curX = nil
    curY = nil
    if swapItems then
      table.clear(swapItems)
    end
  end)
end
local SetItemObjController = function(itemObj, effect)
  if "HORIZONTAL" == effect then
    ChangeUIController(itemObj, "c1", 1)
  elseif "VERTICAL" == effect then
    ChangeUIController(itemObj, "c1", 2)
  elseif "MATRIX" == effect then
    ChangeUIController(itemObj, "c1", 3)
  else
    ChangeUIController(itemObj, "c1", 0)
  end
end

function CreateItem(itemType, x, y, effect)
  local itemObj
  local tbl = TableData.GetTable("BaseActivityGameItem")
  local parent = uis.Main.LatticeRegion.root
  local config = tbl[itemType]
  if config then
    local splits = Split(config.icon, ":")
    itemObj = UIMgr:CreateObject(splits[1], splits[2])
  else
    printError("Can not find itemType", itemType)
  end
  if itemObj then
    parent:AddChild(itemObj)
    if y <= ROW then
      local gridObj = gridObjs[Pos2Index(x, y)]
      itemObj.xy = gridObj:TransformPoint(Vector2.zero, parent)
    else
      local gridHeight = 78
      local topGridObj = gridObjs[Pos2Index(x, ROW)]
      itemObj.xy = topGridObj:TransformPoint(Vector2.zero, parent) - (y - ROW) * gridHeight * Vector2.up
    end
    itemObj.name = GetItemName(x, y)
    itemObj.sortingOrder = 10
    SetItemObjController(itemObj, effect)
    ResetItemInputCallback(itemObj, x, y)
    table.insert(itemObjs, itemObj)
  end
  return itemObj
end

local Update = function()
  if allAccomplish then
    return
  end
  if controller then
    elapse = elapse + Time.deltaTime
    if controller.IsOperation() then
      if exchangeTipsObj then
        exchangeTipsObj.visible = false
      end
      interval = 0
    else
      local x1, y1, x2, y2 = controller.CheckAnyBoomItems()
      local result = true
      if not (x1 and y1 and x2) or not y2 then
        result = false
        FloatTipsUtil.ShowWarnTips(T(20611))
        ClearAllItems()
        ResumeCoroutine(controller.ResetAllItems(CreateItem))
      end
      interval = interval + Time.deltaTime
      if interval > 5 then
        if not result then
          exchangeTipsObj.visible = false
          return
        end
        local parent = uis.Main.LatticeRegion.root
        if not exchangeTipsObj then
          exchangeTipsObj = UIMgr:CreateObject("ActivityDungeon1004", "MiniStart_LatticeExchange")
          parent:AddChild(exchangeTipsObj)
          exchangeTipsObj.sortingOrder = 105
          exchangeTipsObj.touchable = false
        end
        parent:SetChildIndex(exchangeTipsObj, parent.numChildren)
        exchangeTipsObj.visible = true
        if x1 == x2 then
          exchangeTipsObj.rotation = 90
        else
          exchangeTipsObj.rotation = 0
        end
        local c1 = parent:GetChild(GetItemName(x1, y1))
        local c2 = parent:GetChild(GetItemName(x2, y2))
        if c1 and c2 then
          exchangeTipsObj.xy = (c1.xy + c2.xy) * 0.5 + Vector2(39, 39)
        end
        interval = 0
      end
    end
  end
end
local OnCreateGrid = function(x, y)
  local parent = uis.Main.LatticeRegion.root
  local index = Pos2Index(x, y)
  local gridObj = UIMgr:CreateObject("ActivityDungeon1004", "MiniStart_Lattice")
  parent:AddChild(gridObj)
  gridObjs[index] = gridObj
  gridObj.sortingOrder = -10
  local pw, ph = parent.width, parent.height
  local gw, gh = GRID_WIDTH, GRID_HEIGHT
  local margin_x = (pw - (COL * gw + (COL - 1) * COL_GAP)) * 0.5
  local margin_y = (ph - (ROW * gh + (ROW - 1) * ROW_GAP)) * 0.5
  gridObj:SetXY((x - 1) * (gw + COL_GAP) + margin_x, ph - gh * y - (y - 1) * ROW_GAP - margin_y)
end
local PlayEffect = function(path, position, callback)
  local parent = uis.Main.LatticeRegion.root
  local o = UIMgr:CreateObject("ActivityDungeon1004", "MiniStart_LatticeEffect")
  o.pivot = Vector2.zero
  parent:AddChild(o)
  o.xy = position
  local holder = o:GetChild("Effect1Holder")
  local effect = ResourceManager.Instantiate(path)
  effect.transform:GetChild(0).localPosition = Vector3.zero
  UIUtil.SetObjectToUI(effect, holder)
  effect.transform.localPosition = Vector3.zero
  LuaUtil.PlayEffect(effect)
  EffectUtil.SetAutoDestroyCallback(effect, function()
    o:Dispose()
    if type(callback) == "function" then
      callback()
    end
  end)
end
local CalcScores = function(scoreLookup)
  if scoreLookup then
    for k, v in pairs(scoreLookup) do
      local addition = 1
      if string.find(k, "RAINBOW_RAINBOW") then
        addition = 5
      elseif string.find(k, "MATRIX_MATRIX") then
        addition = 4
      elseif string.find(k, "MATRIX_VERTICAL") or string.find(k, "MATRIX_HORIZONTAL") or string.find(k, "VERTICAL_MATRIX") or string.find(k, "HORIZONTAL_MATRIX") then
        addition = 3.5
      elseif string.find(k, "HORIZONTAL_VERTICAL") or string.find(k, "VERTICAL_HORIZONTAL") or string.find(k, "HORIZONTAL_HORIZONTAL") or string.find(k, "VERTICAL_VERTICAL") then
        addition = 3
      elseif string.find(k, "RAINBOW") then
        addition = 2.5
      elseif string.find(k, "MATRIX") then
        addition = 2
      elseif string.find(k, "HORIZONTAL") or string.find(k, "VERTICAL") then
        addition = 1.5
      end
      score = score + math.floor(v * addition)
    end
    score = score + combo * 3
  end
end
local RefreshScores = function()
  local scoreText = T(20617, score)
  uis.Main.Integral.NumberTxt.text = scoreText
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
end
local RefreshStep = function()
  local step = controller.GetStep()
  uis.Main.Condition.Condition2.NumberTxt.text = step
end
local RefreshConditions = function()
  uis.Main.Condition.Condition1List.numItems = #conditions
end
local AddOrOverrideItem = function(itemType, count)
  alreadyBoomedItems = alreadyBoomedItems or {}
  local k = table.keyof(alreadyBoomedItems, itemType, "type")
  if k then
    alreadyBoomedItems[k].count = alreadyBoomedItems[k].count + (count or 1)
  else
    table.insert(alreadyBoomedItems, {
      type = itemType,
      count = count or 1
    })
  end
end
local comboEffectLookup = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword1.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword4.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword2.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_UI_minigame_005_effword3.prefab"
}
local DisplayComboTips = function(callback)
  if combo >= 2 then
    if not comboTipsObj then
      local parent = uis.Main.LatticeRegion.root
      comboTipsObj = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      comboTipsObj.sortingOrder = 200
      comboTipsObj.touchable = false
      parent:AddChild(comboTipsObj)
      comboTipsObj:Center()
    end
    comboTipsObj.visible = true
    local comboIndex = math.min(combo - 1, 4)
    if 1 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_1")
    elseif 2 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_2")
    elseif 3 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_3")
    elseif 4 == comboIndex then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_comb_4")
    end
    UIUtil.SetEffectToUI(comboEffectLookup[comboIndex], comboTipsObj, nil, true, function()
      comboTipsObj:SetNativeObject(nil)
      comboTipsObj.visible = false
      if type(callback) == "function" then
        callback()
      end
    end)
  elseif type(callback) == "function" then
    callback()
  end
end
local AfterBoom = function(co, items, soundPath)
  local progress = 0
  local cnt = #items
  local parent = uis.Main.LatticeRegion.root
  if cnt > 0 then
    if soundPath then
      SoundUtil.PlayUISfx(soundPath)
    end
    for _, item in ipairs(items) do
      local obj = parent:GetChild(GetItemName(item.x, item.y))
      AddOrOverrideItem(item.type)
      PlayEffect("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_xiaochu_eff.prefab", obj.xy)
      obj:TweenFade(0, BOOM_DURATION):OnComplete(function()
        local k = table.keyof(itemObjs, obj)
        if k then
          table.remove(itemObjs, k)
        end
        obj:Dispose()
        progress = progress + 1
        if progress >= cnt then
          RefreshScores()
          RefreshConditions()
          DisplayComboTips()
          ResumeCoroutine(co)
        end
      end)
    end
  else
    RefreshScores()
    RefreshConditions()
    DisplayComboTips()
    ResumeCoroutine(co)
  end
end

function ResumeCoroutine(co, param1, param2, param3, param4)
  local status, result, arg1, arg2, arg3 = coroutine.resume(co, param1, param2, param3, param4)
  if status then
    local parent = uis.Main.LatticeRegion.root
    if result == ACTIVITY5_STATUS.BOOM or result == ACTIVITY5_STATUS.BOOM_FINAL then
      local items = arg1
      local scoreLookup = arg2
      CalcScores(scoreLookup)
      combo = combo + 1
      local boomEntries = {}
      for x = 1, COL do
        local hasBoomVerticalEffect = false
        for y = 1, ROW do
          for _, v in ipairs(items) do
            if x == v.x and y == v.y and (v.effect == "VERTICAL" or "VERTICAL" == v.__combo_effect) then
              hasBoomVerticalEffect = true
              break
            end
          end
          if hasBoomVerticalEffect then
            break
          end
        end
        for y = 1, ROW do
          if hasBoomVerticalEffect then
            local entry
            local k = table.keyof(boomEntries, x, "vertical")
            if not k then
              entry = {
                vertical = x,
                items = {}
              }
              table.insert(boomEntries, entry)
            else
              entry = boomEntries[k]
            end
            local n = #items
            for i = n, 1, -1 do
              local item = items[i]
              if x == item.x and y == item.y then
                table.insert(entry.items, item)
              end
            end
          end
        end
      end
      for y = 1, ROW do
        local hasBoomHorizontalEffect = false
        for x = 1, COL do
          for _, v in ipairs(items) do
            if x == v.x and y == v.y and (v.effect == "HORIZONTAL" or v.__combo_effect == "HORIZONTAL") then
              hasBoomHorizontalEffect = true
              break
            end
          end
          if hasBoomHorizontalEffect then
            break
          end
        end
        for x = 1, COL do
          if hasBoomHorizontalEffect then
            local entry
            local k = table.keyof(boomEntries, y, "horizontal")
            if not k then
              entry = {
                horizontal = y,
                items = {}
              }
              table.insert(boomEntries, entry)
            else
              entry = boomEntries[k]
            end
            local n = #items
            for i = n, 1, -1 do
              local item = items[i]
              if x == item.x and y == item.y then
                table.insert(entry.items, item)
              end
            end
          end
        end
      end
      local cnt = #boomEntries
      local hasMatrix, hasRainbow, doubleRainbow = false, false, false
      for i, v in ipairs(items) do
        if v.effect == "MATRIX" then
          hasMatrix = true
        end
        if v.type == 70076501 then
          hasRainbow = true
        end
        for _, vv in ipairs(items) do
          if v ~= vv and vv.type == 70076501 and 1 == math.abs(v.x - vv.x) + math.abs(v.y - vv.y) then
            doubleRainbow = true
          end
        end
      end
      local soundPath
      if hasRainbow then
        if doubleRainbow then
          soundPath = "event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_caihong_all"
        else
          soundPath = "event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_xiaochu_caihong"
        end
      elseif hasMatrix then
        soundPath = "event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_xiaochu_33"
      else
        soundPath = "event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_xiaochu"
      end
      if cnt > 0 then
        local progress = 0
        local isFinalBoom = result == ACTIVITY5_STATUS.BOOM_FINAL
        for i, entry in ipairs(boomEntries) do
          local x = entry.vertical
          local y = entry.horizontal
          local entryItems = entry.items
          local a, b
          local boomVertical = false
          if x then
            a = gridObjs[Pos2Index(x, 1)]
            b = gridObjs[Pos2Index(x, ROW)]
            boomVertical = true
          else
            a = gridObjs[Pos2Index(1, y)]
            b = gridObjs[Pos2Index(COL, y)]
          end
          local xy = (a.xy + b.xy) * 0.5
          local delay = i * 0.1
          local effPath = boomVertical and "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_shu.prefab" or "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_heng.prefab"
          if isFinalBoom then
            local tweenId
            tweenId = LeanTween.delayedCall(delay, function()
              RemoveTween(tweenId)
              for _, item in ipairs(entryItems) do
                local index = table.keyof(items, item)
                if index then
                  AddOrOverrideItem(item.type)
                  table.remove(items, index)
                end
                local obj = parent:GetChild(GetItemName(item.x, item.y))
                if obj and not obj.isDisposed then
                  obj:Dispose()
                  local k = table.keyof(itemObjs, obj)
                  if k then
                    table.remove(itemObjs, k)
                  end
                end
              end
              PlayEffect(effPath, xy)
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_xiaochu_blast")
              progress = progress + 1
              if progress >= cnt then
                local subTween
                subTween = LeanTween.delayedCall(BOOM_DURATION, function()
                  RemoveTween(subTween)
                  AfterBoom(co, items, soundPath)
                end).id
                AddTween(subTween)
              end
            end).id
            AddTween(tweenId)
          else
            for _, item in ipairs(entryItems) do
              local index = table.keyof(items, item)
              if index then
                AddOrOverrideItem(item.type)
                table.remove(items, index)
              end
              local obj = parent:GetChild(GetItemName(item.x, item.y))
              if obj and not obj.isDisposed then
                obj:Dispose()
                local k = table.keyof(itemObjs, obj)
                if k then
                  table.remove(itemObjs, k)
                end
              end
            end
            PlayEffect(effPath, xy)
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_xiaochu_blast")
            if cnt <= i then
              local tweenId
              tweenId = LeanTween.delayedCall(BOOM_DURATION, function()
                RemoveTween(tweenId)
                AfterBoom(co, items, soundPath)
              end).id
              AddTween(tweenId)
            end
          end
        end
      else
        AfterBoom(co, items, soundPath)
      end
    elseif result == ACTIVITY5_STATUS.ITEMS_DROP then
      local colDropItemsDict = arg1
      local colNewDropItemsDict = arg2
      local cnt, progress = 0, 0
      for _, items in pairs(colDropItemsDict) do
        cnt = cnt + table.getLen(items)
      end
      for _, items in pairs(colNewDropItemsDict) do
        cnt = cnt + table.getLen(items)
      end
      if cnt > 0 then
        for x, items in pairs(colDropItemsDict) do
          for _, item in ipairs(items) do
            local y, oldY = item.y, item.__oldy
            local obj = parent:GetChild(GetItemName(item.x, oldY))
            local targetGrid = gridObjs[Pos2Index(x, y)]
            if obj then
              local newName = GetItemName(x, y)
              local targetPosition = targetGrid:TransformPoint(Vector2.zero, parent)
              if obj.y == targetPosition.y then
                progress = progress + 1
                if cnt <= progress then
                  ResumeCoroutine(co)
                end
              else
                obj:TweenMove(targetPosition, math.abs(y - oldY) * DROP_GAP + DROP_MINITIME):OnComplete(function()
                  obj.name = newName
                  ResetItemInputCallback(obj, x, y)
                  progress = progress + 1
                  if progress >= cnt then
                    ResumeCoroutine(co)
                  end
                end)
              end
            end
          end
        end
        for x, items in pairs(colNewDropItemsDict) do
          for _, item in ipairs(items) do
            local y, tempY = item.y, item.__tempy
            local obj = CreateItem(item.type, item.x, tempY)
            local targetGrid = gridObjs[Pos2Index(x, y)]
            if obj then
              local newName = GetItemName(x, y)
              local targetPosition = targetGrid:TransformPoint(Vector2.zero, parent)
              if obj.y == targetPosition.y then
                progress = progress + 1
                if cnt <= progress then
                  ResumeCoroutine(co)
                end
              else
                obj:TweenMove(targetPosition, math.abs(y - tempY) * DROP_GAP + DROP_MINITIME):OnComplete(function()
                  obj.name = newName
                  ResetItemInputCallback(obj, x, y)
                  progress = progress + 1
                  if progress >= cnt then
                    ResumeCoroutine(co)
                  end
                end)
              end
            end
          end
        end
      else
        ResumeCoroutine(co)
      end
    elseif result == ACTIVITY5_STATUS.CREATE_NEW_ITEMS then
      local colCreatedNewItemsDict = arg1
      for _, items in pairs(colCreatedNewItemsDict) do
        for _, item in ipairs(items) do
          CreateItem(item.type, item.x, item.y, item.effect)
        end
      end
      ResumeCoroutine(co)
    elseif result == ACTIVITY5_STATUS.SWAP or result == ACTIVITY5_STATUS.REVERT then
      local itemA, itemB = arg1, arg2
      local useAllStep = arg3
      local x1, y1 = itemA.x, itemA.y
      local x2, y2 = itemB.x, itemB.y
      local name1 = GetItemName(x1, y1)
      local name2 = GetItemName(x2, y2)
      local c1 = parent:GetChild(name1)
      local c2 = parent:GetChild(name2)
      local progress = 0
      c1:TweenMove(c2.xy, 0.2):OnComplete(function()
        c1.name = GetItemName(x2, y2)
        ResetItemInputCallback(c1, x2, y2)
        progress = progress + 1
        if progress >= 2 then
          ResumeCoroutine(co)
        end
      end)
      c2:TweenMove(c1.xy, 0.2):OnComplete(function()
        c2.name = GetItemName(x1, y1)
        ResetItemInputCallback(c2, x1, y1)
        progress = progress + 1
        if progress >= 2 then
          ResumeCoroutine(co)
        end
      end)
      if useAllStep then
        RefreshStep()
      end
      if result == ACTIVITY5_STATUS.SWAP then
        PlayEffect("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_change.prefab", c1.xy)
        PlayEffect("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_change.prefab", c2.xy)
      end
    elseif result == ACTIVITY5_STATUS.OVER then
      RefreshStep()
      if controller.GetStep() <= 0 then
        local unmetlist
        if not allAccomplish then
          local allFinished = true
          for _, info in ipairs(conditions) do
            local count = 0
            if alreadyBoomedItems then
              local k = table.keyof(alreadyBoomedItems, info.id, "type")
              if k then
                count = alreadyBoomedItems[k].count
              end
            end
            local remain = math.max(0, info.count - count)
            if remain > 0 then
              allFinished = false
              unmetlist = unmetlist or {}
              table.insert(unmetlist, {
                id = info.id,
                count = remain
              })
            end
          end
          if allFinished then
            allAccomplish = true
            if comboTipsObj and comboTipsObj.visible then
              local tweenId
              tweenId = LeanTween.delayedCall(0.5, function()
                RemoveTween(tweenId)
                OpenWindow(WinResConfig.Activity5MiniGameWinWindow.name)
                local subTween
                subTween = LeanTween.delayedCall(1, function()
                  RemoveTween(subTween)
                  OpenWindow(WinResConfig.Activity5MiniGameSubmitWindow.name, nil, allAccomplish, score, math.ceil(elapse), unmetlist)
                end).id
                AddTween(subTween)
              end).id
              AddTween(tweenId)
            else
              OpenWindow(WinResConfig.Activity5MiniGameWinWindow.name)
              local tweenId
              tweenId = LeanTween.delayedCall(1, function()
                RemoveTween(tweenId)
                OpenWindow(WinResConfig.Activity5MiniGameSubmitWindow.name, nil, allAccomplish, score, math.ceil(elapse), unmetlist)
              end).id
              AddTween(tweenId)
            end
            return
          end
        end
        if comboTipsObj and comboTipsObj.visible then
          local tweenId
          tweenId = LeanTween.delayedCall(0.5, function()
            RemoveTween(tweenId)
            OpenWindow(WinResConfig.Activity5MiniGameSubmitWindow.name, nil, allAccomplish, score, math.ceil(elapse), unmetlist)
          end).id
          AddTween(tweenId)
        else
          OpenWindow(WinResConfig.Activity5MiniGameSubmitWindow.name, nil, allAccomplish, score, math.ceil(elapse), unmetlist)
        end
      elseif not allAccomplish then
        local allFinished = true
        for _, v in ipairs(conditions) do
          if alreadyBoomedItems then
            local k = table.keyof(alreadyBoomedItems, v.id, "type")
            if k then
              if alreadyBoomedItems[k].count < v.count then
                allFinished = false
                break
              end
            else
              allFinished = false
              break
            end
          end
        end
        if allFinished then
          allAccomplish = true
          OpenWindow(WinResConfig.Activity5MiniGameWinWindow.name)
          local tweenId
          tweenId = LeanTween.delayedCall(1, function()
            RemoveTween(tweenId)
            ResumeCoroutine(controller.UseAllStepCoroutine())
          end).id
          AddTween(tweenId)
        end
      end
    elseif result == ACTIVITY5_STATUS.RANDOM_SET_EFFECT then
      local items = arg1
      if _G.next(items) then
        local step = controller.GetStep()
        local cnt = #items
        local cmp = uis.Main.Condition.Condition2.root
        local startPosition = cmp:TransformPoint(Vector2(cmp.width * 0.5, cmp.height * 0.5), parent)
        for i, item in ipairs(items) do
          local name = GetItemName(item.x, item.y)
          local child = parent:GetChild(name)
          local upvalue = step - 1
          step = upvalue
          local time = i * FINAL_EFF_FLY_GAP
          local tweenId
          tweenId = LeanTween.delayedCall(time, function()
            RemoveTween(tweenId)
            local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame005/FX_ui_minigame_005_trail.prefab")
            local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
            parent:AddChild(holder)
            holder.sortingOrder = 300
            holder:SetXY(startPosition.x, startPosition.y)
            UIUtil.SetObjectToUI(eff, holder)
            LuaUtil.PlayEffect(eff)
            SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_result_wh")
            holder:TweenMove(child.xy + Vector2(child.width * 0.5, child.height * 0.5), FINAL_EFF_FLY_DURATION):OnComplete(function()
              holder:Dispose()
              uis.Main.Condition.Condition2.NumberTxt.text = math.floor(upvalue)
              SetItemObjController(child, item.effect)
              if i >= cnt then
                ResumeCoroutine(co)
              end
            end)
          end).id
          AddTween(tweenId)
        end
      end
    elseif result == ACTIVITY5_STATUS.SET_EFFECT then
      local items = arg1
      if _G.next(items) then
        local cnt = #items
        local progress = 0
        for i, item in ipairs(items) do
          local tweenId
          tweenId = LeanTween.delayedCall(0.08 * i, function()
            RemoveTween(tweenId)
            local obj = parent:GetChild(GetItemName(item.x, item.y))
            SetItemObjController(obj, item.effect)
            progress = progress + 1
            if progress >= cnt then
              ResumeCoroutine(co)
            end
          end).id
          AddTween(tweenId)
        end
      end
    end
  else
    printError("err:", result)
  end
end

local function GetDifficulties(day)
  local maxDay = 0
  local data = TableData.GetTable("BaseActivityGame")
  local result = {}
  for _, v in pairs(data) do
    if v.game_id == 70441005 then
      if v.game_day == day then
        table.insert(result, v)
      end
      if maxDay < v.game_day then
        maxDay = v.game_day
      end
    end
  end
  table.sort(result, function(a, b)
    return a.id < b.id
  end)
  if #result < 1 then
    return GetDifficulties(maxDay)
  end
  return result
end

local GetCurrentMiniGameConfig = function()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local curDay = math.ceil((LoginData.GetCurServerTime() - activityInfo.baseInfo.startStamp) / 86400)
  local difficulties = GetDifficulties(curDay)
  local miniDailyNum = info.miniDailyNum + 1
  local index = miniDailyNum > #difficulties and #difficulties or miniDailyNum
  return difficulties[index]
end
local ConditionItemRenderer = function(i, gcmp)
  local info = conditions[i + 1]
  local conf = TableData.GetConfig(info.id, "BaseActivityGameItem")
  gcmp:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
  local finished = false
  local count = 0
  if alreadyBoomedItems then
    local k = table.keyof(alreadyBoomedItems, info.id, "type")
    if k then
      count = alreadyBoomedItems[k].count
      finished = count >= info.count
    end
  end
  UIUtil.SetText(gcmp, info.count - count, "NumberTxt")
  ChangeUIController(gcmp, "c1", finished and 1 or 0)
end
local StartGame = function()
  score = 0
  combo = 0
  elapse = 0
  interval = 0
  allAccomplish = false
  gridObjs = gridObjs or {}
  itemObjs = itemObjs or {}
  table.clear(itemObjs)
  table.clear(gridObjs)
  controller = require("Activity5_MiniGameController")
  local step = 30
  local config = GetCurrentMiniGameConfig()
  ROW, COL = config.grid[1], config.grid[2]
  step = config.act
  local splits = Split(config.win, "|")
  conditions = {}
  alreadyBoomedItems = {}
  local randomlist = config.item
  local copylist = SimpleCopy(randomlist)
  for _, str in ipairs(splits) do
    local cnt = tonumber(str)
    local index = math.random(1, #copylist)
    local id = table.remove(copylist, index)
    table.insert(conditions, {id = id, count = cnt})
  end
  OpenWindow(WinResConfig.Activity5MiniGameStartWindow.name, nil, conditions)
  local itemlist = uis.Main.Condition.Condition1List
  itemlist.itemRenderer = ConditionItemRenderer
  itemlist.numItems = conditions and #conditions or 0
  local root = uis.Main.LatticeRegion.root
  local gw, gh = GRID_WIDTH, GRID_HEIGHT
  root:SetSize(COL * gw + (COL - 1) * COL_GAP + 2 * MARGIN_X, ROW * gh + (ROW - 1) * ROW_GAP + 2 * MARGIN_Y)
  local halfW, halfH = root.width * 0.5, root.height * 0.5
  local mask = root:GetChild("n0")
  mask:SetPivot(0.5, 0.5, true)
  mask:SetXY(halfW, halfH)
  controller.Start(ROW, COL, step, randomlist, OnCreateGrid, CreateItem)
  RefreshStep()
  RefreshScores()
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
end
local Release = function()
  if itemObjs then
    for i, v in pairs(itemObjs) do
      v:Dispose()
    end
    table.clear(itemObjs)
  end
  if gridObjs then
    for i, v in pairs(gridObjs) do
      v:Dispose()
    end
    table.clear(gridObjs)
  end
end

function Activity5MiniGameWindow.ReInitData()
end

function Activity5MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameWindow.package, WinResConfig.Activity5MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniGameStartWindowUis(contentPane)
    Activity5MiniGameWindow.UpdateInfo()
    Activity5MiniGameWindow.InitBtn()
  end)
end

function Activity5MiniGameWindow.UpdateInfo()
  local root = uis.Main.LatticeRegion.root
  local position = root.position
  root:SetPivot(0.5, 0.5, true)
  local halfW, halfH = root.width * 0.5, root.height * 0.5
  root:SetXY(position.x + halfW, position.y + halfH)
  local mask = root:GetChild("n0")
  mask:SetPivot(0.5, 0.5, true)
  mask:SetXY(halfW, halfH)
  uis.Main.BackGround.BackGroundLoader.url = "ui://wyxy0raau4qxac"
  StartGame()
  uis.Main.Condition.Word1Txt.text = T(20613)
  uis.Main.Condition.Word2Txt.text = T(20614)
  uis.Main.Integral.NumberWordTxt.text = T(20526)
  uis.Main.Integral.NumberWord1Txt.text = T(20527)
end

function Activity5MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(20533), {
      touchCallback = function()
        Activity5_MiniGameService.MiniGameSubmitReq(gameId, {}, score, math.ceil(elapse), function()
          UIMgr:CloseToWindow(WinResConfig.Activity5MiniGameMainWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity5MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  UpdateManager.RemoveUpdateHandler(Update)
  exchangeTipsObj = nil
  comboTipsObj = nil
  swapItems = nil
  itemObjs = nil
  gridObjs = nil
  if tweeners then
    for _, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
    table.clear(tweeners)
  end
end

function Activity5MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity5_MiniGame.RESET then
    Release()
    StartGame()
  elseif msgId == WindowMsgEnum.Activity5_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshScores()
  end
end

return Activity5MiniGameWindow
