require("ActivityDungeon1007_MiniOperationByName")

function GetActivityDungeon1007_MiniOperationWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniOperationUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
