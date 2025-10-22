require("ActivityDungeon1018_MiniTaskByName")

function GetActivityDungeon1018_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
