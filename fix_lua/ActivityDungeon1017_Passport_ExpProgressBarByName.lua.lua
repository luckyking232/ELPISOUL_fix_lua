require("ActivityDungeon1017_Passport_ExpProgressFillByName")

function GetActivityDungeon1017_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
