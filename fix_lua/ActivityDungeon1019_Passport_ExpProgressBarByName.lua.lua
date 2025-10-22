require("ActivityDungeon1019_Passport_ExpProgressFillByName")

function GetActivityDungeon1019_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1019_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
