require("CommonResource_PopupBgByName")
require("ActivityDungeon1022_MiniStart_WinByName")

function GetActivityDungeon1022_MiniStart_EndRewardUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Win = GetActivityDungeon1022_MiniStart_WinUis(ui:GetChild("Win"))
  uis.AgainBtn = ui:GetChild("AgainBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
