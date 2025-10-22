require("ActivityDungeon1010_MiniGameStartWindowByName")
local Activity10MiniGameWindow = {}
local uis, contentPane, hpTxt, flyCom, bgComInfo, mapConfData, bgPrefab
local bgWidth = 16.68
local curConfData, allBarrier, playerX, barrierDis, dieDownY, itemConfig, itemIndex, itemCreateDis, itemConfIndex, score, hp, flyObj, stop, rootWidth, mapConfMax, mapLayer, itemInfo, detailsShow, stopDwon, targetY, fristGuide, tipsCom, downArrInfo, lastW, showPlay, curItemType
local itemEffectNum = {}
local tweenDie, stopTween, waitTween
local moveSpeed = 0
local downAddSpeed = 1380
local defaultSpeedUp = -400
local cachedFrameRate
local targetFrameRate = 60

function Activity10MiniGameWindow.ReInitData()
end

function Activity10MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity10MiniGameWindow.package, WinResConfig.Activity10MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1010_MiniGameStartWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity10MiniGameWindow.InitBtn()
    downArrInfo = {}
    rootWidth = uis.root.width / 100
    local hpCom = UIMgr:CreateObject("ActivityDungeon1010", "MiniStart_Info")
    uis.Main.AssetsTipsList:AddChild(hpCom)
    UIUtil.SetText(hpCom, T(1906), "WordTxt")
    hpTxt = hpCom:GetChild("NumberTxt")
    itemConfig = Activity10MiniGameWindow.GetItemConfig()
    Activity10MiniGameWindow.UpdateInfo()
    if Application.targetFrameRate ~= targetFrameRate then
      cachedFrameRate = Application.targetFrameRate
      Application.targetFrameRate = targetFrameRate
    end
  end)
end

function Activity10MiniGameWindow.ShowStartTips(send)
  local oldTips = uis.Main.root:GetChild("hitTips")
  if oldTips then
    oldTips:Dispose()
  end
  stop = true
  stopDwon = true
  local hitTips = UIMgr:CreateObject("ActivityDungeon1010", "MiniOperation")
  hitTips.name = "hitTips"
  tipsCom[hitTips] = true
  UIUtil.SetText(hitTips, send and T(1901) or T(1909), "WordTxt")
  hitTips:SetSize(uis.root.width, uis.root.height)
  uis.Main.root:AddChild(hitTips)
  hitTips:AddRelation(uis.Main.root, FairyGUI.RelationType.Center_Center)
  PlayUITrans(hitTips, "in")
  hitTips.onClick:Set(function()
    hitTips.touchable = false
    PlayUITrans(hitTips, "out", function()
      hitTips:Dispose()
      tipsCom[hitTips] = nil
      hitTips = nil
      moveSpeed = 0
      if send then
        Activity10_MiniGameService.MiniGameSubmitReq({}, 1, nil, 1, function()
          stop = nil
          stopDwon = nil
        end)
      else
        stop = nil
        stopDwon = nil
      end
    end)
  end)
end

