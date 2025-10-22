require("ActivityDungeon1004_PassReward_AllFrame_EByName")

function GetActivityDungeon1004_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1004_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
