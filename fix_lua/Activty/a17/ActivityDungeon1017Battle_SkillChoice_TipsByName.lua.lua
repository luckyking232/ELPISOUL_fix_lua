require("ActivityDungeon1017Battle_SkillChoice_CardByName")

function GetActivityDungeon1017Battle_SkillChoice_TipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Card = GetActivityDungeon1017Battle_SkillChoice_CardUis(ui:GetChild("Card"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
