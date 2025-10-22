require("ActivityDungeon1003_MiniTaskByName")

function GetActivityDungeon1003_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
