require("CommonResource_PopupBgByName")
require("ActivityDungeon1004_MiniBook2_NumberByName")

function GetActivityDungeon1004_MiniBook2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.Number = GetActivityDungeon1004_MiniBook2_NumberUis(ui:GetChild("Number"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
