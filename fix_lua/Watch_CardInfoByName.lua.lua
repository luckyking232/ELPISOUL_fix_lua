require("Watch_Batch_CardClothesByName")

function GetWatch_CardInfoUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.ClothesNameTxt = ui:GetChild("ClothesNameTxt")
  uis.CardClothes = GetWatch_Batch_CardClothesUis(ui:GetChild("CardClothes"))
  uis.CardInfoLookBtn = ui:GetChild("CardInfoLookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
