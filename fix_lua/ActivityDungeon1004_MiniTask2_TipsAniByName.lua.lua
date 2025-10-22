require("ActivityDungeon1004_MiniTask2_TipsByName")

function GetActivityDungeon1004_MiniTask2_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_MiniTask2_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
