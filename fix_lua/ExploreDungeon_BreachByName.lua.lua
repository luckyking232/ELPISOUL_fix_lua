require("CommonResource_BackGroundByName")
require("ExploreDungeon_Breach_TipsAniByName")
require("CommonResource_CurrencyReturnByName")

function GetExploreDungeon_BreachUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Tips1 = GetExploreDungeon_Breach_TipsAniUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetExploreDungeon_Breach_TipsAniUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetExploreDungeon_Breach_TipsAniUis(ui:GetChild("Tips3"))
  uis.Tips4 = GetExploreDungeon_Breach_TipsAniUis(ui:GetChild("Tips4"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
