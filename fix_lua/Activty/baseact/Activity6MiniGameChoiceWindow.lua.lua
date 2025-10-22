require("ActivityDungeon1005_MiniGameChoiceWindowByName")
local Activity6MiniGameChoiceWindow = {}
local uis, contentPane
local gameId = 70441007
local selectedConf, configs, shapeMode
local OnUpdate = function()
  local list = uis.Main.TipsList
  if configs and selectedConf then
    for i, v in ipairs(configs) do
      if v == selectedConf then
        for j = 0, list.numChildren - 1 do
          local child = list:GetChildAt(j)
          local btn = child:GetChild("TipsBtn")
          ChangeUIController(btn, "button", j == i - 1 and 1 or 0)
        end
      end
    end
  end
end

function Activity6MiniGameChoiceWindow.ReInitData()
end

function Activity6MiniGameChoiceWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity6MiniGameChoiceWindow.package, WinResConfig.Activity6MiniGameChoiceWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1005_MiniGameChoiceWindowUis(contentPane)
    Activity6MiniGameChoiceWindow.UpdateInfo()
    Activity6MiniGameChoiceWindow.InitBtn()
  end)
end

local ACTIVITY_6_ENABLE_SHAPE_MODE = "ACTIVITY_6_ENABLE_SHAPE_MODE"
local ACTIVITY_6_DEFAULT_SELECTED_MAP_ID = "ACTIVITY_6_DEFAULT_SELECTED_MAP_ID"

function Activity6MiniGameChoiceWindow.UpdateInfo()
  local balllist = uis.Main.BallList
  
  function balllist.itemRenderer(i, gcmp)
    ChangeUIController(gcmp, "c1", i)
    ChangeUIController(gcmp, "c2", shapeMode and 1 or 0)
  end
  
  local defaultMapId = PlayerPrefsUtil.GetInt(ACTIVITY_6_DEFAULT_SELECTED_MAP_ID, -1, ActorData.GetUin())
  shapeMode = PlayerPrefsUtil.GetInt(ACTIVITY_6_ENABLE_SHAPE_MODE, -1, ActorData.GetUin()) > 0
  balllist.numItems = 4
  local toggle = uis.Main.TabSignBtn:GetController("button")
  toggle.onChanged:Set(function()
    shapeMode = 1 == toggle.selectedIndex
    balllist.numItems = 4
    PlayerPrefsUtil.SetInt(ACTIVITY_6_ENABLE_SHAPE_MODE, shapeMode and 1 or -1, ActorData.GetUin())
  end)
  ChangeUIController(uis.Main.TabSignBtn, "button", shapeMode and 1 or 0)
  UIUtil.SetText(uis.Main.TabSignBtn, T(20633), "Word1Txt")
  UIUtil.SetText(uis.Main.TabSignBtn, T(20634), "Word2Txt")
  UIUtil.SetBtnText(uis.Main.StartBtn, T(20631))
  configs = {}
  local tbl = TableData.GetTable("BaseActivityGame")
  for _, v in pairs(tbl) do
    if v.game_id == gameId then
      table.insert(configs, v)
    end
  end
  table.sort(configs, function(a, b)
    return a.game_stage < b.game_stage
  end)
  local info = Activity6_MiniGameData.GetMiniGameInfo(gameId)
  local extraCount = info.extraCount
  local list = uis.Main.TipsList
  
  function list.itemRenderer(i, gcmp)
    local gameConfig = configs[i + 1]
    local tips = gcmp:GetChild("TipsBtn")
    tips.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.08)
    LeanTween.delayedCall(i * 0.08, function()
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_role_card_move_dual")
    end)
    UIUtil.SetText(tips, gameConfig.name and gameConfig.name() or "未配置", "NameTxt")
    ChangeUIController(tips, "map", gameConfig.map_icon - 1)
    local unlock = 1 == gameConfig.game_stage or extraCount[gameConfig.pre]
    ChangeUIController(tips, "lock", unlock and 0 or 1)
    ChangeUIController(tips, "button", selectedConf == gameConfig and 1 or 0)
    if not unlock then
      local preConf = TableData.GetConfig(gameConfig.pre, "BaseActivityGame")
      UIUtil.SetText(tips, T(20632, preConf.name and preConf.name() or preConf.id), "LockTxt")
    end
    tips.onClick:Set(function()
      if unlock then
        if list.selectedIndex == i then
          return
        end
        selectedConf = gameConfig
        PlayerPrefsUtil.SetInt(ACTIVITY_6_DEFAULT_SELECTED_MAP_ID, gameConfig.id, ActorData.GetUin())
        for j = 0, list.numChildren - 1 do
          local child = list:GetChildAt(j)
          local btn = child:GetChild("TipsBtn")
          ChangeUIController(btn, "button", i == j and 1 or 0)
        end
      else
        local preConf = TableData.GetConfig(gameConfig.pre, "BaseActivityGame")
        FloatTipsUtil.ShowWarnTips(T(20632, preConf.name and preConf.name() or preConf.id))
      end
    end)
    tips.onTouchEnd:Set(function()
      for j, v in ipairs(configs) do
        if v == selectedConf then
          for k = 0, list.numChildren - 1 do
            local child = list:GetChildAt(k)
            local btn = child:GetChild("TipsBtn")
            ChangeUIController(btn, "button", k == j - 1 and 1 or 0)
          end
          break
        end
      end
    end)
  end
  
  list.numItems = #configs
  local defaultSelectedIndex
  for i, config in ipairs(configs) do
    if config.id == defaultMapId then
      defaultSelectedIndex = i - 1
      break
    end
  end
  defaultSelectedIndex = defaultSelectedIndex or 0
  list:GetChildAt(defaultSelectedIndex):GetChild("TipsBtn").onClick:Call()
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    local btn = child:GetChild("TipsBtn")
    local controller = btn:GetController("button")
    controller.onChanged:Set(function()
      if 0 == controller.selectedIndex then
        for j, v in ipairs(configs) do
          if v == selectedConf then
            for k = 0, list.numChildren - 1 do
              local child = list:GetChildAt(k)
              local btn = child:GetChild("TipsBtn")
              ChangeUIController(btn, "button", k == j - 1 and 1 or 0)
            end
            break
          end
        end
      end
    end)
  end
end

function Activity6MiniGameChoiceWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity6MiniGameChoiceWindow.name)
  end)
  uis.Main.StartBtn.onClick:Set(function()
    if selectedConf then
      OpenWindow(WinResConfig.Activity6MiniGameWindow.name, nil, selectedConf, shapeMode)
    end
  end)
end

function Activity6MiniGameChoiceWindow.OnClose()
  uis = nil
  contentPane = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
end

return Activity6MiniGameChoiceWindow
