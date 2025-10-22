require("ActivityDungeon1011_MiniStart_EndRewardByName")

function GetActivityDungeon1011_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
