require("ExploreDungeon_LevelUp_QuickGetNumberByName")

function GetExploreDungeon_LevelUp_AFKRegionUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ProduceList = ui:GetChild("ProduceList")
  uis.RewardList = ui:GetChild("RewardList")
  uis.ProduceProgressBar = ui:GetChild("ProduceProgressBar")
  uis.QuickGetBtn = ui:GetChild("QuickGetBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.QuickGetNumber = GetExploreDungeon_LevelUp_QuickGetNumberUis(ui:GetChild("QuickGetNumber"))
  uis.ExplainBtn = ui:GetChild("ExplainBtn")
  uis.root = ui
  return uis
end
