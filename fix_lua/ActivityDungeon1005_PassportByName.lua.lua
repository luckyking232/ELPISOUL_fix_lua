require("CommonResource_BackGroundByName")
require("ActivityDungeon1005_PassReward_RewardRegionByName")
require("ActivityDungeon1005_PassTask_TaskRegionByName")
require("ActivityDungeon1005_PassClothes_ClothseRegionByName")
require("ActivityDungeon1005_Passport_LevelByName")
require("ActivityDungeon1005_Sign_TimeByName")
require("ActivityDungeon1005_Passport_TabRegionByName")

function GetActivityDungeon1005_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1005_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1005_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1005_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1005_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1005_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1005_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
