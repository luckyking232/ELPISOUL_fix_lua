require("ActivityDungeon1008_MiniGameStartWindowByName")
local Activity9MiniGameWindow = {}
local uis, contentPane, stageData
local itemData = {}
local timeData = {}
local timeItemInfo = {}
local maxLine = 26
local gridWidth = 36
local eatWidth = 35
local guideCom, mapCom, mapFollowTwwen, moveTwwen, deathTwwen
local invincibilityTime = 4
local mapInfo, mapCenterPos, chrInfo, mapRect, hp, revivePos, score
local guguPath = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame009_1/MiniGame_010_monster.prefab"
local slmPath = "Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame009_1/MiniGame_010_char.prefab"
local curDir, neighborGrid, lastDir, isDeath, slmNum, gamePaused, stopMove, notTouch, eatItemNum, tipsIndex
local speed = 4
local curTempInfo, tempInfo, moveDis, startXy, startTime, timeItmeIndex, selectedNum, curSpeed
local DirEnum = {
  None = 0,
  Right = 1,
  Down = 2,
  Left = 3,
  Up = 4
}
local JoyTypeEnum = {
  Four = 1,
  Left_Right = 2,
  UP_Down = 3
}
local dirAnimName = {
  [DirEnum.Right] = "_right",
  [DirEnum.Down] = "_down",
  [DirEnum.Left] = "_aleft",
  [DirEnum.Up] = "_up"
}
local arrTouchId
local GetXY = function(str)
  local arr = Split(str, ":")
  return {
    x = tonumber(arr[1]),
    y = tonumber(arr[2])
  }
end
local GetArrXY = function(str)
  local arrV2 = {}
  local arr = Split(str, "|")
  for i = 1, #arr do
    table.insert(arrV2, GetXY(arr[i]))
  end
  return arrV2
end
local CanMove = function(x, y)
  if mapInfo[x] then
    return mapInfo[x][y]
  end
end

function Activity9MiniGameWindow.ReInitData()
end

function Activity9MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniGameWindow.package, WinResConfig.Activity9MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniGameStartWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1008/MiniGame_1001"
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    stageData = bridgeObj.argTable[1]
    mapCenterPos = Vector2(uis.Main.MapRegion.root.width * 0.5, uis.Main.MapRegion.root.height * 0.5)
    itemData, timeData = Activity9MiniGameWindow.InitItemData()
    Activity9MiniGameWindow.InitBtn()
    Activity9MiniGameWindow.UpdateInfo()
  end)
end

function Activity9MiniGameWindow.UpdateInfo()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
  if stageData then
    local grid = Activity9_MiniGameGridsDataLoader.Load(string.format("Assets/Data/ActivityData/pacman_0%s.bytes", stageData.game_stage))
    mapCom = UIMgr:CreateObject("ActivityDungeon1008", "MiniGame_Map0" .. stageData.game_stage)
    uis.Main.MapRegion.root:AddChild(mapCom)
    hp = stageData.initial_hp
    curSpeed = stageData.gugu_speed or 100
    mapRect = {
      x = uis.Main.MapRegion.root.width - mapCom.width,
      y = uis.Main.MapRegion.root.height - mapCom.height
    }
    Activity9_MiniGameGridsDataLoader.Transform(grid, mapCom)
    mapInfo = {}
    score = 0
    gamePaused = false
    stopMove = false
    tipsIndex = 1
    uis.Main.Integral.Number1Txt.text = info.miniHighScore
    local item
    for i = 1, #grid do
      local x = grid[i].coordinate.x
      local y = grid[i].coordinate.y
      mapInfo[x] = mapInfo[x] or {}
      item = UIMgr:CreateObject("ActivityDungeon1008", "MiniStart_ItemAni")
      mapCom:AddChild(item)
      item:SetXY(grid[i].uiPosition.x, grid[i].uiPosition.y)
      mapInfo[x][y] = {
        canEat = true,
        root = item,
        item = item:GetChild("Item"),
        v2 = grid[i].coordinate,
        uiPosition = grid[i].uiPosition,
        walk = grid[i].playerWalkable,
        type = grid[i].playerWalkable and 0 or 10
      }
      ChangeUIController(mapInfo[x][y].item, "item", mapInfo[x][y].walk and 0 or 9)
      PlayUITrans(mapInfo[x][y].root, "appear")
    end
    notTouch = true
    Activity9MiniGameWindow.InitPosition()
    Activity9MiniGameWindow.SetCanEatNum()
    Activity9MiniGameWindow.RefreshHp()
    Activity9MiniGameWindow.RefreshScore()
    Activity9MiniGameWindow.RefreshJoystick()
    Activity9MiniGameWindow.MapCenterFollow(false)
    slmNum = #revivePos
    startTime = Time.time
    timeItmeIndex = 1
    timeItemInfo = {}
    PlayUITrans(mapCom:GetChild("Gate"), "open", nil, 0.25)
    UpdateManager.AddUpdateHandler(Activity9MiniGameWindow.Update)
  end
end

function Activity9MiniGameWindow.SetCanEatNum()
  eatItemNum = 0
  for x = 1, maxLine do
    for y = 1, maxLine do
      if mapInfo[x][y] and mapInfo[x][y].type < 2 and mapInfo[x][y].canEat then
        eatItemNum = eatItemNum + 1
      end
    end
  end
end

