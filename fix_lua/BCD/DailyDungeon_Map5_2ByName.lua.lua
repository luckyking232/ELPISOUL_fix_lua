require("DailyDungeon_CircleByName")
require("DailyDungeon_Map5PatternAniByName")
require("DailyDungeon_MapTipsByName")

function GetDailyDungeon_Map5_2Uis(ui)
  local uis = {}
  uis.Circle = GetDailyDungeon_CircleUis(ui:GetChild("Circle"))
  uis.PatternAni = GetDailyDungeon_Map5PatternAniUis(ui:GetChild("PatternAni"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Tips1 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips3"))
  uis.Tips4 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips4"))
  uis.Tips5 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips5"))
  uis.Tips6 = GetDailyDungeon_MapTipsUis(ui:GetChild("Tips6"))
  uis.root = ui
  return uis
end
