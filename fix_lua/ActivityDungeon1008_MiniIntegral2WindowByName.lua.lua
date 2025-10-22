require("ActivityDungeon1008_MiniIntegral2ByName")

function GetActivityDungeon1008_MiniIntegral2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniIntegral2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
