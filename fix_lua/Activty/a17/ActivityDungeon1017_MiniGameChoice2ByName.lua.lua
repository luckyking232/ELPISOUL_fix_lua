require("CommonResource_BackGroundByName")
require("ActivityDungeon1017_MiniGameChoice2_CardRegionByName")

function GetActivityDungeon1017_MiniGameChoice2Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.CardRegion = GetActivityDungeon1017_MiniGameChoice2_CardRegionUis(ui:GetChild("CardRegion"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
