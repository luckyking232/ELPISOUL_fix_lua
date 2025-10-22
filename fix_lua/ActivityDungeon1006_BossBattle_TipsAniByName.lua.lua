require("ActivityDungeon1006_BossBattle_TipsByName")

function GetActivityDungeon1006_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
