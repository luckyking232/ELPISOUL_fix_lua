require("ActivityDungeon1003_MiniGameStartWindowByName")
local Activity4MiniGameWindow = {}
local uis, contentPane
local leftRotation = 70
local rightRotation = -70
local clawSpeed = 60
local curRot = 0
local totalGameTime = 60
local nowDir
local RotaDir = {left = 0, right = 1}
local nowMoveDir
local DirectionMove = {
  down = 0,
  up = 1,
  none = 2
}
local moveConfigSpeed = 400
local moveSpeed
local minMove = 96
local maxMove = 800
local nowState
local ClawState = {rotation = 0, move = 1}
local curGameTime, curDifficultyData, curMove, itemInfo, haveRectPos, clawRoot, nowItemIndex, nowIntegral, gameAddSpeedInfo, gamePenetrateInfo, needCreateId, typeChoice, randomNum, buffInfo, addSpeed, timeOutBol, spineObj

function Activity4MiniGameWindow.ReInitData()
end

function Activity4MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity4MiniGameWindow.package, WinResConfig.Activity4MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1003_MiniGameStartWindowUis(contentPane)
    OpenWindow(WinResConfig.Activity4MiniGameCountdownWindow.name)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1003/MiniGame_1001"
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    clawRoot = uis.Main.Claw.root:GetChild("Claw")
    spineObj = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame004/minigame004_gan.prefab", uis.Main.EffectHolder)
    SkeletonAnimationUtil.SetAnimation(spineObj, 0, "idle", true, 0, function()
    end)
    minMove = uis.Main.Claw.root.height
    Activity4MiniGameWindow.InitBtn()
    Activity4MiniGameWindow.UpdateInfo()
  end)
end

function Activity4MiniGameWindow.UpdateInfo()
  uis.Main.root.touchable = false
  uis.Main.Integral.root.alpha = 0
  uis.Main.CloseBtn.alpha = 0
  nowDir = RotaDir.left
  nowState = ClawState.rotation
  curGameTime = Time.time
  curRot = 0
  nowIntegral = 0
  nowMoveDir = DirectionMove.none
  typeChoice = nil
  addSpeed = nil
  buffInfo = {
    [1] = {
      text = T(1685),
      num = 0
    },
    [2] = {
      text = T(1688),
      num = 0
    }
  }
  Activity4MiniGameWindow.UpdateBuffNum()
  gameAddSpeedInfo = nil
  gamePenetrateInfo = nil
  needCreateId = nil
  uis.Main.Integral.NumberWordTxt.text = T(1678)
  uis.Main.Integral.NumberTxt.text = nowIntegral
  uis.Main.Integral.TimeTxt.text = Activity4MiniGameWindow.GetGameTime(totalGameTime)
  uis.Main.CreateRegion.root.onClick:Set(function()
    if timeOutBol then
      curMove = minMove
      nowMoveDir = DirectionMove.down
      nowState = ClawState.move
      moveSpeed = moveConfigSpeed
      if gamePenetrateInfo and gamePenetrateInfo.num > 0 then
        typeChoice = gamePenetrateInfo.value
        gamePenetrateInfo.num = gamePenetrateInfo.num - 1
      end
      SkeletonAnimationUtil.SetAnimation(spineObj, 0, "press", false, 0, function()
      end)
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_ACTION)
    end
  end)
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity4_MiniGameData.GetMiniGameInfo()
  if activityInfo and info then
    local curDay = math.ceil((LoginData.GetCurServerTime() - activityInfo.baseInfo.startStamp) / 86400)
    local allDifficultyData = Activity4MiniGameWindow.GetCurDifficulty(curDay)
    local miniDailyNum = info.miniDailyNum + 1
    local index = miniDailyNum > #allDifficultyData and #allDifficultyData or miniDailyNum
    curDifficultyData = allDifficultyData[index]
    if curDifficultyData then
      itemInfo = {}
      haveRectPos = {}
      Activity4MiniGameWindow.CreateItem(curDifficultyData.item)
    end
  end
  UpdateManager.AddUpdateHandler(Activity4MiniGameWindow.Update)
end

