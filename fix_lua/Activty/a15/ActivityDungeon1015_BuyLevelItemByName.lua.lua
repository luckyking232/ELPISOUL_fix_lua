require("ActivityDungeon1015_PassReward_AllFrame_EByName")

function GetActivityDungeon1015_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1015_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
