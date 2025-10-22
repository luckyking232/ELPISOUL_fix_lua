require("ActivityDungeon1004_MiniGame2ByName")

function GetActivityDungeon1004_MiniGame2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniGame2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
