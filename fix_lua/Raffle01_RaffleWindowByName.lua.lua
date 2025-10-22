require("Raffle01_RaffleByName")

function GetRaffle01_RaffleWindowUis(ui)
  local uis = {}
  uis.Main = GetRaffle01_RaffleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
