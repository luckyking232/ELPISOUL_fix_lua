require("ActivityDungeon1022_MiniStart_EndRewardByName")

function GetActivityDungeon1022_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
