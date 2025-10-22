require("ActivityDungeon1007_MiniTaskByName")

function GetActivityDungeon1007_MiniTaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniTaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
