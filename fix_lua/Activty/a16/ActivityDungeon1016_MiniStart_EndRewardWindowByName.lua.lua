require("ActivityDungeon1016_MiniStart_EndRewardByName")

function GetActivityDungeon1016_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
