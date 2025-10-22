require("ActivityDungeon1022_PassTask_TipsByName")

function GetActivityDungeon1022_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1022_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
