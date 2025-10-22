require("ActivityDungeon1007_MiniTask_TipsByName")

function GetActivityDungeon1007_MiniTask_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1007_MiniTask_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
