require("ActivityDungeon1012_BossBattle_TipsByName")

function GetActivityDungeon1012_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1012_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
