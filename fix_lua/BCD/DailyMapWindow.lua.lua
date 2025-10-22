require("DailyDungeon_DailyMapWindowByName")
local DailyMapWindow = {}
local uis, chapterData, chapterTypeMap, contentPane, stageId, dailyData, jumpTb, stageNum
local lastIndex = 0
local firstOpen, argTable
local bgEffectPath = "Assets/Art/Effects/Prefab/UI_prefab/DailyAdventure/%s"
local GetEffEctPath = function(name)
  return string.format(bgEffectPath, name)
end

function DailyMapWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.DailyMapWindow.package, WinResConfig.DailyMapWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetDailyDungeon_DailyMapWindowUis(contentPane)
    argTable = bridgeObj.argTable
    local arg = argTable[1]
    dailyData = arg.data
    stageId = arg.stageId
    DailyMapWindow.InitBtn()
    DailyMapWindow.Init()
    PlayUITrans(uis.Main.root, "in1")
    if nil ~= stageId then
      stageId = nil
      local newArgs = argTable
      newArgs[1].stageId = nil
      UIMgr:SetWindowArgs(WinResConfig.DailyMapWindow.name, newArgs)
    end
  end)
end

function DailyMapWindow.Init()
  if dailyData then
    DailyMapWindow.InitData()
  end
  if stageId then
    local stageData = TableData.GetConfig(stageId, "BaseStage")
    local showType = 0
    if stageData and chapterData then
      for i, v in pairs(chapterData) do
        if v.id == stageData.chapter_id and v.show_type then
          showType = v.show_type
          break
        end
      end
      AdventureMgr.dailyMapIndex = showType + 1
    end
    DailyMapWindow.InitList()
  else
    AdventureService.GetChapterStageReq(dailyData.chapter_id, function()
      if nil == chapterTypeMap then
        DailyMapWindow.InitList()
      end
    end)
  end
end

function DailyMapWindow.IsQuality()
  if dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_QUALITY_UP then
    return true
  end
end

function DailyMapWindow.InitData()
  chapterData = {}
  local tab = uis.Main.TabRegion
  local fourBtn = {
    [1] = {
      root = tab.Tab1Btn,
      name = T(219),
      title = T(220)
    },
    [2] = {
      root = tab.Tab2Btn,
      name = T(221),
      title = T(222)
    },
    [3] = {
      root = tab.Tab5Btn,
      name = T(227),
      title = T(228)
    },
    [4] = {
      root = tab.Tab4Btn,
      name = T(225),
      title = T(226)
    }
  }
  local fiveBtn = {
    [1] = {
      root = tab.Tab20Btn,
      name = T(1109),
      title = T(1110)
    },
    [2] = {
      root = tab.Tab21Btn,
      name = T(1111),
      title = T(1112)
    },
    [3] = {
      root = tab.Tab23Btn,
      name = T(1115),
      title = T(1116)
    },
    [4] = {
      root = tab.Tab22Btn,
      name = T(1117),
      title = T(1118)
    },
    [5] = {
      root = tab.Tab24Btn,
      name = T(1809)
    }
  }
  for i, v in ipairs(dailyData.chapter_id) do
    local data = TableData.GetConfig(v, "BaseChapter")
    if data.show_type then
      chapterData[data.show_type + 1] = data
    else
      chapterData[i] = data
      AdventureMgr.dailyMapIndex = 1
    end
    if DailyMapWindow.IsQuality() then
      ChangeUIController(fourBtn[i].root:GetChild("Badge2"), nil, data.show_type)
      ChangeUIController(fourBtn[i].root:GetChild("Badge1"), nil, data.show_type)
      fourBtn[i].root.soundFmod = SOUND_EVENT_ENUM.TAB_TAG_BOTTOM
      UIUtil.SetBtnText(fourBtn[i].root, fourBtn[i].name, fourBtn[i].title)
    else
      ChangeUIController(fiveBtn[i].root:GetChild("Badge2"), nil, data.show_type)
      ChangeUIController(fiveBtn[i].root:GetChild("Badge1"), nil, data.show_type)
      fiveBtn[i].root.soundFmod = SOUND_EVENT_ENUM.TAB_TAG_BOTTOM
      UIUtil.SetBtnText(fiveBtn[i].root, fiveBtn[i].name, fiveBtn[i].title)
    end
  end
