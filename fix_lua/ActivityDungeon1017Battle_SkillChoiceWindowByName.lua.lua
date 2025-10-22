require("ActivityDungeon1017Battle_SkillChoiceByName")

function GetActivityDungeon1017Battle_SkillChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017Battle_SkillChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
