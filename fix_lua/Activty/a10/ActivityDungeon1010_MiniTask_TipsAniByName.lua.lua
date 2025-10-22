require("ActivityDungeon1010_MiniTask_TipsByName")

function GetActivityDungeon1010_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1010_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
