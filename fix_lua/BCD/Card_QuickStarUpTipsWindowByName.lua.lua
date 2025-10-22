require("Card_QuickStarUpTips2ByName")

function GetCard_QuickStarUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_QuickStarUpTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
