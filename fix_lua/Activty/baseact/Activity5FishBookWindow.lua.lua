require("ActivityDungeon1004_MiniBook2WindowByName")
local Activity5FishBookWindow = {}
local uis, contentPane
local gameId = 70441006
local fishNew

function Activity5FishBookWindow.ReInitData()
end

function Activity5FishBookWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishBookWindow.package, WinResConfig.Activity5FishBookWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniBook2WindowUis(contentPane)
    fishNew = OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.FISH_NEW)
    Activity5FishBookWindow.UpdateInfo()
    Activity5FishBookWindow.InitBtn()
  end)
end

function Activity5FishBookWindow.UpdateInfo(notPlay)
  UIUtil.SetText(uis.Main.GetBtn, T(1703), "WordTxt")
  local fishData = Activity5FishBookWindow.GetAllFish()
  local list = uis.Main.TipsList
  local haveFish = Activity5_MiniGameData.GetAllFish()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local new = {}
  
  function list.itemRenderer(i, item)
    local tips = item:GetChild("Tips")
    local data = fishData[i + 1]
    if data and tips then
      tips:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      UIUtil.SetText(tips, data.name(), "NameTxt")
      ChangeUIController(tips, "c1", haveFish[data.id] and 1 or 0)
      if haveFish[data.id] then
        table.insert(new, data.id)
      end
      ChangeUIController(tips, "c2", table.contain(fishNew, data.id) and 0 or 1)
      ChangeUIController(tips, "c3", info and 1 == info.extraCount[data.id] and 1 or 0)
      if data.reward and data.reward[1] then
        local reward = Split(data.reward[1], ":")
        if 3 == #reward then
          UIUtil.SetIconById(tips:GetChild("ItemLoader"), tonumber(reward[2]))
        end
      end
      item.onClick:Set(function()
        if info and 1 == info.extraCount[data.id] then
          Activity5_MiniGameService.MiniGameGetDailyRewardReq(gameId, data.id)
        end
      end)
    end
    if not notPlay and i < 12 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.04)
    end
  end
  
  list.numItems = #fishData
  local haveNumber = info and info.extraCount and table.getLen(info.extraCount) or 0
  uis.Main.Number.WordTxt.text = T(1702, haveNumber, #fishData)
  ChangeController(uis.Main.c1Ctr, Activity5FishBookWindow.CanGet() and 1 or 0)
  OprRecordUtil.SaveRecord(PLAYER_OPERATION_ENUM.FISH_NEW, new)
end

function Activity5FishBookWindow.GetAllFish()
  local data = TableData.GetTable("BaseActivityGameItem")
  local fish = {}
  for i, v in pairs(data) do
    if v.game_id == gameId and 1 == v.type then
      table.insert(fish, v)
    end
  end
  table.sort(fish, function(a, b)
    return a.sort < b.sort
  end)
  return fish
end

function Activity5FishBookWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5FishBookWindow.name)
  end)
  uis.Main.GetBtn.onClick:Set(function()
    if Activity5FishBookWindow.CanGet() then
      Activity5_MiniGameService.MiniGameGetDailyRewardReq(gameId, -1)
    end
  end)
end

function Activity5FishBookWindow.CanGet()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  if info then
    for i, v in pairs(info.extraCount) do
      if 1 == v then
        return true
      end
    end
  end
end

function Activity5FishBookWindow.OnClose()
  uis = nil
  contentPane = nil
end

function Activity5FishBookWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity5_MiniGame.REFRESH_MINIGAME_INFO then
    Activity5FishBookWindow.UpdateInfo(true)
  end
end

return Activity5FishBookWindow
