require("ExploreSign02_GetWordByName")

function GetExploreSign02_Place1BtnUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.GetWord = GetExploreSign02_GetWordUis(ui:GetChild("GetWord"))
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
