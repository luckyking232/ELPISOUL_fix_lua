ScheduleService = {}

function ScheduleService.Init()
  Net.AddListener(Proto.MsgName.GetFeatureScheduleRsp, ScheduleService.GetFeatureScheduleRsp)
  Net.AddListener(Proto.MsgName.ManorBatchProcessEventRsp, ScheduleService.ManorBatchProcessEventRsp)
end

function ScheduleService.GetFeatureScheduleReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetFeatureScheduleReq, msg, rspCallback)
end

function ScheduleService.GetFeatureScheduleRsp(msg)
  ScheduleData.SaveInfo(msg)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SCHEDULE)
end

function ScheduleService.ManorBatchProcessEventReq(eventIds, rspCallback)
  local msg = {}
  msg.eventIds = eventIds
  Net.Send(Proto.MsgName.ManorBatchProcessEventReq, msg, rspCallback)
end

function ScheduleService.ManorBatchProcessEventRsp(msg)
  OpenWindow(WinResConfig.BoxGetWindow.name, nil, msg.eventRewards)
end

ScheduleService.Init()
