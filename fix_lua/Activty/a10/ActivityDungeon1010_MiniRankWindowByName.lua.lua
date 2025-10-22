require("ActivityDungeon1010_MiniRankByName")

function GetActivityDungeon1010_MiniRankWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniRankUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
