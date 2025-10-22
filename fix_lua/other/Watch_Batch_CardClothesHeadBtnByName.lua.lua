require("Watch_Batch_CardClothesHeadPicByName")

function GetWatch_Batch_CardClothesHeadBtnUis(ui)
  local uis = {}
  uis.CardHeadPic = GetWatch_Batch_CardClothesHeadPicUis(ui:GetChild("CardHeadPic"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
