require("ActivityDungeon1013_MiniGame2ByName")

function GetActivityDungeon1013_MiniGame2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniGame2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
