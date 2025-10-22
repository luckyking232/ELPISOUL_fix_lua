require("ActivityDungeon1014_MiniGameStartWindowByName")
local Activity14MiniGameWindow = {}
local uis, contentPane
local controller = require("Activity14_MiniGameController")
local blockObjs, sceneItemObjs, playerData, playerObj
local FADE_IN_DURATION = 0.8
local PLAYER_SCALE = 0.4
local BLOCK_ASSET_LOOKUP = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type1_1_cube.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type1_2_cube.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type1_3_cube.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type2_1_cube.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type2_2_cube.prefab",
  [6] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type2_3_cube.prefab",
  [7] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type3_1_cube.prefab",
  [8] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type3_2_cube.prefab",
  [9] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_type3_3_cube.prefab"
}
local SCENE_ITEM_ASSET_LOOKUP = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_grass1.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_grass2.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_plant1.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_plant2.prefab"
}
local effect, fog
local OnCreatePlayer = function(inst)
  playerData = inst
  playerObj = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame016/minigame016_char.prefab")
  local transform = playerObj.transform
  transform.position = playerData.position
  transform.localScale = Vector3.one * PLAYER_SCALE
  local renderer = playerObj:GetComponent(typeof(CS.UnityEngine.Renderer))
  renderer.sortingOrder = 5
  SkeletonAnimationUtil.SetAnimation(playerObj, 0, "idle", true)
end
local OnDestroyPlayer = function(inst)
  if inst == playerData then
    inst = nil
    if playerObj then
      ResourceManager.DestroyGameObject(playerObj)
    end
    playerObj = nil
  end
end
local OnPlayerStateChanged = function(oldState, newState)
  if newState == controller.PLAYER_STATE.JUMP or newState == controller.PLAYER_STATE.DROP then
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "jump", true)
  elseif newState == controller.PLAYER_STATE.IDLE then
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "idle", true)
  elseif newState & controller.PLAYER_STATE.LEFT > 0 then
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "left", true)
  elseif newState & controller.PLAYER_STATE.RIGHT > 0 then
    SkeletonAnimationUtil.SetAnimation(playerObj, 0, "right", true)
  end
end
local OnCreateBlock = function(block, fadeIn)
  blockObjs = blockObjs or {}
  local blockType = block.type
  local path = BLOCK_ASSET_LOOKUP[blockType]
  local go = ResourceManager.Instantiate(path)
  blockObjs[block] = go
  local x, z = block.x, block.z
  local transform = go.transform
  transform.position = Vector3(x, 0, z)
  transform.localScale = Vector3.one * 0.01
  local renderer = go:GetComponent(typeof(CS.UnityEngine.Renderer))
  renderer.sortingOrder = 5
  if fadeIn then
    LuaUtil.SetAlpha(go, 0)
    LeanTween.value(go, 0, 1, FADE_IN_DURATION):setOnUpdate(function(val)
      LuaUtil.SetAlpha(go, val)
    end):setEaseInOutQuad()
  else
    LuaUtil.SetAlpha(go, 1)
  end
end
local OnDestroyBlock = function(block)
  if blockObjs then
    local go = blockObjs[block]
    blockObjs[block] = nil
    ResourceManager.DestroyGameObject(go)
  end
end
local OnCreateSceneItem = function(sceneItem)
  sceneItemObjs = sceneItemObjs or {}
  local sceneItemType = sceneItem.type
  local path = SCENE_ITEM_ASSET_LOOKUP[sceneItemType]
  local go = ResourceManager.Instantiate(path)
  sceneItemObjs[sceneItem] = go
  local x, y, z = sceneItem.x, sceneItem.y, sceneItem.z
  local transform = go.transform
  local sr = go:GetComponent(typeof(CS.UnityEngine.SpriteRenderer))
  transform.position = Vector3(x, y + sr.bounds.extents.y, z)
  transform.localScale = Vector3.one * sceneItem.scale
  sr.sortingOrder = 5
  LuaUtil.SetAlpha(go, 0)
  LeanTween.value(go, 0, 1, FADE_IN_DURATION):setOnUpdate(function(val)
    LuaUtil.SetAlpha(go, val)
  end):setEaseInOutQuad()
end
local OnDestroySceneItem = function(item)
  if sceneItemObjs then
    local go = sceneItemObjs[item]
    sceneItemObjs[item] = nil
    ResourceManager.DestroyGameObject(go)
  end
end
local gameId = 70441018
local tweenId
local OnGameOver = function()
  playerData = nil
  local transform = playerObj.transform
  tweenId = LeanTween.moveY(playerObj, transform.position.y - 10, 0.3):setEaseInSine():setOnComplete(function()
    tweenId = nil
    if playerObj then
      ResourceManager.DestroyGameObject(playerObj)
    end
    playerObj = nil
    local score = Mathf.RoundToInt(controller.GetMovedDist())
    local elapse = Mathf.RoundToInt(controller.GetElapse())
    Activity14_MiniGameService.MiniGameSubmitReq(gameId, {}, score, elapse, function()
      OpenWindow(WinResConfig.Activity14MiniGameSubmitWindow.name, nil, score)
    end)
  end).id
