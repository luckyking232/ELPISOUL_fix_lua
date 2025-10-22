require("ActivityDungeon1015_PassReward_MiddleRegionByName")
require("ActivityDungeon1015_PassReward_StartTwoByName")
require("ActivityDungeon1015_PassReward_EndTwoByName")

function GetActivityDungeon1015_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1015_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1015_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1015_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
