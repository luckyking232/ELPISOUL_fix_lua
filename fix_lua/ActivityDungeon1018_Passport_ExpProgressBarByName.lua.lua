require("ActivityDungeon1018_Passport_ExpProgressFillByName")

function GetActivityDungeon1018_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1018_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
