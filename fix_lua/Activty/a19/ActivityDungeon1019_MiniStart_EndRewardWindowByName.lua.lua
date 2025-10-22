require("ActivityDungeon1019_MiniStart_EndRewardByName")

function GetActivityDungeon1019_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
