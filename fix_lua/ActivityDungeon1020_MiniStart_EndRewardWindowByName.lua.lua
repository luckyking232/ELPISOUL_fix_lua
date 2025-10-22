require("ActivityDungeon1020_MiniStart_EndRewardByName")

function GetActivityDungeon1020_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
