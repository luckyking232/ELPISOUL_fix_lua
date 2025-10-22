require("PlayerInfo_BirthdayTips_TimeAniByName")

function GetPlayerInfo_BirthdayTips_TimeUis(ui)
  local uis = {}
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.Time = GetPlayerInfo_BirthdayTips_TimeAniUis(ui:GetChild("Time"))
  uis.root = ui
  return uis
end
