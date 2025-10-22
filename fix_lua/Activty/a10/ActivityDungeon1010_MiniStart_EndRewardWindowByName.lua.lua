require("ActivityDungeon1010_MiniStart_EndRewardByName")

function GetActivityDungeon1010_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
