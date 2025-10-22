require("ActivityDungeon1014_Passport_ExpProgressFillByName")

function GetActivityDungeon1014_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1014_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
