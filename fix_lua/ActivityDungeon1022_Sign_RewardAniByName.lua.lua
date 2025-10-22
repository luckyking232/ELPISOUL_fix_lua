require("ActivityDungeon1022_Sign_RewardByName")

function GetActivityDungeon1022_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1022_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
