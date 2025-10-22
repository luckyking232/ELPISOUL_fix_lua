require("CommonResource_ItemFrameByName")
require("PlayerReturns_Shop_MoveWordByName")
require("PlayerReturns_Shop_SellOutByName")

function GetPlayerReturns_Shop_ItemUis(ui)
  local uis = {}
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.MoveWord = GetPlayerReturns_Shop_MoveWordUis(ui:GetChild("MoveWord"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.SellOut = GetPlayerReturns_Shop_SellOutUis(ui:GetChild("SellOut"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
