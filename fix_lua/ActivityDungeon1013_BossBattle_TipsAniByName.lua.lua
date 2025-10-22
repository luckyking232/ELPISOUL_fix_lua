require("ActivityDungeon1013_BossBattle_TipsByName")

function GetActivityDungeon1013_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1013_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
