require("TowerSpecial_BattleEventSignByName")
require("TowerSpecial_BattleEventLockByName")

function GetTowerSpecial_BattleEventBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Sign = GetTowerSpecial_BattleEventSignUis(ui:GetChild("Sign"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Lock = GetTowerSpecial_BattleEventLockUis(ui:GetChild("Lock"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
