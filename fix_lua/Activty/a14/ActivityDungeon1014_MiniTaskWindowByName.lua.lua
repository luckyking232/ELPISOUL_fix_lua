require("ActivityDungeon1014_MiniTaskByName")

function GetActivityDungeon1014_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
