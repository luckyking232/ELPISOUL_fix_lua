require("CommonResource_BackGroundByName")
require("ActivityDungeon1008_PassReward_RewardRegionByName")
require("ActivityDungeon1008_PassTask_TaskRegionByName")
require("ActivityDungeon1008_PassClothes_ClothseRegionByName")
require("ActivityDungeon1008_Passport_LevelByName")
require("ActivityDungeon1008_Sign_TimeByName")
require("ActivityDungeon1008_Passport_TabRegionByName")

function GetActivityDungeon1008_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1008_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1008_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1008_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1008_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1008_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1008_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
