require("ActivityDungeon1017_TreasureArrowByName")

function GetActivityDungeon1017_TreasureBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Arrow = GetActivityDungeon1017_TreasureArrowUis(ui:GetChild("Arrow"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