function Activity10MiniGameWindow.UpdateInfo()
  tipsCom = {}
  mapConfData = Activity10MiniGameWindow.GetConfig()
  mapConfMax = #mapConfData
  curConfData = mapConfData[1]
  Activity10MiniGameWindow.ShowStartTips(true)
  hp = 2
  score = 0
  allBarrier = {}
  itemInfo = {}
  itemEffectNum = {}
  lastW = 0
  Activity10MiniGameWindow.RefreshScore()
  moveSpeed = 0
  showPlay = nil
  bgComInfo = {}
  itemIndex = 1
  itemCreateDis = 0
  itemConfIndex = 1
  if not bgPrefab then
    bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame012/MiniGame12Bg.prefab")
  end
  local curSceneCamera = bgPrefab:GetComponentInChildren(typeof(Camera), true)
  curSceneCamera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
  local name = {
    [1] = {
      path = {
        "MiniGame12Bg_2",
        "MiniGame12Bg_3",
        "MiniGame12Bg_4",
        "MiniGame12Bg_5"
      },
      speed = 0.2
    },
    [2] = {
      path = {
        "MiniGame12Bg_2_z",
        "MiniGame12Bg_3_z",
        "MiniGame12Bg_4_z",
        "MiniGame12Bg_5_z"
      },
      speed = 0.3
    },
    [3] = {
      path = {
        "MiniGame12Bg_2_q",
        "MiniGame12Bg_3_q",
        "MiniGame12Bg_4_q",
        "MiniGame12Bg_5_q"
      },
      speed = 0.5
    }
  }
  mapLayer = #name
  for i = 1, mapLayer do
    local root = LuaUtil.FindChild(bgPrefab.transform, "bg" .. i, true)
    bgComInfo[i] = Activity10MiniGameWindow.CreateBgCom(root, name[i].path, name[i].speed)
  end
  if not flyCom then
    flyCom = UIMgr:CreateObject("ActivityDungeon1010", "MiniStart_GuGu")
    uis.Main.root:AddChild(flyCom)
    local flyComHolder = flyCom:GetChild("EffectHolder")
    flyObj = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame010/MiniGame010_char.prefab", flyComHolder)
  end
  SkeletonAnimationUtil.SetAnimation(flyObj, 0, "fly_mid", true)
  dieDownY = uis.Main.root.height - flyCom.height / 2
  playerX = uis.Main.root.width / 3
  barrierDis = playerX
  flyCom:SetXY(playerX, uis.Main.root.height * 0.5 - flyCom.height * 0.5)
  for i = 1, 5 do
    Activity10MiniGameWindow.CreateBarrier()
  end
  uis.Main.TouchScreenBtn.onClick:Set(function()
    if stop then
      return
    end
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_gangguanniao_jump")
    moveSpeed = defaultSpeedUp
  end)
  UpdateManager.AddUpdateHandler(Activity10MiniGameWindow.Update)
end

function Activity10MiniGameWindow.Update()
  if stop then
    return
  end
  local deltaTime = Time.deltaTime
  local mapSp = curConfData.flight_speed * deltaTime
  uis.Main.OperateRegion.root:SetXY(uis.Main.OperateRegion.root.x - mapSp, uis.Main.OperateRegion.root.y)
  score = math.ceil(math.abs(uis.Main.OperateRegion.root.x) * 0.01)
  for i = 1, mapLayer do
    bgComInfo[i]:Move(mapSp * 0.01)
  end
  curConfData = Activity10MiniGameWindow.GetConfData(bgComInfo[mapLayer].nameIndex)
  Activity10MiniGameWindow.CreateBarrier()
  Activity10MiniGameWindow.Move(deltaTime)
  Activity10MiniGameWindow.CheckDie()
  Activity10MiniGameWindow.CheckEatItem()
  Activity10MiniGameWindow.RefreshScore()
  if Input.GetKeyDown(KeyCode.Space) then
    uis.Main.TouchScreenBtn.onClick:Call()
  end
end

function Activity10MiniGameWindow.Resurrection(dis, startPos)
  tweenDie = LeanTween.delayedCall(0.1, function()
    if uis then
      moveSpeed = 0
      Activity10MiniGameWindow.ShowStartTips()
      if flyCom then
        SkeletonAnimationUtil.SetAnimation(flyObj, 0, "fly_mid", true)
        local add = uis.Main.root.height - uis.Main.OperateRegion.root.height
        if add > 0 then
          flyCom:SetXY(playerX, startPos + add / 2)
        else
          flyCom:SetXY(playerX, startPos)
        end
      end
      if dis then
        uis.Main.OperateRegion.root:SetXY(uis.Main.OperateRegion.root.x + dis, uis.Main.OperateRegion.root.y)
        for i = 1, mapLayer do
          local num = dis * 0.01 * bgComInfo[i].speedScale
          local x = bgComInfo[i].root.transform.localPosition.x + num
          x = x > 0 and 0 or x
          bgComInfo[i].moveDis = bgComInfo[i].moveDis - num
          LuaUtil.SetLocalPos(bgComInfo[i].root.gameObject, x, bgComInfo[i].root.transform.localPosition.y, bgComInfo[i].root.transform.localPosition.z)
        end
      end
    end
    tweenDie = nil
  end)
end

