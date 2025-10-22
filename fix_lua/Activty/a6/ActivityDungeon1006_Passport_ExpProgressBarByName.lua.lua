require("ActivityDungeon1006_Passport_ExpProgressFillByName")

function GetActivityDungeon1006_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1006_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
