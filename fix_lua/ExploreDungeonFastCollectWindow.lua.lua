require("ExploreDungeon_LevelQuickWindowByName")
local ExploreDungeonFastCollectWindow = {}
local uis, contentPane, consumes, selectedConsumeIndex
local parseItemStrs = function(strs)
  local list = {}
  for _, str in ipairs(strs) do
    local splits = Split(str, ":")
    table.insert(list, {
      itemType = tonumber(splits[1]),
      itemId = tonumber(splits[2]),
      count = tonumber(splits[3])
    })
  end
  return list
end

function ExploreDungeonFastCollectWindow.ReInitData()
end

function ExploreDungeonFastCollectWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDungeonFastCollectWindow.package, WinResConfig.ExploreDungeonFastCollectWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDungeon_LevelQuickWindowUis(contentPane)
    ExploreDungeonFastCollectWindow.UpdateInfo()
    ExploreDungeonFastCollectWindow.InitBtn()
  end)
end

function ExploreDungeonFastCollectWindow.UpdateInfo()
  local consumeText = T(20798)
  local panel = uis.Main.Tips
  panel.TitleTxt.text = T(20796)
  panel.WordTxt.text = T(20797)
  local info = ExploreDungeonData.GetPlayerInfo()
  local currentStage, currentChapter = info.currentStage, info.currentChapter
  local chapters = ExploreDungeonMgr.GetChapters()
  local passedStageId
  local chapterIndex = table.keyof(chapters, currentChapter, "id")
  if currentStage <= 0 then
    local stages = chapters[chapterIndex].stages
    passedStageId = stages[#stages]
  else
    local stageIndex
    if currentStage > 0 then
      stageIndex = table.keyof(chapters[chapterIndex].stages, currentStage)
    else
      chapterIndex = chapterIndex + 1
      stageIndex = 1
    end
    if stageIndex > 1 then
      passedStageId = chapters[chapterIndex].stages[stageIndex - 1]
    elseif chapterIndex > 1 then
      local prevChapter = chapters[chapterIndex - 1]
      local prevChapterStages = prevChapter.stages
      passedStageId = prevChapterStages[#prevChapterStages]
    end
  end
  local outputs
  if passedStageId then
    outputs = parseItemStrs(TableData.GetConfig(passedStageId, "BaseStage").on_hook_reward_quick)
  else
    outputs = parseItemStrs(Split(TableData.GetConfig(70011705, "BaseFixed").array_value, "|"))
  end
  local fastCollectCnt = info.fastCollectCnt
  local fastCollectThreshold = TableData.GetConfig(70011704, "BaseFixed").int_value
  local greenText = T(20794, fastCollectCnt, fastCollectThreshold)
  local redText = T(20795, fastCollectCnt, fastCollectThreshold)
  panel.NumberTxt.text = fastCollectCnt > 0 and greenText or redText
  UIUtil.SetBtnText(uis.Main.Tips.SureBtn, T(20792))
  consumes = parseItemStrs(Split(TableData.GetConfig(70011706, "BaseFixed").array_value, "|"))
  local index = -1
  local assets = {}
  for i, v in ipairs(consumes) do
    table.insert(assets, v.itemId)
  end
  for i, consume in ipairs(consumes) do
    if ActorData.GetItemCount(consume.itemId) >= consume.count then
      index = i
      break
    end
  end
  selectedConsumeIndex = 2
  if index > 0 then
    selectedConsumeIndex = index
  end
  
  function panel.SpendList.itemRenderer(i, gcmp)
    local consume = consumes[i + 1]
    UIUtil.SetIconById(gcmp:GetChild("PicLoader"), consume.itemId)
    UIUtil.SetText(gcmp, consume.count, "NumberTxt")
    UIUtil.SetText(gcmp, consumeText, "WordTxt")
    ChangeUIController(gcmp, "c2", selectedConsumeIndex == i + 1 and 1 or 0)
    local ownCnt = ActorData.GetItemCount(consume.itemId)
    local selectedIndex = ownCnt >= consume.count and 0 or 1
    ChangeUIController(gcmp, "c1", selectedIndex)
    gcmp.onClick:Set(function()
      if consume.itemId ~= COMMON_ITEM_ID.BIND_DIAMOND and ActorData.GetItemCount(consume.itemId) < consume.count then
        FloatTipsUtil.ShowWarnTips(T(20800))
        return
      end
      selectedConsumeIndex = i + 1
      panel.SpendList.numItems = #consumes
    end)
  end
  
  panel.SpendList.numItems = #consumes
  
  function panel.ItemList.itemRenderer(i, gcmp)
    local output = outputs[i + 1]
    UIUtil.ShowItemFrame(output.itemId, gcmp, output.count, nil, function()
      UIUtil.CommonItemClickCallback(output.itemId, 1)
    end)
  end
  
  panel.ItemList.numItems = #outputs
  local assetlist = uis.Main.root:GetChild("AssetsTipsList")
  UIUtil.InitAssetsTips(assetlist, assets)
end

function ExploreDungeonFastCollectWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDungeonFastCollectWindow.name)
  end)
  uis.Main.Tips.SureBtn.onClick:Set(function()
    local info = ExploreDungeonData.GetPlayerInfo()
    local fastCollectRemain = info.fastCollectCnt
    if fastCollectRemain <= 0 then
      FloatTipsUtil.ShowWarnTips(T(20799))
      return
    end
    local consume = consumes[selectedConsumeIndex]
    if consume.itemId == COMMON_ITEM_ID.BIND_DIAMOND and ActorData.GetItemCount(COMMON_ITEM_ID.BIND_DIAMOND) < consume.count then
      OpenWindow(WinResConfig.MainOpalExchangeWindow.name)
      return
    end
    ExploreDungeonService.FastGetRewardReq(selectedConsumeIndex, function()
      UIMgr:CloseWindow(WinResConfig.ExploreDungeonFastCollectWindow.name)
    end)
  end)
end

function ExploreDungeonFastCollectWindow.OnClose()
  uis = nil
  contentPane = nil
end

function ExploreDungeonFastCollectWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    local assetlist = uis.Main.root:GetChild("AssetsTipsList")
    assetlist.numItems = 2
    uis.Main.Tips.SpendList.numItems = 2
  end
end

return ExploreDungeonFastCollectWindow
