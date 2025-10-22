require("ActivityDungeon1011_PassReward_AllFrame_EByName")

function GetActivityDungeon1011_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1011_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
