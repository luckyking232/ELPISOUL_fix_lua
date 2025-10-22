require("ExploreDungeon_LevelQuickByName")

function GetExploreDungeon_LevelQuickWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDungeon_LevelQuickUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
