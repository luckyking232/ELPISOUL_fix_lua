require("ActivityDungeon1008_MiniStart_EndRewardByName")

function GetActivityDungeon1008_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
