require("ActivityDungeon1018_MiniStart_EndRewardByName")

function GetActivityDungeon1018_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
