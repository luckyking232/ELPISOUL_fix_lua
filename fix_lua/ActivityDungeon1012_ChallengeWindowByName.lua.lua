require("ActivityDungeon1012_ChallengeByName")

function GetActivityDungeon1012_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
