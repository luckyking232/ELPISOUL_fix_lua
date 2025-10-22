require("ActivityDungeon1004_MiniStart2_End2ByName")

function GetActivityDungeon1004_MiniStart2_End2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniStart2_End2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
