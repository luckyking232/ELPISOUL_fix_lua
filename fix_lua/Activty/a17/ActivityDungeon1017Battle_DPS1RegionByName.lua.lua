require("ActivityDungeon1017Battle_DPS1ByName")

function GetActivityDungeon1017Battle_DPS1RegionUis(ui)
  local uis = {}
  uis.Card1 = GetActivityDungeon1017Battle_DPS1Uis(ui:GetChild("Card1"))
  uis.Card2 = GetActivityDungeon1017Battle_DPS1Uis(ui:GetChild("Card2"))
  uis.Card3 = GetActivityDungeon1017Battle_DPS1Uis(ui:GetChild("Card3"))
  uis.Card4 = GetActivityDungeon1017Battle_DPS1Uis(ui:GetChild("Card4"))
  uis.Card5 = GetActivityDungeon1017Battle_DPS1Uis(ui:GetChild("Card5"))
  uis.root = ui
  return uis
end
