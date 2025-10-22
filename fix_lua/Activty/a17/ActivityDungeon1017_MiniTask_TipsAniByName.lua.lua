require("ActivityDungeon1017_MiniTask_TipsByName")

function GetActivityDungeon1017_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1017_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
