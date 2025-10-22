require("ActivityDungeon1015_MiniTaskByName")

function GetActivityDungeon1015_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
