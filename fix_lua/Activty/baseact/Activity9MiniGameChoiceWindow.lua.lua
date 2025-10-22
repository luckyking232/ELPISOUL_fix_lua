require("ActivityDungeon1008_MiniGameChoiceWindowByName")
local Activity9MiniGameChoiceWindow = {}
local uis, contentPane, stageData

function Activity9MiniGameChoiceWindow.ReInitData()
end

function Activity9MiniGameChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniGameChoiceWindow.package, WinResConfig.Activity9MiniGameChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniGameChoiceWindowUis(contentPane)
    Activity9MiniGameChoiceWindow.UpdateInfo()
    Activity9MiniGameChoiceWindow.InitBtn()
  end)
end

function Activity9MiniGameChoiceWindow.UpdateInfo()
  local list = uis.Main.TipsList
  local mapData, stageName = Activity9MiniGameChoiceWindow.GetMapData()
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
  local call = true
  if info then
    local haveData = info.extraCount
    local id = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY09_GAME_STAGE_ID)
    local lastBtn, tempIndex
    
    function list.itemRenderer(i, item)
      local tips = item:GetChild("TipsBtn")
      ChangeUIController(tips, "map", i)
      UIUtil.SetText(tips, mapData[i + 1].name(), "NameTxt")
      if mapData[i + 1].pre == nil or haveData[mapData[i + 1].pre] then
        ChangeUIController(tips, "lock", 0)
        tips.touchable = true
      else
        ChangeUIController(tips, "lock", 1)
        UIUtil.SetText(tips, T(1853, stageName[mapData[i + 1].pre]), "LockTxt")
        tips.touchable = false
      end
      tips.onClick:Set(function()
        if nil == lastBtn or lastBtn ~= tips then
          stageData = mapData[i + 1]
          if mapData[i + 1].stage_id then
            local rand = math.random(1, #mapData[i + 1].stage_id)
            stageData = TableData.GetConfig(mapData[i + 1].stage_id[rand], "BaseActivityGame")
          end
          PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ACTIVITY09_GAME_STAGE_ID, mapData[i + 1].id)
          list.selectedIndex = i
          tips.selected = true
          if lastBtn then
            lastBtn.selected = false
          end
          lastBtn = tips
        end
      end)
      if not haveData[mapData[i + 1].id] and call then
        tips.onClick:Call()
        call = nil
      end
      if id and id == mapData[i + 1].id then
        tempIndex = i
      end
      tips.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.05)
    end
    
    list.numItems = #mapData
    if call and tempIndex then
      list:GetChildAt(tempIndex):GetChild("TipsBtn").onClick:Call()
    end
  end
end

function Activity9MiniGameChoiceWindow.GetMapData()
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  local lockName = {}
  for i, v in pairs(data) do
    if v.game_id == Activity9_MiniGameData.gameId and v.name then
      table.insert(difficulty, v)
      lockName[v.id] = v.name()
    end
  end
  table.sort(difficulty, function(a, b)
    return a.game_stage < b.game_stage
  end)
  return difficulty, lockName
end

function Activity9MiniGameChoiceWindow.InitBtn()
  UIUtil.SetText(uis.Main.OperateBtn, T(1852))
  uis.Main.OperateBtn.onClick:Set(function()
    OpenWindow(WinResConfig.Activity9MiniOperateChoiceWindow.name)
  end)
  UIUtil.SetText(uis.Main.StartBtn, T(1849))
  uis.Main.StartBtn.onClick:Set(function()
    if stageData then
      OpenWindow(WinResConfig.Activity9MiniGameWindow.name, nil, stageData)
    end
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9MiniGameChoiceWindow.name)
  end)
end

function Activity9MiniGameChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity9MiniGameChoiceWindow
