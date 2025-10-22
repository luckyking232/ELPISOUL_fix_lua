require("ActivityCasket_GaChaSpendByName")

function GetActivityCasket_GaChaBtnUis(ui)
  local uis = {}
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.Word3Txt = ui:GetChild("Word3Txt")
  uis.Spend1 = GetActivityCasket_GaChaSpendUis(ui:GetChild("Spend1"))
  uis.Spend2 = GetActivityCasket_GaChaSpendUis(ui:GetChild("Spend2"))
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
