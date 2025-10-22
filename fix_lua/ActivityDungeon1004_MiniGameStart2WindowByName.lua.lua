require("ActivityDungeon1004_MiniGameStart2ByName")

function GetActivityDungeon1004_MiniGameStart2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniGameStart2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
