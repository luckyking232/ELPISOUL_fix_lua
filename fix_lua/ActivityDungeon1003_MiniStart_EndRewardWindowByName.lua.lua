require("ActivityDungeon1003_MiniStart_EndRewardByName")

function GetActivityDungeon1003_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
