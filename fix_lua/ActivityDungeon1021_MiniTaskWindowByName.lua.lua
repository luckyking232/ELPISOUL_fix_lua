require("ActivityDungeon1021_MiniTaskByName")

function GetActivityDungeon1021_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
