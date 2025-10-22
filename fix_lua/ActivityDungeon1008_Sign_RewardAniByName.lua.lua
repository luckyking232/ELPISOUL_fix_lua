require("ActivityDungeon1008_Sign_RewardByName")

function GetActivityDungeon1008_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1008_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
