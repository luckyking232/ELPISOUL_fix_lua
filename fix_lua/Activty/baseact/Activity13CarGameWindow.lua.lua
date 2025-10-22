require("ActivityDungeon1013_MiniGameStart2WindowByName")
local Activity13CarGameWindow = {}
local uis, contentPane
local width, height = 106, 106
local targetUrl = "MiniStart2_Move00"
local twoUrl = {
  "MiniStart2_Move01",
  "MiniStart2_Move02",
  "MiniStart2_Move03",
  "MiniStart2_Move04",
  "MiniStart2_Move05",
  "MiniStart2_Move06",
  "MiniStart2_Move07"
}
local threeUrl = {
  "MiniStart2_Move08",
  "MiniStart2_Move09",
  "MiniStart2_Move10"
}
local stageNum, count, difficultyData, withdrawInfo, itemInfo, gridInfo
local gameId = 70441017
local gridWidth = 6
local setStageId = 0

function Activity13CarGameWindow.ReInitData()
end

function Activity13CarGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13CarGameWindow.package, WinResConfig.Activity13CarGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniGameStart2WindowUis(contentPane)
    Activity13CarGameWindow.UpdateInfo()
    Activity13CarGameWindow.InitBtn()
    if GuideData.CanShowCaption(gameId) then
      uis.Main.PauseBtn.onClick:Call()
      GuideData.SaveCaptionOpen(gameId)
    end
  end)
end

function Activity13CarGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1013", "MiniGame1_1001")
  UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
  uis.Main.OperateRegion.root.touchable = true
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
  count = 0
  withdrawInfo = {}
  local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
  if info then
    difficultyData, stageNum = Activity13CarGameWindow.GetCurDifficulty(info.extraCount)
    print(difficultyData.id, ">>>>>>>>>>>StageId>>>>>>>>>>>>>>")
    Activity13CarGameWindow.InitStageData()
    Activity13CarGameWindow.InitMap()
    Activity13CarGameWindow.UpdateCount()
  end
end

function Activity13CarGameWindow.InitMap()
  gridInfo = {}
  for y = 1, gridWidth do
    gridInfo[y] = {}
    for x = 1, gridWidth do
      gridInfo[y][x] = 0
    end
  end
  for i = 1, #itemInfo do
    Activity13CarGameWindow.SetGridMap(itemInfo[i])
    itemInfo[i] = Activity13CarGameWindow.CreateItem(itemInfo[i], 1 == i and targetUrl or Activity13CarGameWindow.GetResName(itemInfo[i]))
  end
  for i = 1, #itemInfo do
    local com = itemInfo[i].item
    com.draggable = true
    local limit = {}
    local startPos, startXy
    com.onDragStart:Set(function(context)
      startPos = com.xy
      startXy = {
        x = itemInfo[i].xy.x,
        y = itemInfo[i].xy.y
      }
      limit = Activity13CarGameWindow.GetLimitPos(itemInfo[i])
      local rect = com.displayObject:GetBounds(GRoot.inst.displayObject)
      if 1 == itemInfo[i].dir then
        rect:Set(rect.x - limit.pos, rect.y, rect.width + limit.addWidth, rect.height)
      else
        rect:Set(rect.x + width / 2, rect.y - limit.pos, 0, rect.height + limit.addWidth)
        rect.xMax = rect.xMax - width
      end
      com.dragBounds = rect
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_wanyan_mov")
    end)
    com.onDragEnd:Set(function(context)
      local posNum = 1 == itemInfo[i].dir and com.x or com.y
      local index = posNum % width > width * 0.5 and math.ceil(posNum / width) or math.floor(posNum / width)
      Activity13CarGameWindow.ClearMapById(itemInfo[i].id)
      if 1 == itemInfo[i].dir then
        itemInfo[i].xy.x = index + 1
        com:SetXY(index * width, com.y)
      else
        itemInfo[i].xy.y = index + 1
        com:SetXY(com.x, index * width)
      end
      itemInfo[i].pos = com.xy
      Activity13CarGameWindow.SetGridMap(itemInfo[i])
      if Vector2.Distance(com.xy, startPos) > 10 then
        count = count + 1
        if #withdrawInfo >= 1000 then
          table.remove(withdrawInfo, 1)
        end
        table.insert(withdrawInfo, {
          count = count,
          itemIndex = i,
          startPos = startPos,
          endPos = com.xy,
          startXy = startXy
        })
        Activity13CarGameWindow.UpdateCount()
      end
      if Activity13CarGameWindow.CheckPass() then
        uis.Main.OperateRegion.root.touchable = false
        PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY13_CAR_STAGE_ID, 0)
        itemInfo[1].item:TweenMoveX(500, 0.5):SetEase(EaseType.Linear):OnComplete(function()
          OpenWindow(WinResConfig.Activity13CarGameSubmitWindow.name, nil, count, difficultyData.id)
          uis.Main.OperateRegion.root.touchable = true
        end)
      end
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_wanyan_stop")
    end)
  end
