require("CommonResource_BackGroundByName")
require("ActivityDungeon1013_MiniStart_HandRegionByName")
require("ActivityDungeon1013_MiniStart_BoxByName")
require("ActivityDungeon1013_MiniStart_LaunchByName")

function GetActivityDungeon1013_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.HandRegion = GetActivityDungeon1013_MiniStart_HandRegionUis(ui:GetChild("HandRegion"))
  uis.Box = GetActivityDungeon1013_MiniStart_BoxUis(ui:GetChild("Box"))
  uis.Launch = GetActivityDungeon1013_MiniStart_LaunchUis(ui:GetChild("Launch"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
