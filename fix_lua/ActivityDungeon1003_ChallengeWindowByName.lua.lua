require("ActivityDungeon1003_ChallengeByName")

function GetActivityDungeon1003_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
