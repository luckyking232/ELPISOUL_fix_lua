require("CommonResource_BackGroundByName")
require("ActivityDungeon1007_Sign_RewardListByName")
require("ActivityDungeon1007_Sign_TimeByName")

function GetActivityDungeon1007_SignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardList = GetActivityDungeon1007_Sign_RewardListUis(ui:GetChild("RewardList"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Time = GetActivityDungeon1007_Sign_TimeUis(ui:GetChild("Time"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
