require("Story_CardStar_InfoByName")

function GetStory_CardStar_TipsUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.Info = GetStory_CardStar_InfoUis(ui:GetChild("Info"))
  uis.DotList = ui:GetChild("DotList")
  uis.root = ui
  return uis
end
