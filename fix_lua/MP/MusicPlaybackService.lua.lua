local GetMusicPlaybackInfoReq = function(callback, rspCallback)
  Net.Send(Proto.MsgName.GetStoryListReq, {newStory = 0}, rspCallback)
end
local GetMusicPlaybackInfoRsp = function(msg)
  MusicPlaybackData.SetFavorites(msg.staredSoundLst)
  MusicPlaybackData.SetPlaylist(msg.soundPlaylist)
end
local FavoritesOperationReq = function(soundId, opType, rspCallback)
  Net.Send(Proto.MsgName.OperateStarSoundReq, {soundId = soundId, opType = opType}, rspCallback)
end
local FavoritesOperationRsp = function(msg)
  MusicPlaybackData.SetFavorites(msg.staredSoundLst)
end
local PlaylistOperationReq = function(soundId, opType, rspCallback)
  Net.Send(Proto.MsgName.OperateSoundPlayListReq, {soundId = soundId, opType = opType}, rspCallback)
end
local PlaylistOperationRsp = function(msg)
  MusicPlaybackData.SetPlaylist(msg.soundPlaylist)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetStoryListRsp, GetMusicPlaybackInfoRsp)
  Net.AddListener(Proto.MsgName.OperateStarSoundRsp, FavoritesOperationRsp)
  Net.AddListener(Proto.MsgName.OperateSoundPlayListRsp, PlaylistOperationRsp)
end
Init()
return {
  GetMusicPlaybackInfoReq = GetMusicPlaybackInfoReq,
  FavoritesOperationReq = FavoritesOperationReq,
  PlaylistOperationReq = PlaylistOperationReq
}
