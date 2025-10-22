require("ActivityDungeon1014_MiniStart_EndRewardByName")

function GetActivityDungeon1014_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
