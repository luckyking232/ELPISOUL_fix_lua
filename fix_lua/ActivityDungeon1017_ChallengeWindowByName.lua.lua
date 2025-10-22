require("ActivityDungeon1017_ChallengeByName")

function GetActivityDungeon1017_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
