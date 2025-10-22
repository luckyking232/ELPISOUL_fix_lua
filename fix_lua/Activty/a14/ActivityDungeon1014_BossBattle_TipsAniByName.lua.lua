require("ActivityDungeon1014_BossBattle_TipsByName")

function GetActivityDungeon1014_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1014_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
