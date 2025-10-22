require("ActivityDungeon1006_ChallengeByName")

function GetActivityDungeon1006_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
