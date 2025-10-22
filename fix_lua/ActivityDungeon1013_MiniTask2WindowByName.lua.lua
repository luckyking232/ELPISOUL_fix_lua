require("ActivityDungeon1013_MiniTask2ByName")

function GetActivityDungeon1013_MiniTask2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniTask2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
