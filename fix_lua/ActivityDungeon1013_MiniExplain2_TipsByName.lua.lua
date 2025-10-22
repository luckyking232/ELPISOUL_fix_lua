require("ActivityDungeon1013_MiniExplain2_TipsContentWordByName")

function GetActivityDungeon1013_MiniExplain2_TipsUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Word1 = GetActivityDungeon1013_MiniExplain2_TipsContentWordUis(ui:GetChild("Word1"))
  uis.Word2 = GetActivityDungeon1013_MiniExplain2_TipsContentWordUis(ui:GetChild("Word2"))
  uis.Word3 = GetActivityDungeon1013_MiniExplain2_TipsContentWordUis(ui:GetChild("Word3"))
  uis.root = ui
  return uis
end
