require("Watch_CardHeadPicByName")
require("Watch_Special_SignByName")
require("Watch_Special_LockByName")

function GetWatch_CardHeadBtnUis(ui)
  local uis = {}
  uis.CardHeadPic = GetWatch_CardHeadPicUis(ui:GetChild("CardHeadPic"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.Sign = GetWatch_Special_SignUis(ui:GetChild("Sign"))
  uis.Lock = GetWatch_Special_LockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.typeCtr = ui:GetController("type")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
