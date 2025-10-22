require("CommonResource_PopupBgByName")
require("ActivityDungeon1017_MiniGameChoice2_InfoRegionByName")

function GetActivityDungeon1017_MiniGameChoice2_InfoSkillUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Info = GetActivityDungeon1017_MiniGameChoice2_InfoRegionUis(ui:GetChild("Info"))
  uis.root = ui
  return uis
end
