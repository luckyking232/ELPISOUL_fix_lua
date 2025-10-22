require("CommonResource_BackGroundByName")
require("ActivityDungeon1017_PassReward_RewardRegionByName")
require("ActivityDungeon1017_PassTask_TaskRegionByName")
require("ActivityDungeon1017_PassClothes_ClothseRegionByName")
require("ActivityDungeon1017_Passport_LevelByName")
require("ActivityDungeon1017_Sign_TimeByName")
require("ActivityDungeon1017_Passport_TabRegionByName")

function GetActivityDungeon1017_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1017_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1017_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1017_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1017_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1017_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1017_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
