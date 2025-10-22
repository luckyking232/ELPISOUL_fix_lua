require("ActivityDungeon1003_PassTask_TipsByName")

function GetActivityDungeon1003_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1003_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
