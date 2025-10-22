require("Watch_Batch_CardPicByName")

function GetWatch_Batch_CardUis(ui)
  local uis = {}
  uis.CardPic = GetWatch_Batch_CardPicUis(ui:GetChild("CardPic"))
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.DelBtn = ui:GetChild("DelBtn")
  uis.choiceCtr = ui:GetController("choice")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
