require("ActivityDungeon1010_ChallengeByName")

function GetActivityDungeon1010_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
