require("ActivityDungeon1017Battle_SkillChoice_CardBgByName")

function GetActivityDungeon1017Battle_SkillChoice_CardUis(ui)
  local uis = {}
  uis.PartsCardBg = GetActivityDungeon1017Battle_SkillChoice_CardBgUis(ui:GetChild("PartsCardBg"))
  uis.root = ui
  return uis
end
