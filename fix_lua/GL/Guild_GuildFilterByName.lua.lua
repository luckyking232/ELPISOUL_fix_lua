require("CommonResource_PopupBgByName")
require("Guild_GuildFilter_TipsByName")

function GetGuild_GuildFilterUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetGuild_GuildFilter_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
