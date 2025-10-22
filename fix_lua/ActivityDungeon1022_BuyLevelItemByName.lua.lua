require("ActivityDungeon1022_PassReward_AllFrame_EByName")

function GetActivityDungeon1022_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1022_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
