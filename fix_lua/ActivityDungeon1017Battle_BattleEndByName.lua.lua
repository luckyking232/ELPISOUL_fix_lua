require("CommonResource_PopupBgByName")
require("ActivityDungeon1017Battle_BattleEnd_InfoByName")

function GetActivityDungeon1017Battle_BattleEndUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Info1 = GetActivityDungeon1017Battle_BattleEnd_InfoUis(ui:GetChild("Info1"))
  uis.Info2 = GetActivityDungeon1017Battle_BattleEnd_InfoUis(ui:GetChild("Info2"))
  uis.EndBtn = ui:GetChild("EndBtn")
  uis.root = ui
  return uis
end
