require("ActivityDungeon1004_MiniTask_TipsByName")

function GetActivityDungeon1004_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
