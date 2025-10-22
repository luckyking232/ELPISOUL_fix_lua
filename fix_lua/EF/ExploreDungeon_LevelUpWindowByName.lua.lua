require("ExploreDungeon_LevelUpByName")

function GetExploreDungeon_LevelUpWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDungeon_LevelUpUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
