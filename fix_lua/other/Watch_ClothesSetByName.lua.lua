require("Watch_PicByName")
require("Watch_Batch_CardEmptyByName")
require("Watch_ClothesModularByName")
require("Watch_SetByName")
require("Watch_CardInfoByName")

function GetWatch_ClothesSetUis(ui)
  local uis = {}
  uis.Pic = GetWatch_PicUis(ui:GetChild("Pic"))
  uis.CardEmpty = GetWatch_Batch_CardEmptyUis(ui:GetChild("CardEmpty"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ClothesModular = GetWatch_ClothesModularUis(ui:GetChild("ClothesModular"))
  uis.Set = GetWatch_SetUis(ui:GetChild("Set"))
  uis.CardInfo = GetWatch_CardInfoUis(ui:GetChild("CardInfo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
