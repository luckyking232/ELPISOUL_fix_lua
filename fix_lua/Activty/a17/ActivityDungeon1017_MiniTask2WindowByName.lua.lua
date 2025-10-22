require("ActivityDungeon1017_MiniTask2ByName")

function GetActivityDungeon1017_MiniTask2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniTask2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
