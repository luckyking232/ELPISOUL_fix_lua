require("CommonResource_ItemFrameByName")

function GetPlayerReturns_SignReward_ItemUis(ui)
  local uis = {}
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.DayTxt = ui:GetChild("DayTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
