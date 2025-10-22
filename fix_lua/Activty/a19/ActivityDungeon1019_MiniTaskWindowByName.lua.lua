require("ActivityDungeon1019_MiniTaskByName")

function GetActivityDungeon1019_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
