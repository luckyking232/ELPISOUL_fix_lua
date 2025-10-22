require("ActivityDungeon1012_PassReward_AllFrame_EByName")

function GetActivityDungeon1012_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1012_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
