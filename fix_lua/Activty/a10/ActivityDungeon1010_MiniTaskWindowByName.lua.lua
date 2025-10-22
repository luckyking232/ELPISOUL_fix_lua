require("ActivityDungeon1010_MiniTaskByName")

function GetActivityDungeon1010_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
