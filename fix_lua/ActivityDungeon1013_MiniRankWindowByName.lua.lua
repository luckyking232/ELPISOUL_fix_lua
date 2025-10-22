require("ActivityDungeon1013_MiniRankByName")

function GetActivityDungeon1013_MiniRankWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniRankUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
