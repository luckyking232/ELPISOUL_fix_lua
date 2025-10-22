require("ActivityDungeon1007_BossBattle_TipsByName")

function GetActivityDungeon1007_BossBattle_TipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1007_BossBattle_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
