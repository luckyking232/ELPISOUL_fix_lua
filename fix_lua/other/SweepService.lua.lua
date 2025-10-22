SweepService = {}

function SweepService.Init()
  Net.AddListener(Proto.MsgName.SweepStageRsp, SweepService.SweepStageRsp)
end

function SweepService.SweepStageReq(stageId, rspCallBack)
  local msg = {}
  msg.stageId = stageId
  Net.Send(Proto.MsgName.SweepStageReq, msg, rspCallBack)
end

function SweepService.SweepStageRsp(msg)
  UIMgr:SendWindowMessage(WinResConfig.SweepWindow.name, WindowMsgEnum.SweepWindow.SWEEP_RESULT, msg)
  local stageId = msg.stageId
  if stageId then
    local stageConfig = TableData.GetConfig(stageId, "BaseStage")
    local sceneType = stageConfig.chapter_type
    if sceneType == ProtoEnum.SCENE_TYPE.BUFF_STAGE then
      ld("FrostDungeon")
      FrostDungeonMgr.OnBattleComplete(msg)
    elseif sceneType == ProtoEnum.SCENE_TYPE.MANOR_FIR or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WOOD or sceneType == ProtoEnum.SCENE_TYPE.MANOR_WATER then
      ld("TideDungeon")
      TideDungeonService.GetTideDungeonInfoReq(sceneType)
    end
  end
end

SweepService.Init()