function Activity10MiniGameWindow.CheckDie()
  local rect = flyCom.displayObject:GetBounds()
  local rect2, rect3, die, dieAnim, dis, startPos
  for i = 1, #allBarrier do
    rect2 = allBarrier[i].downCom.displayObject:GetBounds()
    rect3 = allBarrier[i].upCom.displayObject:GetBounds()
    if Activity10MiniGameWindow.Overlaps(rect2, rect) or Activity10MiniGameWindow.Overlaps(rect3, rect) then
      die = true
      dieAnim = true
      startPos = allBarrier[i].startPos
      if allBarrier[i - 1] then
        dis = allBarrier[i - 1].upCom.x + allBarrier[i - 1].upCom.width
        dis = math.abs(uis.Main.OperateRegion.root.x) - (dis - playerX + flyCom.width)
        break
      end
      dis = allBarrier[i].dis * 0.65 - (allBarrier[i].upCom.x - playerX - math.abs(uis.Main.OperateRegion.root.x))
      break
    end
  end
  if flyCom.y > dieDownY or flyCom.y <= 0 then
    die = true
    dieAnim = flyCom.y <= 0
    for i = 1, #allBarrier do
      if allBarrier[i].upCom.x - playerX >= math.abs(uis.Main.OperateRegion.root.x) then
        if allBarrier[i - 1] then
          dis = allBarrier[i - 1].upCom.x + allBarrier[i - 1].upCom.width
          dis = math.abs(uis.Main.OperateRegion.root.x) - (dis - playerX + flyCom.width)
        else
          local itemPos = allBarrier[i].upCom.x - playerX - math.abs(uis.Main.OperateRegion.root.x)
          dis = allBarrier[i].dis * 0.65 - itemPos
        end
        startPos = allBarrier[i].startPos
        break
      end
    end
  end
  if die then
    hp = hp - 1
    stop = true
    stopDwon = true
    if stopTween then
      LeanTween.cancel(stopTween.uniqueId)
      stopTween = nil
    end
    uis.root.touchable = false
    stopTween = LeanTween.delayedCall(0.2, function()
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_gangguanniao_failed")
      local CheckGameOver = function()
        if hp < 1 then
          if tweenDie then
            LeanTween.cancel(tweenDie.uniqueId)
            tweenDie = nil
          end
          Activity10MiniGameWindow.OnGameOver()
        else
          Activity10MiniGameWindow.Resurrection(dis, startPos)
        end
      end
      if dieAnim then
        SkeletonAnimationUtil.SetAnimation(flyObj, 0, "down", true)
        local time = (dieDownY - flyCom.y) / 800
        flyCom:TweenMoveY(dieDownY, time):SetEase(EaseType.Linear):OnComplete(function()
          CheckGameOver()
        end)
      else
        CheckGameOver()
      end
      stopTween = nil
      uis.root.touchable = true
    end)
  end
end

function Activity10MiniGameWindow.CheckEatItem()
  if stop then
    return
  end
  for i = 1, #itemInfo do
    if score >= itemInfo[i].disNum then
      itemInfo[i].com:Dispose()
      if 1 == itemInfo[i].data.type then
        hp = hp + 1
      elseif 2 == itemInfo[i].data.type or 3 == itemInfo[i].data.type then
        if itemEffectNum[itemInfo[i].data.type] and itemEffectNum[itemInfo[i].data.type].num then
          itemEffectNum[itemInfo[i].data.type].num = itemEffectNum[itemInfo[i].data.type].num + itemInfo[i].data.distance[2]
        else
          itemEffectNum[itemInfo[i].data.type] = {}
          itemEffectNum[itemInfo[i].data.type] = {
            dis = itemInfo[i].data.distance[1],
            num = itemInfo[i].data.distance[2]
          }
        end
      end
      curItemType = itemInfo[i].data.type
      table.remove(itemInfo, i)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_gangguanniao_item")
      UIUtil.AddEffectToUITop("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame009/FX_minigame008_getitem_blue.prefab", flyCom, nil, true)
      if GuideData.CanShowCaption(Activity10_MiniGameData.gameId) then
        if 2 == curItemType or 3 == curItemType then
          showPlay = true
        end
        uis.Main.FunctionDetailsBtn.onClick:Call()
        GuideData.SaveCaptionOpen(Activity10_MiniGameData.gameId)
      elseif 2 == curItemType or 3 == curItemType then
        Activity10MiniGameWindow.PlayItemAnim()
      end
      return
    end
  end
end

