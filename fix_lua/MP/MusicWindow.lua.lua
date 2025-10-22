require("HomeMusic_MusicWindowByName")
local MusicWindow = {}
local uis, contentPane
local ALBUM_MUSIC_OFFSET = -1
local selectedMusiclist, selectedAlbumIndex, playingMusicSoundId, selectedPlaylistSoundId, RefreshPanelInfo, RefreshPlaylist, RefreshMusiclist, phonograph, playingEffects, maskTex, cachedMusicData
local RefreshPlayingMusicInfo = function()
  local musicInfoPanel = uis.Main.MusicChoiceRegion.MusicInfo
  local musicName, musicComposer, soundId
  if playingMusicSoundId then
    soundId = playingMusicSoundId
    local conf = TableData.GetConfig(soundId, "BaseSound")
    musicName = conf.name and conf.name()
    musicComposer = conf.composer and conf.composer()
  end
  musicInfoPanel.MusicTxt.text = musicName
  musicInfoPanel.ComposerTxt.text = T(20654, musicComposer)
  if not phonograph then
    phonograph = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Mainui_music/mainui_music.prefab")
    UIUtil.SetObjectToUI(phonograph, musicInfoPanel.RecordAni.Effect1Holder, 13333.333333333334)
  end
  if soundId then
    ChangeUIController(musicInfoPanel.AddLiveBtn, "button", MusicPlaybackMgr.InPlaylist(soundId) and 1 or 0)
    ChangeUIController(musicInfoPanel.CollectBtn, "button", MusicPlaybackMgr.InFavorites(soundId) and 1 or 0)
    musicInfoPanel.AddLiveBtn.onClick:Set(function()
      local addOrRemove = not MusicPlaybackMgr.InPlaylist(soundId)
      local result = MusicPlaybackMgr.AddToOrRemoveFromPlaylist(soundId, addOrRemove, function()
        RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId)
        local selectedIndex = uis.Main.c1Ctr.selectedIndex
        if addOrRemove and 0 == selectedIndex then
          uis.Main.c1Ctr.selectedIndex = 1
        end
      end)
      if not result then
        RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId)
      end
    end)
    musicInfoPanel.CollectBtn.onClick:Set(function()
      MusicPlaybackMgr.AddToOrRemoveFromFavorites(soundId, not MusicPlaybackMgr.InFavorites(soundId), function()
        RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId)
      end)
    end)
    SkeletonAnimationUtil.SetAnimation(phonograph, 0, "idle", true)
  else
    SkeletonAnimationUtil.StopAnimation(phonograph, "idle")
    musicInfoPanel.AddLiveBtn.onClick:Clear()
    musicInfoPanel.CollectBtn.onClick:Clear()
    ChangeUIController(musicInfoPanel.AddLiveBtn, "button", 0)
    ChangeUIController(musicInfoPanel.CollectBtn, "button", 0)
  end
end
local GetOrCreateHolder = function(parent, name, index)
  local holder = parent:GetChild(name)
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    if index then
      parent:AddChildAt(holder, index)
    else
      parent:AddChild(holder)
    end
    holder.name = name
  end
  return holder
end
local AlbumItemRenderer = function(i, gcmp)
  local index = i + 1
  local favorites = 0 == i
  if not favorites then
    local albumData = cachedMusicData[index + ALBUM_MUSIC_OFFSET]
    UIUtil.SetText(gcmp:GetChild("Tab1"), albumData.name(), "NameTxt")
    UIUtil.SetText(gcmp:GetChild("Tab2"), albumData.name(), "NameTxt")
  else
    local favoriteTitle = T(20655)
    UIUtil.SetText(gcmp:GetChild("Tab1"), favoriteTitle, "NameTxt")
    UIUtil.SetText(gcmp:GetChild("Tab2"), favoriteTitle, "NameTxt")
  end
  ChangeUIController(gcmp, "button", index == selectedAlbumIndex and 1 or 0)
  gcmp.onClick:Set(function()
    local musicListPanel = uis.Main.MusicChoiceRegion.MusicList
    local albumlist = musicListPanel.TabList
    for j = 0, albumlist.numChildren - 1 do
      local child = albumlist:GetChildAt(j)
      ChangeUIController(child, "button", j == i and 1 or 0)
    end
    if index ~= selectedAlbumIndex then
      if playingEffects then
        for k, effect in pairs(playingEffects) do
          LuaUtil.StopEffectEmitting(effect, true, true)
          playingEffects[k] = nil
        end
      end
      selectedAlbumIndex = index
      if favorites then
        selectedMusiclist = MusicPlaybackData.GetFavorites()
      else
        local albumData = cachedMusicData[index + ALBUM_MUSIC_OFFSET]
        local children = albumData.child_ids
        selectedMusiclist = children
      end
      RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId, true)
    end
  end)
