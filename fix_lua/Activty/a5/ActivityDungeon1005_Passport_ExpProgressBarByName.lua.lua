require("ActivityDungeon1005_Passport_ExpProgressFillByName")

function GetActivityDungeon1005_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1005_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
