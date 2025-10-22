local InPlaylist = function(soundId)
  local playlist = MusicPlaybackData.GetPlaylist()
  if playlist then
    local k = table.keyof(playlist, soundId)
    return type(k) == "number"
  end
  return false
end
local InFavorites = function(soundId)
  local favorites = MusicPlaybackData.GetFavorites()
  if favorites then
    local k = table.keyof(favorites, soundId)
    return type(k) == "number"
  end
  return false
end
local AddToOrRemoveFromPlaylist = function(soundId, addOrRemove, rspCallback)
  if soundId then
    if not addOrRemove then
      local list = MusicPlaybackData.GetPlaylist()
      if #list <= 1 then
        FloatTipsUtil.ShowWarnTips(T(20656))
        return false
      end
    end
    MusicPlaybackService.PlaylistOperationReq(soundId, addOrRemove and 1 or 2, rspCallback)
    return true
  end
end
local ChangeMusicOrderInPlaylist = function(soundId, upOrDown, rspCallback)
  if soundId then
    MusicPlaybackService.PlaylistOperationReq(soundId, upOrDown and 3 or 4, rspCallback)
  end
end
local AddToOrRemoveFromFavorites = function(soundId, addOrRemove, rspCallback)
  if soundId then
    MusicPlaybackService.FavoritesOperationReq(soundId, addOrRemove and 1 or 2, rspCallback)
  end
end
local PlayMusic = function(index)
  local playlist = MusicPlaybackData.GetPlaylist()
  if playlist and index > 0 and index <= #playlist then
    SoundUtil.PlayMusic(playlist[index], false)
  end
end
local PlayNextMusic = function()
  local playlist = MusicPlaybackData.GetPlaylist()
  local playIndex = MusicPlaybackData.GetPlayIndex()
  if playlist and _G.next(playlist) then
    playIndex = (playIndex or 0) + 1
    if playIndex > #playlist then
      playIndex = 1
    end
    MusicPlaybackData.SetPlayIndex(playIndex)
    SoundUtil.PlayHomeMusic(true)
  else
    printError("Err Empty Playlist !!!")
  end
end
return {
  InPlaylist = InPlaylist,
  InFavorites = InFavorites,
  AddToOrRemoveFromPlaylist = AddToOrRemoveFromPlaylist,
  ChangeMusicOrderInPlaylist = ChangeMusicOrderInPlaylist,
  AddToOrRemoveFromFavorites = AddToOrRemoveFromFavorites,
  PlayMusic = PlayMusic,
  PlayNextMusic = PlayNextMusic
}
