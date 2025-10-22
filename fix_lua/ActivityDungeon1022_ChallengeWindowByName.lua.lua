require("ActivityDungeon1022_ChallengeByName")

function GetActivityDungeon1022_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
