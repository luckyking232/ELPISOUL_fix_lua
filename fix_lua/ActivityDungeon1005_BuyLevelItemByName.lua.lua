require("ActivityDungeon1005_PassReward_AllFrame_EByName")

function GetActivityDungeon1005_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1005_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
