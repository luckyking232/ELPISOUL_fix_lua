require("Sign_Module5ObtainByName")

function GetSign_Module5Uis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Obtain = GetSign_Module5ObtainUis(ui:GetChild("Obtain"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
