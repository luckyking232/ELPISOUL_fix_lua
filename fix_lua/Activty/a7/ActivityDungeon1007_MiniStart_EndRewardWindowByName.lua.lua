require("ActivityDungeon1007_MiniStart_EndRewardByName")

function GetActivityDungeon1007_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
