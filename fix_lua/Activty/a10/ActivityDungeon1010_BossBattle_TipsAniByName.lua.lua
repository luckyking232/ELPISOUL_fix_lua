require("ActivityDungeon1010_BossBattle_TipsByName")

function GetActivityDungeon1010_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1010_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
