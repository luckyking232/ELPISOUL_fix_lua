require("ActivityDungeon1017_Sign_RewardByName")

function GetActivityDungeon1017_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1017_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
