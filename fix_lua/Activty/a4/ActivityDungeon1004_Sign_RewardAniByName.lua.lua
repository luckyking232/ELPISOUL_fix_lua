require("ActivityDungeon1004_Sign_RewardByName")

function GetActivityDungeon1004_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1004_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
