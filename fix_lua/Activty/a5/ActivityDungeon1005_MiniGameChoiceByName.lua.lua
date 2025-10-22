require("CommonResource_PopupBgByName")

function GetActivityDungeon1005_MiniGameChoiceUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.BallList = ui:GetChild("BallList")
  uis.TabSignBtn = ui:GetChild("TabSignBtn")
  uis.root = ui
  return uis
end
