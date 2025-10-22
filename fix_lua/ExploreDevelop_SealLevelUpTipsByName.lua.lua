require("ExploreDevelop_SealLevel_UpTipsAni1ByName")
require("ExploreDevelop_SealLevel_UpTipsAni2ByName")
require("ExploreDevelop_SealLevel_BreachByName")

function GetExploreDevelop_SealLevelUpTipsUis(ui)
  local uis = {}
  uis.TipsAni1 = GetExploreDevelop_SealLevel_UpTipsAni1Uis(ui:GetChild("TipsAni1"))
  uis.TipsAni2 = GetExploreDevelop_SealLevel_UpTipsAni2Uis(ui:GetChild("TipsAni2"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Breach = GetExploreDevelop_SealLevel_BreachUis(ui:GetChild("Breach"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
