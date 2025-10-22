require("ActivityDungeon1008_ChallengeByName")

function GetActivityDungeon1008_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
