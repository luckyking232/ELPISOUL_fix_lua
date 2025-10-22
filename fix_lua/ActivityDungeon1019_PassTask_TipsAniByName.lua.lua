require("ActivityDungeon1019_PassTask_TipsByName")

function GetActivityDungeon1019_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1019_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
