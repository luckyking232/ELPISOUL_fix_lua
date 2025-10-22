require("ActivityDungeon1004_MiniStart2_End1ByName")

function GetActivityDungeon1004_MiniStart2_End1WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniStart2_End1Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