function Activity4MiniGameWindow.UpdateBuffNum()
  local list = uis.Main.SpeedList
  buffInfo[1].num = 0
  buffInfo[2].num = 0
  if gameAddSpeedInfo and gameAddSpeedInfo.num > 0 then
    buffInfo[1].num = gameAddSpeedInfo.num
  end
  if gamePenetrateInfo and gamePenetrateInfo.num > 0 then
    buffInfo[2].num = gamePenetrateInfo.num
  end
  local data = {}
  for i = 1, #buffInfo do
    if buffInfo[i].num > 0 then
      table.insert(data, buffInfo[i])
    end
  end
  
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, data[i + 1].text, "WordTxt")
    UIUtil.SetText(item, T(1686, data[i + 1].num), "NumberTxt")
  end
  
  list.numItems = #data
end

function Activity4MiniGameWindow.CreateItem(itemIds, addBol)
  local region = {}
  randomNum = 0
  local map = uis.Main.CreateRegion.root
  local num = math.floor(map.height / 3)
  for i = 1, 3 do
    region[i] = {
      min = num * (i - 1),
      max = num * i
    }
  end
  for idIndex = 1, #itemIds do
    local config = TableData.GetConfig(itemIds[idIndex], "BaseActivityGameMiningItem")
    if config then
      for numIndex = 1, #config.num do
        if config.num[numIndex] > 0 then
          for i = 1, config.num[numIndex] do
            local arr = Split(config.icon, ":")
            local item = UIMgr:CreateObject(arr[1], arr[2])
            uis.Main.CreateRegion.root:AddChild(item)
            randomNum = 0
            local v2 = Activity4MiniGameWindow.GetItemPos(region[numIndex], item, config.type)
            item:SetXY(v2.x, v2.y)
            if 3 == config.type then
              local spine = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame004/minigame004_gugu.prefab", item:GetChild("EffectHolder"))
              table.insert(itemInfo, 1, {
                item = item,
                config = config,
                itemClass = Activity4MiniGameWindow.ItemNew(item, spine)
              })
            else
              table.insert(itemInfo, {item = item, config = config})
            end
            if addBol and config.effect1 then
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame004/FX_ui_minigame_004_term_reflash.prefab", item:GetChild("Effect2Holder"), nil, true, function()
                if uis then
                  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame004/" .. config.effect1, item:GetChild("Effect2Holder"))
                end
              end)
            end
            if addBol and gameAddSpeedInfo and gameAddSpeedInfo.num > 0 and config.effect then
              UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame004/" .. config.effect, item:GetChild("Effect1Holder"))
            end
          end
        end
      end
    end
  end
end

function Activity4MiniGameWindow.ItemNew(root, spine)
  local item = {}
  item.nowDir = math.random(0, 1)
  item.speed = math.random(80, 200)
  item.curDir = root.x
  item.root = root
  item.spine = spine
  item.rightMax = uis.Main.CreateRegion.root.width - root.width
  item.root:GetChild("EffectHolder"):SetScale(item.nowDir == RotaDir.right and -1 or 1, 1)
  item.moveBol = true
  SkeletonAnimationUtil.SetAnimation(item.spine, 0, "move", true)
  
  function item:move()
    if self.moveBol then
      if self.nowDir == RotaDir.right then
        local speed = Time.deltaTime * self.speed
        self.curDir = self.curDir + speed
        if self.curDir < item.rightMax then
          self.root:SetXY(self.curDir, self.root.y)
        else
          self.nowDir = RotaDir.left
          item.root:GetChild("EffectHolder"):SetScale(1, 1)
        end
      else
        local speed = Time.deltaTime * -self.speed
        self.curDir = self.curDir + speed
        if self.curDir > 0 then
          self.root:SetXY(self.curDir, self.root.y)
        else
          self.nowDir = RotaDir.right
          item.root:GetChild("EffectHolder"):SetScale(-1, 1)
        end
      end
    end
  end
  
  function item:catch()
    self.moveBol = false
    SkeletonAnimationUtil.SetAnimation(item.spine, 0, "catch", true)
  end
  
  return item
end

