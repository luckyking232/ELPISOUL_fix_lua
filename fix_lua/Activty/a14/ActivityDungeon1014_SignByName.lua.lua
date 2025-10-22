require("CommonResource_BackGroundByName")
require("ActivityDungeon1014_Sign_RewardListByName")
require("ActivityDungeon1014_Sign_TimeByName")

function GetActivityDungeon1014_SignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardList = GetActivityDungeon1014_Sign_RewardListUis(ui:GetChild("RewardList"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Time = GetActivityDungeon1014_Sign_TimeUis(ui:GetChild("Time"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
