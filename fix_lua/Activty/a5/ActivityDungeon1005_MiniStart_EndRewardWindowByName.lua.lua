require("ActivityDungeon1005_MiniStart_EndRewardByName")

function GetActivityDungeon1005_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
