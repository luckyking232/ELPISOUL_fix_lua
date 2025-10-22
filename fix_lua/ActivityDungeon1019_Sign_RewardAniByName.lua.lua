require("ActivityDungeon1019_Sign_RewardByName")

function GetActivityDungeon1019_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1019_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
