require("ActivityDungeon1008_MiniGame2ByName")

function GetActivityDungeon1008_MiniGame2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniGame2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
