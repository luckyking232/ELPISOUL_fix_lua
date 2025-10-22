require("ExploreDungeon_LevelUp_ProduceProgressFillByName")

function GetExploreDungeon_LevelUp_ProduceProgressBarUis(ui)
  local uis = {}
  uis.bar = GetExploreDungeon_LevelUp_ProduceProgressFillUis(ui:GetChild("bar"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ScaleHolder = ui:GetChild("ScaleHolder")
  uis.ScaleLoader = ui:GetChild("ScaleLoader")
  uis.root = ui
  return uis
end
