require("ActivityDungeon1021_BossBattle_TipsByName")

function GetActivityDungeon1021_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1021_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
