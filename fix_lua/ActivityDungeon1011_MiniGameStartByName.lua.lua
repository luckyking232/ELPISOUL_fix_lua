require("CommonResource_BackGroundByName")
require("ActivityDungeon1011_MiniStart_BoxRegionByName")
require("ActivityDungeon1011_MiniStart_HandRegionByName")
require("ActivityDungeon1011_MiniStart_LaunchByName")

function GetActivityDungeon1011_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BoxRegion = GetActivityDungeon1011_MiniStart_BoxRegionUis(ui:GetChild("BoxRegion"))
  uis.HandRegion = GetActivityDungeon1011_MiniStart_HandRegionUis(ui:GetChild("HandRegion"))
  uis.Launch = GetActivityDungeon1011_MiniStart_LaunchUis(ui:GetChild("Launch"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
