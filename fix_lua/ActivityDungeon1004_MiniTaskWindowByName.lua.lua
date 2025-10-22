require("ActivityDungeon1004_MiniTaskByName")

function GetActivityDungeon1004_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
