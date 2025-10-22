require("ActivityDungeon1004_BossBattle_TipsByName")

function GetActivityDungeon1004_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1004_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
