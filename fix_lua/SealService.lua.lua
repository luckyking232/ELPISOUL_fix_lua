local GetEquippedSealInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetSealWearInfoReq, nil, rspCallback)
end
local GetEquippedSealInfoRsp = function(msg)
  local infos = msg.wearInfos
  if infos then
    for i, v in ipairs(infos) do
      SealData.UpdateSealInfo(v)
    end
  end
end
local EquipSealReq = function(jobId, sealIdList, rspCallback)
  Net.Send(Proto.MsgName.WearSealReq, {job = jobId, sealIds = sealIdList}, rspCallback)
end
local EquipSealRsp = function(msg)
  if msg.wearInfo then
    SealData.UpdateSealInfo(msg.wearInfo)
  end
end
local TakeoffSealReq = function(jobId, sealId, rspCallback)
  Net.Send(Proto.MsgName.TakeoffSealReq, {job = jobId, sealId = sealId}, rspCallback)
end
local TakeoffSealRsp = function(msg)
  if msg.wearInfo then
    SealData.UpdateSealInfo(msg.wearInfo)
  end
end
local CompositeSealReq = function(sealId, count, lucky, rspCallback)
  Net.Send(Proto.MsgName.CompositeSealReq, {
    sealId = sealId,
    count = count,
    useLucky = lucky
  }, rspCallback)
end
local CompositeSealRsp = function(msg)
end
local MainSealLevelUpReq = function(jobId, targetLevel, rspCallback)
  Net.Send(Proto.MsgName.SealBigLevelupReq, {job = jobId, toLevel = targetLevel}, rspCallback)
end
local MainSealLevelUpRsp = function(msg)
  if msg and msg.info then
    SealData.UpdateSealInfo(msg.info)
  end
end
local MainSealBreakthroughReq = function(jobId, rspCallback)
  Net.Send(Proto.MsgName.SealBigQualityUpReq, {job = jobId}, rspCallback)
end
local MainSealBreakthroughRsp = function(msg)
  if msg and msg.info then
    SealData.UpdateSealInfo(msg.info)
  end
end
local MainSealAmplifyReq = function(jobId, rspCallback)
  Net.Send(Proto.MsgName.SealBigAddUpReq, {job = jobId}, rspCallback)
end
local MainSealAmplifyRsp = function(msg)
  if msg and msg.info then
    SealData.UpdateSealInfo(msg.info)
  end
end
local Init = function()
  Net.AddListener(Proto.MsgName.WearSealRsp, EquipSealRsp)
  Net.AddListener(Proto.MsgName.TakeoffSealRsp, TakeoffSealRsp)
  Net.AddListener(Proto.MsgName.CompositeSealRsp, CompositeSealRsp)
  Net.AddListener(Proto.MsgName.GetSealWearInfoRsp, GetEquippedSealInfoRsp)
  Net.AddListener(Proto.MsgName.SealBigLevelupRsp, MainSealLevelUpRsp)
  Net.AddListener(Proto.MsgName.SealBigQualityUpRsp, MainSealBreakthroughRsp)
  Net.AddListener(Proto.MsgName.SealBigAddUpRsp, MainSealAmplifyRsp)
end
Init()
return {
  GetEquippedSealInfoReq = GetEquippedSealInfoReq,
  EquipSealReq = EquipSealReq,
  TakeoffSealReq = TakeoffSealReq,
  CompositeSealReq = CompositeSealReq,
  MainSealLevelUpReq = MainSealLevelUpReq,
  MainSealBreakthroughReq = MainSealBreakthroughReq,
  MainSealAmplifyReq = MainSealAmplifyReq
}
