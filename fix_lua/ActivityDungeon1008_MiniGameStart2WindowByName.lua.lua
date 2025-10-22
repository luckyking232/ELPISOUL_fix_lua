require("ActivityDungeon1008_MiniGameStart2ByName")

function GetActivityDungeon1008_MiniGameStart2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniGameStart2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