function Activity9MiniGameWindow.MonsterNew(spine, data, info)
  local monster = {}
  monster.spine = spine
  monster.path = {}
  monster.info = info
  monster.type = data.type
  monster.name = data.skinName
  monster.lastPath = Vector2.zero
  SkeletonAnimationUtil.SetSkin(spine, data.skinName)
  monster.curAnimation = ""
  monster.v2 = info.v2
  monster.pathIndex = 2
  monster.twwen = nil
  monster.time = Time.time
  monster.myInfo = nil
  monster.modeType = 0
  local timeUp = GetArrXY(data.speedUp)
  local modeData = GetArrXY(data.mode)
  local modeIndex = 1
  local modePos = GetArrXY(data.mode_coordinate)
  monster.speed = 100
  monster.gridDis = 8
  monster.fearMode = false
  monster.fearModeIndex = 0
  monster.fearModeTime = Time.time
  monster.scareSpeed = data.scare_speed
  monster.scareTime = data.scare_time
  local randomTime = 3
  local guInfo
  
  function monster:Control()
    if data.time and Time.time - monster.time > data.time then
      monster:AutoMove()
    end
    if 0 == Time.frameCount % 5 then
      monster:TimeUp()
      monster:ChangeMode()
    end
  end
  
  function monster:GetDeathScore()
    if data.points[monster.fearModeIndex] then
      return data.points[monster.fearModeIndex]
    end
    return data.points[#data.points]
  end
  
  function monster:EnterDeath()
    SkeletonAnimationUtil.SetSkin(spine, "ghost")
    monster.fearMode = false
    monster.modeType = 3
    monster:StopTwwen()
    monster:AutoMove()
  end
  
  function monster:TimeUp()
    if timeUp and not monster.fearMode and 3 ~= monster.modeType then
      if 4 == data.type and 0 == math.floor((Time.time - monster.time) % randomTime) then
        monster.gridDis = math.random(0, 8)
      end
      for i = 1, #timeUp do
        if timeUp[i].x and eatItemNum < timeUp[i].x and timeUp[i].y > monster.speed then
          monster.speed = timeUp[i].y
        end
      end
    end
  end
  
  function monster:ChangeMode()
    if monster.fearMode then
      if data.scare_time[monster.fearModeIndex] and Time.time - monster.fearModeTime > data.scare_time[monster.fearModeIndex] then
        monster.fearMode = false
        monster:TimeUp()
        monster:ChangeMode()
      end
    elseif 3 ~= monster.modeType then
      if modeData and modeData[modeIndex] and Time.time - monster.time > modeData[modeIndex].x then
        if Time.time - monster.time > modeData[modeIndex].x + modeData[modeIndex].y then
          modeIndex = modeIndex + 1
        else
          monster.modeType = 1
          return
        end
      end
      monster.modeType = 0
    end
  end
  
  function monster:SetAnimation(name, loop, track)
    if monster.curAnimation ~= name then
      SkeletonAnimationUtil.SetAnimation(monster.spine, track or 0, name, loop, 0, function()
      end)
      monster.curAnimation = name
    end
  end
  
  function monster:StopTwwen()
    if monster.twwen then
      monster.twwen:Kill()
      monster.twwen = nil
    end
  end
  
  function monster:GetTargetByDis(maxDis, startV2)
    local tb = {}
    for i = 1, maxDis do
      if CanMove(startV2.x + i, startV2.y) then
        tb[DirEnum.Right] = {
          x = startV2.x + i,
          y = startV2.y,
          num = i
        }
      else
        break
      end
    end
    for i = 1, maxDis do
      if CanMove(startV2.x, startV2.y - i) then
        tb[DirEnum.Down] = {
          x = startV2.x,
          y = startV2.y - i,
          num = i
        }
      else
        break
      end
    end
    for i = 1, maxDis do
      if CanMove(startV2.x - i, startV2.y) then
        tb[DirEnum.Left] = {
          x = startV2.x - i,
          y = startV2.y,
          num = i
        }
      else
        break
      end
    end
    for i = 1, maxDis do
      if CanMove(startV2.x, startV2.y + i) then
        tb[DirEnum.Up] = {
          x = startV2.x,
          y = startV2.y + i,
          num = i
        }
      else
        break
      end
    end
    return tb
  end
  
  function monster:Move()
    if monster.path and monster.path[monster.pathIndex] and monster.twwen == nil then
      local tp = monster.path[monster.pathIndex]
      local time = gridWidth / monster.speed
      local ind = math.floor(Vector2.Distance(mapInfo[tp.x][tp.y].uiPosition, info.root.xy) / gridWidth)
      if 1 ~= ind then
        if ind < 1 then
          monster.pathIndex = monster.pathIndex + 1
        elseif ind > 1 then
          monster.pathIndex = monster.pathIndex - (ind - 1)
        end
        tp = monster.path[monster.pathIndex]
      end
      if tp then
        monster:SetAnimation(monster.fearMode and "scare" or "walk", true)
        monster.twwen = monster.info.root:TweenMove(mapInfo[tp.x][tp.y].uiPosition, time):SetEase(EaseType.Linear):OnComplete(function()
          monster.pathIndex = monster.pathIndex + 1
          monster.twwen = nil
          if 0 == monster.modeType or 1 == monster.modeType then
            monster:AutoMove()
          end
          if monster.path and nil == monster.path[monster.pathIndex] then
            if 2 == monster.modeType then
              monster:AutoMove()
              return
            elseif 3 == monster.modeType then
              monster.modeType = 1
              SkeletonAnimationUtil.SetSkin(spine, data.skinName)
              monster:AutoMove()
              return
            end
            monster.path = {}
            monster.pathIndex = 0
            monster:SetAnimation(monster.fearMode and "idle_scare" or "idle", true)
          end
        end)
      end
    end
  end
  
  function monster:GetRootByType(type)
    if revivePos then
      for i = 1, #revivePos do
        if 1 == revivePos[i].class.type then
          return revivePos[i].class.info.root
        end
      end
    end
  end
  
  function monster:GetBlueTarget(maxDis)
    local tb = monster:GetTargetByDis(4, guInfo.v2)
    local maxNum = 0
    local tV2
    monster.myInfo = Activity9MiniGameWindow.GetGridByPos(monster.info.root.xy)
    if tb[lastDir] then
      maxNum = tb[lastDir].num
      tV2 = tb[lastDir]
    end
    for i = 1, 4 do
      if tb[i] and tb[i].num and maxNum < tb[i].num and (monster.myInfo.v2.x ~= tb[i].x or monster.myInfo.v2.y ~= tb[i].y) then
        maxNum = tb[i].num
        tV2 = {
          x = tb[i].x,
          y = tb[i].y
        }
      end
    end
    if tV2 and (monster.myInfo.v2.x ~= tV2.x or monster.myInfo.v2.y ~= tV2.y) then
      return tV2
    end
    return guInfo.v2
  end
  
  function monster:GetGreenTarget()
    local temp1Info
    local temp1Root = monster:GetRootByType(1)
    if temp1Root then
      temp1Info = Activity9MiniGameWindow.GetGridByPos(temp1Root.xy)
    end
    if guInfo and temp1Info then
      if lastDir == DirEnum.Right then
        if temp1Info.v2.y < guInfo.v2.y then
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x + 2, guInfo.v2.y + i) then
              return {
                x = guInfo.v2.x + 2,
                y = guInfo.v2.y + i
              }
            end
          end
        else
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x + 2, guInfo.v2.y - i) then
              return {
                x = guInfo.v2.x + 2,
                y = guInfo.v2.y - i
              }
            end
          end
        end
        for i = 2, 1, -1 do
          if CanMove(guInfo.v2.x + i, guInfo.v2.y) then
            return {
              x = guInfo.v2.x + i,
              y = guInfo.v2.y
            }
          end
        end
      elseif lastDir == DirEnum.Left then
        if temp1Info.v2.y < guInfo.v2.y then
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x - 2, guInfo.v2.y + i) then
              return {
                x = guInfo.v2.x - 2,
                y = guInfo.v2.y + i
              }
            end
          end
        else
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x - 2, guInfo.v2.y - i) then
              return {
                x = guInfo.v2.x - 2,
                y = guInfo.v2.y - i
              }
            end
          end
        end
        for i = 2, 1, -1 do
          if CanMove(guInfo.v2.x - i, guInfo.v2.y) then
            return {
              x = guInfo.v2.x - i,
              y = guInfo.v2.y
            }
          end
        end
      elseif lastDir == DirEnum.Up then
        if temp1Info.v2.x < guInfo.v2.x then
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x - i, guInfo.v2.y - 2) then
              return {
                x = guInfo.v2.x - i,
                y = guInfo.v2.y - 2
              }
            end
          end
        else
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x + i, guInfo.v2.y - 2) then
              return {
                x = guInfo.v2.x + i,
                y = guInfo.v2.y - 2
              }
            end
          end
        end
        for i = 2, 1, -1 do
          if CanMove(guInfo.v2.x, guInfo.v2.y - i) then
            return {
              x = guInfo.v2.x,
              y = guInfo.v2.y - i
            }
          end
        end
      elseif lastDir == DirEnum.Down then
        if temp1Info.v2.x < guInfo.v2.x then
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x - i, guInfo.v2.y + 2) then
              return {
                x = guInfo.v2.x - i,
                y = guInfo.v2.y + 2
              }
            end
          end
        else
          for i = 2, 1, -1 do
            if CanMove(guInfo.v2.x + i, guInfo.v2.y + 2) then
              return {
                x = guInfo.v2.x + i,
                y = guInfo.v2.y + 2
              }
            end
          end
        end
        for i = 2, 1, -1 do
          if CanMove(guInfo.v2.x, guInfo.v2.y + i) then
            return {
              x = guInfo.v2.x,
              y = guInfo.v2.y + i
            }
          end
        end
      end
    end
    return guInfo.v2
  end
  
  function monster:GetPinkTarget()
    monster.myInfo = Activity9MiniGameWindow.GetGridByPos(monster.info.root.xy)
    if monster.myInfo and (math.abs(monster.myInfo.v2.x - guInfo.v2.x) > monster.gridDis or math.abs(monster.myInfo.v2.y - guInfo.v2.y) > monster.gridDis) then
      return guInfo.v2
    end
    return modePos[1]
  end
  
  function monster:GetTarget()
    if 0 == monster.modeType then
      guInfo = Activity9MiniGameWindow.GetGridByPos(chrInfo.root.xy)
      if guInfo then
        if 1 == data.type then
          return guInfo.v2
        elseif 2 == data.type then
          return monster:GetBlueTarget()
        elseif 3 == data.type then
          return monster:GetGreenTarget()
        elseif 4 == data.type then
          return monster:GetPinkTarget()
        end
      end
    elseif 1 == monster.modeType then
      monster.myInfo = Activity9MiniGameWindow.GetGridByPos(monster.info.root.xy)
      if monster.myInfo and monster.myInfo.v2.x == modePos[1].x and modePos[1].y == monster.myInfo.v2.y then
        return modePos[#modePos]
      else
        return modePos[1]
      end
    elseif 2 == monster.modeType then
      monster.myInfo = Activity9MiniGameWindow.GetGridByPos(monster.info.root.xy)
      local fourV2 = monster:GetTargetByDis(maxLine, monster.myInfo.v2)
      local canHaveIndex = {}
      for i = 1, 4 do
        if fourV2[i] and fourV2[i].num then
          table.insert(canHaveIndex, i)
        end
      end
      local canIndex = math.random(1, #canHaveIndex)
      if canHaveIndex[canIndex] then
        return fourV2[canHaveIndex[canIndex]]
      end
      return modePos[1]
    elseif 3 == monster.modeType then
      return info.v2
    end
  end
  
  function monster:AutoMove()
    local targetV2 = monster:GetTarget()
    if targetV2 and monster.twwen == nil then
      monster.myInfo = Activity9MiniGameWindow.GetGridByPos(monster.info.root.xy)
      if monster.myInfo then
        monster.path = Activity9_MiniGameGridsDataLoader.GetPath(mapInfo, monster.myInfo.v2, targetV2)
        monster.pathIndex = 1
        monster:Move()
      end
    end
  end
  
  return monster
end

function Activity9MiniGameWindow.ItemNew(spine)
  local item = {}
  item.spine = spine
  item.curAnimation = ""
  
  function item:SetAnimation(name, loop)
    if item.curAnimation ~= name then
      SkeletonAnimationUtil.SetAnimation(item.spine, 0, name, loop, 0, function()
      end)
      item.curAnimation = name
    end
  end
  
  function item:PlayEatAnimation()
    SkeletonAnimationUtil.SetAnimation(item.spine, 1, "eat", false, 0, function()
    end)
  end
  
  return item
end

function Activity9MiniGameWindow.RefreshHp()
  uis.Main.Info1.NumberTxt.text = hp
end

function Activity9MiniGameWindow.RefreshScore()
  uis.Main.Integral.NumberTxt.text = score
  uis.Main.Info2.NumberTxt.text = eatItemNum
end

function Activity9MiniGameWindow.InitPosition()
  local guguV2 = GetXY(stageData.gugu_coordinate)
  chrInfo = mapInfo[guguV2.x][guguV2.y]
  if chrInfo then
    ChangeUIController(chrInfo.item, "item", 9)
    local spineObj = UIUtil.SetEffectToUI(guguPath, chrInfo.item:GetChild("EffectHolder"))
    SkeletonAnimationUtil.SetColor(spineObj, Color(1, 1, 1, 1))
    chrInfo.itemClass = Activity9MiniGameWindow.ItemNew(spineObj)
    chrInfo.itemClass:SetAnimation("idle_right", true)
    mapInfo[guguV2.x][guguV2.y].type = 12
  end
  if stageData.Revive_coordinate then
    local reviveArr = GetArrXY(stageData.Revive_coordinate)
    revivePos = {}
    for i = 1, #reviveArr do
      local info = mapInfo[reviveArr[i].x][reviveArr[i].y]
      if info then
        table.insert(revivePos, info)
        ChangeUIController(info.item, "item", 9)
      end
    end
  end
  if stageData.monster then
    for i = 1, #stageData.monster do
      local data = TableData.GetConfig(stageData.monster[i], "BaseActivityGameMonster")
      if data and revivePos[i] then
        local spineObj = UIUtil.SetEffectToUI(slmPath, revivePos[i].item:GetChild("EffectHolder"))
        revivePos[i].class = Activity9MiniGameWindow.MonsterNew(spineObj, data, revivePos[i])
        revivePos[i].class:SetAnimation("idle", true)
        mapCom:SetChildIndex(revivePos[i].root, mapCom.numChildren - 1)
      end
    end
  end
  if stageData.yellow_coordinate then
    local yellowArr = GetArrXY(stageData.yellow_coordinate)
    for i = 1, #yellowArr do
      local info = mapInfo[yellowArr[i].x][yellowArr[i].y]
      if info then
        ChangeUIController(info.item, "item", 1)
        mapInfo[yellowArr[i].x][yellowArr[i].y].type = 1
      end
    end
  end
  if stageData.Portal_coordinate then
    local portalArr = GetArrXY(stageData.Portal_coordinate)
    for i = 1, #portalArr do
      local info = mapInfo[portalArr[i].x][portalArr[i].y]
      if info then
        mapInfo[portalArr[i].x][portalArr[i].y].type = 8
        ChangeUIController(info.item, "item", 8)
      end
    end
  end
  if chrInfo then
    mapCom:SetChildIndex(chrInfo.root, mapCom.numChildren - 1)
  end
end

local GetMinPos = function(t)
  local minKey = 100000
  local index = 1
  for i, v in pairs(t) do
    if minKey > v.num then
      minKey = v.num
      index = i
    end
  end
  return t[index]
end

function Activity9MiniGameWindow.GetGridByPos(v2)
  local info, dis, minInfo
  minInfo = {}
  for x = 1, maxLine do
    for y = 1, maxLine do
      info = mapInfo[x][y]
      if info then
        dis = Vector2.Distance(info.uiPosition, v2)
        if dis <= gridWidth then
          table.insert(minInfo, {
            num = dis,
            x = x,
            y = y
          })
        end
      end
    end
  end
  info = GetMinPos(minInfo)
  if info then
    return mapInfo[info.x][info.y], minInfo
  end
end

function Activity9MiniGameWindow.Update()
  if gamePaused then
    return
  end
  if Input.GetKey(KeyCode.UpArrow) then
    Activity9MiniGameWindow.GetJoystickDirCom(DirEnum.Up)
  elseif Input.GetKey(KeyCode.RightArrow) then
    Activity9MiniGameWindow.GetJoystickDirCom(DirEnum.Right)
  elseif Input.GetKey(KeyCode.DownArrow) then
    Activity9MiniGameWindow.GetJoystickDirCom(DirEnum.Down)
  elseif Input.GetKey(KeyCode.LeftArrow) then
    Activity9MiniGameWindow.GetJoystickDirCom(DirEnum.Left)
  elseif Input.anyKey == false and notTouch then
    Activity9MiniGameWindow.GetJoystickDirCom(DirEnum.None)
  end
  Activity9MiniGameWindow.MapCenterFollow()
  Activity9MiniGameWindow.Move()
  Activity9MiniGameWindow.CreateTimeItem()
  Activity9MiniGameWindow.CheckScnceGuide()
  Activity9MiniGameWindow.MonsterControl()
  Activity9MiniGameWindow.CheckDeath()
end

function Activity9MiniGameWindow.GetJoystickDirCom(dir)
  local joyRoot, ctrRoot
  if 0 == selectedNum then
    joyRoot = uis.Main.Joystick1Left
    ctrRoot = {
      {
        ctr = joyRoot.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = joyRoot.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = joyRoot.Left.c1Ctr,
        dir = DirEnum.Left
      },
      {
        ctr = joyRoot.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  elseif 1 == selectedNum then
    joyRoot = uis.Main.Joystick2Right
    ctrRoot = {
      {
        ctr = joyRoot.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = joyRoot.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = joyRoot.Left.c1Ctr,
        dir = DirEnum.Left
      },
      {
        ctr = joyRoot.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  elseif 2 == selectedNum then
    ctrRoot = {
      {
        ctr = uis.Main.Joystick3Left.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = uis.Main.Joystick3Right.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = uis.Main.Joystick3Left.Left.c1Ctr,
        dir = DirEnum.Left
      },
      {
        ctr = uis.Main.Joystick3Right.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  elseif 3 == selectedNum then
    ctrRoot = {
      {
        ctr = uis.Main.Joystick4Right.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = uis.Main.Joystick4Light.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = uis.Main.Joystick4Right.Left.c1Ctr,
        dir = DirEnum.Left
      },
      {
        ctr = uis.Main.Joystick4Light.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  end
  for i = 1, #ctrRoot do
    ChangeController(ctrRoot[i].ctr, dir == ctrRoot[i].dir and 1 or 0)
  end
  curDir = dir
end

function Activity9MiniGameWindow.MonsterPaused(bol)
  for i = 1, slmNum do
    if revivePos[i].class.twwen then
      revivePos[i].class.twwen:SetPaused(bol)
    end
  end
end

function Activity9MiniGameWindow.CheckDeath()
  if nil == revivePos then
    return
  end
  for i = 1, slmNum do
    if Vector2.Distance(chrInfo.root.xy, revivePos[i].class.info.root.xy) < gridWidth then
      if revivePos[i].class.fearMode and 2 == revivePos[i].class.modeType then
        revivePos[i].class:EnterDeath()
        local addScore = revivePos[i].class:GetDeathScore()
        score = score + addScore
        Activity9MiniGameWindow.RefreshScore()
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_eat_ghost")
      elseif not isDeath and revivePos[i].class.modeType < 2 then
        revivePos[i].class:SetAnimation("eat", false)
        hp = hp - 1
        isDeath = true
        Activity9MiniGameWindow.RefreshHp()
        if hp < 1 then
          Activity9MiniGameWindow.OnGameOver(true)
        else
          FloatTipsUtil.ShowWarnTips(T(1881))
        end
        local name = "die_aleft"
        if lastDir == DirEnum.Up or lastDir == DirEnum.Down then
          name = "die_down"
        end
        stopMove = true
        chrInfo.itemClass:SetAnimation(name, false)
        LeanTween.delayedCall(1.5, function()
          stopMove = nil
          if chrInfo then
            chrInfo.itemClass:SetAnimation("idle" .. dirAnimName[lastDir], true)
            SkeletonAnimationUtil.SetColor(chrInfo.itemClass.spine, Color.red)
          end
          local targetSpeed = curSpeed
          local startSpeed = curSpeed * 1.5
          LeanTween.value(startSpeed, targetSpeed, 2):setOnUpdate(function(val)
            curSpeed = val
          end):setOnComplete(function()
            curSpeed = targetSpeed
          end)
        end)
        deathTwwen = LeanTween.delayedCall(invincibilityTime + 1.5, function()
          SkeletonAnimationUtil.SetColor(chrInfo.itemClass.spine, Color(1, 1, 1, 1))
          isDeath = nil
        end)
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_pacman_death")
        break
      end
    end
  end
end

function Activity9MiniGameWindow.MonsterControl()
  if revivePos then
    for i = 1, #revivePos do
      revivePos[i].class:Control()
    end
  end
end

function Activity9MiniGameWindow.MonsterEnterFearMode()
  local time
  if revivePos then
    for i = 1, #revivePos do
      revivePos[i].class.fearModeIndex = revivePos[i].class.fearModeIndex + 1
      if nil == time then
        time = revivePos[i].class.scareTime[revivePos[i].class.fearModeIndex]
      end
      if revivePos[i].class.modeType < 2 then
        revivePos[i].class.fearModeTime = Time.time
        if revivePos[i].class.scareSpeed[revivePos[i].class.fearModeIndex] then
          revivePos[i].class.speed = revivePos[i].class.scareSpeed[revivePos[i].class.fearModeIndex]
        end
        revivePos[i].class.modeType = 2
        revivePos[i].class.fearMode = true
      end
    end
  end
  return time
end

function Activity9MiniGameWindow.Move()
  if stopMove then
    return
  end
  if curDir and curDir ~= DirEnum.None then
    curTempInfo, neighborGrid = Activity9MiniGameWindow.GetGridByPos(chrInfo.root.xy)
    if curTempInfo then
      speed = Time.deltaTime * curSpeed
      if curDir == DirEnum.Right then
        tempInfo = CanMove(curTempInfo.v2.x + 1, curTempInfo.v2.y)
        if tempInfo and tempInfo.walk then
          moveDis = chrInfo.root.x + speed
          chrInfo.root:SetXY(moveDis, tempInfo.uiPosition.y)
        elseif nil == tempInfo and chrInfo.root.x <= curTempInfo.uiPosition.x then
          moveDis = math.min(chrInfo.root.x + speed, curTempInfo.uiPosition.x)
          if math.abs(chrInfo.root.x - curTempInfo.uiPosition.x) < 1 then
            local upInfo = CanMove(curTempInfo.v2.x + 1, curTempInfo.v2.y - 1)
            local downInfo = CanMove(curTempInfo.v2.x + 1, curTempInfo.v2.y + 1)
            if downInfo and upInfo then
              local disUp = chrInfo.root.y - upInfo.uiPosition.y
              local disDown = downInfo.uiPosition.y - chrInfo.root.y
              if disUp < disDown then
                chrInfo.root:SetXY(moveDis, math.max(chrInfo.root.y - speed / 2, upInfo.uiPosition.y))
              else
                chrInfo.root:SetXY(moveDis, math.min(chrInfo.root.y + speed / 2, downInfo.uiPosition.y))
              end
            elseif downInfo then
              chrInfo.root:SetXY(moveDis, math.min(chrInfo.root.y + speed / 2, downInfo.uiPosition.y))
            elseif upInfo then
              chrInfo.root:SetXY(moveDis, math.max(chrInfo.root.y - speed / 2, upInfo.uiPosition.y))
            end
          else
            chrInfo.root:SetXY(moveDis, chrInfo.root.y)
          end
        end
      elseif curDir == DirEnum.Left then
        tempInfo = CanMove(curTempInfo.v2.x - 1, curTempInfo.v2.y)
        if tempInfo and tempInfo.walk then
          moveDis = chrInfo.root.x - speed
          chrInfo.root:SetXY(moveDis, tempInfo.uiPosition.y)
        elseif nil == tempInfo and chrInfo.root.x <= curTempInfo.uiPosition.x then
          moveDis = math.max(chrInfo.root.x - speed, curTempInfo.uiPosition.x)
          if math.abs(chrInfo.root.x - curTempInfo.uiPosition.x) < 1 then
            local upInfo = CanMove(curTempInfo.v2.x - 1, curTempInfo.v2.y - 1)
            local downInfo = CanMove(curTempInfo.v2.x - 1, curTempInfo.v2.y + 1)
            if downInfo and upInfo then
              local disUp = chrInfo.root.y - upInfo.uiPosition.y
              local disDown = downInfo.uiPosition.y - chrInfo.root.y
              if disUp < disDown then
                chrInfo.root:SetXY(moveDis, math.max(chrInfo.root.y - speed / 2, upInfo.uiPosition.y))
              else
                chrInfo.root:SetXY(moveDis, math.min(chrInfo.root.y + speed / 2, downInfo.uiPosition.y))
              end
            elseif downInfo then
              chrInfo.root:SetXY(moveDis, math.min(chrInfo.root.y + speed / 2, downInfo.uiPosition.y))
            elseif upInfo then
              chrInfo.root:SetXY(moveDis, math.max(chrInfo.root.y - speed / 2, upInfo.uiPosition.y))
            end
          else
            chrInfo.root:SetXY(moveDis, chrInfo.root.y)
          end
        end
      elseif curDir == DirEnum.Up then
        tempInfo = CanMove(curTempInfo.v2.x, curTempInfo.v2.y - 1)
        if tempInfo and tempInfo.walk then
          moveDis = chrInfo.root.y - speed
          chrInfo.root:SetXY(tempInfo.uiPosition.x, moveDis)
        elseif nil == tempInfo and chrInfo.root.y >= curTempInfo.uiPosition.y then
          moveDis = math.max(chrInfo.root.y - speed, curTempInfo.uiPosition.y)
          if math.abs(chrInfo.root.y - curTempInfo.uiPosition.y) < 1 then
            local lInfo = CanMove(curTempInfo.v2.x - 1, curTempInfo.v2.y - 1)
            local rInfo = CanMove(curTempInfo.v2.x + 1, curTempInfo.v2.y - 1)
            if lInfo and rInfo then
              local disL = chrInfo.root.x - lInfo.uiPosition.x
              local disR = rInfo.uiPosition.x - chrInfo.root.x
              if disL < disR then
                chrInfo.root:SetXY(math.max(chrInfo.root.x - speed / 2, lInfo.uiPosition.x), moveDis)
              else
                chrInfo.root:SetXY(math.min(chrInfo.root.x + speed / 2, rInfo.uiPosition.x), moveDis)
              end
            elseif lInfo then
              chrInfo.root:SetXY(math.max(chrInfo.root.x - speed / 2, lInfo.uiPosition.x), moveDis)
            elseif rInfo then
              chrInfo.root:SetXY(math.min(chrInfo.root.x + speed / 2, rInfo.uiPosition.x), moveDis)
            end
          else
            chrInfo.root:SetXY(chrInfo.root.x, moveDis)
          end
        end
      elseif curDir == DirEnum.Down then
        tempInfo = CanMove(curTempInfo.v2.x, curTempInfo.v2.y + 1)
        if tempInfo and tempInfo.walk then
          moveDis = chrInfo.root.y + speed
          chrInfo.root:SetXY(tempInfo.uiPosition.x, moveDis)
        elseif nil == tempInfo and chrInfo.root.y <= curTempInfo.uiPosition.y then
          moveDis = math.min(chrInfo.root.y + speed, curTempInfo.uiPosition.y)
          if math.abs(chrInfo.root.y - curTempInfo.uiPosition.y) < 1 then
            local lInfo = CanMove(curTempInfo.v2.x - 1, curTempInfo.v2.y + 1)
            local rInfo = CanMove(curTempInfo.v2.x + 1, curTempInfo.v2.y + 1)
            if lInfo and rInfo then
              local disL = chrInfo.root.x - lInfo.uiPosition.x
              local disR = rInfo.uiPosition.x - chrInfo.root.x
              if disL < disR then
                chrInfo.root:SetXY(math.max(chrInfo.root.x - speed / 2, lInfo.uiPosition.x), moveDis)
              else
                chrInfo.root:SetXY(math.min(chrInfo.root.x + speed / 2, rInfo.uiPosition.x), moveDis)
              end
            elseif lInfo then
              chrInfo.root:SetXY(math.max(chrInfo.root.x - speed / 2, lInfo.uiPosition.x), moveDis)
            elseif rInfo then
              chrInfo.root:SetXY(math.min(chrInfo.root.x + speed / 2, rInfo.uiPosition.x), moveDis)
            end
          else
            chrInfo.root:SetXY(chrInfo.root.x, moveDis)
          end
        end
      end
      chrInfo.itemClass:SetAnimation("walk" .. dirAnimName[curDir], true)
      lastDir = curDir
      Activity9MiniGameWindow.CheckEat(neighborGrid)
    end
  elseif curDir == DirEnum.None then
    chrInfo.itemClass:SetAnimation("idle" .. dirAnimName[lastDir], true)
  end
end

function Activity9MiniGameWindow.CheckEat(grids)
  local isAddScore
  for _, v in pairs(grids) do
    if v.num < eatWidth and mapInfo[v.x][v.y] and mapInfo[v.x][v.y].canEat and mapInfo[v.x][v.y].root and mapInfo[v.x][v.y].type < 8 then
      local data = Activity9MiniGameWindow.GetItemDataByType(mapInfo[v.x][v.y].type)
      if data and data.points then
        score = data.points + score
      end
      if data and data.health then
        hp = data.health + hp
      end
      if data and 1 == data.type then
        local time = Activity9MiniGameWindow.MonsterEnterFearMode()
        if time then
          local effectObj, holder = UIUtil.AddEffectToUITop("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame010/FX_minigame010_baoqi.prefab", chrInfo.root)
          local event = SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_scared_loop")
          LeanTween.delayedCall(time, function()
            if holder and uis then
              holder:SetNativeObject(nil)
            end
            if event then
              SoundUtil.StopSoundEvent(event)
              event = nil
            end
          end)
        end
        FloatTipsUtil.ShowWarnTips(T(1883))
      end
      if data then
        if data.type < 2 then
          eatItemNum = eatItemNum - 1
          if stageData.tips and stageData.tips[tipsIndex] and eatItemNum <= stageData.tips[tipsIndex] then
            tipsIndex = tipsIndex + 1
            FloatTipsUtil.ShowWarnTips(T(1882))
          end
        else
          UIUtil.AddEffectToUITop("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame010/FX_minigame010_itemlight_gethigh.prefab", chrInfo.root, nil, true)
        end
        if 0 == data.type then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_pellet_eat")
        else
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_item_eat")
        end
      end
      chrInfo.itemClass:PlayEatAnimation()
      PlayUITrans(mapInfo[v.x][v.y].root, "disappear", function()
        mapInfo[v.x][v.y].root:Dispose()
        mapInfo[v.x][v.y].item = nil
        mapInfo[v.x][v.y].root = nil
      end)
      mapInfo[v.x][v.y].canEat = nil
      isAddScore = true
      for ind = #timeItemInfo, 1, -1 do
        if timeItemInfo[ind].x == v.x and timeItemInfo[ind].y == v.y then
          if v.guideCom then
            v.guideCom.visible = false
            v.guideCom.rotation = 0
            v.guideCom = nil
          end
          table.remove(timeItemInfo, ind)
        end
      end
    end
  end
  if isAddScore then
    Activity9MiniGameWindow.RefreshScore()
    Activity9MiniGameWindow.RefreshHp()
    Activity9MiniGameWindow.OnGameOver()
  end
end

function Activity9MiniGameWindow.ResetPos(callBack)
  if chrInfo then
    local info = Activity9MiniGameWindow.GetGridByPos(chrInfo.root.xy)
    if info then
      local targetInfo, targetPos, dis
      local startInfo = Activity9MiniGameWindow.GetGridByPos(startXy)
      dis = Vector2.Distance(chrInfo.root.xy, startXy)
      if dis > 0 then
        if dis < speed * 4 then
          if startInfo and startInfo.v2.x == info.v2.x and startInfo.v2.y == info.v2.y then
            if curDir == DirEnum.Right then
              targetInfo = CanMove(info.v2.x + 1, info.v2.y)
            elseif curDir == DirEnum.Left then
              targetInfo = CanMove(info.v2.x - 1, info.v2.y)
            elseif curDir == DirEnum.Up then
              targetInfo = CanMove(info.v2.x, info.v2.y - 1)
            elseif curDir == DirEnum.Down then
              targetInfo = CanMove(info.v2.x, info.v2.y + 1)
            end
          end
          if targetInfo then
            targetPos = Vector2(targetInfo.uiPosition.x, targetInfo.uiPosition.y)
          else
            targetPos = Vector2(info.uiPosition.x, info.uiPosition.y)
          end
        else
          targetPos = Vector2(info.uiPosition.x, info.uiPosition.y)
        end
        dis = Vector2.Distance(chrInfo.root.xy, targetPos)
        moveTwwen = chrInfo.root:TweenMove(targetPos, dis * 0.0042):SetEase(EaseType.Linear):OnComplete(function()
          moveTwwen = nil
        end)
        info, neighborGrid = Activity9MiniGameWindow.GetGridByPos(targetPos)
        Activity9MiniGameWindow.CheckEat(neighborGrid)
      end
    end
  end
end

function Activity9MiniGameWindow.MapCenterFollow(tween)
  if mapCenterPos and chrInfo and mapCom then
    local cx = mapCenterPos.x - chrInfo.root.x
    cx = cx < mapRect.x and mapRect.x or cx
    cx = cx > 0 and 0 or cx
    local cy = mapCenterPos.y - chrInfo.root.y
    cy = cy < mapRect.y and mapRect.y or cy
    cy = cy > 0 and 0 or cy
    if math.abs(mapCom.x - cx) > 0.05 or math.abs(mapCom.y - cy) > 0.05 then
      if mapFollowTwwen then
        mapFollowTwwen:Kill()
        mapFollowTwwen = nil
      end
      if nil == tween then
        mapFollowTwwen = mapCom:TweenMove(Vector2(cx, cy), 0.1):SetEase(EaseType.Linear):OnComplete(function()
          mapFollowTwwen = nil
        end)
      else
        mapCom:SetXY(cx, cy)
      end
    end
  end
end

function Activity9MiniGameWindow.CreateTimeItem()
  if startTime and timeData[timeItmeIndex] and Time.time - startTime >= timeData[timeItmeIndex].time then
    local tempGridInfo = Activity9MiniGameWindow.FindGrid()
    if tempGridInfo then
      local addItem = UIMgr:CreateObject("ActivityDungeon1008", "MiniStart_ItemAni")
      mapCom:AddChildAt(addItem, 1)
      addItem:SetXY(tempGridInfo.uiPosition.x, tempGridInfo.uiPosition.y)
      local x = tempGridInfo.v2.x
      local y = tempGridInfo.v2.y
      mapInfo[x][y] = {
        canEat = true,
        root = addItem,
        item = addItem:GetChild("Item"),
        v2 = tempGridInfo.v2,
        uiPosition = tempGridInfo.uiPosition,
        walk = tempGridInfo.walk,
        type = timeData[timeItmeIndex].type
      }
      ChangeUIController(mapInfo[x][y].item, "item", timeData[timeItmeIndex].type)
      PlayUITrans(mapInfo[x][y].root, "appear")
      uis.Main.EffectTips.Tips.WordTxt.text = T(1864)
      ChangeController(uis.Main.EffectTips.Tips.Item.itemCtr, timeData[timeItmeIndex].type)
      ChangeController(uis.Main.c1Ctr, 1)
      PlayUITrans(uis.Main.EffectTips.root, "up", function()
        ChangeController(uis.Main.c1Ctr, 0)
      end)
      UIUtil.AddEffectToUITop("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame010/FX_minigame010_itemlight.prefab", addItem)
      table.insert(timeItemInfo, {x = x, y = y})
    end
    timeItmeIndex = timeItmeIndex + 1
    if nil == timeData[timeItmeIndex] then
      startTime = Time.time
      timeItmeIndex = 1
    end
  end
end

function Activity9MiniGameWindow.FindGrid()
  local info
  local guguInfo = Activity9MiniGameWindow.GetGridByPos(chrInfo.root.xy)
  local teamGrid = {}
  for x = 1, maxLine do
    for y = 1, maxLine do
      info = mapInfo[x][y]
      if info and guguInfo and info.type < 8 and info.root == nil and nil == mapInfo[x][y].canEat and guguInfo.v2.x ~= x and guguInfo.v2.x ~= y then
        table.insert(teamGrid, {x = x, y = y})
      end
    end
  end
  if #teamGrid > 0 then
    local ind = math.random(1, #teamGrid)
    return mapInfo[teamGrid[ind].x][teamGrid[ind].y]
  end
end

local GetLimitY = function(y)
  y = y < 54 and 54 or y
  y = y > uis.Main.MapRegion.root.height and uis.Main.MapRegion.root.height or y
  return y
end
local GetLimitX = function(x)
  x = x < gridWidth and gridWidth or x
  x = x > uis.Main.MapRegion.root.width and uis.Main.MapRegion.root.width or x
  return x
end

function Activity9MiniGameWindow.CheckScnceGuide()
  if timeItemInfo then
    for i, v in pairs(timeItemInfo) do
      if mapInfo[v.x][v.y] and mapInfo[v.x][v.y].root then
        local r3 = mapCom:TransformPoint(mapInfo[v.x][v.y].root.xy, uis.Main.MapRegion.root)
        if r3.y < -5 then
          local bx = chrInfo.root.x - mapInfo[v.x][v.y].root.x
          local by = chrInfo.root.y - mapInfo[v.x][v.y].root.y
          local angle = Mathf.Atan2(bx, by)
          local degre = angle * (180 / Mathf.PI)
          if v.guideCom == nil then
            v.guideCom = Activity9MiniGameWindow.GetGuideItem()
            v.guideCom.visible = true
            ChangeUIController(v.guideCom:GetChild("Guide"):GetChild("Item"), "item", mapInfo[v.x][v.y].type)
          end
          local per = (math.abs(r3.y) + gridWidth) / math.abs(by)
          v.guideCom.rotation = -degre
          v.guideCom:SetXY(GetLimitX(bx * per + r3.x), 54)
        elseif r3.y > uis.Main.MapRegion.root.height then
          local bx = chrInfo.root.x - mapInfo[v.x][v.y].root.x
          local by = chrInfo.root.y - mapInfo[v.x][v.y].root.y
          local angle = Mathf.Atan2(bx, by)
          local degre = angle * (180 / Mathf.PI)
          if v.guideCom == nil then
            v.guideCom = Activity9MiniGameWindow.GetGuideItem()
            v.guideCom.visible = true
            ChangeUIController(v.guideCom:GetChild("Guide"):GetChild("Item"), "item", mapInfo[v.x][v.y].type)
          end
          local per = (r3.y - uis.Main.MapRegion.root.height + gridWidth) / math.abs(by)
          v.guideCom.rotation = -degre
          v.guideCom:SetXY(GetLimitX(math.abs(bx) * per + r3.x), uis.Main.MapRegion.root.height - 54)
        elseif r3.x < -5 then
          local bx = chrInfo.root.x - mapInfo[v.x][v.y].root.x
          local by = chrInfo.root.y - mapInfo[v.x][v.y].root.y
          local angle = Mathf.Atan2(bx, by)
          local degre = angle * (180 / Mathf.PI)
          if v.guideCom == nil then
            v.guideCom = Activity9MiniGameWindow.GetGuideItem()
            v.guideCom.visible = true
            ChangeUIController(v.guideCom:GetChild("Guide"):GetChild("Item"), "item", mapInfo[v.x][v.y].type)
          end
          local per = (math.abs(r3.x) + gridWidth) / bx
          v.guideCom.rotation = -degre
          v.guideCom:SetXY(gridWidth, GetLimitY(by * per + r3.y))
        elseif r3.x > uis.Main.MapRegion.root.width then
          local bx = chrInfo.root.x - mapInfo[v.x][v.y].root.x
          local by = chrInfo.root.y - mapInfo[v.x][v.y].root.y
          local angle = Mathf.Atan2(bx, by)
          local degre = angle * (180 / Mathf.PI)
          if v.guideCom == nil then
            v.guideCom = Activity9MiniGameWindow.GetGuideItem()
            v.guideCom.visible = true
            ChangeUIController(v.guideCom:GetChild("Guide"):GetChild("Item"), "item", mapInfo[v.x][v.y].type)
          end
          local per = (r3.x - uis.Main.MapRegion.root.width + gridWidth) / math.abs(bx)
          v.guideCom.rotation = -degre
          v.guideCom:SetXY(uis.Main.MapRegion.root.width - gridWidth, GetLimitY(by * per + r3.y))
        elseif v.guideCom then
          v.guideCom.visible = false
          v.guideCom.rotation = 0
          v.guideCom = nil
        end
      end
    end
  end
end

function Activity9MiniGameWindow.RefreshJoystick()
  selectedNum = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_SETTER_INDEX)
  ChangeController(uis.Main.joystickCtr, selectedNum)
  curDir = DirEnum.None
  lastDir = 1
  if 0 == selectedNum then
    arrTouchId = nil
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick1Left, JoyTypeEnum.Four)
  elseif 1 == selectedNum then
    arrTouchId = nil
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick2Right, JoyTypeEnum.Four)
  elseif 2 == selectedNum then
    arrTouchId = {}
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick3Left, JoyTypeEnum.Left_Right)
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick3Right, JoyTypeEnum.UP_Down)
  elseif 3 == selectedNum then
    arrTouchId = {}
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick4Light, JoyTypeEnum.UP_Down)
    Activity9MiniGameWindow:InitJoystick(uis.Main.Joystick4Right, JoyTypeEnum.Left_Right)
  end
end

function Activity9MiniGameWindow:InitJoystick(joyRoot, joyType)
  local _startStageX = 0
  local _startStageY = 0
  local _lastStageX = 0
  local _lastStageY = 0
  local touchId = -1
  local radius = 150
  local onMove, onEnd
  local _touchArea = joyRoot.root:GetChild("RegionImage")
  joyRoot.root:SetChildIndex(_touchArea, joyRoot.root.numChildren - 1)
  local _center = joyRoot.root:GetChild("TouchImage")
  local radiusPos = {
    x = _center.width / 2,
    y = _center.height / 2
  }
  local _InitX = _center.x + radiusPos.x
  local _InitY = _center.y + radiusPos.y
  local ctrRoot = {}
  if joyType == JoyTypeEnum.Four then
    ctrRoot = {
      {
        ctr = joyRoot.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = joyRoot.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = joyRoot.Left.c1Ctr,
        dir = DirEnum.Left
      },
      {
        ctr = joyRoot.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  elseif joyType == JoyTypeEnum.Left_Right then
    ctrRoot = {
      {
        ctr = joyRoot.Right.c1Ctr,
        dir = DirEnum.Right
      },
      {
        ctr = joyRoot.Left.c1Ctr,
        dir = DirEnum.Left
      }
    }
  elseif joyType == JoyTypeEnum.UP_Down then
    ctrRoot = {
      {
        ctr = joyRoot.Down.c1Ctr,
        dir = DirEnum.Down
      },
      {
        ctr = joyRoot.Up.c1Ctr,
        dir = DirEnum.Up
      }
    }
  end
  local GetDir = function(degrees)
    if joyType == JoyTypeEnum.Four then
      if degrees > -45 and degrees <= 45 then
        return DirEnum.Right
      elseif degrees > 45 and degrees <= 135 then
        return DirEnum.Down
      elseif degrees > 135 or degrees <= -135 then
        return DirEnum.Left
      elseif degrees > -135 and degrees <= -45 then
        return DirEnum.Up
      end
    elseif joyType == JoyTypeEnum.Left_Right then
      if degrees > -90 and degrees <= 90 then
        return DirEnum.Right
      else
        return DirEnum.Left
      end
    elseif joyType == JoyTypeEnum.UP_Down then
      if degrees > 0 and degrees <= 180 then
        return DirEnum.Down
      else
        return DirEnum.Up
      end
    end
    return DirEnum.None
  end
  local ShowDir = function(dir)
    for i = 1, #ctrRoot do
      ChangeController(ctrRoot[i].ctr, dir == ctrRoot[i].dir and 1 or 0)
    end
    curDir = dir
  end
  _touchArea.onTouchBegin:Set(function(context)
    if -1 == touchId then
      if moveTwwen then
        moveTwwen:Kill()
        moveTwwen = nil
      end
      local evt = context.data
      touchId = evt.touchId
      if arrTouchId then
        for root, v in pairs(arrTouchId) do
          if joyRoot.root ~= root then
            root:GetChild("TouchImage"):StopDrag()
            root:GetChild("RegionImage"):StopDrag()
          end
        end
        arrTouchId[joyRoot.root] = evt.touchId
      end
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
      startXy = chrInfo.root.xy
      notTouch = nil
      context:CaptureTouch()
    end
  end)
  _touchArea.onTouchMove:Set(function(context)
    local evt = context.data
    if -1 ~= touchId and evt.touchId == touchId then
      local pt = joyRoot.root:GlobalToLocal({
        x = evt.x,
        y = evt.y
      })
      local bx = pt.x
      local by = pt.y
      local moveX = bx - _lastStageX
      local moveY = by - _lastStageY
      _lastStageX = bx
      _lastStageY = by
      local buttonX = _center.x + moveX
      local buttonY = _center.y + moveY
      local offsetX = buttonX + radiusPos.x - _startStageX
      local offsetY = buttonY + radiusPos.y - _startStageY
      local rad = Mathf.Atan2(offsetY, offsetX)
      local degrees = rad * 180 / Mathf.PI
      ShowDir(GetDir(degrees))
      local maxX = radius * Mathf.Cos(rad)
      local maxY = radius * Mathf.Sin(rad)
      if Mathf.Abs(offsetX) > Mathf.Abs(maxX) then
        offsetX = maxX
      end
      if Mathf.Abs(offsetY) > Mathf.Abs(maxY) then
        offsetY = maxY
      end
      buttonX = _startStageX + offsetX
      buttonY = _startStageY + offsetY
      if buttonX < 0 then
        buttonX = 0
      end
      if buttonY > joyRoot.root.height then
        buttonY = joyRoot.root.height
      end
      _center:SetXY(buttonX - radiusPos.x, buttonY - radiusPos.y)
    end
  end)
  _touchArea.onTouchEnd:Set(function(context)
    local inputEvt = context.data
    if -1 ~= touchId and inputEvt.touchId == touchId then
      if arrTouchId then
        arrTouchId[joyRoot.root] = -1
      end
      touchId = -1
      _center:SetXY(_InitX - radiusPos.x, _InitY - radiusPos.y)
      Activity9MiniGameWindow.ResetPos()
      ShowDir(DirEnum.None)
      notTouch = true
    end
  end)
end

function Activity9MiniGameWindow.GetItemDataByType(type)
  for i, v in pairs(itemData) do
    if v.type == type then
      return v
    end
  end
end

function Activity9MiniGameWindow.GetGuideItem()
  guideCom = guideCom or {}
  for i = 1, #guideCom do
    if guideCom[i].visible == false then
      uis.Main.MapRegion.root:SetChildIndex(guideCom[i], uis.Main.MapRegion.root.numChildren)
      return guideCom[i]
    end
  end
  local com = UIMgr:CreateObject("ActivityDungeon1008", "MiniStart_GuideAni")
  uis.Main.MapRegion.root:AddChild(com)
  table.insert(guideCom, com)
  return com
end

function Activity9MiniGameWindow.InitItemData()
  local data = TableData.GetTable("BaseActivityGameItem")
  local allTb = {}
  local timeTb = {}
  for i, v in pairs(data) do
    if v.game_id == Activity9_MiniGameData.gameId then
      table.insert(allTb, v)
      if v.time then
        table.insert(timeTb, v)
      end
    end
  end
  table.sort(timeTb, function(a, b)
    return a.time < b.time
  end)
  return allTb, timeTb
end

function Activity9MiniGameWindow.CheckGameOver()
  return eatItemNum < 1
end

function Activity9MiniGameWindow.OnGameOver(over)
  local failBol = Activity9MiniGameWindow.CheckGameOver()
  if failBol or over then
    UpdateManager.RemoveUpdateHandler(Activity9MiniGameWindow.Update)
    LeanTween.delayedCall(0.35, function()
      OpenWindow(WinResConfig.Activity9MiniGameSubmitWindow.name, nil, score, stageData.id, not failBol)
    end)
  end
end

function Activity9MiniGameWindow.OnNext()
  if mapCom then
    mapCom:Dispose()
    mapCom = nil
  end
  if deathTwwen then
    LeanTween.cancel(deathTwwen.uniqueId)
    deathTwwen = nil
    SkeletonAnimationUtil.SetColor(chrInfo.itemClass.spine, Color(1, 1, 1, 1))
    isDeath = nil
  end
  mapInfo = {}
  timeItemInfo = {}
  if guideCom then
    for i, v in pairs(guideCom) do
      v.visible = false
    end
  end
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
  stageData = Activity9MiniGameWindow.GetCurDifficulty(info.extraCount)
  if stageData then
    Activity9MiniGameWindow.UpdateInfo()
  end
end

function Activity9MiniGameWindow.GetCurDifficulty(haveData)
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  for i, v in pairs(data) do
    if v.game_id == Activity9_MiniGameData.gameId and v.name then
      table.insert(difficulty, v)
    end
  end
  table.sort(difficulty, function(a, b)
    return a.game_stage < b.game_stage
  end)
  local len = #difficulty
  if haveData[difficulty[len - 1].id] then
    local id = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_GAME_STAGE_ID)
    if id and 0 ~= id then
      local dataStage = TableData.GetConfig(id, "BaseActivityGame")
      if dataStage and dataStage.stage_id then
        local rand = math.random(1, #dataStage.stage_id)
        local dataStage = TableData.GetConfig(dataStage.stage_id[rand], "BaseActivityGame")
        if dataStage then
          return dataStage
        end
      else
        return dataStage
      end
    end
  end
  for i = 1, len do
    if not haveData[difficulty[i].id] then
      if difficulty[i].stage_id then
        local rand = math.random(1, #difficulty[i].stage_id)
        local dataStage = TableData.GetConfig(difficulty[i].stage_id[rand], "BaseActivityGame")
        if dataStage then
          return dataStage
        end
      end
      return difficulty[i]
    end
  end
  return difficulty[len - 1]
end

function Activity9MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    gamePaused = true
    Activity9MiniGameWindow.MonsterPaused(gamePaused)
    MessageBox.Show(T(1872), {
      touchCallback = function()
        Activity9_MiniGameService.MiniGameSubmitReq(Activity9_MiniGameData.gameId, {}, 0, nil, function()
          UIMgr:CloseToWindow(WinResConfig.Activity9MiniGameMainWindow.name)
        end)
      end
    }, {
      touchCallback = function()
        gamePaused = false
        Activity9MiniGameWindow.MonsterPaused(gamePaused)
      end
    })
  end)
  uis.Main.SetBtn.onClick:Set(function()
    gamePaused = true
    Activity9MiniGameWindow.MonsterPaused(gamePaused)
    OpenWindow(WinResConfig.Activity9MiniOperateChoiceWindow.name)
  end)
  uis.Main.Integral.NumberWordTxt.text = T(1854)
  uis.Main.Integral.NumberWord1Txt.text = T(1855)
  uis.Main.Info1.WordTxt.text = T(1856)
  uis.Main.Info2.WordTxt.text = T(1880)
end

function Activity9MiniGameWindow.OnClose()
  UpdateManager.RemoveUpdateHandler(Activity9MiniGameWindow.Update)
  if deathTwwen then
    LeanTween.cancel(deathTwwen.uniqueId)
    deathTwwen = nil
  end
  uis = nil
  contentPane = nil
  itemData = nil
  mapInfo = nil
  guideCom = nil
  mapCenterPos = nil
  chrInfo = nil
  hp = nil
  revivePos = nil
  score = nil
  curDir = nil
  neighborGrid = nil
  lastDir = nil
  curTempInfo = nil
  tempInfo = nil
  moveDis = nil
  startXy = nil
  startTime = nil
  timeItmeIndex = nil
  stageData = nil
  timeData = nil
  timeItemInfo = nil
  isDeath = nil
  slmNum = nil
  gamePaused = nil
  stopMove = nil
  selectedNum = nil
  notTouch = nil
  tipsIndex = nil
  arrTouchId = nil
end

function Activity9MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity9_MiniGame.RESET then
    Activity9MiniGameWindow.OnNext()
  elseif msgId == WindowMsgEnum.Activity9_MiniGame.REFRESH_JOYSTICK then
    gamePaused = false
    Activity9MiniGameWindow.MonsterPaused(gamePaused)
    Activity9MiniGameWindow.RefreshJoystick()
  end
end

return Activity9MiniGameWindow
