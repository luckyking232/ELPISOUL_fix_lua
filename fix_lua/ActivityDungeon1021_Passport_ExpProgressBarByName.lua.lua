require("ActivityDungeon1021_Passport_ExpProgressFillByName")

function GetActivityDungeon1021_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1021_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
