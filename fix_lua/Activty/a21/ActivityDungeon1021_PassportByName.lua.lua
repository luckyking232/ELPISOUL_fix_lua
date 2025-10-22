require("CommonResource_BackGroundByName")
require("ActivityDungeon1021_PassReward_RewardRegionByName")
require("ActivityDungeon1021_PassTask_TaskRegionByName")
require("ActivityDungeon1021_PassClothes_ClothseRegionByName")
require("ActivityDungeon1021_Passport_LevelByName")
require("ActivityDungeon1021_Sign_TimeByName")
require("ActivityDungeon1021_Passport_TabRegionByName")

function GetActivityDungeon1021_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1021_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1021_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1021_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1021_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1021_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1021_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
