require("ActivityDungeon1006_Sign_RewardByName")

function GetActivityDungeon1006_Sign_RewardAniUis(ui)
  local uis = {}
  uis.Reward = GetActivityDungeon1006_Sign_RewardUis(ui:GetChild("Reward"))
  uis.root = ui
  return uis
end
