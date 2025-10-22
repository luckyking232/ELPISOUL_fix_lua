require("ActivityDungeon1003_BossBattle_TipsByName")

function GetActivityDungeon1003_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1003_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
