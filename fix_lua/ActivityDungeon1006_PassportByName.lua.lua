require("CommonResource_BackGroundByName")
require("ActivityDungeon1006_PassReward_RewardRegionByName")
require("ActivityDungeon1006_PassTask_TaskRegionByName")
require("ActivityDungeon1006_PassClothes_ClothseRegionByName")
require("ActivityDungeon1006_Passport_LevelByName")
require("ActivityDungeon1006_Sign_TimeByName")
require("ActivityDungeon1006_Passport_TabRegionByName")

function GetActivityDungeon1006_PassportUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardRegion = GetActivityDungeon1006_PassReward_RewardRegionUis(ui:GetChild("RewardRegion"))
  uis.TaskRegion = GetActivityDungeon1006_PassTask_TaskRegionUis(ui:GetChild("TaskRegion"))
  uis.ClothseRegion = GetActivityDungeon1006_PassClothes_ClothseRegionUis(ui:GetChild("ClothseRegion"))
  uis.Level = GetActivityDungeon1006_Passport_LevelUis(ui:GetChild("Level"))
  uis.Time = GetActivityDungeon1006_Sign_TimeUis(ui:GetChild("Time"))
  uis.AllGetBtn = ui:GetChild("AllGetBtn")
  uis.TabRegion = GetActivityDungeon1006_Passport_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
