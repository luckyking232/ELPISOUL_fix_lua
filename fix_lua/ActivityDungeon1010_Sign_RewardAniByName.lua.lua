require("ActivityDungeon1010_Sign_RewardByName")

function GetActivityDungeon1010_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1010_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
