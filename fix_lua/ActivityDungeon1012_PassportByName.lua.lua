require("CommonResource_BackGroundByName")
require("ActivityDungeon1012_PassReward_RewardRegionByName")
require("ActivityDungeon1012_PassTask_TaskRegionByName")
require("ActivityDungeon1012_PassClothes_ClothseRegionByName")
require("ActivityDungeon1012_Passport_LevelByName")
require("ActivityDungeon1012_Sign_TimeByName")
require("ActivityDungeon1012_Passport_TabRegionByName")

function GetActivityDungeon1012_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1012_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1012_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1012_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1012_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1012_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1012_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
