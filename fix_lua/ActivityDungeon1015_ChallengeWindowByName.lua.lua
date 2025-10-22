require("ActivityDungeon1015_ChallengeByName")

function GetActivityDungeon1015_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
