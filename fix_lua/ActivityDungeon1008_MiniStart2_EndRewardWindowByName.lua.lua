require("ActivityDungeon1008_MiniStart2_EndRewardByName")

function GetActivityDungeon1008_MiniStart2_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniStart2_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