function Activity4MiniGameWindow.GetItemPos(region, item, type)
  local map = uis.Main.CreateRegion.root
  local itemSize = item.size
  local PicImage = item:GetChild("PicImage")
  if PicImage then
    itemSize = PicImage.size
  end
  local maxX = uis.Main.CreateRegion.root.width - itemSize.x
  local x = math.random(0, maxX)
  local maxY = region.max - itemSize.y - region.min
  local y = math.random(0, maxY) + region.min
  local rect = {
    xMin = x,
    yMin = y,
    xMax = x + itemSize.x,
    yMax = y + itemSize.y,
    item = item
  }
  if 3 == type then
    return {x = x, y = y}
  end
  if Activity4MiniGameWindow.CheckContain(rect) then
    table.insert(haveRectPos, rect)
    return {x = x, y = y}
  else
    randomNum = randomNum + 1
    if randomNum > 10000 then
      printError(">>>>>>>>>>>创建失败位置重叠>>>>>")
      return {x = x, y = y}
    end
    return Activity4MiniGameWindow.GetItemPos(region, item, type)
  end
end

function Activity4MiniGameWindow.CheckContain(rect)
  for i, v in pairs(haveRectPos) do
    if Activity4MiniGameWindow.Overlaps(v, rect) then
      return false
    end
  end
  return true
end

function Activity4MiniGameWindow.Update()
  Activity4MiniGameWindow.MoveItemGuGu()
  if timeOutBol then
    if Time.time - curGameTime >= totalGameTime then
      Activity4MiniGameWindow.OnGameOver()
    else
      uis.Main.Integral.TimeTxt.text = Activity4MiniGameWindow.GetGameTime(totalGameTime - (Time.time - curGameTime))
    end
    if nowState == ClawState.rotation then
      Activity4MiniGameWindow.RotationClaw()
    else
      Activity4MiniGameWindow.MoveClaw()
    end
  end
  uis.Main.CreateRegion.root.touchable = nowState == ClawState.rotation
end

function Activity4MiniGameWindow.MoveItemGuGu()
  if itemInfo then
    for i, v in ipairs(itemInfo) do
      if v.itemClass then
        v.itemClass:move()
      end
    end
  end
end

function Activity4MiniGameWindow.MoveClaw()
  local initH = uis.Main.Claw.root.height
  if nowMoveDir == DirectionMove.down then
    local speed = Time.deltaTime * moveSpeed
    curMove = curMove + speed
    if curMove < maxMove then
      uis.Main.Claw.root:SetSize(uis.Main.Claw.root.width, curMove)
      Activity4MiniGameWindow.CheckGetItem()
    else
      nowMoveDir = DirectionMove.up
    end
  elseif nowMoveDir == DirectionMove.up then
    local speed = Time.deltaTime * -moveSpeed
    curMove = curMove + speed
    if curMove > minMove then
      uis.Main.Claw.root:SetSize(uis.Main.Claw.root.width, curMove)
    else
      Activity4MiniGameWindow.Finish()
    end
  end
end

function Activity4MiniGameWindow.Finish()
  nowMoveDir = DirectionMove.none
  typeChoice = nil
  uis.Main.Claw.root:SetSize(uis.Main.Claw.root.width, minMove)
  if nowItemIndex and itemInfo[nowItemIndex] then
    nowIntegral = itemInfo[nowItemIndex].config.integral + nowIntegral
    clawRoot:GetChild("LeftImage"):TweenRotate(0, 0.1)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame004/FX_ui_minigame_004_item_get_eff.prefab", uis.Main.Claw.Effect1Holder)
    clawRoot:GetChild("RightImage"):TweenRotate(0, 0.1):OnComplete(function()
      uis.Main.Integral.NumberTxt.text = nowIntegral
      uis.Main.GetIntegral.NumberTxt.text = "+" .. itemInfo[nowItemIndex].config.integral
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_PICK_GET)
      PlayUITrans(uis.Main.root, "Integral")
      Activity4MiniGameWindow.RemoveHavePoint(itemInfo[nowItemIndex].item)
      Activity4MiniGameWindow.AddBoxBuff(itemInfo[nowItemIndex])
      itemInfo[nowItemIndex].item:Dispose()
      nowState = ClawState.rotation
      table.remove(itemInfo, nowItemIndex)
      nowItemIndex = nil
      Activity4MiniGameWindow.CheckBuffAlpha()
      Activity4MiniGameWindow.UpdateBuffNum()
      if addSpeed and gameAddSpeedInfo.num <= 0 then
        Activity4MiniGameWindow.DisposeEffect()
        addSpeed = nil
      end
      if needCreateId and #needCreateId > 0 then
        uis.Main.SpeedTips.WordTxt.text = T(1692)
        PlayUITrans(uis.Main.root, "speedup")
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_NOTIF)
        Activity4MiniGameWindow.CreateItem(needCreateId, true)
        needCreateId = nil
      end
      if 0 == table.getLen(itemInfo) then
        Activity4MiniGameWindow.OnGameOver()
      end
    end)
  else
    nowState = ClawState.rotation
    if 0 == table.getLen(itemInfo) then
      Activity4MiniGameWindow.OnGameOver()
    end
  end
  SkeletonAnimationUtil.SetAnimation(spineObj, 0, "idle", true, 0, function()
  end)
