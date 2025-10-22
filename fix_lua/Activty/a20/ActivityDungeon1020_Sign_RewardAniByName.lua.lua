require("ActivityDungeon1020_Sign_RewardByName")

function GetActivityDungeon1020_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1020_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
