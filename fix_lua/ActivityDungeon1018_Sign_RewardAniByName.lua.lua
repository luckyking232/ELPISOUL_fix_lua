require("ActivityDungeon1018_Sign_RewardByName")

function GetActivityDungeon1018_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1018_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
