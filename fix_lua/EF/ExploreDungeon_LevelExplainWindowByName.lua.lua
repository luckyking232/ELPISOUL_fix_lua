require("ExploreDungeon_LevelExplainByName")

function GetExploreDungeon_LevelExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDungeon_LevelExplainUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
