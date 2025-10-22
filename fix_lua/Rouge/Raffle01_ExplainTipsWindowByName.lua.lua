require("Raffle01_ExplainTipsByName")

function GetRaffle01_ExplainTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRaffle01_ExplainTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
