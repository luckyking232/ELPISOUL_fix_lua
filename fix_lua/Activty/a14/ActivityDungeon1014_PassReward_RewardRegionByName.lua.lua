require("ActivityDungeon1014_PassReward_MiddleRegionByName")
require("ActivityDungeon1014_PassReward_StartTwoByName")
require("ActivityDungeon1014_PassReward_EndTwoByName")

function GetActivityDungeon1014_PassReward_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetActivityDungeon1014_PassReward_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetActivityDungeon1014_PassReward_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetActivityDungeon1014_PassReward_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
