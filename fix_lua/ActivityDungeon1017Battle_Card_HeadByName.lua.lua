require("ActivityDungeon1017Battle_Card_HeadBgByName")

function GetActivityDungeon1017Battle_Card_HeadUis(ui)
  local uis = {}
  uis.Bg = GetActivityDungeon1017Battle_Card_HeadBgUis(ui:GetChild("Bg"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.SkillList = ui:GetChild("SkillList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
