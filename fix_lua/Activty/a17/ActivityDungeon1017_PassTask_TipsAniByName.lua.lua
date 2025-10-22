require("ActivityDungeon1017_PassTask_TipsByName")

function GetActivityDungeon1017_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1017_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
