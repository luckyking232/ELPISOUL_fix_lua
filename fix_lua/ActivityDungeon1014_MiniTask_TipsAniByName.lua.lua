require("ActivityDungeon1014_MiniTask_TipsByName")

function GetActivityDungeon1014_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1014_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
