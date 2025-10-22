require("Formation_SetChoiceCardByName")
require("Formation_SetSelectedByName")
require("Formation_SetSelected1ByName")

function GetFormation_SetChoiceCardBtnUis(ui)
  local uis = {}
  uis.CardHead = GetFormation_SetChoiceCardUis(ui:GetChild("CardHead"))
  uis.SetSelected = GetFormation_SetSelectedUis(ui:GetChild("SetSelected"))
  uis.SetSelected1 = GetFormation_SetSelected1Uis(ui:GetChild("SetSelected1"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
