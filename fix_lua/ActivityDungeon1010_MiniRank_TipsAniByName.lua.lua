require("ActivityDungeon1010_MiniRank_TipsByName")

function GetActivityDungeon1010_MiniRank_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1010_MiniRank_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
