require("CommonResource_PopupBgByName")
require("ActivityDungeon1010_MiniExplain_TipsByName")

function GetActivityDungeon1010_MiniExplainUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Tips = GetActivityDungeon1010_MiniExplain_TipsUis(ui:GetChild("Tips"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
