require("ActivityDungeon1015_BossBattle_TipsByName")

function GetActivityDungeon1015_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1015_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
