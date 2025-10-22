require("ActivityDungeon1013_MiniRank_TipsByName")

function GetActivityDungeon1013_MiniRank_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1013_MiniRank_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
