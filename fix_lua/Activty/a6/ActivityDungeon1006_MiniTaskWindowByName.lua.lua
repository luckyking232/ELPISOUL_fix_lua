require("ActivityDungeon1006_MiniTaskByName")

function GetActivityDungeon1006_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
