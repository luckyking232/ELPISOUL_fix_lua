require("CommonResource_PopupBgByName")
require("ActivityDungeon1013_MiniExplain2_TipsByName")

function GetActivityDungeon1013_MiniExplain2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetActivityDungeon1013_MiniExplain2_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
