local indexesBufferLookup
local RequireRankInfo = function(r_type, startIndex, rspCallback)
  indexesBufferLookup = indexesBufferLookup or {}
  indexesBufferLookup[r_type] = indexesBufferLookup[r_type] or {}
  local indexesBuffer = indexesBufferLookup[r_type]
  local length = 10
  for i, v in ipairs(indexesBuffer) do
    if v <= startIndex and startIndex < v + length then
      return
    end
  end
  table.insert(indexesBuffer, startIndex)
  RanklistService.GetRankInfoReq(r_type, startIndex, rspCallback)
end
local ClearRankInfoCache = function()
  RanklistData.Clear()
  if indexesBufferLookup then
    table.clear(indexesBufferLookup)
  end
end
return {RequireRankInfo = RequireRankInfo, ClearRankInfoCache = ClearRankInfoCache}
