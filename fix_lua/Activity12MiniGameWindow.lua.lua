require("ActivityDungeon1012_MiniGameStartWindowByName")
local Activity12MiniGameWindow = {}
local uis, contentPane, curGameTime, selectCol, selectIndex, columnInfo, moveInfo, oneColumnCount, difficultyData

function Activity12MiniGameWindow.ReInitData()
end

function Activity12MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity12MiniGameWindow.package, WinResConfig.Activity12MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1012_MiniGameStartWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1012/MiniGame_1001"
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity12MiniGameWindow.UpdateInfo()
    Activity12MiniGameWindow.InitBtn()
  end)
end

function Activity12MiniGameWindow.UpdateInfo()
  local info = Activity12_MiniGameData.GetMiniGameInfo()
  curGameTime = Time.time
  columnInfo = {}
  if info then
    difficultyData = Activity12MiniGameWindow.GetCurDifficulty(info.extraCount)
    local column = difficultyData.item[1]
    local count = difficultyData.item[2]
    oneColumnCount = count
    Activity12MiniGameWindow.ShowStartTips()
    local typeData = Activity12MiniGameWindow.Random(column, count)
    Activity12MiniGameWindow.InitBottleList(column, typeData)
    Activity12MiniGameWindow.InitStripList(count)
    Activity12MiniGameWindow.CheckEffect()
  end
end

