require("ActivityDungeon1015_PassTask_TipsByName")

function GetActivityDungeon1015_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1015_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
