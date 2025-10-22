require("ExploreDungeon_ExploreAdventureByName")

function GetExploreDungeon_ExploreAdventureWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDungeon_ExploreAdventureUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
