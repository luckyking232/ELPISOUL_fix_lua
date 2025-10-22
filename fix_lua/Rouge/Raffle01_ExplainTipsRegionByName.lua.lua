require("Raffle01_ExplainTipsInfoByName")

function GetRaffle01_ExplainTipsRegionUis(ui)
  local uis = {}
  uis.Tips = GetRaffle01_ExplainTipsInfoUis(ui:GetChild("Tips"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.root = ui
  return uis
end
