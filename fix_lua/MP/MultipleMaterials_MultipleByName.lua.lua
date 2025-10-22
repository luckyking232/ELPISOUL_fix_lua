require("CommonResource_PopupBgByName")

function GetMultipleMaterials_MultipleUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.FunctionList = ui:GetChild("FunctionList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
