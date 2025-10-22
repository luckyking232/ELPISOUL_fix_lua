require("ActivityDungeon1020_MiniTask_TipsByName")

function GetActivityDungeon1020_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1020_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
