require("CommonResource_BackGroundByName")
require("ActivityDungeon1020_MapListByName")

function GetActivityDungeon1020_ChallengeUis(ui)
  local uis = {}
  uis.BgList = ui:GetChild("BgList")
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Map = GetActivityDungeon1020_MapListUis(ui:GetChild("Map"))
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.ChapterList = ui:GetChild("ChapterList")
  uis.root = ui
  return uis
end
