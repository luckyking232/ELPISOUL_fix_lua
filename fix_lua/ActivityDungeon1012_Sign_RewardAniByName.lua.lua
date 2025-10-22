require("ActivityDungeon1012_Sign_RewardByName")

function GetActivityDungeon1012_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1012_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
