require("ActivityDungeon1018_PassReward_AllFrame_EByName")

function GetActivityDungeon1018_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1018_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
