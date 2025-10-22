require("ActivityDungeon1017_PassReward_AllFrame_EByName")

function GetActivityDungeon1017_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1017_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
