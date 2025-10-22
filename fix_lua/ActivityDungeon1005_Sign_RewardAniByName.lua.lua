require("ActivityDungeon1005_Sign_RewardByName")

function GetActivityDungeon1005_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1005_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
