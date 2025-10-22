require("ActivityDungeon1010_PassTask_TipsByName")

function GetActivityDungeon1010_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1010_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