end

function DailyMapWindow.InitList()
  chapterTypeMap = {}
  stageNum = {}
  uis.Main.TabRegion.root.visible = #chapterData > 1
  for i, v in pairs(chapterData) do
    local resStrTable = Split(v.map_path, ":")
    if resStrTable and #resStrTable > 1 then
      local map = UIMgr:CreateObject(resStrTable[1], resStrTable[2])
      map.name = map.gameObjectName
      chapterTypeMap[i] = map
      chapterTypeMap[i].visible = false
      stageNum[i] = #v.stages
      UIUtil.SetHolderCenter(map:GetChild("EffectHolder"))
      DailyMapWindow.RefreshMapItem(map, v)
      if i == AdventureMgr.dailyMapIndex then
        if DailyMapWindow.IsQuality() then
          uis.Main.TabRegion.c2Ctr.selectedIndex = 1
          uis.Main.TabRegion.c1Ctr.selectedIndex = i - 1
        else
          uis.Main.TabRegion.c2Ctr.selectedIndex = 2
        end
        DailyMapWindow.ChangeTabState(i)
        uis.Main.MapList:AddChild(map)
        lastIndex = i
        DailyMapWindow.PlayAnim(map, stageNum[i], "in")
        PlayUITrans(map:GetChild("PatternAni"), "in")
        chapterTypeMap[i].visible = true
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(v.back_ground)
        if v.back_effect then
          UIUtil.SetEffectToUI(GetEffEctPath(v.back_effect), map:GetChild("EffectHolder"))
        end
      end
    end
  end
end

function DailyMapWindow.RefreshMapList()
  uis.Main.MapList:RemoveChildAt(0, false)
  local index = 1
  index = uis.Main.TabRegion.c1Ctr.selectedIndex + 1
  chapterTypeMap[index].visible = true
  AdventureMgr.dailyMapIndex = index
  uis.Main.MapList:AddChild(chapterTypeMap[index])
end

function DailyMapWindow.PlayAnim(map, num, transName)
  local tips
  for i = 1, num do
    tips = map:GetChild("Tips" .. i)
    if tips then
      PlayUITrans(tips, transName)
    end
  end
end

function DailyMapWindow.RefreshMapItem(map, data)
  if #data.stages > 0 then
    local newImage
    for i = 1, #data.stages do
      local tips = map:GetChild("Tips" .. i)
      if tips then
        local unlocked
        local stageData = TableData.GetConfig(data.stages[i], "BaseStage")
        local MapTipsBtn = tips:GetChild("MapTipsBtn")
        newImage = MapTipsBtn:GetChild("NewImage")
        newImage.visible = true
        if AdventureData.GetStageOpen(stageData.chapter_id, stageData.id) then
          if AdventureData.GetPassedStageInfo(stageData.id) then
            ChangeUIController(MapTipsBtn, "c1", 2)
          else
            newImage.visible = AdventureData.CanShowStageNew(stageData.id)
            ChangeUIController(MapTipsBtn, "c1", 1)
          end
          unlocked = true
          tips.visible = true
        else
          tips.visible = 1 == dailyData.lock_show and true or false
          ChangeUIController(MapTipsBtn, "c1", 0)
          UIUtil.SetText(MapTipsBtn, "", "LockTxt")
          if stageData.open_condition then
            local arr = Split(stageData.open_condition, "|")
            for i = 1, #arr do
              local condition = Split(arr[i], ":")
              if 2 == #condition then
                local id = tonumber(condition[1])
                if CONDITION_ENUM.LV == id then
                  local lv = tonumber(condition[2])
                  if lv > ActorData.GetLevel() then
                    UIUtil.SetText(MapTipsBtn, T(1303, lv), "LockTxt")
                  end
                end
              end
            end
          elseif stageData.pre == nil then
            ChangeUIController(MapTipsBtn, "c1", 1)
          end
        end
        MapTipsBtn:GetChild("PicLoader").url = UIUtil.GetResUrl(stageData.icon)
        UIUtil.SetText(MapTipsBtn, stageData.name(), "NumberTxt")
        if stageData.name_english then
          UIUtil.SetText(MapTipsBtn, stageData.name_english(), "SubtitleTxt")
        end
        tips.onClick:Set(function()
          DailyMapWindow.StageItemClick(unlocked, stageData)
        end)
        if stageId and stageId == stageData.id then
          firstOpen = true
          tips.onClick:Call()
          firstOpen = nil
        end
      end
    end
  end
