require("ActivityDungeon1020_BossBattle_TipsByName")

function GetActivityDungeon1020_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1020_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
