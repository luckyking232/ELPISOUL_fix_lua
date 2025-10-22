require("ActivityDungeon1016_BossBattle_TipsByName")

function GetActivityDungeon1016_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1016_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
