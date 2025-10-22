require("ActivityDungeon1004_MiniStart_EndRewardByName")

function GetActivityDungeon1004_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
