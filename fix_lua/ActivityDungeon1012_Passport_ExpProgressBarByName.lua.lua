require("ActivityDungeon1012_Passport_ExpProgressFillByName")

function GetActivityDungeon1012_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1012_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