end
local MusicItemRenderer = function(i, gcmp)
  local index = i + 1
  local soundId = selectedMusiclist[index]
  local subgcmp = gcmp:GetChild("Tips")
  local collectBtn = subgcmp:GetChild("CollectBtn")
  UIUtil.SetText(subgcmp, "", "NameTxt")
  local conf = TableData.GetConfig(soundId, "BaseSound")
  UIUtil.SetText(subgcmp, conf.name(), "NameTxt")
  local playing = playingMusicSoundId == soundId
  ChangeUIController(subgcmp, "c1", playing and 1 or 0)
  ChangeUIController(subgcmp, "c2", MusicPlaybackMgr.InPlaylist(soundId) and 1 or 0)
  ChangeUIController(collectBtn, "button", MusicPlaybackMgr.InFavorites(soundId) and 1 or 0)
  local holder = GetOrCreateHolder(subgcmp, "Effect1Holder")
  if playing then
    local tbl = TableData.GetTable("BaseSoundPath")
    local config = TableData.GetConfig(soundId, "BaseSound")
    local soundPathId = soundId
    for _, v in pairs(tbl) do
      if v.path == config.path then
        soundPathId = v.id
        break
      end
    end
    SoundUtil.PlayMusic(soundPathId, true)
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Mainui_music/mianui_music_chooseeff.prefab")
    UIUtil.SetObjectToUI(effect, holder)
    LuaUtil.PlayEffect(effect)
    playingEffects = playingEffects or {}
    playingEffects[soundId] = effect
    local renderers = effect:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
    local musicListPanel = uis.Main.MusicChoiceRegion.MusicList
    local musiclist = musicListPanel.TipsList
    for j = 1, renderers.Length do
      local material = renderers[j - 1].sharedMaterial
      material:EnableKeyword("_SOFT_MASK")
      material:SetTexture("_SoftMaskTex", maskTex)
      material:SetVector("_SoftMaskRect", CS.UnityEngine.Vector4(musiclist.width, musiclist.height, 0, 1))
      local matrix = musiclist.displayObject.cachedTransform.worldToLocalMatrix
      material:SetMatrix("_SoftMaskMatrix", matrix)
    end
  elseif playingEffects and playingEffects[soundId] then
    local effect = playingEffects[soundId]
    LuaUtil.StopEffectEmitting(effect, true)
    local fadeOutTime = 0.4
    local mph = effect:GetOrAddComponent(typeof(CS.MaterialPropertyHelper))
    LeanTween.value(1, 0, fadeOutTime):setOnUpdate(function(val)
      local white = Color.white
      white.a = val
      mph:ChangeColorValue("_TintColor", white)
    end)
    playingEffects[soundId] = nil
  else
    holder:SetNativeObject(nil)
  end
  subgcmp.onClick:Set(function()
    playingMusicSoundId = soundId
    RefreshMusiclist()
    RefreshPlayingMusicInfo()
  end)
  collectBtn.onClick:Set(function(context)
    context:StopPropagation()
    MusicPlaybackMgr.AddToOrRemoveFromFavorites(soundId, not MusicPlaybackMgr.InFavorites(soundId), function()
      RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId)
    end)
  end)
