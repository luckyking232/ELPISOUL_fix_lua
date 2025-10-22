require("ActivityDungeon1017_PassReward_MiddleRegionByName")
require("ActivityDungeon1017_PassReward_StartTwoByName")
require("ActivityDungeon1017_PassReward_EndTwoByName")

function GetActivityDungeon1017_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1017_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1017_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1017_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
