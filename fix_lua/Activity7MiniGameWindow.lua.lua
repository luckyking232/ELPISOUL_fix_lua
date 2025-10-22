require("ActivityDungeon1006_MiniGameStartWindowByName")
local Activity7MiniGameWindow = {}
local uis, contentPane, curGameTime, combTime, combNum, isPause
local rowNum = 7
local columNum = 10
local guideWaitTime = 5
local comboWaitTime = 3.25
local xMove, yMove, gridMap, randomMax, tweener, maps, lineCom, oneItemInfo, twoItemInfo, lineType, oneLineType, twoLinePos, hitTime, tipsInfo1, tipsInfo2, stageId
local LineDirectionEnum = {
  vertical = 1,
  horizontal = 2,
  leftDown = 3,
  leftUp = 4,
  rightUp = 5,
  rightDown = 6
}

function Activity7MiniGameWindow.ReInitData()
end

function Activity7MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity7MiniGameWindow.package, WinResConfig.Activity7MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1006_MiniGameStartWindowUis(contentPane)
    uis.Main.ReturnBtn.alpha = 0
    uis.Main.Integral.root.alpha = 0
    xMove, yMove = 82, 82
    OpenWindow(WinResConfig.Activity7MiniGameCountdownWindow.name)
    uis.Main.Integral.TimeTxt.text = Activity7MiniGameWindow.GetGameTime()
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1006/MiniGame_1001"
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity7MiniGameWindow.InitBtn()
  end)
end

function Activity7MiniGameWindow.UpdateInfo()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity7_MiniGameData.GetMiniGameInfo()
  curGameTime = Time.time
  tipsInfo1, tipsInfo2 = nil, nil
  if activityInfo and info then
    local difficultyData = Activity7MiniGameWindow.GetCurDifficulty(info.extraCount)
    if difficultyData then
      hitTime = Time.time
      stageId = difficultyData.id
      local number = info.extraCount[1] or 0
      Activity7MiniGameWindow.InitAllMap(difficultyData, number % 4)
      Activity7MiniGameWindow.CreateItem()
      Activity7MiniGameWindow.CreateLine()
    end
  end
  UpdateManager.AddUpdateHandler(Activity7MiniGameWindow.Update)
end

function Activity7MiniGameWindow.Update()
  if isPause then
    return
  end
  uis.Main.Integral.TimeTxt.text = Activity7MiniGameWindow.GetGameTime(Time.time - curGameTime)
  if Time.time - hitTime > guideWaitTime and nil == tipsInfo1 and nil == tipsInfo2 then
    tipsInfo1, tipsInfo2 = Activity7MiniGameWindow.CheckCanLine()
    if tipsInfo1 and tipsInfo2 then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_llk_help")
      hitTime = Time.time
      if maps[tipsInfo1.x][tipsInfo1.y] then
        local controller = maps[tipsInfo1.x][tipsInfo1.y].item:GetController("c2")
        if controller and 0 == controller.selectedIndex then
          ChangeUIController(maps[tipsInfo1.x][tipsInfo1.y].item, "c1", 1)
        end
      end
      if maps[tipsInfo2.x][tipsInfo2.y] then
        local controller = maps[tipsInfo2.x][tipsInfo2.y].item:GetController("c2")
        if controller and 0 == controller.selectedIndex then
          ChangeUIController(maps[tipsInfo2.x][tipsInfo2.y].item, "c1", 1)
        end
      end
    end
  end
end

