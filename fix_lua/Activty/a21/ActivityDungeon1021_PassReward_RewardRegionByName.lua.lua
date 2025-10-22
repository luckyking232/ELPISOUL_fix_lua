require("ActivityDungeon1021_PassReward_MiddleRegionByName")
require("ActivityDungeon1021_PassReward_StartTwoByName")
require("ActivityDungeon1021_PassReward_EndTwoByName")

function GetActivityDungeon1021_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1021_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1021_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1021_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
