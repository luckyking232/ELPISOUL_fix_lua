require("ActivityDungeon1011_PassTask_TipsByName")

function GetActivityDungeon1011_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1011_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
