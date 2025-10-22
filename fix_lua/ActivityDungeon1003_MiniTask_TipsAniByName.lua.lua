require("ActivityDungeon1003_MiniTask_TipsByName")

function GetActivityDungeon1003_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1003_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
