local rankInfoLookup, guildWarRankInfo
local SetRankInfo = function(data)
  rankInfoLookup = rankInfoLookup or {}
  local sceneType = data.sceneType
  local exits = rankInfoLookup[sceneType] or data
  local index = data.startIndex
  local rankList = data.members
  for i = 1, #rankList do
    exits.members[i + index] = rankList[i]
  end
  rankInfoLookup[sceneType] = exits
end
local SetGuildWarRankInfo = function(data)
  guildWarRankInfo = data
end
local GetRankInfo = function(r_type)
  return rankInfoLookup and rankInfoLookup[r_type]
end
local GetGuildWarRankInfo = function()
  return guildWarRankInfo
end
local GetPlayerRankInfoAt = function(r_type, rank)
  local entry = GetRankInfo(r_type)
  if entry then
    return entry.members and entry.members[rank]
  end
end
local GetPlayerRankInfo = function(r_type, uin)
  local entry = GetRankInfo(r_type)
  if not entry then
    return
  end
  for _, v in pairs(entry.members) do
    if v.uin == uin then
      return v
    end
  end
end
local Clear = function()
  if rankInfoLookup then
    rankInfoLookup = nil
  end
  guildWarRankInfo = nil
end
return {
  SetRankInfo = SetRankInfo,
  SetGuildWarRankInfo = SetGuildWarRankInfo,
  GetRankInfo = GetRankInfo,
  GetGuildWarRankInfo = GetGuildWarRankInfo,
  GetPlayerRankInfoAt = GetPlayerRankInfoAt,
  GetPlayerRankInfo = GetPlayerRankInfo,
  Clear = Clear
}
