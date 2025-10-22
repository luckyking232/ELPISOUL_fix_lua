require("ActivityDungeon1017_MainSeasonsByName")

function GetActivityDungeon1017_MainSeasonsWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MainSeasonsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
