require("ActivityDungeon1017Battle_DPS1ProgressFillByName")

function GetActivityDungeon1017Battle_DPS1ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017Battle_DPS1ProgressFillUis(ui:GetChild("bar"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