end
local PlaylistItemRenderer = function(i, gcmp)
  local playlist = MusicPlaybackData.GetPlaylist()
  local index = i + 1
  local soundId = playlist[index]
  local conf = TableData.GetConfig(soundId, "BaseSound")
  local musicName = conf.name and conf.name()
  UIUtil.SetText(gcmp, musicName, "NameTxt")
  local selected = selectedPlaylistSoundId == soundId
  if type(selectedPlaylistSoundId) == "number" then
    ChangeUIController(gcmp, "button", selected and 1 or 0)
  else
    ChangeUIController(gcmp, "button", 0)
  end
  gcmp.onClick:Set(function()
    selectedPlaylistSoundId = soundId
    RefreshPlaylist()
  end)
end

function RefreshPlaylist(scrollToView)
  local list = MusicPlaybackData.GetPlaylist()
  if not selectedPlaylistSoundId or not table.keyof(list, selectedPlaylistSoundId) then
    selectedPlaylistSoundId = list[1]
  end
  local playlist = uis.Main.MusicPlayList.TipsList
  local len = list and #list or 0
  playlist.numItems = len
  if scrollToView then
    local index = table.keyof(list, selectedPlaylistSoundId)
    if index then
      playlist:ScrollToView(index - 1)
    end
  end
end

function RefreshMusiclist()
  local musicData = cachedMusicData
  local musicListPanel = uis.Main.MusicChoiceRegion.MusicList
  local musiclist = musicListPanel.TipsList
  if selectedAlbumIndex > 1 then
    selectedMusiclist = musicData[selectedAlbumIndex + ALBUM_MUSIC_OFFSET].child_ids
  else
    selectedMusiclist = MusicPlaybackData.GetFavorites()
  end
  musiclist.numItems = #selectedMusiclist
  local index = table.keyof(selectedMusiclist, playingMusicSoundId)
  if index then
    musiclist:ScrollToView(index - 1)
  end
end

local DEFAULT_MUSIC = 70160002
local DEFAULT_ALBUM = 70150001

function RefreshPanelInfo(albumIndex, specialPlayingSoundId, scrollToView)
  StoryMgr.InitData()
  local musicListPanel = uis.Main.MusicChoiceRegion.MusicList
  local playlist = uis.Main.MusicPlayList.TipsList
  local albumlist = musicListPanel.TabList
  local musiclist = musicListPanel.TipsList
  cachedMusicData = SimpleCopy(StoryMgr.musicData)
  albumlist.itemRenderer = AlbumItemRenderer
  musiclist.itemRenderer = MusicItemRenderer
  playlist.itemRenderer = PlaylistItemRenderer
  local soundplaylist = MusicPlaybackData.GetPlaylist()
  local playingAlbumIndex, playingSoundId
  if soundplaylist and #soundplaylist > 0 then
    local playIndex = MusicPlaybackData.GetPlayIndex()
    if not playIndex or playIndex <= 0 or playIndex > #soundplaylist then
      playIndex = 1
    end
    local soundId = soundplaylist[playIndex]
    playingSoundId = soundId
    for i = #cachedMusicData, 1, -1 do
      local data = cachedMusicData[i]
      local ids = StoryMgr.GetUnlockData(data.child_ids)
      if data.id == DEFAULT_ALBUM and not table.keyof(ids, DEFAULT_MUSIC) then
        table.insert(ids, DEFAULT_MUSIC)
      end
      if not ids or 0 == #ids then
        table.remove(cachedMusicData, i)
      else
        local len = #data.child_ids
        for j = len, 1, -1 do
          if not table.keyof(ids, data.child_ids[j]) then
            table.remove(data.child_ids, j)
          end
        end
      end
    end
    for i, v in ipairs(cachedMusicData) do
      for j, id in ipairs(v.child_ids) do
        if soundId == id then
          playingAlbumIndex = i + 1
          break
        end
      end
    end
  end
  local musicLen = #cachedMusicData
  selectedAlbumIndex = albumIndex or playingAlbumIndex or musicLen > 0 and 2 or 1
  playingMusicSoundId = specialPlayingSoundId or playingSoundId or soundplaylist[1]
  albumlist.numItems = 1 + musicLen
  if scrollToView then
    albumlist:ScrollToView(selectedAlbumIndex - 1, true)
  end
  RefreshMusiclist()
  RefreshPlayingMusicInfo()
  RefreshPlaylist()
end

function MusicWindow.ReInitData()
end

function MusicWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MusicWindow.package, WinResConfig.MusicWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetHomeMusic_MusicWindowUis(contentPane)
    MusicWindow.UpdateInfo()
    MusicWindow.InitBtn()
  end)
end

function MusicWindow.UpdateInfo()
  maskTex = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/soft_rect.png")
  local playlistTitle = T(20651)
  local playlistBtnTitle = T(20652)
  local add2PlaylistBtnTitle = T(20653)
  uis.Main.MusicPlayList.WordTxt.text = playlistTitle
  local musicInfoPanel = uis.Main.MusicChoiceRegion.MusicInfo
  UIUtil.SetText(musicInfoPanel.PlayListBtn, playlistBtnTitle, "WordTxt")
  UIUtil.SetText(musicInfoPanel.AddLiveBtn, add2PlaylistBtnTitle, "WordTxt")
  RedDotMgr.AddNode({
    windowName = WinResConfig.MusicWindow.name,
    com = musicInfoPanel.PlayListBtn,
    visibleFunc = function()
      return PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.MUSIC_PLAYBACK_FIRST_EXTEND_LIST, -1) <= 0
    end,
    dataType = RED_DOT_DATA_TYPE.STORY
  })
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.MusicWindow.name)
  ActorService.GetStoryListReq(0, function()
    local list = MusicPlaybackData.GetPlaylist()
    if not list or not _G.next(list) then
      MusicPlaybackMgr.AddToOrRemoveFromPlaylist(DEFAULT_MUSIC, true, function()
        RefreshPanelInfo(nil, nil, true)
      end)
    else
      RefreshPanelInfo(nil, nil, true)
    end
  end)
end

function MusicWindow.InitBtn()
  local btn = uis.Main.MusicChoiceRegion.MusicInfo.PlayListBtn
  btn.mode = FairyGUI.ButtonMode.Check
  btn.onClick:Set(function(context)
    local selectedIndex = (uis.Main.c1Ctr.selectedIndex + 1) % 2
    uis.Main.c1Ctr.selectedIndex = selectedIndex
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.MUSIC_PLAYBACK_FIRST_EXTEND_LIST, 1)
    RedDotMgr.UpdateNodeByWindowName(WinResConfig.MusicWindow.name)
  end)
  uis.Main.c1Ctr.onChanged:Set(function()
    local selectedIndex = uis.Main.c1Ctr.selectedIndex
    ChangeUIController(btn, "down", selectedIndex)
    if selectedIndex > 0 then
      PlayUITrans(btn, "down")
    else
      PlayUITrans(btn, "up")
    end
  end)
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.MusicWindow.name)
  end)
  uis.Main.MusicPlayList.UpBtn.onClick:Set(function()
    MusicPlaybackMgr.ChangeMusicOrderInPlaylist(selectedPlaylistSoundId, true, function()
      RefreshPlaylist(true)
    end)
  end)
  uis.Main.MusicPlayList.DownBtn.onClick:Set(function()
    MusicPlaybackMgr.ChangeMusicOrderInPlaylist(selectedPlaylistSoundId, false, function()
      RefreshPlaylist(true)
    end)
  end)
  uis.Main.MusicPlayList.DeleteBtn.onClick:Set(function()
    MusicPlaybackMgr.AddToOrRemoveFromPlaylist(selectedPlaylistSoundId, false, function()
      local playlist = MusicPlaybackData.GetPlaylist()
      if playlist and _G.next(playlist) then
        if not table.keyof(playlist, selectedPlaylistSoundId) then
          selectedPlaylistSoundId = playlist[1]
        end
      else
        selectedPlaylistSoundId = nil
      end
      RefreshPanelInfo(selectedAlbumIndex, playingMusicSoundId)
    end)
  end)
end

function MusicWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.MusicWindow.name)
  uis = nil
  contentPane = nil
  selectedMusiclist = nil
  playingMusicSoundId = nil
  selectedAlbumIndex = nil
  selectedPlaylistSoundId = nil
  playingEffects = nil
  phonograph = nil
  SoundUtil.PlayHomeMusic(true)
  if maskTex then
    ResourceManager.UnloadTexture(maskTex)
  end
  maskTex = nil
end

return MusicWindow
