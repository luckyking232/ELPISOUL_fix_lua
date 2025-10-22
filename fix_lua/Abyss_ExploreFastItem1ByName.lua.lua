require("Abyss_ExploreFastSpend1ByName")
require("Abyss_ExploreFastNumberStripByName")

function GetAbyss_ExploreFastItem1Uis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Spend = GetAbyss_ExploreFastSpend1Uis(ui:GetChild("Spend"))
  uis.NumberStrip = GetAbyss_ExploreFastNumberStripUis(ui:GetChild("NumberStrip"))
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
