require("ActivityDungeon1010_PassReward_AllFrame_EByName")

function GetActivityDungeon1010_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1010_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
