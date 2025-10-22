require("Battle_Firm1FillByName")

function GetBattle_Firm1BarUis(ui)
  local uis = {}
  uis.bar = GetBattle_Firm1FillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
