require("ActivityDungeon1019_BossBattle_TipsByName")

function GetActivityDungeon1019_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1019_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
