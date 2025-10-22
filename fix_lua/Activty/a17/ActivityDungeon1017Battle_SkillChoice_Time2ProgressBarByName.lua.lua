require("ActivityDungeon1017Battle_SkillChoice_Time2ProgressFillByName")

function GetActivityDungeon1017Battle_SkillChoice_Time2ProgressBarUis(ui)
  local uis = {}
  uis.bar = GetActivityDungeon1017Battle_SkillChoice_Time2ProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
