require("ActivityDungeon1013_MiniTask2_TipsByName")

function GetActivityDungeon1013_MiniTask2_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1013_MiniTask2_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
