require("ActivityDungeon1004_MiniStart_Condition2ByName")

function GetActivityDungeon1004_MiniStart_ConditionUis(ui)
  local uis = {}
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.Word2Txt = ui:GetChild("Word2Txt")
  uis.Condition1List = ui:GetChild("Condition1List")
  uis.Condition2 = GetActivityDungeon1004_MiniStart_Condition2Uis(ui:GetChild("Condition2"))
  uis.root = ui
  return uis
end
