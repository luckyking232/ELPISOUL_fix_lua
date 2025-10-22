require("Guild_GuildFilter_InfoMoveWordByName")

function GetGuild_GuildFilter_InfoBtnUis(ui)
  local uis = {}
  uis.MoveWord = GetGuild_GuildFilter_InfoMoveWordUis(ui:GetChild("MoveWord"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
