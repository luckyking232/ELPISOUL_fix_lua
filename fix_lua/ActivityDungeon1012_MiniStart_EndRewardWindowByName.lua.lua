require("ActivityDungeon1012_MiniStart_EndRewardByName")

function GetActivityDungeon1012_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
