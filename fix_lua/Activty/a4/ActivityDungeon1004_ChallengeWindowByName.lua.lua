require("ActivityDungeon1004_ChallengeByName")

function GetActivityDungeon1004_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
