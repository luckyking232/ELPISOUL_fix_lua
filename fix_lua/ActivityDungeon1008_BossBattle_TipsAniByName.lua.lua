require("ActivityDungeon1008_BossBattle_TipsByName")

function GetActivityDungeon1008_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1008_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
