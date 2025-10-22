require("ActivityDungeon1014_ChallengeByName")

function GetActivityDungeon1014_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
