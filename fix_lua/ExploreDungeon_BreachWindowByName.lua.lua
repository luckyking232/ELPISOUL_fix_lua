require("ExploreDungeon_BreachByName")

function GetExploreDungeon_BreachWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDungeon_BreachUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
