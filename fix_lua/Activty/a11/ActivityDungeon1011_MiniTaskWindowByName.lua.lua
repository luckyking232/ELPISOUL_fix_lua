require("ActivityDungeon1011_MiniTaskByName")

function GetActivityDungeon1011_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
