require("ActivityDungeon1018_PassTask_TipsByName")

function GetActivityDungeon1018_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1018_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
