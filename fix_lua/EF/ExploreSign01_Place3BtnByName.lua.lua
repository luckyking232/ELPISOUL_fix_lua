require("ExploreSign01_GetWordByName")

function GetExploreSign01_Place3BtnUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.GetWord = GetExploreSign01_GetWordUis(ui:GetChild("GetWord"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
