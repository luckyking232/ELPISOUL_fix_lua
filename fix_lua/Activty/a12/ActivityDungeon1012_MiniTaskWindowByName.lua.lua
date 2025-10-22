require("ActivityDungeon1012_MiniTaskByName")

function GetActivityDungeon1012_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