function Activity10MiniGameWindow.PlayItemAnim()
  local startIndex
  local moveNum = 0
  for i = 1, #allBarrier do
    if startIndex then
      if itemEffectNum[2] and itemEffectNum[2].num > 0 then
        local addDis = itemEffectNum[2].dis / 2
        allBarrier[i].downCom:TweenMoveY(addDis + allBarrier[i].downCom.y, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
        allBarrier[i].upCom:TweenMoveY(allBarrier[i].upCom.y - addDis, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
        itemEffectNum[2].num = itemEffectNum[2].num - 1
        allBarrier[i].startPos = allBarrier[i].startPos + itemEffectNum[2].dis * 0.6666666666666666
      end
      if itemEffectNum[3] and 3 == curItemType then
        if itemEffectNum[3].num > 0 then
          local add = itemEffectNum[3].dis * (startIndex + 1)
          local newX = add + allBarrier[i].upCom.x
          allBarrier[i].upCom:TweenMoveX(newX, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
          allBarrier[i].downCom:TweenMoveX(newX, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
          allBarrier[i].x = newX
          allBarrier[i].dis = allBarrier[i].dis + itemEffectNum[3].dis
          barrierDis = barrierDis + add
          itemEffectNum[3].num = itemEffectNum[3].num - 1
          moveNum = moveNum + 1
        else
          local add = itemEffectNum[3].dis * (moveNum + 1)
          local newX = add + allBarrier[i].upCom.x
          allBarrier[i].upCom:TweenMoveX(newX, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
          allBarrier[i].downCom:TweenMoveX(newX, 0.25):SetEase(EaseType.QuadOut):SetDelay(startIndex * 0.1)
          allBarrier[i].x = newX
          allBarrier[i].dis = allBarrier[i].dis + itemEffectNum[3].dis
        end
      end
      startIndex = startIndex + 1
    end
    if allBarrier[i].addItem then
      startIndex = 0
    end
  end
end

function Activity10MiniGameWindow.Overlaps(r1, r2)
  return r1.xMin < r2.xMax and r1.xMax > r2.xMin and r1.yMin < r2.yMax and r1.yMax > r2.yMin
end

function Activity10MiniGameWindow.Move(deltaTime)
  moveSpeed = moveSpeed + downAddSpeed * deltaTime
  flyCom:SetXY(flyCom.x, flyCom.y + moveSpeed * deltaTime)
  if moveSpeed > 0 then
    SkeletonAnimationUtil.SetAnimation(flyObj, 0, "fly_mid", true)
  else
    SkeletonAnimationUtil.SetAnimation(flyObj, 0, "fly_mid", true)
  end
end

function Activity10MiniGameWindow.RefreshScore()
  uis.Main.Integral.NumberTxt.text = T(1902, score)
  hpTxt.text = hp
end

function Activity10MiniGameWindow.CreateBgCom(root, pngName, scale)
  local bgClass = {}
  bgClass.root = root
  bgClass.prefabs = {}
  bgClass.nameIndex = 0
  bgClass.moveDis = 0
  bgClass.canMoveDis = 0
  bgClass.speedScale = scale
  bgClass.pngName = pngName
  bgClass.tatalW = bgWidth
  local icon1 = LuaUtil.FindChild(bgClass.root.transform, "icon1", true)
  if icon1 then
    LuaUtil.SetLocalPos(bgClass.root.gameObject, 0, bgClass.root.transform.localPosition.y, bgClass.root.transform.localPosition.z)
    icon1.gameObject:SetActive(true)
    table.insert(bgClass.prefabs, {
      obj = icon1.gameObject,
      x = icon1.transform.localPosition.x,
      load = true
    })
  end
  local addSpeed
  
  function bgClass:LoadBg()
    bgClass.nameIndex = bgClass.nameIndex + 1
    local name = bgClass.pngName[bgClass.nameIndex] or bgClass.pngName[#bgClass.pngName]
    local effect = ResourceManager.Instantiate(string.format("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame012/%s.prefab", name))
    if effect then
      effect.transform:SetParent(bgClass.root.transform)
      local x = bgWidth * bgClass.nameIndex
      LuaUtil.SetLocalPos(effect, x, 0, 0)
      table.insert(bgClass.prefabs, {obj = effect, x = x})
    end
  end
  
  function bgClass:Move(speed)
    addSpeed = speed * bgClass.speedScale
    bgClass.moveDis = bgClass.moveDis + addSpeed
    bgClass.canMoveDis = bgClass.tatalW - rootWidth - bgClass.moveDis
    if bgClass.canMoveDis <= 5 then
      bgClass:LoadBg()
      bgClass.tatalW = bgWidth * bgClass.nameIndex
    end
    LuaUtil.SetLocalPos(bgClass.root.gameObject, bgClass.root.transform.localPosition.x - addSpeed, bgClass.root.transform.localPosition.y, bgClass.root.transform.localPosition.z)
    bgClass.Dispose()
  end
  
  function bgClass.Dispose()
    local offX = math.abs(bgClass.root.transform.localPosition.x) - (bgWidth + 3)
    for i = #bgClass.prefabs, 1, -1 do
      if offX > bgClass.prefabs[i].x then
        if bgClass.prefabs[i].load then
          bgClass.prefabs[i].obj:SetActive(false)
        else
          ResourceManager.DestroyGameObject(bgClass.prefabs[i].obj)
        end
        table.remove(bgClass.prefabs, i)
      end
    end
  end
  
  function bgClass:DisposeAll()
    for i = #bgClass.prefabs, 1, -1 do
      if bgClass.prefabs[i].load then
        bgClass.prefabs[i].obj:SetActive(true)
      else
        ResourceManager.DestroyGameObject(bgClass.prefabs[i].obj)
      end
    end
    bgClass.prefabs = nil
  end
  
  return bgClass
end

function Activity10MiniGameWindow.CreateBarrier()
  if math.abs(uis.Main.OperateRegion.root.x) + (uis.root.width - playerX) - barrierDis > -600 then
    local downDis = Activity10MiniGameWindow.GetDownNum()
    local interval = Activity10MiniGameWindow.GetRandomNum(curConfData.pillar_interval)
    local dis = Activity10MiniGameWindow.GetRandomNum(curConfData.pillar_distance)
    local url = Activity10MiniGameWindow.GetRandomNum(curConfData.url)
    if itemEffectNum[2] and itemEffectNum[2].num > 0 then
      dis = dis + itemEffectNum[2].dis
      itemEffectNum[2].num = itemEffectNum[2].num - 1
    end
    if itemEffectNum[3] and itemEffectNum[3].num > 0 then
      interval = interval + itemEffectNum[3].dis
      itemEffectNum[3].num = itemEffectNum[3].num - 1
    end
    local downCom = UIMgr:CreateObject(url.down.pkgName, url.down.resName)
    uis.Main.OperateRegion.root:AddChild(downCom)
    downCom:SetXY(barrierDis + interval + lastW, uis.Main.OperateRegion.root.height - downDis)
    local startPos = downDis + dis * 0.6666666666666666
    startPos = uis.Main.OperateRegion.root.height - startPos
    local upCom = UIMgr:CreateObject(url.up.pkgName, url.up.resName)
    uis.Main.OperateRegion.root:AddChild(upCom)
    upCom:SetXY(barrierDis + interval + lastW, uis.Main.OperateRegion.root.height - downDis - dis - upCom.height)
    barrierDis = barrierDis + interval + lastW
    lastW = upCom.width
    local info = Activity10MiniGameWindow.GetCreateItemInfo()
    local addItem = false
    if info and itemCreateDis + info.dis < math.ceil(barrierDis * 0.01) then
      itemIndex = itemIndex + 1
      itemCreateDis = itemCreateDis + info.dis
      local data = TableData.GetConfig(info.id, "BaseActivityGameItem")
      if data then
        local item = UIMgr:CreateObject("ActivityDungeon1010", "MiniStart_ItemAni")
        ChangeUIController(item:GetChild("Item"), "c1", data.type - 1)
        uis.Main.OperateRegion.root:AddChild(item)
        item:SetXY(upCom.x + upCom.width * 0.5, uis.Main.OperateRegion.root.height - downDis - dis * 0.5)
        table.insert(itemInfo, {
          com = item,
          data = data,
          disNum = (upCom.x - playerX + flyCom.width) * 0.01
        })
        addItem = true
      end
    end
    table.insert(allBarrier, {
      downCom = downCom,
      upCom = upCom,
      x = downCom.x,
      dis = interval,
      startPos = startPos,
      addItem = addItem
    })
  end
  Activity10MiniGameWindow.DisposeBarrier()
end

function Activity10MiniGameWindow.GetDownNum()
  if downArrInfo[curConfData.id] then
    local posArr = downArrInfo[curConfData.id].arr[downArrInfo[curConfData.id].arrIndex]
    if posArr[downArrInfo[curConfData.id].index] then
      local pos = tonumber(posArr[downArrInfo[curConfData.id].index])
      downArrInfo[curConfData.id].index = downArrInfo[curConfData.id].index + 1
      return pos
    else
      downArrInfo[curConfData.id].arrIndex = math.random(1, #downArrInfo[curConfData.id].arr)
      posArr = downArrInfo[curConfData.id].arr[downArrInfo[curConfData.id].arrIndex]
      downArrInfo[curConfData.id].index = 1
      local pos = tonumber(posArr[downArrInfo[curConfData.id].index])
      downArrInfo[curConfData.id].index = downArrInfo[curConfData.id].index + 1
      return pos
    end
  else
    local arrTb = {}
    local arr = Split(curConfData.pillar_height1, "|")
    for i = 1, #arr do
      local pos = Split(arr[i], ":")
      arrTb[i] = pos
    end
    downArrInfo[curConfData.id] = {
      arr = arrTb,
      arrIndex = math.random(1, #arr),
      index = 1
    }
    local posArr = downArrInfo[curConfData.id].arr[downArrInfo[curConfData.id].arrIndex]
    if posArr[downArrInfo[curConfData.id].index] then
      local pos = tonumber(posArr[downArrInfo[curConfData.id].index])
      downArrInfo[curConfData.id].index = downArrInfo[curConfData.id].index + 1
      return pos
    end
  end
end

function Activity10MiniGameWindow.GetCreateItemInfo()
  if itemConfig[itemConfIndex] then
    if itemConfig[itemConfIndex].item[itemIndex] then
      return itemConfig[itemConfIndex].item[itemIndex]
    else
      itemIndex = 1
      itemConfIndex = itemConfIndex + 1
      return Activity10MiniGameWindow.GetCreateItemInfo()
    end
  end
end

function Activity10MiniGameWindow.DisposeBarrier()
  local offX = math.abs(uis.Main.OperateRegion.root.x) - playerX
  for i = #allBarrier, 1, -1 do
    if offX > allBarrier[i].x then
      allBarrier[i].downCom:Dispose()
      allBarrier[i].upCom:Dispose()
      table.remove(allBarrier, i)
    end
  end
end

function Activity10MiniGameWindow.GetConfData(mapIndex)
  local index = mapIndex
  index = index < 1 and 1 or index
  index = index > mapConfMax and mapConfMax or index
  return mapConfData[index]
end

function Activity10MiniGameWindow.GetConfig()
  local data = TableData.GetTable("BaseActivityGameMap")
  local tb = {}
  local GetName = function(str)
    local arr = Split(str, ":")
    return {
      pkgName = arr[1],
      resName = arr[2]
    }
  end
  local GetUrl = function(allStr)
    local arr = Split(allStr, "|")
    local url = {}
    for i = 1, #arr, 2 do
      table.insert(url, {
        down = GetName(arr[i]),
        up = GetName(arr[i + 1])
      })
    end
    return url
  end
  for i, v in pairs(data) do
    if v.game_id == Activity10_MiniGameData.gameId then
      local newData = SimpleCopy(v)
      newData.url = GetUrl(v.pillar_id)
      table.insert(tb, newData)
    end
  end
  table.sort(tb, function(a, b)
    return a.id < b.id
  end)
  return tb
end

function Activity10MiniGameWindow.GetRandomNum(numberData)
  local len = #numberData
  if len < 2 then
    return numberData[1]
  end
  return numberData[math.random(1, len)]
end

function Activity10MiniGameWindow.GetItemConfig()
  local data = TableData.GetTable("BaseActivityGame")
  local tb = {}
  local GetNum = function(str)
    local arr = Split(str, ":")
    return {
      id = tonumber(arr[1]),
      num = tonumber(arr[2])
    }
  end
  local GetUrl = function(numTb, dis)
    local item = {}
    for i, v in pairs(numTb) do
      local idTb = GetNum(v)
      if idTb then
        for index = 1, idTb.num do
          table.insert(item, {
            id = idTb.id,
            dis = dis
          })
        end
      end
    end
    return item
  end
  for i, v in pairs(data) do
    if v.game_id == Activity10_MiniGameData.gameId then
      local newData = GetUrl(v.item_num, v.interval_item)
      table.insert(tb, {
        game_stage = v.game_stage,
        item = newData
      })
    end
  end
  table.sort(tb, function(a, b)
    return a.game_stage < b.game_stage
  end)
  return tb
end

function Activity10MiniGameWindow.OnGameOver()
  UpdateManager.RemoveUpdateHandler(Activity10MiniGameWindow.Update)
  if waitTween then
    LeanTween.cancel(waitTween.uniqueId)
    waitTween = nil
  end
  uis.Main.root.touchable = false
  waitTween = LeanTween.delayedCall(0.15, function()
    OpenWindow(WinResConfig.Activity10MiniGameSubmitWindow.name, nil, score)
    uis.Main.root.touchable = true
    waitTween = nil
  end)
end

function Activity10MiniGameWindow.OnNext()
  stop = true
  if uis.Main.OperateRegion.root.numChildren > 0 then
    uis.Main.OperateRegion.root:RemoveChildren(0, -1, true)
  end
  uis.Main.OperateRegion.root:SetXY(0, uis.Main.OperateRegion.root.y)
  for i = 1, mapLayer do
    bgComInfo[i]:DisposeAll()
  end
  for com, v in pairs(tipsCom) do
    if v then
      com:Dispose()
    end
  end
  tipsCom = {}
  bgComInfo = {}
  Activity10MiniGameWindow.UpdateInfo()
end

function Activity10MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    stop = true
    stopDwon = true
    if stopTween then
      stopTween:pause()
    end
    MessageBox.Show(T(1897), {
      touchCallback = function()
        Activity10_MiniGameService.MiniGameSubmitReq({}, score, nil, 0, function()
          UIMgr:CloseWindow(WinResConfig.Activity10MiniGameWindow.name)
        end)
      end
    }, {
      touchCallback = function()
        stop = nil
        stopDwon = nil
        if stopTween then
          stopTween:resume()
        end
      end
    })
  end)
  uis.Main.FunctionDetailsBtn.onClick:Set(function()
    stop = true
    stopDwon = true
    OpenWindow(WinResConfig.Activity10MiniExplainWindow.name, nil, function()
      if uis and stop then
        stop = nil
        stopDwon = nil
        if showPlay then
          Activity10MiniGameWindow.PlayItemAnim()
          showPlay = nil
        end
      end
    end)
  end)
end

function Activity10MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity10_MiniGame.START_GAME then
    Activity10MiniGameWindow.OnNext()
  end
end

function Activity10MiniGameWindow.OnClose()
  if cachedFrameRate and Application.targetFrameRate ~= cachedFrameRate then
    Application.targetFrameRate = cachedFrameRate
  end
  cachedFrameRate = nil
  UpdateManager.RemoveUpdateHandler(Activity10MiniGameWindow.Update)
  ResourceManager.DestroyGameObject(bgPrefab, true)
  bgPrefab = nil
  uis = nil
  contentPane = nil
  score = nil
  hpTxt = nil
  flyCom = nil
  bgComInfo = nil
  allBarrier = nil
  itemInfo = nil
  hp = nil
  flyObj = nil
  mapConfData = nil
  curConfData = nil
  playerX = nil
  barrierDis = nil
  dieDownY = nil
  itemConfig = nil
  itemIndex = nil
  itemCreateDis = nil
  itemConfIndex = nil
  stop = nil
  rootWidth = nil
  mapConfMax = nil
  mapLayer = nil
  detailsShow = nil
  itemEffectNum = nil
  tipsCom = nil
  downArrInfo = nil
  curItemType = nil
  moveSpeed = 0
  if tweenDie then
    LeanTween.cancel(tweenDie.uniqueId)
    tweenDie = nil
  end
  if waitTween then
    LeanTween.cancel(waitTween.uniqueId)
    waitTween = nil
  end
  if stopTween then
    LeanTween.cancel(stopTween.uniqueId)
    stopTween = nil
  end
end

return Activity10MiniGameWindow
