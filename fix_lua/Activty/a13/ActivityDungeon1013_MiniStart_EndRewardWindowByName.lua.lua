require("ActivityDungeon1013_MiniStart_EndRewardByName")

function GetActivityDungeon1013_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
