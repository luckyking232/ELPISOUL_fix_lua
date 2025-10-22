require("ActivityDungeon1015_MiniStart_EndRewardByName")

function GetActivityDungeon1015_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
