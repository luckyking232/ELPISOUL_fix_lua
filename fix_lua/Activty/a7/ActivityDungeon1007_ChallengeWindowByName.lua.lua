require("ActivityDungeon1007_ChallengeByName")

function GetActivityDungeon1007_ChallengeWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_ChallengeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
