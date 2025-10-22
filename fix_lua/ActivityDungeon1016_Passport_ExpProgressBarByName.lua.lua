require("ActivityDungeon1016_Passport_ExpProgressFillByName")

function GetActivityDungeon1016_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1016_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
