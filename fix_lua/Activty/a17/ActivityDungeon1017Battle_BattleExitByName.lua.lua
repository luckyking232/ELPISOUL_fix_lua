require("CommonResource_PopupBgByName")

function GetActivityDungeon1017Battle_BattleExitUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CancelBtn = ui:GetChild("CancelBtn")
  uis.ExitBtn = ui:GetChild("ExitBtn")
  uis.root = ui
  return uis
end
