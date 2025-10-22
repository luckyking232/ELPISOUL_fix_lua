local playlist, favorites, playIndex
local SetPlaylist = function(list)
  playlist = list
end
local GetPlaylist = function()
  return playlist
end
local SetFavorites = function(list)
  favorites = list
end
local GetFavorites = function()
  return favorites
end
local SetPlayIndex = function(index)
  playIndex = index
end
local GetPlayIndex = function()
  return playIndex or 1
end
local Clear = function()
  playlist = nil
  favorites = nil
  playIndex = 1
end
return {
  SetPlaylist = SetPlaylist,
  GetPlaylist = GetPlaylist,
  SetFavorites = SetFavorites,
  GetFavorites = GetFavorites,
  SetPlayIndex = SetPlayIndex,
  GetPlayIndex = GetPlayIndex,
  Clear = Clear
}
