require("CommonResource_PopupBgByName")

function GetActivityDungeon1008_MiniGameChoiceUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.OperateBtn = ui:GetChild("OperateBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
