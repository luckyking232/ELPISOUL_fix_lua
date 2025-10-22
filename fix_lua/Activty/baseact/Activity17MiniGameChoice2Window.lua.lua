require("ActivityDungeon1017_MiniGameChoice2WindowByName")
local Activity17MiniGameChoice2Window = {}
local uis, contentPane, selectCardId
local gameId = 70441022
local GetStageUnlockStamp = function(stageId)
  local stageConfig = TableData.GetConfig(stageId, "BaseShootStage")
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local startStamp = activityInfo.baseInfo.startStamp
  local startHour = tonumber(TimeUtil.FormatDate("%H", startStamp))
  local unlockStamp = startStamp - (startHour - 5) * 3600 + stageConfig.unlock_day * 3600 * 24
  return unlockStamp
end
local StageIsUnlock = function(stageId)
  local stageConfig = TableData.GetConfig(stageId, "BaseShootStage")
  local unlockStamp = GetStageUnlockStamp(stageId)
  local curServerStamp = LoginData.GetCurServerTime()
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local latestStage = info.miniHighScore
  return latestStage >= stageConfig.pre, unlockStamp <= curServerStamp
end
local StageIsPass = function(stageId)
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local latestStage = info.miniHighScore
  return stageId <= latestStage
end
local GetCurStage = function()
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local latestPassStage = info.miniHighScore
  local stageTable = TableData.GetTable("BaseShootStage")
  local lastStage
  for _, stage in pairs(stageTable) do
    if stage.pre == latestPassStage then
      return stage
    end
    if 0 == stage.next then
      lastStage = stage
    end
  end
  return lastStage
end
local GetCurUnlockStage = function()
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  local latestPassStage = info.miniHighScore
  local stageTable = TableData.GetTable("BaseShootStage")
  local lastStage
  for _, stage in pairs(stageTable) do
    if stage.pre == latestPassStage then
      lastStage = stage
      break
    end
  end
  local preComplete, timeComplete = StageIsUnlock(lastStage.id)
  if false == preComplete or false == timeComplete then
    return stageTable[lastStage.pre]
  end
  return lastStage
end
local RefreshPanelInfo = function()
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, gcmp)
    local allStageList = {}
    local stageTable = TableData.GetTable("BaseShootStage")
    for _, stage in pairs(stageTable) do
      table.insert(allStageList, stage)
    end
    table.sort(allStageList, function(a, b)
      return a.id < b.id
    end)
    local maxUnlockChildIndex = 0
    for index = 1, #allStageList do
      local stage = allStageList[index]
      local stageId = stage.id
      local tipsBtn
      if index < #allStageList then
        tipsBtn = gcmp:GetChild(string.format("Tips%dBtn", index))
        tipsBtn:GetChild("NumberTxt").text = T(11917, index)
      else
        tipsBtn = gcmp:GetChild("SpecialBtn")
      end
      if StageIsPass(stageId) then
        ChangeUIController(tipsBtn, "c2", 1)
        ChangeUIController(tipsBtn, "c1", 0)
        ChangeUIController(tipsBtn, "lock", 0)
        tipsBtn.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(11927))
        end)
      else
        ChangeUIController(tipsBtn, "c2", 0)
        local preComplete, timeComplete = StageIsUnlock(stageId)
        if preComplete and timeComplete then
          ChangeUIController(tipsBtn, "lock", 0)
          maxUnlockChildIndex = math.max(maxUnlockChildIndex, index)
          tipsBtn.onClick:Set(function()
            ld("MiniGameBattle")
            MiniGameBattleMgr.InitBattle({stageId = stageId})
          end)
        else
          ChangeUIController(tipsBtn, "lock", 1)
          tipsBtn.touchable = true
          local unlockStamp = GetStageUnlockStamp(stageId)
          local curServerStamp = LoginData.GetCurServerTime()
          local day = math.floor((unlockStamp - curServerStamp) / 24 / 3600) + 1
          if true == preComplete and false == timeComplete then
            ChangeUIController(tipsBtn, "c1", 1)
            tipsBtn:GetChild("Time"):GetChild("WordTxt").text = T(11925, day)
          else
            ChangeUIController(tipsBtn, "c1", 0)
          end
          tipsBtn.onClick:Set(function()
            if false == preComplete then
              FloatTipsUtil.ShowWarnTips(T(11926))
              return
            end
            if false == timeComplete then
              FloatTipsUtil.ShowWarnTips(T(11925, day))
            end
          end)
        end
      end
    end
  end
  
  list.numItems = 1
  Activity17MiniGameChoice2Window.UpdateCardHead()
end

function Activity17MiniGameChoice2Window.UpdateCardHead()
  local curStage = GetCurUnlockStage()
  local cardList = curStage.card_id
  local headList = uis.Main.CardRegion.HeadList
  local allCardList = {
    78000101,
    78000102,
    78000103,
    78000104,
    78000105
  }
  
  function headList.itemRenderer(i, gcmp)
    local cardId = allCardList[i + 1]
    local cardConfig = TableData.GetConfig(cardId, "BaseShootCard")
    gcmp:GetChild("Bg"):GetChild("PicLoader").url = UIUtil.GetResUrl(cardConfig.head_icon_ui)
    if table.contain(cardList, cardId) then
      ChangeUIController(gcmp, "lock", 0)
    else
      ChangeUIController(gcmp, "lock", 1)
    end
    gcmp.onClick:Set(function()
      selectCardId = cardId
      Activity17MiniGameChoice2Window.UpdateCardHead()
      OpenWindow(WinResConfig.Activity17MiniGameChoice2_InfoSkillWindow.name, nil, selectCardId, curStage.id)
    end)
    if selectCardId == cardId then
      ChangeUIController(gcmp, "c1", 1)
    else
      ChangeUIController(gcmp, "c1", 0)
    end
  end
  
  headList.numItems = #allCardList
end

function Activity17MiniGameChoice2Window.ReInitData()
end

function Activity17MiniGameChoice2Window.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17MiniGameChoice2Window.package, WinResConfig.Activity17MiniGameChoice2Window.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniGameChoice2WindowUis(contentPane)
    Activity17MiniGameChoice2Window.UpdateInfo()
    Activity17MiniGameChoice2Window.InitBtn()
  end)
end

function Activity17MiniGameChoice2Window.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIMgr:GetItemUrl("ActivityDungeon1017", "MiniGame1_1000")
  RefreshPanelInfo()
  local curStageId = GetCurStage().id
  uis.Main.TipsList.scrollPane:SetPosX(-190 * (curStageId % 100 - 1), false)
end

function Activity17MiniGameChoice2Window.InitBtn()
  uis.Main.ReturnBtn.onClick:Add(Activity17MiniGameChoice2Window.TouchClose)
end

function Activity17MiniGameChoice2Window.TouchClose()
  UIMgr:CloseWindow(WinResConfig.Activity17MiniGameChoice2Window.name)
end

function Activity17MiniGameChoice2Window.OnClose()
  uis = nil
  contentPane = nil
  selectCardId = nil
end

function Activity17MiniGameChoice2Window.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity17_MiniGame.REFRESH_MINIGAME_INFO then
    RefreshPanelInfo()
  elseif msgId == WindowMsgEnum.Activity17_MiniGameChoice2Window.RESET_SELECT_CARD then
    selectCardId = nil
    Activity17MiniGameChoice2Window.UpdateCardHead()
  end
end

return Activity17MiniGameChoice2Window
