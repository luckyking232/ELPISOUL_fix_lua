require("ActivityDungeon1008_Passport_ExpProgressFillByName")

function GetActivityDungeon1008_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1008_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
