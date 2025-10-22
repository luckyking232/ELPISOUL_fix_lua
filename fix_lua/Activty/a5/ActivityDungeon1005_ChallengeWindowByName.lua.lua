require("ActivityDungeon1005_ChallengeByName")

function GetActivityDungeon1005_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
