require("ActivityDungeon1022_Passport_ExpProgressFillByName")

function GetActivityDungeon1022_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1022_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
