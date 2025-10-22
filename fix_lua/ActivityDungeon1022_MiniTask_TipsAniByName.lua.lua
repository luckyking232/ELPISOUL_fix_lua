require("ActivityDungeon1022_MiniTask_TipsByName")

function GetActivityDungeon1022_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1022_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
