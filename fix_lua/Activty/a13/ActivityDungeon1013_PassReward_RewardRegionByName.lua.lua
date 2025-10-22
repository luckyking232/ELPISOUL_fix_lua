require("ActivityDungeon1013_PassReward_MiddleRegionByName")
require("ActivityDungeon1013_PassReward_StartTwoByName")
require("ActivityDungeon1013_PassReward_EndTwoByName")

function GetActivityDungeon1013_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1013_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1013_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1013_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
