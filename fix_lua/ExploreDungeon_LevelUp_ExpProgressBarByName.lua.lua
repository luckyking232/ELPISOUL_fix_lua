require("ExploreDungeon_LevelUp_ExpProgressFillByName")

function GetExploreDungeon_LevelUp_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetExploreDungeon_LevelUp_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
