require("ActivityDungeon1007_PassTask_TipsByName")

function GetActivityDungeon1007_PassTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1007_PassTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
