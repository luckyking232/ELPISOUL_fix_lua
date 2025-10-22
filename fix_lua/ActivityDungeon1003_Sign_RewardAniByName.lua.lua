require("ActivityDungeon1003_Sign_RewardByName")

function GetActivityDungeon1003_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1003_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
