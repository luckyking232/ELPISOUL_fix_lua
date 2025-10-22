require("Raffle01_BoxSpendByName")

function GetRaffle01_BoxUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRaffle01_BoxSpendUis(ui:GetChild("Spend"))
  uis.BoxBtn = ui:GetChild("BoxBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