end

function Activity13CarGameWindow.CheckPass()
  local y = itemInfo[1].xy.y
  for x = itemInfo[1].xy.x + itemInfo[1].num - 1, gridWidth do
    if gridInfo[y][x] > 1 then
      return false
    end
  end
  return true
end

function Activity13CarGameWindow.ClearMapById(id)
  for y = 1, gridWidth do
    for x = 1, gridWidth do
      if gridInfo[y][x] == id then
        gridInfo[y][x] = 0
      end
    end
  end
end

function Activity13CarGameWindow.GetLimitPos(info)
  if 1 == info.dir then
    local index = 0
    for x = info.xy.x + info.num, gridWidth do
      if 0 == gridInfo[info.xy.y][x] then
        index = index + 1
      else
        break
      end
    end
    local index2 = 0
    for x = info.xy.x - 1, 1, -1 do
      if 0 == gridInfo[info.xy.y][x] then
        index2 = index2 + 1
      else
        break
      end
    end
    return {
      addWidth = (index + index2) * height,
      pos = index2 * height
    }
  else
    local index = 0
    for y = info.xy.y + info.num, gridWidth do
      if 0 == gridInfo[y][info.xy.x] then
        index = index + 1
      else
        break
      end
    end
    local index2 = 0
    for y = info.xy.y - 1, 1, -1 do
      if 0 == gridInfo[y][info.xy.x] then
        index2 = index2 + 1
      else
        break
      end
    end
    return {
      addWidth = (index + index2) * height,
      pos = index2 * height
    }
  end
end

function Activity13CarGameWindow.CreateItem(info, resName)
  local item = UIMgr:CreateObject("ActivityDungeon1013", resName)
  uis.Main.OperateRegion.root:AddChild(item)
  local x = (info.xy.x - 1) * width
  local y = (info.xy.y - 1) * height
  if 2 == info.dir then
    UIUtil.SetHolderCenter(item, 0, 0.5)
    item.rotation = 90
    x = x + width / 2
  end
  item:SetXY(x, y)
  info.pos = {x = x, y = y}
  info.item = item
  item.gameObjectName = info.id
  item.name = info.id
  return info
end

