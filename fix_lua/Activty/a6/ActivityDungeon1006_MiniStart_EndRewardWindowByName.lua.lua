require("ActivityDungeon1006_MiniStart_EndRewardByName")

function GetActivityDungeon1006_MiniStart_EndRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniStart_EndRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
