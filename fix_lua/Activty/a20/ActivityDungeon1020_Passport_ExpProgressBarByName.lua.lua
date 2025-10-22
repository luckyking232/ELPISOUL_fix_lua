require("ActivityDungeon1020_Passport_ExpProgressFillByName")

function GetActivityDungeon1020_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1020_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
