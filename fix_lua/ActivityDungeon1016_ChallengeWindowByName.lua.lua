require("ActivityDungeon1016_ChallengeByName")

function GetActivityDungeon1016_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
