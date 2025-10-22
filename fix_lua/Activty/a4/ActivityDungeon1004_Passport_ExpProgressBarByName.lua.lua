require("ActivityDungeon1004_Passport_ExpProgressFillByName")

function GetActivityDungeon1004_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1004_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
