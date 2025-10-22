require("ActivityDungeon1011_MiniGameChoiceWindowByName")
local Activity11MiniGameChoiceWindow = {}
local uis, contentPane, selectedLevelIndex
local gameId = 70441013
local LevelIsUnlock = function(levelIndex)
  local info = Activity11_MiniGameData.GetMiniGameInfo(gameId)
  local remoteMap = info.extraCount
  local latestLevel = remoteMap and remoteMap[1] or 0
  return levelIndex <= latestLevel + 1
end
local LevelIsCleared = function(levelIndex)
  local info = Activity11_MiniGameData.GetMiniGameInfo(gameId)
  local remoteMap = info.extraCount
  local latestLevel = remoteMap and remoteMap[1] or 0
  return levelIndex <= latestLevel
end
local LevelIsReachedUnlockTime = function(levelIndex)
  local levelConfigs = Activity11_MiniGameData.GetOrLoadLevelConfigs()
  local config = levelConfigs[levelIndex]
  if levelIndex > #levelConfigs then
    config = levelConfigs[#levelConfigs]
  end
  local unlockDay = config and config.unlockDay or 0
  local info = ActivityDungeonData.GetActivityInfo()
  local diff = LoginData.GetCurServerTime() - info.baseInfo.startStamp
  local unlockSeconds = unlockDay * 86400
  local result = unlockSeconds - diff
  return result <= 0, result
end
local perPageLevels = 20
local LevelItemRenderer = function(page, gcmp)
  local levelConfigs = Activity11_MiniGameData.GetOrLoadLevelConfigs()
  local numLevels = #levelConfigs + 1
  for i = 1, perPageLevels do
    local levelItem = gcmp:GetChild(string.format("Dot%sBtn", i))
    local levelIndex = page * perPageLevels + i
    if numLevels >= levelIndex then
      local unlock = LevelIsUnlock(levelIndex)
      local cleared = LevelIsCleared(levelIndex)
      local reachedUnlockTime, _ = LevelIsReachedUnlockTime(levelIndex)
      ChangeUIController(levelItem, "lock", unlock and reachedUnlockTime and (cleared and 2 or 1) or 0)
      UIUtil.SetText(levelItem, levelIndex, "NumberTxt")
      levelItem.onClick:Set(function()
        local reachedUnlockTime, remainTime = LevelIsReachedUnlockTime(levelIndex)
        if reachedUnlockTime then
          if unlock then
            selectedLevelIndex = levelIndex
          else
            FloatTipsUtil.ShowWarnTips(T(20686))
          end
        else
          FloatTipsUtil.ShowWarnTips(T(20687, TimeUtil.FormatRemainTimeRough(remainTime)))
        end
      end)
    else
      ChangeUIController(levelItem, "lock", 0)
    end
  end
end
local RefreshPanelInfo = function()
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, gcmp)
    local levelList = gcmp:GetChild("DotList")
    levelList.itemRenderer = LevelItemRenderer
    levelList.numItems = 10
  end
  
  list.numItems = 1
  local info = Activity11_MiniGameData.GetMiniGameInfo(gameId)
  local remoteLevelIndex = info and (info.extraCount[1] and info.extraCount[1] or 0) or 0
  local latestLevelIndex
  if LevelIsReachedUnlockTime(remoteLevelIndex + 1) then
    latestLevelIndex = remoteLevelIndex + 1
  else
    for i = remoteLevelIndex, 0, -1 do
      if LevelIsReachedUnlockTime(i) then
        latestLevelIndex = i
        break
      end
    end
  end
  if type(Activity11_MiniGameData.levelIndex) == "number" then
    selectedLevelIndex = math.min(200, math.min(Activity11_MiniGameData.levelIndex, latestLevelIndex))
  else
    selectedLevelIndex = math.min(200, latestLevelIndex)
  end
  local page = math.ceil(selectedLevelIndex / perPageLevels)
  local itemIndex = (selectedLevelIndex - 1) % perPageLevels + 1
  local dotlist = list:GetChildAt(0):GetChild("DotList")
  local childIndex = dotlist:ItemIndexToChildIndex(math.max(0, page - 1))
  local child = dotlist:GetChildAt(childIndex)
  local item = child:GetChild(string.format("Dot%sBtn", itemIndex))
  local leftPosX = item.x + 1425 * (page - 1) + 45 + 128
  list.container.x = math.max(-13166, math.min(0, list.width * 0.5 - leftPosX))
end

function Activity11MiniGameChoiceWindow.ReInitData()
end

function Activity11MiniGameChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity11MiniGameChoiceWindow.package, WinResConfig.Activity11MiniGameChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1011_MiniGameChoiceWindowUis(contentPane)
    Activity11MiniGameChoiceWindow.UpdateInfo()
    Activity11MiniGameChoiceWindow.InitBtn()
  end)
end

function Activity11MiniGameChoiceWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1011/MiniGame_1001"
  UIUtil.SetText(uis.Main.StartBtn, T(20659), "WordTxt")
  RefreshPanelInfo()
end

function Activity11MiniGameChoiceWindow.InitBtn()
  uis.Main.StartBtn.onClick:Set(function()
    if selectedLevelIndex then
      OpenWindow(WinResConfig.Activity11MiniGameWindow.name, nil, selectedLevelIndex)
    end
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity11MiniGameChoiceWindow.name)
  end)
end

function Activity11MiniGameChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity11MiniGameChoiceWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity11_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  end
end

return Activity11MiniGameChoiceWindow
