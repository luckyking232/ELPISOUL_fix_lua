require("CommonResource_BackGroundByName")
require("ActivityDungeon1021_MapListByName")

function GetActivityDungeon1021_ChallengeUis(ui)
  local uis = {}
  uis.BgList = ui:GetChild("BgList")
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Map = GetActivityDungeon1021_MapListUis(ui:GetChild("Map"))
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.ChapterList = ui:GetChild("ChapterList")
  uis.root = ui
  return uis
end
