require("ActivityDungeon1008_MiniTaskByName")

function GetActivityDungeon1008_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
