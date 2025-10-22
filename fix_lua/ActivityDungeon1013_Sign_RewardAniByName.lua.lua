require("ActivityDungeon1013_Sign_RewardByName")

function GetActivityDungeon1013_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1013_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