function Activity7MiniGameWindow.HiedTipsEffect(bol)
  if tipsInfo1 and tipsInfo2 then
    hitTime = Time.time
    if oneItemInfo and oneItemInfo.x == tipsInfo1.x and oneItemInfo.y == tipsInfo1.y then
      ChangeUIController(maps[tipsInfo1.x][tipsInfo1.y].item, "c1", 0)
      ChangeUIController(maps[tipsInfo2.x][tipsInfo2.y].item, "c1", bol and 0 or 1)
    elseif oneItemInfo and oneItemInfo.x == tipsInfo2.x and oneItemInfo.y == tipsInfo2.y then
      ChangeUIController(maps[tipsInfo1.x][tipsInfo1.y].item, "c1", bol and 0 or 1)
      ChangeUIController(maps[tipsInfo2.x][tipsInfo2.y].item, "c1", 0)
    else
      ChangeUIController(maps[tipsInfo1.x][tipsInfo1.y].item, "c1", 0)
      ChangeUIController(maps[tipsInfo2.x][tipsInfo2.y].item, "c1", 0)
      tipsInfo1 = nil
      tipsInfo2 = nil
    end
    if bol then
      tipsInfo1 = nil
      tipsInfo2 = nil
    end
  end
end

function Activity7MiniGameWindow.InitAllMap(difficultyData, canBottom)
  local mapData = TableData.GetConfig(difficultyData.site[math.random(1, #difficultyData.site)], "BaseActivityGameMap")
  local rowStr = Split(mapData.item_site, "|")
  print(#rowStr, ">>>>>>>>>>>>>>>>>>>", mapData.id, difficultyData.id)
  if #rowStr == rowNum then
    local allCtr = table.randomx(0, 15, difficultyData.type_item)
    local tempMap = {}
    gridMap = {}
    local num = 0
    local allNum, ctrIndex = 0, 1
    for y = 1, rowNum do
      tempMap[y] = tempMap[y] or {}
      for x = 1, columNum do
        tempMap[y][x] = -1
      end
      local arr = Split(rowStr[y], ":")
      if #arr > 0 then
        for i = 1, #arr do
          local ind = tonumber(arr[i])
          if ind then
            num = num + 1
            if nil == allCtr[ctrIndex] then
              ctrIndex = ctrIndex - math.random(1, #allCtr - 1)
            end
            tempMap[y][ind] = allCtr[ctrIndex]
            allNum = allNum + 1
            if 0 == allNum % 2 then
              ctrIndex = ctrIndex + 1
            end
          end
        end
      end
    end
    local haveTb = {}
    local CanChange = function(x, y)
      for i, v in pairs(haveTb) do
        if v.x == x and v.y == y then
          return false
        end
      end
      return true
    end
    if difficultyData.bottom_num and canBottom and 0 == canBottom then
      local next = true
      local twoIndex = 0
      local ind = math.floor(num / (difficultyData.bottom_num + 3))
      ind = 0 == ind % 2 and ind - 1 or ind
      ind = ind > 5 and 5 or ind
      for x = 1, rowNum do
        for y = 1, columNum do
          local temp = tempMap[x][y]
          if -1 ~= temp then
            twoIndex = twoIndex + 1
            if 0 ~= twoIndex % ind and next then
            else
              if 0 == twoIndex % ind then
                next = false
              else
                next = true
              end
              table.insert(haveTb, {x = x, y = y})
            end
          end
        end
      end
      print(">>>触发保底>>>", ind)
    end
    for x = 1, rowNum do
      for y = 1, columNum do
        local temp = tempMap[x][y]
        if -1 ~= temp and CanChange(x, y) then
          randomMax = 0
          local randomRow, randomColum = Activity7MiniGameWindow.GetRandomIndex(tempMap)
          if -1 ~= tempMap[randomRow][randomColum] and CanChange(randomRow, randomColum) then
            tempMap[x][y] = tempMap[randomRow][randomColum]
            tempMap[randomRow][randomColum] = temp
          end
        end
      end
    end
    for x = 1, rowNum + 2 do
      for y = 1, columNum + 2 do
        gridMap[x] = gridMap[x] or {}
        if 1 == x or 1 == y or x == rowNum + 2 or y == columNum + 2 then
          gridMap[x][y] = -1
        else
          gridMap[x][y] = tempMap[x - 1][y - 1]
        end
      end
    end
  end
end

function Activity7MiniGameWindow.CreateItem()
  local tb = {}
  maps = {}
  for x = 1, rowNum + 2 do
    for y = 1, columNum + 2 do
      maps[x] = maps[x] or {}
      if -1 ~= gridMap[x][y] then
        local animItem = UIMgr:CreateObject("ActivityDungeon1006", "MiniStart_ItemAni")
        local item = animItem:GetChild("Item")
        item.alpha = 0
        ChangeUIController(item, "item", gridMap[x][y])
        uis.Main.CreateRegion.root:AddChild(animItem)
        local posX = (y - 2) * xMove
        local posY = (x - 2) * yMove
        animItem:SetXY(posX, posY)
        table.insert(tb, {x = x, y = y})
        maps[x][y] = {
          root = animItem,
          item = item,
          x = x,
          y = y,
          posX = posX,
          posY = posY,
          value = gridMap[x][y]
        }
        item.onClick:Set(function()
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_llk_select")
          if oneItemInfo and nil == twoItemInfo and oneItemInfo.x == x and oneItemInfo.y == y then
            return
          end
          hitTime = Time.time
          oneLineType, twoLinePos = nil, nil
          combTime = combTime or 0
          ChangeUIController(item, "c2", 1)
          if nil == oneItemInfo then
            oneItemInfo = {
              root = animItem,
              item = item,
              x = x,
              y = y,
              posX = posX,
              posY = posY,
              value = gridMap[x][y]
            }
            Activity7MiniGameWindow.HiedTipsEffect()
          elseif oneItemInfo and nil == twoItemInfo then
            twoItemInfo = {
              root = animItem,
              item = item,
              x = x,
              y = y,
              posX = posX,
              posY = posY,
              value = gridMap[x][y]
            }
            if oneItemInfo.value == twoItemInfo.value and Activity7MiniGameWindow.IsLink(oneItemInfo.x, twoItemInfo.x, oneItemInfo.y, twoItemInfo.y) then
              Activity7MiniGameWindow.HiedTipsEffect(true)
              SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_llk_act")
              UIUtil.SetHolderCenter(twoItemInfo.item:GetChild("Effect2Holder"))
              UIUtil.SetHolderCenter(oneItemInfo.item:GetChild("Effect2Holder"))
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/FX_minigame008_flash.prefab", twoItemInfo.item:GetChild("Effect2Holder"))
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/FX_minigame008_flash.prefab", oneItemInfo.item:GetChild("Effect2Holder"))
              PlayUITrans(oneItemInfo.root, "clear", nil, 0.2)
              local teamOne = SimpleCopy(oneItemInfo)
              local teamTwo = SimpleCopy(oneItemInfo)
              PlayUITrans(twoItemInfo.root, "clear", function()
                teamOne.item:Dispose()
                teamTwo.item:Dispose()
                teamOne, teamTwo = nil, nil
              end, 0.2)
              Activity7MiniGameWindow.ShowLine(function()
                tipsInfo1, tipsInfo2 = nil, nil
                maps[x][y].value = -1
                gridMap[twoItemInfo.x][twoItemInfo.y] = -1
                gridMap[oneItemInfo.x][oneItemInfo.y] = -1
                oneItemInfo, twoItemInfo = nil, nil
                if Time.time - combTime < comboWaitTime then
                  combNum = combNum or 0
                  combNum = combNum + 1
                  Activity7MiniGameWindow.PlayComb()
                else
                  combNum = 0
                end
                combTime = Time.time
                Activity7MiniGameWindow.OnGameOver()
              end)
            else
              ChangeUIController(oneItemInfo.item, "c2", 0)
              oneItemInfo = {
                item = item,
                x = x,
                y = y,
                posX = posX,
                posY = posY,
                value = gridMap[x][y]
              }
              Activity7MiniGameWindow.HiedTipsEffect()
              twoItemInfo = nil
            end
          end
        end)
      else
        maps[x][y] = {
          x = x,
          y = y,
          posX = (y - 2) * xMove,
          posY = (x - 2) * yMove,
          value = gridMap[x][y]
        }
      end
    end
  end
  local newTb = table.randomSort(tb)
  local max = #newTb
  uis.Main.CreateRegion.root.touchable = false
  for i = 1, max do
    if i == max then
      PlayUITrans(maps[newTb[i].x][newTb[i].y].root, "up", function()
        uis.Main.CreateRegion.root.touchable = true
      end, i * 0.02)
    else
      PlayUITrans(maps[newTb[i].x][newTb[i].y].root, "up", nil, i * 0.02)
    end
  end
end

function Activity7MiniGameWindow.PlayComb()
  local item = UIMgr:CreateObject("ActivityDungeon1006", "MiniStart_EffectTipsAni")
  uis.Main.root:AddChild(item)
  item:SetXY(uis.Main.root.width / 2 + item.width / 2, uis.Main.root.height / 2 + item.height / 2)
  local Tips = item:GetChild("Tips")
  UIUtil.SetText(Tips, T(1782, combNum), "WordTxt")
  ChangeUIController(Tips, "c1", combNum < 4 and combNum - 1 or 3)
  PlayUITrans(item, "up", function()
    item:Dispose()
  end)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_llk_notif")
end

function Activity7MiniGameWindow.ShowLine(callBack)
  local lineOff = 10
  local line, line2
  if 1 == lineType then
    local w = math.abs(twoItemInfo.posX - oneItemInfo.posX)
    line = lineCom[2]
    uis.Main.CreateRegion.root:AddChild(line)
    line:SetSize(w, line.height)
    local x = math.min(twoItemInfo.posX, oneItemInfo.posX) + xMove / 2
    local y = twoItemInfo.posY + yMove / 2 - lineOff
    line:SetXY(x, y)
  elseif 2 == lineType then
    local h = math.abs(twoItemInfo.posY - oneItemInfo.posY)
    line = lineCom[1]
    uis.Main.CreateRegion.root:AddChild(line)
    line:SetSize(line.width, h)
    local y = math.min(twoItemInfo.posY, oneItemInfo.posY) + yMove / 2
    local x = twoItemInfo.posX + xMove / 2 - lineOff
    line:SetXY(x, y)
  elseif 3 == lineType and oneLineType then
    line = lineCom[oneLineType]
    if line then
      uis.Main.CreateRegion.root:AddChild(line)
      local h, w, x, y = Activity7MiniGameWindow.GetCornerLineInfo(oneItemInfo, twoItemInfo, oneLineType)
      line:SetSize(w, h)
      line:SetXY(x, y)
    end
  elseif 4 == lineType and oneLineType and twoLinePos then
    local tempInfo = maps[twoLinePos.x][twoLinePos.y]
    print(tempInfo.x, tempInfo.x, ">>>>>>>>>点1>>>>>>>>>>>>>>>>", oneLineType, "<<<<", twoLinePos.x, twoLinePos.y)
    line = lineCom[oneLineType]
    if line then
      uis.Main.CreateRegion.root:AddChild(line)
      local h, w, x, y = Activity7MiniGameWindow.GetCornerLineInfo(tempInfo, twoItemInfo, oneLineType)
      line:SetSize(w, h)
      line:SetXY(x, y)
    end
    local testType, changeLeft
    local newPos = {}
    if tempInfo.x == oneItemInfo.x then
      newPos = {
        x = twoItemInfo.x,
        y = tempInfo.y
      }
      testType = Activity7MiniGameWindow.CanCornerOne(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
      if nil == testType or testType == oneLineType then
        testType = Activity7MiniGameWindow.CanCornerTwo(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
      end
      if nil == testType and Activity7MiniGameWindow.X_Link(newPos.y, oneItemInfo.y, newPos.x) then
        newPos.x = twoItemInfo.x
        testType = Activity7MiniGameWindow.CanCornerOne(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
        if nil == testType or testType == oneLineType then
          testType = Activity7MiniGameWindow.CanCornerTwo(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
        end
      end
      print(tempInfo.x, tempInfo.y, newPos.x, newPos.y, ">>>>>>左右>>>小于>>>>>>>>点2>>>>>>>>", "oneLineType>>", oneLineType, testType)
    elseif tempInfo.y == oneItemInfo.y then
      newPos = {
        x = tempInfo.x,
        y = twoItemInfo.y
      }
      testType = Activity7MiniGameWindow.CanCornerOne(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
      if nil == testType or testType == oneLineType then
        testType = Activity7MiniGameWindow.CanCornerTwo(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
      end
      if nil == testType or Activity7MiniGameWindow.Y_Link(newPos.x, oneItemInfo.x, newPos.y) then
        newPos.y = twoItemInfo.y
        testType = Activity7MiniGameWindow.CanCornerOne(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
        if nil == testType or testType == oneLineType then
          testType = Activity7MiniGameWindow.CanCornerTwo(newPos.x, newPos.y, oneItemInfo.x, oneItemInfo.y)
        end
      end
      changeLeft = true
      print(tempInfo.x, tempInfo.y, newPos.x, newPos.y, ">>>>>>上下>>>小于>>>>>>>>点2>>>>>>>>", "oneLineType>>", oneLineType, testType)
    end
    line2 = nil
    if testType and lineCom[testType] then
      tempInfo = maps[newPos.x][newPos.y]
      line2 = lineCom[testType]
      uis.Main.CreateRegion.root:AddChild(line2)
      local h, w, x, y = Activity7MiniGameWindow.GetCornerLineInfo(tempInfo, oneItemInfo, testType)
      line2:SetSize(w, h)
      line2:SetXY(x, y)
      if changeLeft then
        if line.x < line2.x then
          line:SetSize(20, line.height)
        else
          line2:SetSize(20, line2.height)
        end
      elseif line.y < line2.y then
        line:SetSize(line.width, 20)
      else
        line2:SetSize(line2.width, 20)
      end
    end
  end
  if tweener then
    LeanTween.cancel(tweener.uniqueId)
    tweener = nil
  end
  if line then
    line.visible = true
    line:TweenFade(0, 0.05):SetDelay(0.28):OnComplete(function()
      if line then
        line.visible = false
        line.alpha = 1
        uis.Main.root:AddChild(line)
      end
    end)
  end
  if line2 then
    line2.visible = true
    line2:TweenFade(0, 0.05):SetDelay(0.28):OnComplete(function()
      if line2 then
        line2.visible = false
        line2.alpha = 1
        uis.Main.root:AddChild(line2)
      end
    end)
  end
  uis.Main.CreateRegion.root.touchable = false
  tweener = LeanTween.delayedCall(0.1, function()
    uis.Main.CreateRegion.root.touchable = true
    callBack()
  end)
end

function Activity7MiniGameWindow.GetCornerLineInfo(info1, info2, type)
  local lineOff = 10
  local h = math.abs(info1.posY - info2.posY)
  local w = math.abs(info1.posX - info2.posX)
  local x = math.min(info1.posX, info2.posX) + xMove / 2
  local y = math.min(info1.posY, info2.posY) + yMove / 2
  if type == LineDirectionEnum.rightDown then
    x = x + lineOff
    y = y + lineOff
  elseif type == LineDirectionEnum.rightUp then
    x = x + lineOff
    y = y - lineOff
  elseif type == LineDirectionEnum.leftUp then
    x = x - lineOff
    y = y - lineOff
  elseif type == LineDirectionEnum.leftDown then
    x = x - lineOff
    y = y + lineOff
  end
  return h, w, x, y
end

function Activity7MiniGameWindow.IsLink(x1, x2, y1, y2)
  if x1 == x2 and Activity7MiniGameWindow.X_Link(y1, y2, x1) then
    lineType = 1
    return true
  end
  if y1 == y2 and Activity7MiniGameWindow.Y_Link(x1, x2, y1) then
    lineType = 2
    return true
  end
  oneLineType = Activity7MiniGameWindow.OneCornerLink(x1, y1, x2, y2)
  if oneLineType then
    lineType = 3
    return true
  end
  oneLineType, twoLinePos = Activity7MiniGameWindow.TwoCornerLink(x1, y1, x2, y2)
  if oneLineType and twoLinePos then
    lineType = 4
    return true
  end
end

function Activity7MiniGameWindow.OneCornerLink(x1, y1, x2, y2)
  local t
  t = Activity7MiniGameWindow.CanCornerOne(x1, y1, x2, y2)
  if t then
    return t
  end
  t = Activity7MiniGameWindow.CanCornerTwo(x1, y1, x2, y2)
  if t then
    return t
  end
end

function Activity7MiniGameWindow.CanCornerOne(x1, y1, x2, y2)
  if gridMap[x1] and -1 == gridMap[x1][y2] and Activity7MiniGameWindow.X_Link(y1, y2, x1) and Activity7MiniGameWindow.Y_Link(x1, x2, y2) then
    if x1 < x2 and y2 < y1 then
      return LineDirectionEnum.leftUp
    elseif x1 < x2 and y1 < y2 then
      return LineDirectionEnum.rightUp
    elseif x2 < x1 and y1 < y2 then
      return LineDirectionEnum.rightDown
    elseif x2 < x1 and y2 < y1 then
      return LineDirectionEnum.leftDown
    end
  end
end

function Activity7MiniGameWindow.CanCornerTwo(x1, y1, x2, y2)
  if gridMap[x2] and -1 == gridMap[x2][y1] and Activity7MiniGameWindow.X_Link(y1, y2, x2) and Activity7MiniGameWindow.Y_Link(x1, x2, y1) then
    if x1 < x2 and y2 < y1 then
      return LineDirectionEnum.rightDown
    elseif x1 < x2 and y1 < y2 then
      return LineDirectionEnum.leftDown
    elseif x2 < x1 and y1 < y2 then
      return LineDirectionEnum.leftUp
    elseif x2 < x1 and y2 < y1 then
      return LineDirectionEnum.rightUp
    end
  end
end

function Activity7MiniGameWindow.TwoCornerLink(x1, y1, x2, y2)
  local t1, t2
  for i = y1 + 1, columNum + 2 do
    if -1 == gridMap[x1][i] then
      t1 = Activity7MiniGameWindow.OneCornerLink(x1, i, x2, y2)
      if t1 then
        t2 = {x = x1, y = i}
        return t1, t2
      end
    else
      break
    end
  end
  for i = y1 - 1, 1, -1 do
    if -1 == gridMap[x1][i] then
      t1 = Activity7MiniGameWindow.OneCornerLink(x1, i, x2, y2)
      if t1 then
        t2 = {x = x1, y = i}
        return t1, t2
      end
    else
      break
    end
  end
  for i = x1 + 1, rowNum + 2 do
    if -1 == gridMap[i][y1] then
      t1 = Activity7MiniGameWindow.OneCornerLink(i, y1, x2, y2)
      if t1 then
        t2 = {x = i, y = y1}
        return t1, t2
      end
    else
      break
    end
  end
  for i = x1 - 1, 1, -1 do
    if -1 == gridMap[i][y1] then
      t1 = Activity7MiniGameWindow.OneCornerLink(i, y1, x2, y2)
      if t1 then
        t2 = {x = i, y = y1}
        return t1, t2
      end
    else
      break
    end
  end
end

function Activity7MiniGameWindow.Y_Link(y1, y2, x1)
  if y2 < y1 then
    local n = y1
    y1 = y2
    y2 = n
  end
  for i = y1 + 1, y2 do
    if i == y2 then
      return true
    end
    if -1 ~= gridMap[i][x1] then
      break
    end
  end
  return false
end

function Activity7MiniGameWindow.X_Link(x1, x2, y2)
  if x2 < x1 then
    local n = x1
    x1 = x2
    x2 = n
  end
  for i = x1 + 1, x2 do
    if i == x2 then
      return true
    end
    if -1 ~= gridMap[y2][i] then
      break
    end
  end
  return false
end

function Activity7MiniGameWindow.GetRandomIndex(mapTable)
  local randomRow = math.random(1, rowNum)
  local randomColum = math.random(1, columNum)
  if -1 == mapTable[randomRow][randomColum] then
    if randomMax < 4 then
      return Activity7MiniGameWindow.GetRandomIndex(mapTable)
    end
    randomMax = randomMax + 1
  end
  return randomRow, randomColum
end

function Activity7MiniGameWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return "00\"00"
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  local mStr = "00"
  local sStr = LuaUtil.FormatNum(t % 60, "00")
  if minutes > 0 then
    mStr = LuaUtil.FormatNum(minutes, "00")
  end
  return string.format("%s\"%s", mStr, sStr)
end

function Activity7MiniGameWindow.GetCurDifficulty(haveData)
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  for i, v in pairs(data) do
    if v.game_id == 70441008 then
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

function Activity7MiniGameWindow.CreateLine()
  lineCom = {}
  local path = {
    "MiniStart_Line1",
    "MiniStart_Line3",
    "MiniStart_Line2-1",
    "MiniStart_Line2-2",
    "MiniStart_Line2-3",
    "MiniStart_Line2-4"
  }
  for i = 1, #path do
    lineCom[i] = UIMgr:CreateObject("ActivityDungeon1006", path[i])
    lineCom[i].visible = false
    uis.Main.root:AddChild(lineCom[i])
  end
end

function Activity7MiniGameWindow.CheckCanLine()
  local linkData = {}
  for x = 1, rowNum + 2 do
    for y = 1, columNum + 2 do
      if -1 ~= gridMap[x][y] then
        local value = gridMap[x][y]
        linkData[value] = linkData[value] or {}
        table.insert(linkData[value], {x = x, y = y})
      end
    end
  end
  for ctr, v in pairs(linkData) do
    local len = #v
    if 2 == len then
      if Activity7MiniGameWindow.IsLink(v[1].x, v[2].x, v[1].y, v[2].y) then
        return {
          x = v[1].x,
          y = v[1].y
        }, {
          x = v[2].x,
          y = v[2].y
        }
      end
    else
      local index = 1
      local fPos = v[index]
      while fPos and len > index do
        for i = index + 1, len do
          if v[i] and Activity7MiniGameWindow.IsLink(fPos.x, v[i].x, fPos.y, v[i].y) then
            return {
              x = fPos.x,
              y = fPos.y
            }, {
              x = v[i].x,
              y = v[i].y
            }
          end
        end
        index = index + 1
        fPos = v[index]
      end
    end
  end
end

function Activity7MiniGameWindow.ChangeMap()
  local allItem = {}
  for x = 1, rowNum + 2 do
    for y = 1, columNum + 2 do
      if -1 ~= gridMap[x][y] then
        table.insert(allItem, {
          x = x,
          y = y,
          value = gridMap[x][y]
        })
      end
    end
  end
  if table.getLen(allItem) < 2 then
    return true
  end
  local newTb = table.randomSort(SimpleCopy(allItem))
  local tb = {}
  for i = 1, #newTb do
    local temp = newTb[i]
    local info = allItem[i]
    gridMap[info.x][info.y] = temp.value
    maps[info.x][info.y].value = temp.value
    ChangeUIController(maps[info.x][info.y].item, "item", temp.value)
    table.insert(tb, {
      x = info.x,
      y = info.y
    })
  end
  if not Activity7MiniGameWindow.CheckCanLine() then
    if randomMax > 100 then
      return
    end
    randomMax = randomMax + 1
    Activity7MiniGameWindow.ChangeMap()
  else
    local newSortTb = table.randomSort(tb)
    local max = #newSortTb
    uis.Main.CreateRegion.root.touchable = false
    for i = 1, max do
      maps[newSortTb[i].x][newSortTb[i].y].item.alpha = 0
      if i == max then
        PlayUITrans(maps[newSortTb[i].x][newSortTb[i].y].root, "up", function()
          uis.Main.CreateRegion.root.touchable = true
        end, i * 0.02)
      else
        PlayUITrans(maps[newSortTb[i].x][newSortTb[i].y].root, "up", nil, i * 0.02)
      end
    end
  end
end

function Activity7MiniGameWindow.CheckGameOver()
  for x = 1, rowNum + 2 do
    for y = 1, columNum + 2 do
      gridMap[x] = gridMap[x] or {}
      if -1 ~= gridMap[x][y] then
        return false
      end
    end
  end
  return true
end

function Activity7MiniGameWindow.OnGameOver()
  if Activity7MiniGameWindow.CheckGameOver() then
    UpdateManager.RemoveUpdateHandler(Activity7MiniGameWindow.Update)
    uis.Main.ReturnBtn.touchable = false
    LeanTween.delayedCall(0.35, function()
      OpenWindow(WinResConfig.Activity7MiniGameSubmitWindow.name, nil, Time.time - curGameTime, stageId)
      uis.Main.ReturnBtn.alpha = 0
      uis.Main.ReturnBtn.touchable = true
      uis.Main.Integral.root.alpha = 0
    end)
  elseif not Activity7MiniGameWindow.CheckCanLine() then
    randomMax = 0
    Activity7MiniGameWindow.ChangeMap()
    FloatTipsUtil.ShowWarnTips(T(1787))
  end
end

function Activity7MiniGameWindow.OnNext()
  if uis.Main.CreateRegion.root.numChildren > 0 then
    uis.Main.CreateRegion.root:RemoveChildren(0, -1, true)
  end
  if lineCom then
    for i, v in pairs(lineCom) do
      v:Dispose()
    end
  end
  Activity7MiniGameWindow.UpdateInfo()
  PlayUITrans(uis.Main.root, "up", function()
    uis.Main.root.touchable = true
  end)
end

function Activity7MiniGameWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    MessageBox.Show(T(1792), {
      touchCallback = function()
        Activity7_MiniGameService.MiniGameSubmitReq({}, 0, nil, function()
          UIMgr:CloseToWindow(WinResConfig.Activity7MiniGameMainWindow.name)
          UIMgr:CloseWindow(WinResConfig.Activity7MiniGameWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity7MiniGameWindow.OnClose()
  if tweener then
    LeanTween.cancel(tweener.uniqueId)
    tweener = nil
  end
  UpdateManager.RemoveUpdateHandler(Activity7MiniGameWindow.Update)
  uis = nil
  contentPane = nil
  curGameTime = nil
  tipsInfo1, tipsInfo2 = nil, nil
  combTime, combNum = nil, nil
  xMove, yMove = nil, nil
  gridMap, randomMax = nil, nil
  maps = nil
  lineCom = nil
  oneItemInfo = nil
  twoItemInfo = nil
  lineType = nil
  oneLineType = nil
  tipsInfo1 = nil
  hitTime = nil
  tipsInfo2 = nil
  stageId = nil
end

function Activity7MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity7_MiniGame.RESET then
  elseif msgId == WindowMsgEnum.Activity7_MiniGame.START_GAME then
    Activity7MiniGameWindow.OnNext()
  end
end

return Activity7MiniGameWindow
