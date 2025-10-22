require("Raffle01_Task_ItemByName")

function GetRaffle01_Task_ItemRegionUis(ui)
  local uis = {}
  uis.DayItem = GetRaffle01_Task_ItemUis(ui:GetChild("DayItem"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
