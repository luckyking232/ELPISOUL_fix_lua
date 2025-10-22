require("ActivityDungeon1019_MiniTask_TipsByName")

function GetActivityDungeon1019_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1019_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
