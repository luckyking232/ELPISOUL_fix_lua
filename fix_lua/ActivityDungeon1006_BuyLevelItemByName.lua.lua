require("ActivityDungeon1006_PassReward_AllFrame_EByName")

function GetActivityDungeon1006_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1006_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
