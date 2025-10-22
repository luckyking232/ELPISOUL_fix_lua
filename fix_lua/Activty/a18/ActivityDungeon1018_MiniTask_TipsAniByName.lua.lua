require("ActivityDungeon1018_MiniTask_TipsByName")

function GetActivityDungeon1018_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1018_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
