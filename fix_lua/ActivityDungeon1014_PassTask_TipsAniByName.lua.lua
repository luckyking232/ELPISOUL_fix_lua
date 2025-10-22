require("ActivityDungeon1014_PassTask_TipsByName")

function GetActivityDungeon1014_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1014_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
