require("CommonResource_BackGroundByName")
require("ExploreDungeon_LevelUp_MapRegionByName")
require("ExploreDungeon_LevelUp_TitleByName")
require("ExploreDungeon_LevelUp_AFKRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetExploreDungeon_LevelUpUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MapRegion = GetExploreDungeon_LevelUp_MapRegionUis(ui:GetChild("MapRegion"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Title = GetExploreDungeon_LevelUp_TitleUis(ui:GetChild("Title"))
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.TabList = ui:GetChild("TabList")
  uis.AFKRegion = GetExploreDungeon_LevelUp_AFKRegionUis(ui:GetChild("AFKRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
