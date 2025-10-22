require("ActivityDungeon1011_ChallengeByName")

function GetActivityDungeon1011_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
