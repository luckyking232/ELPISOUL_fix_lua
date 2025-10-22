require("ActivityDungeon1020_MiniStart_GuGuNumberByName")

function GetActivityDungeon1020_MiniStart_GuGuUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Left = GetActivityDungeon1020_MiniStart_GuGuNumberUis(ui:GetChild("Left"))
  uis.Right = GetActivityDungeon1020_MiniStart_GuGuNumberUis(ui:GetChild("Right"))
  uis.numberCtr = ui:GetController("number")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
