require("ActivityDungeon1008_MiniTask2ByName")

function GetActivityDungeon1008_MiniTask2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniTask2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
