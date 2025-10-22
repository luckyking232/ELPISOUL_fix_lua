require("ActivityDungeon1004_MiniTask2ByName")

function GetActivityDungeon1004_MiniTask2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniTask2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
