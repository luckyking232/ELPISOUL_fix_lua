require("ActivityDungeon1007_PassReward_MiddleRegionByName")
require("ActivityDungeon1007_PassReward_StartTwoByName")
require("ActivityDungeon1007_PassReward_EndTwoByName")

function GetActivityDungeon1007_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1007_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1007_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1007_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
