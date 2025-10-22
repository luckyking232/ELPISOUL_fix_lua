require("ActivityDungeon1019_ChallengeByName")

function GetActivityDungeon1019_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
