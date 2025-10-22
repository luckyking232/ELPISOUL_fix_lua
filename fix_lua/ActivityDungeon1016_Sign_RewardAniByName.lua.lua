require("ActivityDungeon1016_Sign_RewardByName")

function GetActivityDungeon1016_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1016_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
