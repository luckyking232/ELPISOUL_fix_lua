require("ExploreDevelop_SealForge_PicByName")
require("ExploreDevelop_SealForge_NumberByName")
require("ExploreDevelop_SealForge_PartAttributeRegionByName")
require("ExploreDevelop_SealForge_MaxByName")
require("ExploreDevelop_SealForge_FirstLockByName")
require("ExploreDevelop_SealForge_LimitLockByName")

function GetExploreDevelop_SealForge_ForgeRegionUis(ui)
  local uis = {}
  uis.Pic = GetExploreDevelop_SealForge_PicUis(ui:GetChild("Pic"))
  uis.Number = GetExploreDevelop_SealForge_NumberUis(ui:GetChild("Number"))
  uis.PartAttributeRegion = GetExploreDevelop_SealForge_PartAttributeRegionUis(ui:GetChild("PartAttributeRegion"))
  uis.SpendList = ui:GetChild("SpendList")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.Max = GetExploreDevelop_SealForge_MaxUis(ui:GetChild("Max"))
  uis.FirstLock = GetExploreDevelop_SealForge_FirstLockUis(ui:GetChild("FirstLock"))
  uis.LimitLock = GetExploreDevelop_SealForge_LimitLockUis(ui:GetChild("LimitLock"))
  uis.lockCtr = ui:GetController("lock")
  uis.forgemaxCtr = ui:GetController("forgemax")
  uis.root = ui
  return uis
end