function Activity13CarGameWindow.GetResName(info)
  if 2 == info.num then
    return twoUrl[math.random(1, #twoUrl)]
  elseif 3 == info.num then
    return threeUrl[math.random(1, #threeUrl)]
  end
end

function Activity13CarGameWindow.SetGridMap(info)
  if 1 == info.dir then
    for y = 1, info.num do
      local x = y + info.xy.x - 1
      gridInfo[info.xy.y][x] = info.id
    end
  else
    for x = 1, info.num do
      local y = x + info.xy.y - 1
      gridInfo[y][info.xy.x] = info.id
    end
  end
end

function Activity13CarGameWindow.InitStageData()
  local str = Split(difficultyData.item_site, "|")
  itemInfo = {}
  local arr
  for i = 1, #str do
    arr = Split(str[i], ":")
    table.insert(itemInfo, {
      xy = {
        x = tonumber(arr[1]),
        y = tonumber(arr[2])
      },
      num = tonumber(arr[3]),
      dir = tonumber(arr[4]),
      id = #itemInfo + 1
    })
  end
end

function Activity13CarGameWindow.UpdateCount()
  uis.Main.Integral.NumberTxt.text = stageNum
  uis.Main.Integral.Number1Txt.text = count
end

function Activity13CarGameWindow.OnNext()
  for i = 1, #itemInfo do
    itemInfo[i].item:Dispose()
  end
  Activity13CarGameWindow.UpdateInfo()
end

function Activity13CarGameWindow.GetCurDifficulty(haveData)
  local data = TableData.GetTable("BaseActivityGameMap")
  local difficulty = {}
  for i, v in pairs(data) do
    if v.game_id == gameId then
      table.insert(difficulty, v)
    end
  end
  table.sort(difficulty, function(a, b)
    return a.id < b.id
  end)
  local len = #difficulty
  for i = 1, len do
    if setStageId and setStageId > 0 then
      if setStageId == difficulty[i].id then
        return difficulty[i], i
      end
    elseif not haveData[difficulty[i].id] then
      return difficulty[i], i
    end
  end
  local num = 0
  local info = Activity13_MiniGameData.GetMiniGameInfo(gameId)
  if info.extraCount and info.extraCount[1] then
    num = info.extraCount[1]
  end
  local id = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY13_CAR_STAGE_ID)
  if id > 0 then
    local data = TableData.GetConfig(id, "BaseActivityGameMap")
    if data then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY13_CAR_STAGE_ID, data.id)
      return data, num + 1
    end
  else
    local index = math.random(math.max(1, len - 60), len)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY13_CAR_STAGE_ID, difficulty[index].id)
    return difficulty[index], num + 1
  end
end

function Activity13CarGameWindow.InitBtn()
  uis.Main.Integral.NumberWordTxt.text = T(1984)
  uis.Main.Integral.NumberWord1Txt.text = T(1985)
  UIUtil.SetText(uis.Main.AgainBtn, T(1986))
  UIUtil.SetText(uis.Main.WithdrawBtn, T(1987))
  uis.Main.AgainBtn.onClick:Set(function()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_wanyan_restart")
    Activity13CarGameWindow.OnNext()
  end)
  uis.Main.WithdrawBtn.onClick:Set(function()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_13_wanyan_redo")
    for i = #withdrawInfo, 1, -1 do
      if withdrawInfo[i].count == count then
        uis.Main.OperateRegion.root.touchable = false
        itemInfo[withdrawInfo[i].itemIndex].item:TweenMove(withdrawInfo[i].startPos, 0.3):SetEase(EaseType.Linear):OnComplete(function()
          uis.Main.OperateRegion.root.touchable = true
        end)
        Activity13CarGameWindow.ClearMapById(itemInfo[withdrawInfo[i].itemIndex].id)
        itemInfo[withdrawInfo[i].itemIndex].xy = withdrawInfo[i].startXy
        Activity13CarGameWindow.SetGridMap(itemInfo[withdrawInfo[i].itemIndex])
        table.remove(withdrawInfo, i)
        count = count - 1
        Activity13CarGameWindow.UpdateCount()
        return
      end
    end
  end)
  uis.Main.PauseBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity13CarGameExplainWindow.name)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    MessageBox.Show(T(1988), {
      touchCallback = function()
        Activity13_MiniGameService.MiniGameSubmitReq(gameId, {}, 0, nil, function()
          UIMgr:CloseWindow(WinResConfig.Activity13CarGameWindow.name)
        end)
      end
    }, {})
  end)
end

function Activity13CarGameWindow.OnClose()
  uis = nil
  contentPane = nil
  stageNum = nil
  count = nil
  difficultyData = nil
  withdrawInfo = nil
  itemInfo = nil
  gridInfo = nil
end

function Activity13CarGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity13_MiniGame.RESET then
    Activity13CarGameWindow.OnNext()
  end
end

return Activity13CarGameWindow
