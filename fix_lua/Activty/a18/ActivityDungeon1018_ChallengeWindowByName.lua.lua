require("ActivityDungeon1018_ChallengeByName")

function GetActivityDungeon1018_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
