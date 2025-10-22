require("ExploreDungeon_BreachWindowByName")
local ExploreDungeonBreakthroughWindow = {}
local uis, contentPane
ld("ExploreDungeon")
local targetStageId
local jobs = {
  1,
  2,
  4,
  5
}

function ExploreDungeonBreakthroughWindow.ReInitData()
end

function ExploreDungeonBreakthroughWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDungeonBreakthroughWindow.package, WinResConfig.ExploreDungeonBreakthroughWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDungeon_BreachWindowUis(contentPane)
    targetStageId = bridgeObj.argTable[1]
    ExploreDungeonBreakthroughWindow.UpdateInfo()
    ExploreDungeonBreakthroughWindow.InitBtn()
  end)
end

function ExploreDungeonBreakthroughWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(FEATURE_ENUM.SEAL_DUNGEON_BREAKTHROUGH, "BaseFeature").back_ground)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_enter.prefab", uis.Main.root:GetChild("EffectHolder"))
  ExploreDungeonService.GetExploreDungeonInfoReq(function()
    local dungeonInfo = ExploreDungeonData.GetBreakthroughDungeonInfo()
    local conf = TableData.GetConfig(dungeonInfo.currentChapter, "BaseChapter")
    for i, v in ipairs(conf.stages) do
      local gcmp = uis.Main[string.format("Tips%s", i)]
      local entrance = gcmp.TipsBtn
      entrance.alpha = 0
      PlayUITrans(gcmp.root, "up", nil, 0.08 * i)
      ChangeUIController(entrance, "c1", jobs[i] - 1)
      local stageConf = TableData.GetConfig(v, "BaseStage")
      UIUtil.SetText(entrance, stageConf.name and stageConf.name(), "WordTxt")
      entrance.onClick:Set(function()
        OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {stageId = v})
      end)
      if type(targetStageId) == "number" and targetStageId == v then
        entrance.onClick:Call()
        targetStageId = nil
      end
    end
  end)
end

function ExploreDungeonBreakthroughWindow.InitBtn()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreDungeonBreakthroughWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.SEAL_DUNGEON_BREAKTHROUGH)
end

function ExploreDungeonBreakthroughWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExploreDungeonBreakthroughWindow
