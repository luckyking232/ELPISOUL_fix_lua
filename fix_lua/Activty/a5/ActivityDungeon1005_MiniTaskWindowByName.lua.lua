require("ActivityDungeon1005_MiniTaskByName")

function GetActivityDungeon1005_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