end

function Activity4MiniGameWindow.CheckBuffAlpha()
  for i, v in ipairs(itemInfo) do
    if gamePenetrateInfo and gamePenetrateInfo.num > 0 and v.config.type == gamePenetrateInfo.value then
      v.item.alpha = 0.5
    else
      v.item.alpha = 1
    end
  end
end

function Activity4MiniGameWindow.PlayEffect()
  for i, v in ipairs(itemInfo) do
    if gameAddSpeedInfo and gameAddSpeedInfo.num > 0 and v.config and v.config.effect and v.config.effect then
      addSpeed = true
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame004/" .. v.config.effect, v.item:GetChild("Effect1Holder"))
    end
  end
end

function Activity4MiniGameWindow.DisposeEffect()
  for i, v in ipairs(itemInfo) do
    v.item:GetChild("Effect1Holder"):SetNativeObject(nil)
  end
end

function Activity4MiniGameWindow.RemoveHavePoint(item)
  for i, v in ipairs(haveRectPos) do
    if v.item == item then
      table.remove(haveRectPos, i)
      return
    end
  end
end

function Activity4MiniGameWindow.AddBoxBuff(info)
  if info and 2 == info.config.type then
    if info.config.open_effect1 then
      local add = info.config.open_effect1[2] or 0
      if nil == gamePenetrateInfo then
        gamePenetrateInfo = {
          value = info.config.open_effect1[1],
          num = add
        }
      else
        gamePenetrateInfo.num = gamePenetrateInfo.num + add
      end
      uis.Main.SpeedTips.WordTxt.text = T(1689)
      Activity4MiniGameWindow.UpdateBuffNum()
      PlayUITrans(uis.Main.root, "speedup")
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_CMN)
    elseif info.config.open_effect2 then
      local add = info.config.open_effect2[2] or 0
      if nil == gameAddSpeedInfo then
        gameAddSpeedInfo = {
          value = info.config.open_effect2[1],
          num = add
        }
      else
        gameAddSpeedInfo.num = gameAddSpeedInfo.num + add
      end
      uis.Main.SpeedTips.WordTxt.text = T(1687)
      Activity4MiniGameWindow.UpdateBuffNum()
      PlayUITrans(uis.Main.root, "speedup")
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_CMN)
      Activity4MiniGameWindow.PlayEffect()
    elseif info.config.open_effect3 then
      needCreateId = info.config.open_effect3
    end
  end
end

function Activity4MiniGameWindow.CheckGetItem()
  local rect = clawRoot.displayObject:GetBounds()
  local itemRect
  for i, v in ipairs(itemInfo) do
    if nil == typeChoice or v.config.type ~= typeChoice then
      itemRect = v.item.displayObject:GetBounds()
      if itemRect and Activity4MiniGameWindow.Overlaps(rect, itemRect) then
        if v.itemClass then
          v.itemClass:catch()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_PICK_GU)
        else
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_PICK)
        end
        clawRoot:AddChildAt(v.item, 3)
        clawRoot:GetChild("LeftImage"):TweenRotate(-v.config.Angle, 0.15)
        clawRoot:GetChild("RightImage"):TweenRotate(v.config.Angle, 0.15)
        v.item:SetXY(v.config.pos[1], v.config.pos[2])
        v.item:GetChild("Effect2Holder"):SetNativeObject(nil)
        if gameAddSpeedInfo and gameAddSpeedInfo.num > 0 then
          moveSpeed = gameAddSpeedInfo.value
          gameAddSpeedInfo.num = gameAddSpeedInfo.num - 1
        else
          moveSpeed = v.config.weight
        end
        nowMoveDir = DirectionMove.up
        nowItemIndex = i
        return
      end
    end
  end
