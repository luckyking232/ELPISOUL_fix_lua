require("Badge_NewByName")
require("Badge_LevelUpNumberByName")

function GetBadge_DetailsInfo2_2Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.New = GetBadge_NewUis(ui:GetChild("New"))
  uis.LevelUpNumber = GetBadge_LevelUpNumberUis(ui:GetChild("LevelUpNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.root = ui
  return uis
end
