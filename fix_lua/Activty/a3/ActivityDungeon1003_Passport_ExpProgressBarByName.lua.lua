require("ActivityDungeon1003_Passport_ExpProgressFillByName")

function GetActivityDungeon1003_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1003_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
