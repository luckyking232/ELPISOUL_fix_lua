require("ActivityDungeon1004_MiniIntegral2ByName")

function GetActivityDungeon1004_MiniIntegral2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniIntegral2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
