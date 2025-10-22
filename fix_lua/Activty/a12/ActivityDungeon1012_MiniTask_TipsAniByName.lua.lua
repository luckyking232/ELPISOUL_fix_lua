require("ActivityDungeon1012_MiniTask_TipsByName")

function GetActivityDungeon1012_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1012_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
