require("ActivityDungeon1019_PassReward_AllFrame_EByName")

function GetActivityDungeon1019_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1019_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
