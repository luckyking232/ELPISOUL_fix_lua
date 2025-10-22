require("CommonResource_PopupBgByName")
require("ExploreDungeon_LevelExplain_TipsByName")

function GetExploreDungeon_LevelExplainUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetExploreDungeon_LevelExplain_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
