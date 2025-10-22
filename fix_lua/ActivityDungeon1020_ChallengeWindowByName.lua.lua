require("ActivityDungeon1020_ChallengeByName")

function GetActivityDungeon1020_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
