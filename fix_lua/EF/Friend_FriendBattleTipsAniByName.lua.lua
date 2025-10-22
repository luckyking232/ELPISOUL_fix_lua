require("Friend_FriendBattleTipsByName")

function GetFriend_FriendBattleTipsAniUis(ui)
  local uis = {}
  uis.FriendInfo = GetFriend_FriendBattleTipsUis(ui:GetChild("FriendInfo"))
  uis.root = ui
  return uis
end
