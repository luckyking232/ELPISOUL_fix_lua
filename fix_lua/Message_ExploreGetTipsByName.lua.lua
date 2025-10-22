require("CommonResource_PopupBgByName")
require("Message_ExploreGetWayByName")
require("Message_ExploreGetTipsNumberByName")

function GetMessage_ExploreGetTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoaderr = ui:GetChild("PicLoaderr")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.Way = GetMessage_ExploreGetWayUis(ui:GetChild("Way"))
  uis.ItemGetTipsNumber = GetMessage_ExploreGetTipsNumberUis(ui:GetChild("ItemGetTipsNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
