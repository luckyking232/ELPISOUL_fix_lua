require("ActivityDungeon1008_PassReward_MiddleRegionByName")
require("ActivityDungeon1008_PassReward_StartTwoByName")
require("ActivityDungeon1008_PassReward_EndTwoByName")

function GetActivityDungeon1008_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1008_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1008_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1008_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
