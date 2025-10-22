require("Explore_DispatchCardBgByName")
require("Explore_CardBreachByName")

function GetExplore_DispatchCardUis(ui)
  local uis = {}
  uis.CardBg = GetExplore_DispatchCardBgUis(ui:GetChild("CardBg"))
  uis.CardBreach = GetExplore_CardBreachUis(ui:GetChild("CardBreach"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
