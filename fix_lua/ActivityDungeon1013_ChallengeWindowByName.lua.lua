require("ActivityDungeon1013_ChallengeByName")

function GetActivityDungeon1013_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
