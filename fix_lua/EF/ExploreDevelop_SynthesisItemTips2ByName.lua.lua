require("CommonResource_PopupBgByName")
require("ExploreDevelop_SynthesisItemTips1ByName")

function GetExploreDevelop_SynthesisItemTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.GetItemTips1 = GetExploreDevelop_SynthesisItemTips1Uis(ui:GetChild("GetItemTips1"))
  uis.root = ui
  return uis
end
