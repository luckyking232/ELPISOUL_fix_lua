require("CommonResource_BackGroundByName")
require("ActivityDungeon1012_MiniStart_ArrangeRegionByName")

function GetActivityDungeon1012_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.ArrangeRegion = GetActivityDungeon1012_MiniStart_ArrangeRegionUis(ui:GetChild("ArrangeRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
