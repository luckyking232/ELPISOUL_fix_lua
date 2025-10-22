require("ActivityDungeon1015_Passport_ExpProgressFillByName")

function GetActivityDungeon1015_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1015_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
