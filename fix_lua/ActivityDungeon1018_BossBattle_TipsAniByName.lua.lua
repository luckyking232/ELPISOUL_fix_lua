require("ActivityDungeon1018_BossBattle_TipsByName")

function GetActivityDungeon1018_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1018_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
