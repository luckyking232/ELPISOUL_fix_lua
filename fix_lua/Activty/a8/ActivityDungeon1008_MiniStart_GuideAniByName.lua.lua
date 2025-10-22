require("ActivityDungeon1008_MiniStart_GuideByName")

function GetActivityDungeon1008_MiniStart_GuideAniUis(ui)
  local uis = {}
  uis.Guide = GetActivityDungeon1008_MiniStart_GuideUis(ui:GetChild("Guide"))
  uis.root = ui
  return uis
end
