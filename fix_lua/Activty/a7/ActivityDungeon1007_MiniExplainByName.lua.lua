require("CommonResource_PopupBgByName")
require("ActivityDungeon1007_MiniExplain_TipsByName")

function GetActivityDungeon1007_MiniExplainUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetActivityDungeon1007_MiniExplain_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
