require("ActivityDungeon1011_BossBattle_TipsByName")

function GetActivityDungeon1011_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1011_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