end
local OnUpdate = function()
  if blockObjs then
    for block, go in pairs(blockObjs) do
      local x, z = block.x, block.z
      local transform = go.transform
      transform.position = Vector3(x, 0, z)
    end
  end
  if sceneItemObjs then
    for sceneItem, go in pairs(sceneItemObjs) do
      local x, y, z = sceneItem.x, sceneItem.y, sceneItem.z
      local transform = go.transform
      local sr = transform:GetComponent(typeof(CS.UnityEngine.SpriteRenderer))
      transform.localScale = Vector3.one * sceneItem.scale
      local extents = sr.bounds.extents
      transform.position = Vector3(x, y + extents.y, z)
    end
  end
  if playerData and playerObj then
    local position = playerData.position
    local transform = playerObj.transform
    transform.position = position
  end
  uis.Main.Integral.NumberWordTxt.text = T(20768)
  uis.Main.Integral.NumberWord1Txt.text = T(20769)
  uis.Main.Integral.NumberTxt.text = T(20765, Mathf.RoundToInt(controller.GetMovedDist()))
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
    if Input.GetKeyDown(KeyCode.LeftArrow) then
      controller.MovePlayer(controller.RELATIVE_POSITION.LEFT)
    elseif Input.GetKeyDown(KeyCode.RightArrow) then
      controller.MovePlayer(controller.RELATIVE_POSITION.RIGHT)
    end
  end
end
local OnTouchdown = function(player, onBlock)
  if onBlock then
    local eff = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/Minigame016_jump_eff.prefab")
    LuaUtil.PlayEffect(eff)
    EffectUtil.SetAutoDestroyCallback(eff, function()
      ResourceManager.DestroyGameObject(eff)
    end)
    local playerPosition = player.position
    eff.transform.position = Vector3(playerPosition.x, 0, playerPosition.z)
    local renderers = eff:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
    for i = 1, renderers.Length do
      renderers[i - 1].sortingOrder = 5
    end
    local obj = blockObjs[player.block]
    if obj then
      eff.transform:SetParent(obj.transform, true)
    end
  end
end
local Release = function()
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
  controller.Release()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if blockObjs then
    for i, obj in pairs(blockObjs) do
      ResourceManager.DestroyGameObject(obj)
    end
    table.clear(blockObjs)
  end
  if effect then
    ResourceManager.DestroyGameObject(effect)
  end
  effect = nil
  if fog then
    ResourceManager.DestroyGameObject(fog)
  end
  fog = nil
  if playerObj then
    ResourceManager.DestroyGameObject(playerObj)
  end
  playerObj = nil
end
local StartGame = function()
  local info = Activity14_MiniGameData.GetMiniGameInfo(gameId)
  local highestScore = info.miniHighScore
  uis.Main.Integral.Number1Txt.text = T(20765, highestScore)
  if effect then
    ResourceManager.DestroyGameObject(effect)
  end
  effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/FX_Minigame016_smoke.prefab")
  effect.transform.position = Vector3(105.125, 3.5, 105)
  effect.transform.localScale = Vector3(1.2, 1.2, 1)
  local renderers = effect:GetComponentsInChildren(typeof(CS.UnityEngine.Renderer))
  for i = 1, renderers.Length do
    renderers[i - 1].sortingOrder = 5
  end
  if fog then
    ResourceManager.DestroyGameObject(fog)
  end
  fog = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame016/MiniGame016_cross.prefab")
  fog.transform.position = Vector3(105.125, -9.2, 135)
  fog.transform.localScale = 5 * Vector3.one
  fog:GetComponent(typeof(CS.UnityEngine.Renderer)).sortingOrder = 5
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.AddUpdateHandler(OnUpdate)
  local parent = uis.Main.OperateRegion.root
  local loader = parent:GetChild("PROJECT_LOADER")
  if not loader then
    loader = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Loader)
    loader.name = "PROJECT_LOADER"
    loader.displayObject.gameObject.name = "PROJECT_LOADER"
    loader.size = parent.size
    parent:AddChild(loader)
    loader:SetXY(0, 0)
  end
  controller.Initialize(Vector3(100, 0, 100), loader, OnCreatePlayer, OnDestroyPlayer, OnCreateBlock, OnDestroyBlock, OnGameOver, OnPlayerStateChanged, OnCreateSceneItem, OnDestroySceneItem, OnTouchdown)
end

function Activity14MiniGameWindow.ReInitData()
end

function Activity14MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity14MiniGameWindow.package, WinResConfig.Activity14MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1014_MiniGameStartWindowUis(contentPane)
    Activity14MiniGameWindow.UpdateInfo()
    Activity14MiniGameWindow.InitBtn()
  end)
end

function Activity14MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.root.visible = false
  StartGame()
end

local cancelParam = {
  touchCallback = function()
    controller.Pause(false)
  end
}

function Activity14MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    controller.Pause(true)
    MessageBox.Show(T(20648), {
      touchCallback = function()
        local score = Mathf.RoundToInt(controller.GetMovedDist())
        local elapse = Mathf.RoundToInt(controller.GetElapse())
        Activity14_MiniGameService.MiniGameSubmitReq(gameId, {}, score, elapse, function()
          UIMgr:CloseToWindow(WinResConfig.Activity14MiniGameMainWindow.name)
        end)
      end
    }, cancelParam, cancelParam)
  end)
  uis.Main.LeftBtn.onClick:Set(function()
    controller.MovePlayer(controller.RELATIVE_POSITION.LEFT)
  end)
  uis.Main.RightBtn.onClick:Set(function()
    controller.MovePlayer(controller.RELATIVE_POSITION.RIGHT)
  end)
end

function Activity14MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  if blockObjs then
    for i, obj in pairs(blockObjs) do
      ResourceManager.DestroyGameObject(obj)
    end
  end
  blockObjs = nil
  Release()
end

function Activity14MiniGameWindow.HandleMessage(msgId, para)
  if 2 == msgId then
    StartGame()
  end
end

return Activity14MiniGameWindow
