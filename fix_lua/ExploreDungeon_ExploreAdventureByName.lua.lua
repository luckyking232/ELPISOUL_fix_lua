require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetExploreDungeon_ExploreAdventureUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.EnterList = ui:GetChild("EnterList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