end

function Activity4MiniGameWindow.GetGameTime(time)
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

function Activity4MiniGameWindow.RotationClaw()
  if nowDir == RotaDir.left then
    local speed = Time.deltaTime * clawSpeed
    curRot = curRot + speed
    if curRot < leftRotation then
      uis.Main.Claw.root.rotation = curRot
    else
      nowDir = RotaDir.right
    end
  else
    local speed = Time.deltaTime * -clawSpeed
    curRot = curRot + speed
    if curRot > rightRotation then
      uis.Main.Claw.root.rotation = curRot
    else
      nowDir = RotaDir.left
    end
  end
end

function Activity4MiniGameWindow.OnGameOver()
  timeOutBol = nil
  UpdateManager.RemoveUpdateHandler(Activity4MiniGameWindow.Update)
  OpenWindow(WinResConfig.Activity4MiniGameSubmitWindow.name, nil, nowIntegral, Time.time - curGameTime)
end

function Activity4MiniGameWindow.Overlaps(r1, r2)
  return r1.xMin < r2.xMax and r1.xMax > r2.xMin and r1.yMin < r2.yMax and r1.yMax > r2.yMin
end

function Activity4MiniGameWindow.OnNext()
  if uis.Main.CreateRegion.root.numChildren > 0 then
    uis.Main.CreateRegion.root:RemoveChildren(0, -1, true)
  end
  if nowItemIndex and itemInfo[nowItemIndex] then
    itemInfo[nowItemIndex].item:Dispose()
  end
  uis.Main.Claw.root:SetSize(uis.Main.Claw.root.width, minMove)
  clawRoot:GetChild("LeftImage").rotation = 0
  clawRoot:GetChild("RightImage").rotation = 0
  uis.Main.Claw.root.rotation = 0
  Activity4MiniGameWindow.UpdateInfo()
end

function Activity4MiniGameWindow.GetCurDifficulty(curDay)
  local data = TableData.GetTable("BaseActivityGameMining")
  local maxDay = 0
  local curDifficulty = {}
  for i, v in pairs(data) do
    if v.game_day == curDay then
      table.insert(curDifficulty, v)
    end
    if maxDay < v.game_day then
      maxDay = v.game_day
    end
  end
  if #curDifficulty < 1 then
    return Activity4MiniGameWindow.GetCurDifficulty(maxDay)
  end
  table.sort(curDifficulty, function(a, b)
    return a.id < b.id
  end)
  return curDifficulty
end

function Activity4MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(1677), {
      touchCallback = function()
        Activity4MiniGameWindow.OnGameOver()
      end
    }, {})
  end)
end

function Activity4MiniGameWindow.OnClose()
  UpdateManager.RemoveUpdateHandler(Activity4MiniGameWindow.Update)
  uis = nil
  contentPane = nil
  curGameTime = nil
  curDifficultyData = nil
  curMove = nil
  itemInfo = nil
  haveRectPos = nil
  clawRoot = nil
  nowItemIndex = nil
  nowIntegral = nil
  gameAddSpeedInfo = nil
  gamePenetrateInfo = nil
  needCreateId = nil
  typeChoice = nil
  randomNum = nil
  buffInfo = nil
  addSpeed = nil
  timeOutBol = nil
  spineObj = nil
end

function Activity4MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity4_MiniGame.RESET then
    Activity4MiniGameWindow.OnNext()
  elseif msgId == WindowMsgEnum.Activity4_MiniGame.PAUSE then
    PlayUITrans(uis.Main.root, "up", function()
      curGameTime = Time.time
      timeOutBol = true
      uis.Main.root.touchable = true
    end)
  end
end

return Activity4MiniGameWindow
