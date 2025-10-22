require("ActivityDungeon1013_MiniStart2_EndRewardByName")

function GetActivityDungeon1013_MiniStart2_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniStart2_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
