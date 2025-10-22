require("CommonResource_HeadByName")

function GetFriend_FriendBattleTipsUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.ResultTxt = ui:GetChild("ResultTxt")
  uis.DataBtn = ui:GetChild("DataBtn")
  uis.PlayBackBtn = ui:GetChild("PlayBackBtn")
  uis.TimeAxisBtn = ui:GetChild("TimeAxisBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