end

function DailyMapWindow.StageItemClick(unlocked, stageData)
  if unlocked then
    if 1 == stageData.challenge_num and AdventureData.GetPassedStageInfo(stageData.id) then
      return
    end
    local arg = {
      stageId = stageData.id
    }
    if UIMgr:IsWindowOpen(WinResConfig.DungeonInfoWindow.name) then
      UIMgr:SendWindowMessage(WinResConfig.DungeonInfoWindow.name, WindowMsgEnum.DungeonInfoWindow.UPDATE_WINDOW, arg)
    else
      OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, arg)
    end
  elseif true ~= firstOpen then
    if stageData.open_condition then
      local arr = Split(stageData.open_condition, ":")
      if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.LV and tonumber(arr[2]) > ActorData.GetLevel() then
        FloatTipsUtil.ShowWarnTips(T(933, arr[2]))
        return
      end
    end
    FloatTipsUtil.ShowWarnTips(T(229))
  end
end

function DailyMapWindow.ChangeTabState(ind)
  local TabRegion = uis.Main.TabRegion
  local tb5 = {
    TabRegion.Tab1Btn,
    TabRegion.Tab2Btn,
    TabRegion.Tab4Btn,
    TabRegion.Tab5Btn
  }
  local tb4 = {
    TabRegion.Tab20Btn,
    TabRegion.Tab21Btn,
    TabRegion.Tab22Btn,
    TabRegion.Tab23Btn,
    TabRegion.Tab24Btn
  }
  local tb = 1 == uis.Main.TabRegion.c2Ctr.selectedIndex and tb5 or tb4
  for i = 1, #tb do
    local ctr = tb[i]:GetController("button1")
    if i == ind then
      ChangeController(ctr, 1)
    else
      ChangeController(ctr, 0)
    end
  end
end

function DailyMapWindow.GetFeatureId()
  local featureId
  if dailyData then
    if dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_COIN then
      featureId = FEATURE_ENUM.DAILY_GOLD
    elseif dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_ROLE_EXP then
      featureId = FEATURE_ENUM.DAILY_EXP
    elseif dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_SKILL_BOOK then
      featureId = FEATURE_ENUM.DAILY_SKILL
    elseif dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_QUALITY_UP then
      featureId = FEATURE_ENUM.DAILY_BREACH_COM
    elseif dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_MATERIAL then
      featureId = FEATURE_ENUM.DAILY_BREACH
    elseif dailyData.type == ProtoEnum.SCENE_TYPE.DAILY_BADGE_EXP then
      featureId = FEATURE_ENUM.DAILY_BADGE
    end
  end
end

function DailyMapWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.DailyMapWindow.name, uis.Main.CurrencyReturn, DailyMapWindow.GetFeatureId(), function()
    UIMgr:CloseWindow(WinResConfig.DailyMapWindow.name)
  end)
  local TabRegion = uis.Main.TabRegion
  local trans = uis.Main.root:GetTransition("up")
  local btn = {
    TabRegion.Tab20Btn,
    TabRegion.Tab21Btn,
    TabRegion.Tab22Btn,
    TabRegion.Tab23Btn,
    TabRegion.Tab24Btn,
    TabRegion.Tab1Btn,
    TabRegion.Tab2Btn,
    TabRegion.Tab4Btn,
    TabRegion.Tab5Btn
  }
  for i = 1, #btn do
    UIUtil.SetTagButtonSwitch(btn[i], trans, function()
      local index = 1
      index = uis.Main.TabRegion.c1Ctr.selectedIndex + 1
      if lastIndex ~= index then
        if 0 ~= lastIndex then
          DailyMapWindow.PlayAnim(chapterTypeMap[lastIndex], stageNum[lastIndex], "Switch")
          PlayUITrans(chapterTypeMap[lastIndex]:GetChild("PatternAni"), "Switch")
        end
        DailyMapWindow.PlayAnim(chapterTypeMap[index], stageNum[index], "Switch")
        PlayUITrans(chapterTypeMap[index]:GetChild("PatternAni"), "Switch")
        lastIndex = index
        DailyMapWindow.ChangeTabState(index)
        return true
      end
    end, function()
      local index = 1
      index = uis.Main.TabRegion.c1Ctr.selectedIndex + 1
      if not DailyMapWindow.IsQuality() then
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(chapterData[i].back_ground)
        if chapterData[i].back_effect then
          UIUtil.SetEffectToUI(GetEffEctPath(chapterData[i].back_effect), chapterTypeMap[index]:GetChild("EffectHolder"))
        end
        ChangeUIController(chapterTypeMap[index]:GetChild("PatternAni"):GetChild("Pattern"), "c1", index - 1)
      elseif chapterData[i - 5] then
        uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(chapterData[i - 5].back_ground)
        if chapterData[i - 5].back_effect then
          UIUtil.SetEffectToUI(GetEffEctPath(chapterData[i - 5].back_effect), chapterTypeMap[index]:GetChild("EffectHolder"))
        end
        ChangeUIController(chapterTypeMap[index]:GetChild("PatternAni"):GetChild("Pattern"), "c1", index - 1)
      end
      DailyMapWindow.RefreshMapList()
    end, TabRegion.root)
  end
end

function DailyMapWindow.RefreshMapUnlockUI()
  for i, v in ipairs(chapterData) do
    local resStrTable = Split(v.map_path, ":")
    if resStrTable and #resStrTable > 1 then
      DailyMapWindow.RefreshMapItem(chapterTypeMap[i], v)
    end
  end
end

function DailyMapWindow.ChangeUI(para)
  if para then
    UIMgr:CloseWindow(WinResConfig.ItemGetTipsWindow.name)
    if para.data.id == dailyData.id then
      stageId = para.stageId
      DailyMapWindow.RefreshMapUnlockUI()
    else
      DailyMapWindow.DisposeMap()
      dailyData = para.data
      stageId = para.stageId
      if nil == stageId and #dailyData.chapter_id > 1 then
        AdventureMgr.dailyMapIndex = 1
      end
      DailyMapWindow.Init()
    end
  end
end

function DailyMapWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Adventure.GET_STAGE_DATA then
    if nil == chapterTypeMap then
      DailyMapWindow.InitList()
    end
  elseif msgId == WindowMsgEnum.Common.E_MSG_WINDOW_INFO_UPDATE then
    DailyMapWindow.ChangeUI(para)
  end
end

function DailyMapWindow.OnShown()
  if uis then
    AdventureService.GetChapterStageReq(dailyData.chapter_id, function()
      if uis then
        DailyMapWindow.RefreshMapUnlockUI()
      end
    end)
  end
end

function DailyMapWindow.DisposeMap()
  if chapterTypeMap then
    for i, v in pairs(chapterTypeMap) do
      v:Dispose()
    end
  end
  chapterTypeMap = nil
end

function DailyMapWindow.OnClose()
  ld("Sweep")
  SweepData.ClearData()
  DailyMapWindow.DisposeMap()
  uis = nil
  contentPane = nil
  chapterData = nil
  chapterTypeMap = nil
  argTable = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return DailyMapWindow
