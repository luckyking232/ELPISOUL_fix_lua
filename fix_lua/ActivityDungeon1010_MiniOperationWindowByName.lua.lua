require("ActivityDungeon1010_MiniOperationByName")

function GetActivityDungeon1010_MiniOperationWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniOperationUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
