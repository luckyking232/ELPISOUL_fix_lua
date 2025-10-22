require("PlayerInfo_BirthdayTips_TimeByName")

function GetPlayerInfo_BirthdayTips_TimeRegionUis(ui)
  local uis = {}
  uis.Month = GetPlayerInfo_BirthdayTips_TimeUis(ui:GetChild("Month"))
  uis.Day = GetPlayerInfo_BirthdayTips_TimeUis(ui:GetChild("Day"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
