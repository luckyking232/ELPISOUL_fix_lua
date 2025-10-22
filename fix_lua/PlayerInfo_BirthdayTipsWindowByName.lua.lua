require("PlayerInfo_BirthdayTipsByName")

function GetPlayerInfo_BirthdayTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerInfo_BirthdayTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
