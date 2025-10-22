require("CommonResource_PopupBgByName")
require("ActivityDungeon1020_MiniStart_WinByName")
require("ActivityDungeon1020_MiniStart_FailByName")

function GetActivityDungeon1020_MiniStart_EndRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Win = GetActivityDungeon1020_MiniStart_WinUis(ui:GetChild("Win"))
  uis.Fail = GetActivityDungeon1020_MiniStart_FailUis(ui:GetChild("Fail"))
  uis.AgainBtn = ui:GetChild("AgainBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
