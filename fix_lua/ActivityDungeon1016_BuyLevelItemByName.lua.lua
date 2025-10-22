require("ActivityDungeon1016_PassReward_AllFrame_EByName")

function GetActivityDungeon1016_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1016_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
