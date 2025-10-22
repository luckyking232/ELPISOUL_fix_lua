require("ActivityDungeon1012_MiniOperationByName")

function GetActivityDungeon1012_MiniOperationWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniOperationUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
