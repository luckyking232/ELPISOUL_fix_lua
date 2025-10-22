require("ActivityDungeon1014_Sign_RewardByName")

function GetActivityDungeon1014_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1014_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
