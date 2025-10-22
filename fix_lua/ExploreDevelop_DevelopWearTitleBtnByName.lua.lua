require("ExploreDevelop_DevelopWearTitleAttributeByName")

function GetExploreDevelop_DevelopWearTitleBtnUis(ui)
  local uis = {}
  uis.Attribute = GetExploreDevelop_DevelopWearTitleAttributeUis(ui:GetChild("Attribute"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
