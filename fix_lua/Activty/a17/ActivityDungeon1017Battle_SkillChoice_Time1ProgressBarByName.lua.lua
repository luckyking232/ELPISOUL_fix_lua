require("ActivityDungeon1017Battle_SkillChoice_Time1ProgressFillByName")

function GetActivityDungeon1017Battle_SkillChoice_Time1ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017Battle_SkillChoice_Time1ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
