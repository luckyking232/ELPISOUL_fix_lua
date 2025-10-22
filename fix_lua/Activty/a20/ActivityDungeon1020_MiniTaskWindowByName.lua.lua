require("ActivityDungeon1020_MiniTaskByName")

function GetActivityDungeon1020_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
