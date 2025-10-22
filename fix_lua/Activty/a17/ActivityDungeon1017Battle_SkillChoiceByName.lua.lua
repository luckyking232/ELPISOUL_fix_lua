require("CommonResource_PopupBgByName")
require("ActivityDungeon1017Battle_SkillChoice_TimeByName")

function GetActivityDungeon1017Battle_SkillChoiceUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.Time = GetActivityDungeon1017Battle_SkillChoice_TimeUis(ui:GetChild("Time"))
  uis.root = ui
  return uis
end
