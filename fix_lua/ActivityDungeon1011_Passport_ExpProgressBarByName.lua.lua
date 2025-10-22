require("ActivityDungeon1011_Passport_ExpProgressFillByName")

function GetActivityDungeon1011_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1011_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