function Activity12MiniGameWindow.InitStripList(count)
  local rect = uis.Main.ArrangeRegion.StripList.displayObject:GetBounds(GRoot.inst.displayObject)
  rect:Set(rect.x, rect.y, 5000, rect.height)
  local w, dis, mx, my, dragRoot
  
  function uis.Main.ArrangeRegion.StripList.itemRenderer(rootIndex, item)
    for col = 1, #columnInfo do
      for i = 1, count do
        local plant = UIMgr:CreateObject("ActivityDungeon1012", "MiniStart_ArrangeItem")
        item:AddChild(plant)
        w = plant.width
        dis = w / 2
        local x = (i - 1) * w
        local y = columnInfo[col].posCol * 129 + 12
        plant:SetXY(x, y)
        plant.draggable = true
        local type = columnInfo[col].typeData[i] - 1
        ChangeUIController(plant:GetChild("Plant"), "c1", type)
        local plantId = 1000 * col + i
        plant.gameObjectName = plantId
        columnInfo[col].y = y
        table.insert(columnInfo[col].info, {
          plant = plant,
          pos = plant.xy,
          index = i - 1,
          type = type,
          col = col,
          id = plantId
        })
        plant.dragBounds = rect
        plant.onDragStart:Set(function(context)
          moveInfo = Activity12MiniGameWindow.GetInfo(context.sender)
          for ind = 1, #moveInfo do
            dragRoot:AddChild(moveInfo[ind].plant)
          end
          context:CaptureTouch()
        end)
        plant.onDragMove:Set(function(context)
          mx = plant.x - x
          my = plant.y - y
          for ind = 2, #moveInfo do
            moveInfo[ind].plant:SetXY(plant.x + (ind - 1) * w, plant.y)
          end
        end)
        plant.onDragEnd:Set(function(context)
          local curPlantInfo, targetCol
          for ind = 1, #columnInfo do
            if #columnInfo[ind].info > 0 then
              for infoIndex = 1, #columnInfo[ind].info do
                if Vector2.Distance(Vector2(plant.x, columnInfo[ind].info[infoIndex].pos.y), plant.xy) < dis then
                  local checkIndex = #columnInfo[ind].info
                  if type == columnInfo[ind].info[checkIndex].type and checkIndex == #columnInfo[ind].info and plant ~= columnInfo[ind].info[checkIndex].plant and moveInfo[1] and moveInfo[1].col ~= ind then
                    curPlantInfo = columnInfo[ind].info[checkIndex]
                    targetCol = ind
                    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_xiaochu")
                    break
                  end
                end
              end
            elseif Vector2.Distance(Vector2(plant.x, columnInfo[ind].y), plant.xy) < dis and moveInfo[1] and columnInfo[ind].type == moveInfo[1].type then
              curPlantInfo = true
              targetCol = ind
              break
            end
          end
          local showTips = true
          for ind = 1, #columnInfo do
            if Vector2.Distance(Vector2(plant.x, columnInfo[ind].y), plant.xy) < dis and moveInfo[1] and moveInfo[1].col == ind then
              showTips = nil
            end
          end
          if curPlantInfo then
            for ind = #columnInfo[selectCol].info, 1, -1 do
              if ind >= selectIndex then
                table.remove(columnInfo[selectCol].info, ind)
              end
            end
            local len = #columnInfo[targetCol].info
            for ind = 1, #moveInfo do
              item:AddChild(moveInfo[ind].plant)
              moveInfo[ind].plant:SetXY((len + ind - 1) * w, columnInfo[targetCol].y)
              table.insert(columnInfo[targetCol].info, {
                plant = moveInfo[ind].plant,
                pos = moveInfo[ind].plant.xy,
                index = len + ind - 1,
                type = moveInfo[ind].type,
                col = targetCol,
                id = 1000 * targetCol + ind + len
              })
            end
            Activity12MiniGameWindow.PlayEffect(targetCol, len)
            if columnInfo[targetCol].info[1] and columnInfo[targetCol].type == columnInfo[targetCol].info[1].type then
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_xiaochu")
            end
          else
            for ind = 1, #moveInfo do
              item:AddChild(moveInfo[ind].plant)
              moveInfo[ind].plant:SetXY(moveInfo[ind].pos.x, moveInfo[ind].pos.y)
            end
            if showTips then
              FloatTipsUtil.ShowWarnTips(T(1956))
            end
          end
          Activity12MiniGameWindow.CheckEffect()
          item:SetChildIndex(dragRoot, item.numChildren)
          if targetCol then
            local maxLen = 0
            for iii = 1, #columnInfo do
              maxLen = math.max(#columnInfo[iii].info, maxLen)
            end
            item:SetSize(maxLen * w, uis.Main.ArrangeRegion.root.height)
            local list = uis.Main.ArrangeRegion.StripList
            local dis = list.width + math.abs(list.container.x)
            local len = #columnInfo[targetCol].info - table.getLen(moveInfo)
            if columnInfo[targetCol].info[len] and dis <= columnInfo[targetCol].info[len].pos.x then
              uis.Main.ArrangeRegion.StripList.scrollPane:SetPosX(columnInfo[targetCol].info[len].pos.x, true)
            end
          end
          moveInfo = {}
          Activity12MiniGameWindow.CheckGameOver()
        end)
      end
    end
    item:SetSize(w * count, uis.Main.ArrangeRegion.root.height)
    dragRoot = UIMgr:CreateObject("ActivityDungeon1012", "MiniStart_ArrangeStrip")
    item:AddChild(dragRoot)
    dragRoot.touchable = false
  end
  
  uis.Main.ArrangeRegion.StripList.numItems = 1
end

function Activity12MiniGameWindow.PlayEffect(targetCol, startIndex)
  if targetCol then
    startIndex = math.max(startIndex, 1)
    local len = #columnInfo[targetCol].info
    local type = columnInfo[targetCol].info[startIndex].type
    for i = startIndex, 1, -1 do
      if columnInfo[targetCol].info[i].type == type then
        local holder = columnInfo[targetCol].info[i].plant:GetChild("Plant"):GetChild("Effect2Holder")
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame014/FX_minigame014_clean.prefab", holder, nil, true)
      else
        break
      end
    end
    for i = startIndex + 1, len do
      if columnInfo[targetCol].info[i].type == type then
        local holder = columnInfo[targetCol].info[i].plant:GetChild("Plant"):GetChild("Effect2Holder")
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame014/FX_minigame014_clean.prefab", holder, nil, true)
      else
        break
      end
    end
  end
end

function Activity12MiniGameWindow.CheckEffect()
  for i = 1, #columnInfo do
    local holder = uis.Main.ArrangeRegion.BottleList:GetChildAt(columnInfo[i].posCol):GetChild("Effect2Holder")
    if columnInfo[i].info[1] and holder and columnInfo[i].type == columnInfo[i].info[1].type then
      holder.visible = true
    else
      holder.visible = false
    end
  end
end

function Activity12MiniGameWindow.InitBottleList(column, typeData)
  local showCol = {
    [1] = {3},
    [2] = {2, 3},
    [3] = {
      2,
      3,
      4
    },
    [4] = {
      2,
      3,
      4,
      5
    },
    [5] = {
      1,
      2,
      3,
      4,
      5
    }
  }
  local curShowCol = showCol[column]
  local tIndex = 0
  
  function uis.Main.ArrangeRegion.BottleList.itemRenderer(i, item)
    if table.contain(curShowCol, i + 1) then
      local plant = item:GetChild("Plant")
      ChangeUIController(plant, "c1", tIndex)
      item.alpha = 1
      table.insert(columnInfo, {
        type = tIndex,
        posCol = i,
        typeData = typeData[tIndex + 1],
        info = {}
      })
      tIndex = tIndex + 1
    else
      item.alpha = 0
    end
    local holder = item:GetChild("Effect2Holder")
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame014/FX_minigame014_check.prefab", holder)
    holder.visible = false
  end
  
  uis.Main.ArrangeRegion.BottleList.numItems = 5
end

function Activity12MiniGameWindow.GetInfo(dragItem)
  local info = {}
  for ind = 1, #columnInfo do
    for infoIndex = 1, #columnInfo[ind].info do
      if columnInfo[ind].info[infoIndex].plant == dragItem then
        selectCol = ind
        selectIndex = infoIndex
      end
    end
  end
  for i = 1, #columnInfo[selectCol].info do
    if i >= selectIndex then
      table.insert(info, columnInfo[selectCol].info[i])
    end
  end
  return info
end

function Activity12MiniGameWindow.Random(column, count)
  local itemType = {}
  for i = 1, column do
    itemType[i] = {}
    for n = 1, count do
      table.insert(itemType[i], i)
    end
  end
  for x = 1, column do
    for y = 1, count do
      local temp = itemType[x][y]
      local xr = math.random(1, column)
      local yr = math.random(1, count)
      itemType[x][y] = itemType[xr][yr]
      itemType[xr][yr] = temp
    end
  end
  for i = 1, column do
    itemType[i] = Activity12MiniGameWindow.CheckAdjacentMax(itemType[i])
  end
  return itemType
end

function Activity12MiniGameWindow.CheckAdjacentMax(t)
  local Check = function()
    local count = 1
    local number = t[1]
    for i = 2, #t do
      if number == t[i] then
        count = count + 1
        if count > 3 then
          return true
        end
      else
        count = 1
        number = t[i]
      end
    end
  end
  if Check() then
    t = table.randomSort(t)
    return Activity12MiniGameWindow.CheckAdjacentMax(t)
  else
    return t
  end
end

function Activity12MiniGameWindow.ShowStartTips()
  local oldTips = uis.Main.root:GetChild("hitTips")
  if oldTips then
    oldTips:Dispose()
  end
  local hitTips = UIMgr:CreateObject("ActivityDungeon1012", "MiniOperation")
  hitTips.name = "hitTips"
  UIUtil.SetText(hitTips, T(1946), "WordTxt")
  hitTips:SetSize(uis.root.width, uis.root.height)
  uis.Main.root:AddChild(hitTips)
  uis.Main.root:MakeFullScreen()
  PlayUITrans(hitTips, "in")
  hitTips.onClick:Set(function()
    hitTips.touchable = false
    PlayUITrans(hitTips, "out", function()
      hitTips:Dispose()
      hitTips = nil
    end)
  end)
end

function Activity12MiniGameWindow.ShowGameOverTips(fail, callBack)
  local oldTips = uis.Main.root:GetChild("gameOverTips")
  if oldTips then
    oldTips:Dispose()
  end
  local hitTips = UIMgr:CreateObject("ActivityDungeon1012", "MiniComplete")
  hitTips.name = "gameOverTips"
  UIUtil.SetText(hitTips, fail and T(1954) or T(1943), "WordTxt")
  hitTips:SetSize(uis.root.width, uis.root.height)
  uis.Main.root:AddChild(hitTips)
  uis.Main.root:MakeFullScreen()
  PlayUITrans(hitTips, "in")
  uis.Main.root.touchable = false
  LeanTween.delayedCall(0.75, function()
    hitTips.touchable = false
    PlayUITrans(hitTips, "out", function()
      hitTips:Dispose()
      hitTips = nil
      callBack()
      uis.Main.root.touchable = true
    end)
  end)
end

function Activity12MiniGameWindow.CheckEqual()
  for i = 1, #columnInfo do
    if #columnInfo[i].info == oneColumnCount then
      for index = 1, oneColumnCount do
        if columnInfo[i].info[1].type ~= columnInfo[i].info[index].type then
          return false
        end
      end
    else
      return false
    end
  end
  return true
end

function Activity12MiniGameWindow.CheckGameOver()
  local equal = Activity12MiniGameWindow.CheckEqual()
  if equal then
    local fail = false
    for i = 1, #columnInfo do
      if columnInfo[i].type ~= columnInfo[i].info[1].type then
        fail = true
      end
    end
    Activity12MiniGameWindow.ShowGameOverTips(fail, function()
      OpenWindow(WinResConfig.Activity12MiniGameSubmitWindow.name, nil, math.ceil(Time.time - curGameTime), difficultyData.id, fail)
    end)
  end
end

function Activity12MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(1945), {
      touchCallback = function()
        Activity12_MiniGameService.MiniGameSubmitReq({}, 0, nil, function()
          UIMgr:CloseToWindow(WinResConfig.Activity12MiniGameMainWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity12MiniGameWindow.GetCurDifficulty(haveData)
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  for i, v in pairs(data) do
    if v.game_id == Activity12_MiniGameData.gameId then
      table.insert(difficulty, v)
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
  return difficulty[len]
end

function Activity12MiniGameWindow.Next()
  local root = uis.Main.ArrangeRegion.StripList:GetChildAt(0)
  if root and root.numChildren > 0 then
    root:RemoveChildren(0, -1, true)
  end
  Activity12MiniGameWindow.UpdateInfo()
end

function Activity12MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  selectCol, selectIndex = nil, nil
  columnInfo, moveInfo = nil, nil
  oneColumnCount, difficultyData = nil, nil
end

function Activity12MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity12_MiniGame.RESET then
    Activity12MiniGameWindow.Next()
  end
end

return Activity12MiniGameWindow
