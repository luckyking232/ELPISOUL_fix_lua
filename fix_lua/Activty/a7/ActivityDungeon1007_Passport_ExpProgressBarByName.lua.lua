require("ActivityDungeon1007_Passport_ExpProgressFillByName")

function GetActivityDungeon1007_Passport_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1007_Passport_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
