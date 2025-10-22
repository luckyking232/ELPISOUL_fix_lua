require("ActivityDungeon1017Battle_ExpProgressFillByName")

function GetActivityDungeon1017Battle_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017Battle_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
