require("ActivityDungeon1017_MiniTaskByName")

function GetActivityDungeon1017_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
