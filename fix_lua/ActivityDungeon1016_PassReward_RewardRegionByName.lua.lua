require("ActivityDungeon1016_PassReward_MiddleRegionByName")
require("ActivityDungeon1016_PassReward_StartTwoByName")
require("ActivityDungeon1016_PassReward_EndTwoByName")

function GetActivityDungeon1016_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1016_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1016_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1016_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
