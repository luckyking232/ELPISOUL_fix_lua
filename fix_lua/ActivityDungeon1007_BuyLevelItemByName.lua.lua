require("ActivityDungeon1007_PassReward_AllFrame_EByName")

function GetActivityDungeon1007_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1007_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
