require("ActivityDungeon1017Battle_SkillChoice_TipsByName")

function GetActivityDungeon1017Battle_SkillChoice_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1017Battle_SkillChoice_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
