require("ActivityDungeon1016_MiniStart_Tips1numberByName")

function GetActivityDungeon1016_MiniStart_Tips1Uis(ui)
  local uis = {}
  uis.NumberTxt = GetActivityDungeon1016_MiniStart_Tips1numberUis(ui:GetChild("NumberTxt"))
  uis.root = ui
  return uis
end
