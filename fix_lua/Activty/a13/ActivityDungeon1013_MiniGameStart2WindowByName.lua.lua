require("ActivityDungeon1013_MiniGameStart2ByName")

function GetActivityDungeon1013_MiniGameStart2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniGameStart2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
