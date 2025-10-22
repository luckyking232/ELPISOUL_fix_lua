require("ActivityDungeon1013_Passport_ExpProgressFillByName")

function GetActivityDungeon1013_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1013_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
