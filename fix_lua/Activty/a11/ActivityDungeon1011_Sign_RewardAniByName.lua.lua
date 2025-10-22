require("ActivityDungeon1011_Sign_RewardByName")

function GetActivityDungeon1011_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1011_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
