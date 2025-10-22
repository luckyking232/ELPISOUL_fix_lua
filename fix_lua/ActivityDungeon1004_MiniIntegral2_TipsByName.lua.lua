require("ActivityDungeon1004_MiniIntegral2_TipsFirstByName")

function GetActivityDungeon1004_MiniIntegral2_TipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.First = GetActivityDungeon1004_MiniIntegral2_TipsFirstUis(ui:GetChild("First"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
