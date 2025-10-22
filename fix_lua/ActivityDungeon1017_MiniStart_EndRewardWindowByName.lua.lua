require("ActivityDungeon1017_MiniStart_EndRewardByName")

function GetActivityDungeon1017_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
