require("PlayerReturns_Multiple_NumberByName")

function GetPlayerReturns_MultipleUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.Number = GetPlayerReturns_Multiple_NumberUis(ui:GetChild("Number"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.root = ui
  return uis
end
