require("ActivityDungeon1003_PassReward_AllFrame_EByName")

function GetActivityDungeon1003_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1003_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
