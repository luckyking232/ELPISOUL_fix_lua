require("ActivityDungeon1021_ChallengeByName")

function GetActivityDungeon1021_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
