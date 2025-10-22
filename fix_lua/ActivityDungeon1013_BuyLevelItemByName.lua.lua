require("ActivityDungeon1013_PassReward_AllFrame_EByName")

function GetActivityDungeon1013_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1013_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
