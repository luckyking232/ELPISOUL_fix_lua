require("ActivityDungeon1005_BossBattle_TipsByName")

function GetActivityDungeon1005_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1005_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
