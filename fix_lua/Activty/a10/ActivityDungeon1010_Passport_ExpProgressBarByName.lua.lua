require("ActivityDungeon1010_Passport_ExpProgressFillByName")

function GetActivityDungeon1010_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1010_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
