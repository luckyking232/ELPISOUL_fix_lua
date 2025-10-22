require("ActivityDungeon1014_PassReward_AllFrame_EByName")

function GetActivityDungeon1014_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1014_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
