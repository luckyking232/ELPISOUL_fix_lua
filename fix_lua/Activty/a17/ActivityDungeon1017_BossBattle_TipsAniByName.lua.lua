require("ActivityDungeon1017_BossBattle_TipsByName")

function GetActivityDungeon1017_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1017_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
