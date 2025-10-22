require("ExploreDevelop_SynthesisItemTitle1ByName")
require("ExploreDevelop_SynthesisItemTitle2ByName")

function GetExploreDevelop_SynthesisItemTips1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.TitleEffectHolder = ui:GetChild("TitleEffectHolder")
  uis.Title1 = GetExploreDevelop_SynthesisItemTitle1Uis(ui:GetChild("Title1"))
  uis.Title2 = GetExploreDevelop_SynthesisItemTitle2Uis(ui:GetChild("Title2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
