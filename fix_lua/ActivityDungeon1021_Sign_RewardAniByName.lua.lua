require("ActivityDungeon1021_Sign_RewardByName")

function GetActivityDungeon1021_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1021_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
