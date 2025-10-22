function GetBadge_HomePageUis(ui)
  local uis = {}
  
  uis.CardList = ui:GetChild("CardList")
  uis.DecomposeBtn = ui:GetChild("DecomposeBtn")
  uis.OverviewBtn = ui:GetChild("OverviewBtn")
  uis.AllWearBtn = ui:GetChild("AllWearBtn")
  uis.RecommendWearBtn = ui:GetChild("RecommendWearBtn")
  uis.root = ui
  return uis
end
