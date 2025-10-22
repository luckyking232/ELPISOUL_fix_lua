require("ActivityDungeon1015_MiniTask_TipsByName")

function GetActivityDungeon1015_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1015_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
