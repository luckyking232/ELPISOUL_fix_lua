require("ActivityDungeon1020_PassReward_AllFrame_EByName")

function GetActivityDungeon1020_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1020_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
