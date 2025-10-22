require("ActivityDungeon1004_MainSeasonsByName")

function GetActivityDungeon1004_MainSeasonsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MainSeasonsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
