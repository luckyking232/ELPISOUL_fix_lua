require("ExploreDungeon_LevelExplainWindowByName")
local ExploreDungeonUpgradeExplainWindow = {}
local uis, contentPane

function ExploreDungeonUpgradeExplainWindow.ReInitData()
end

function ExploreDungeonUpgradeExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDungeonUpgradeExplainWindow.package, WinResConfig.ExploreDungeonUpgradeExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDungeon_LevelExplainWindowUis(contentPane)
    ExploreDungeonUpgradeExplainWindow.UpdateInfo()
    ExploreDungeonUpgradeExplainWindow.InitBtn()
  end)
end

function ExploreDungeonUpgradeExplainWindow.UpdateInfo()
  local panel = uis.Main.Tips
  local titleText = T(20801)
  local sureText = T(20803)
  panel.TitleTxt.text = titleText
  UIUtil.SetBtnText(uis.Main.Tips.CloseBtn, sureText)
  local curOutputs = ExploreDungeonMgr.GetCurrentOutputs()
  local nextStageId, chapterIndex, stageIndex = ExploreDungeonMgr.GetOutputsImprovedStage()
  local nextOutputs
  if nextStageId then
    nextOutputs = ExploreDungeonMgr.GetOutputs(chapterIndex, stageIndex)
    local stageConf = TableData.GetConfig(nextStageId, "BaseStage")
    panel.WordTxt.text = T(20802, stageConf.name_detail())
  end
  
  function panel.InfoList.itemRenderer(i, gcmp)
    local index = i + 1
    if index <= (curOutputs and #curOutputs or 0) then
      local output = curOutputs[index]
      local id = output.itemId
      local count = output.count + (output.addition or 0)
      UIUtil.ShowItemFrame(id, gcmp:GetChild("n2"), nil, nil, function()
        UIUtil.CommonItemClickCallback(id, output.itemType)
      end)
      UIUtil.SetText(gcmp, T(20737, count), "NowTxt")
      if nextOutputs then
        local k = table.keyof(nextOutputs, id, "itemId")
        if k then
          local nextOutput = nextOutputs[k]
          UIUtil.SetText(gcmp, T(20737, nextOutput.count + (nextOutput.addition or 0)), "AfterTxt")
        end
      end
    elseif index <= (nextOutputs and #nextOutputs or 0) then
      local nextOutput = nextOutputs[index]
      local id = nextOutput.itemId
      local count = nextOutput.count + (nextOutput.addition or 0)
      UIUtil.ShowItemFrame(id, gcmp:GetChild("n2"), nil, nil, function()
        UIUtil.CommonItemClickCallback(id, nextOutput.itemType)
      end)
      UIUtil.SetText(gcmp, T(20737, 0), "NowTxt")
      UIUtil.SetText(gcmp, T(20737, count), "AfterTxt")
    end
  end
  
  panel.InfoList.numItems = math.max(curOutputs and #curOutputs or 0, nextOutputs and #nextOutputs or 0)
end

function ExploreDungeonUpgradeExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDungeonUpgradeExplainWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ExploreDungeonUpgradeExplainWindow.name)
  end)
end

function ExploreDungeonUpgradeExplainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExploreDungeonUpgradeExplainWindow
