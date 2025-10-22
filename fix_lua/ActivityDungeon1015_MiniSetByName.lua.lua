require("CommonResource_PopupBgByName")
require("ActivityDungeon1015_MiniSet_TipsByName")

function GetActivityDungeon1015_MiniSetUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetActivityDungeon1015_MiniSet_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
