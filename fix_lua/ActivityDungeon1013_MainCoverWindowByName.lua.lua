require("ActivityDungeon1013_MainCoverByName")

function GetActivityDungeon1013_MainCoverWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MainCoverUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
