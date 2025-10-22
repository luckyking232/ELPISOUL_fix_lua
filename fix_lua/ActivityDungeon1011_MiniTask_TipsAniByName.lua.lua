require("ActivityDungeon1011_MiniTask_TipsByName")

function GetActivityDungeon1011_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1011_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
