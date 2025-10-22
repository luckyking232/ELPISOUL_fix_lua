require("ActivityDungeon1008_MainSeasonsByName")

function GetActivityDungeon1008_MainSeasonsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MainSeasonsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
