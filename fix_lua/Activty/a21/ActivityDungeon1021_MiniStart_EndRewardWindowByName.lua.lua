require("ActivityDungeon1021_MiniStart_EndRewardByName")

function GetActivityDungeon1021_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
