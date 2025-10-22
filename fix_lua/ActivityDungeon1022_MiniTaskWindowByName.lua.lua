require("ActivityDungeon1022_MiniTaskByName")

function GetActivityDungeon1022_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
