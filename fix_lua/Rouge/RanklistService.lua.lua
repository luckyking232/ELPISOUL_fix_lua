local GetRankInfoReq = function(r_type, index, rspCallback)
  Net.Send(Proto.MsgName.GetSceneRankReq, {sceneType = r_type, startIndex = index}, rspCallback)
end
local GetGuildRankInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetGuildWarRankExtReq, nil, rspCallback)
end
local GetRankInfoRsp = function(msg)
  RanklistData.SetRankInfo(msg)
end
local GetGuildRankInfoRsp = function(msg)
  RanklistData.SetGuildWarRankInfo(msg)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetSceneRankRsp, GetRankInfoRsp)
  Net.AddListener(Proto.MsgName.GetGuildWarRankExtRsp, GetGuildRankInfoRsp)
end
Init()
return {GetRankInfoReq = GetRankInfoReq, GetGuildRankInfoReq = GetGuildRankInfoReq}
