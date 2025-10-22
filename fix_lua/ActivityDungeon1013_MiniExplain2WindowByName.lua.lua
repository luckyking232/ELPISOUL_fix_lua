require("ActivityDungeon1013_MiniExplain2ByName")

function GetActivityDungeon1013_MiniExplain2WindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MiniExplain2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
