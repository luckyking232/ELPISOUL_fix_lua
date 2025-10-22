require("ActivityDungeon1008_PassReward_AllFrame_EByName")

function GetActivityDungeon1008_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1008_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
