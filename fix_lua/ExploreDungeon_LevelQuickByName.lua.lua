require("CommonResource_PopupBgByName")
require("ExploreDungeon_LevelQuick_TipsByName")

function GetExploreDungeon_LevelQuickUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetExploreDungeon_LevelQuick_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
