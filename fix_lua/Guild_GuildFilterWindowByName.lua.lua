require("Guild_GuildFilterByName")

function GetGuild_GuildFilterWindowUis(ui)
  local uis = {}
  uis.Main = GetGuild_GuildFilterUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
