require("ActivityDungeon1016_MiniTaskByName")

function GetActivityDungeon1016_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
