require("ActivityDungeon1013_MiniTaskByName")

function GetActivityDungeon1013_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
