require("ActivityDungeon1022_BossBattle_TipsByName")

function GetActivityDungeon1022_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1022_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
