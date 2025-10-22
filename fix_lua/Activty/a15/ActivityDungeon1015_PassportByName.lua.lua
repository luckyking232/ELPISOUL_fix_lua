require("CommonResource_BackGroundByName")
require("ActivityDungeon1015_PassReward_RewardRegionByName")
require("ActivityDungeon1015_PassTask_TaskRegionByName")
require("ActivityDungeon1015_PassClothes_ClothseRegionByName")
require("ActivityDungeon1015_Passport_LevelByName")
require("ActivityDungeon1015_Sign_TimeByName")
require("ActivityDungeon1015_Passport_TabRegionByName")

function GetActivityDungeon1015_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1015_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1015_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1015_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1015_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1015_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1015_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
