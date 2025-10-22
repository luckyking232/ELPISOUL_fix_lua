require("ActivityDungeon1004_MiniStart2_Stage3EffectByName")
require("ActivityDungeon1004_MiniStart2_Stage3WordByName")

function GetActivityDungeon1004_MiniStart2_Stage3BtnUis(ui)
  local uis = {}
  uis.Effect = GetActivityDungeon1004_MiniStart2_Stage3EffectUis(ui:GetChild("Effect"))
  uis.Word = GetActivityDungeon1004_MiniStart2_Stage3WordUis(ui:GetChild("Word"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
