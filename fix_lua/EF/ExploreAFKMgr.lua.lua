local IsCardSelected = function(groupId, cardId)
  local tempCards = ExploreAFKData.GetTempGroupCards(groupId)
  if tempCards then
    return table.keyof(tempCards, cardId, "cardId")
  end
end
local IsSelected = function(groupId, index)
  local tempCards = ExploreAFKData.GetTempGroupCards(groupId)
  if tempCards then
    return table.keyof(tempCards, index, "index")
  end
end
local IsGroupReady = function(groupId)
  local tempCards = ExploreAFKData.GetTempGroupCards(groupId)
  local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
  local num = #config.job_num
  if tempCards and #tempCards == num then
    return true
  end
  return false
end
local IsGroupCompleted = function(groupId)
  local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
  if groupInfo then
    return LoginData.GetCurServerTime() > groupInfo.overStamp
  end
end
local IsGroupAvailable = function(groupId)
  local groupInfo = ExploreAFKData.GetGroupInfo(groupId)
  return not groupInfo
end
local IsCardAvailable = function(cardId)
  local groups = ExploreAFKData.GetAllGroupsInfo()
  if groups then
    for _, group in ipairs(groups) do
      if table.keyof(group.cards, cardId) then
        return false
      end
    end
  end
  return true
end
local StartDispatch = function(groupId, rewardId, extraIndex, rspCallback)
  local cards = ExploreAFKData.GetTempGroupCards(groupId)
  local cardIdList = {}
  for i, v in ipairs(cards) do
    table.insert(cardIdList, v.cardId)
  end
  ExploreAFKService.StartExploreAFKReq(groupId, rewardId, cardIdList, extraIndex, rspCallback)
end
local SPINE_SCALE = 0.252
local BG_MOVE_SPEED = 0.8
local SHOW_PIVOT = Vector3(2000, 2000, 0)
local CAMERA_OFFSET = Vector3(-2.5, -0.25, 0)
local SPINE_OFFSET = Vector3(1, -1.7, 0)
local MAX_CARD_COUNT = 4
local CARD_GAP = 2.3
local CAMERA_ORTHOGRAPHICSIZE = 3.2
local backgroundMoveSpeed, camera, scene, cardCollection, spineSortingOrder, elapse, cameraBounds, viewBounds, sceneBounds, monster_show_list, subScenes, currentGroupId, currentDispatchState
local CARD_STATE_ENUM = {
  IDLE = 0,
  RUN = 1,
  PREPARE_ATTACK = 1,
  ATTACKING = 2
}
DISPATCH_STATE = {
  START = 0,
  IN_PROGRESS = 1,
  FINISHED = 2,
  SLEEPING = 3
}
local foreach = function(collection, walk)
  if collection and type(walk) == "function" then
    for i, v in pairs(collection) do
      local exit, result = walk(i, v)
      if exit then
        return result
      end
    end
  end
end
local Instantiate = function(fashionId, animname, loop, onComplete)
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  local go = ResourceManager.Instantiate(ModelUtil.GetFullPath(fashionConfig.spd))
  local scale = SPINE_SCALE
  if fashionConfig.spd_scale then
    scale = scale * fashionConfig.spd_scale / 10000
  end
  go.transform.localScale = scale * Vector3.one
  SkeletonAnimationUtil.SetAnimation(go, 0, animname, loop, onComplete, true, "0", -1, 0)
  SkeletonAnimationUtil.SetFlip(go, false, false)
  SkeletonAnimationUtil.SetShaderEffectEnable(go, false, true)
  go.transform.eulerAngles = Vector3.right * -0.01
  local renderer = go:GetComponent(typeof(CS.UnityEngine.Renderer))
  renderer.sortingOrder = spineSortingOrder
  return go
end
local SceneMotion = function()
  if scene then
    local len = #subScenes
    for i = 1, len do
      local list = subScenes[i].list
      local spriteBounds = subScenes[i].bounds
      local n = #list
      for j, v in ipairs(list) do
        local sr = v
        local transform = sr.transform
        local go = sr.gameObject
        local extents = spriteBounds.extents
        local position = transform.position + Vector3.left * (backgroundMoveSpeed / i) * Time.deltaTime
        transform.position = position
        if 1 == j then
          local sceneMax = position + extents
          local diff = sceneMax.x - cameraBounds.max.x
          if diff <= 0 then
            local origin = cameraBounds.max + extents + diff * Vector3.right
            origin.y = position.y
            if n < 2 then
              local clone = CS.UnityEngine.Object.Instantiate(go)
              clone.name = go.name
              local cloneTransform = clone.transform
              cloneTransform.position = origin
              cloneTransform:SetParent(scene.transform, true)
              table.insert(list, clone:GetComponent(typeof(CS.UnityEngine.SpriteRenderer)))
              break
            else
              list[2].transform.position = origin
            end
          end
        end
        if 2 == j then
          local sceneMin = position - extents
          if sceneMin.x <= cameraBounds.min.x then
            table.insert(list, 1, table.remove(list, 2))
          end
        end
      end
    end
  end
end
local CharacterMotion = function()
  foreach(cardCollection, function(_, entry)
    local go = entry.go
    local transform = go.transform
    local velocity = entry.velocity
    local position = transform.position
    if velocity then
      local spineBounds = SkeletonAnimationUtil.GetBounds(go)
      local deltaTime = Time.deltaTime
      position.x = math.min(math.max(position.x + velocity.x * deltaTime, viewBounds.min.x + spineBounds.extents.x), viewBounds.max.x - spineBounds.extents.x)
      transform.position = position
    end
  end)
end
local ChangeCardsState = function(stateEnum)
  local animname
  if stateEnum == CARD_STATE_ENUM.IDLE then
    animname = SPINE_STATE_ENUM.IDLE
  elseif stateEnum == CARD_STATE_ENUM.RUN then
    animname = SPINE_STATE_ENUM.RUN
  end
  foreach(cardCollection, function(i, entry)
    local go = entry.go
    SkeletonAnimationUtil.SetAnimation(go, 0, animname, true)
  end)
end
local Update = function()
  if currentDispatchState == DISPATCH_STATE.START then
    elapse = elapse + Time.deltaTime
    if elapse > 0.5 then
      currentDispatchState = DISPATCH_STATE.IN_PROGRESS
    end
  elseif currentDispatchState == DISPATCH_STATE.IN_PROGRESS then
    ChangeCardsState(CARD_STATE_ENUM.RUN)
    CharacterMotion()
    SceneMotion()
  elseif currentDispatchState == DISPATCH_STATE.FINISHED then
    ChangeCardsState(CARD_STATE_ENUM.IDLE)
    currentDispatchState = DISPATCH_STATE.SLEEPING
  end
end
local IsDispatchShowFinished = function()
  return currentDispatchState == DISPATCH_STATE.FINISHED
end
local ClearCollection = function()
  if cardCollection then
    for _, v in pairs(cardCollection) do
      if v.go and not v.go:IsNull() then
        SkeletonAnimationUtil.RemoveCompleteEvent(v.go)
        ResourceManager.DestroyGameObject(v.go)
      end
      v.go = nil
    end
    table.clear(cardCollection)
  end
end
local CreateDispatchScene = function(groupId, loader)
  UpdateManager.RemoveUpdateHandler(Update)
  local changed = not currentGroupId or groupId ~= currentGroupId
  if changed then
    local config = TableData.GetConfig(groupId, "BaseDispatchTeam")
    if scene then
      ResourceManager.DestroyGameObject(scene)
      scene = nil
    end
    scene = ResourceManager.Instantiate(config.map_path)
    subScenes = {}
    local sceneTrans = scene.transform
    sceneTrans.eulerAngles = Vector3(0, 0, 0)
    sceneTrans.position = SHOW_PIVOT
    local maxSortingOrder = -1
    local srs = scene:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
    if srs and srs.Length > 0 then
      local spriteBounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
      for i = 0, srs.Length - 1 do
        maxSortingOrder = math.max(srs[i].sortingOrder, maxSortingOrder)
        local exists
        for j, v in pairs(subScenes) do
          for _, sr in ipairs(v.list) do
            if sr.gameObject.name == srs[i].gameObject.name then
              exists = j
              break
            end
          end
        end
        if not exists then
          table.insert(subScenes, {
            sortingOrder = srs[i].sortingOrder,
            bounds = LuaUtil.GetSpriteBounds(srs[i].gameObject, Vector3.zero, Vector3.zero, Vector3.one),
            list = {
              [1] = srs[i]
            }
          })
        else
          table.insert(subScenes[exists].list, srs[i])
        end
        srs[i].transform.localPosition = Vector3.zero
        local childScale = Vector3.one
        local childPosition = Vector3.zero
        local childRotation = Quaternion.identity
        local go = srs[i].gameObject
        local transform = go.transform
        local child = transform
        local cur = child
        while nil ~= cur do
          childPosition = childPosition + cur.localPosition
          childRotation = childRotation * Quaternion.Euler(cur.localEulerAngles)
          local localScale = cur.localScale
          childScale = Vector3(childScale.x * localScale.x, childScale.y * localScale.y, childScale.z * localScale.z)
          cur = cur.parent
        end
        local lb = srs[i].localBounds
        local matrix = CS.UnityEngine.Matrix4x4.TRS(childPosition, childRotation, childScale)
        spriteBounds:Encapsulate(CS.UnityEngine.Bounds(matrix:MultiplyPoint(lb.center), 2 * matrix:MultiplyVector(lb.extents)))
      end
      sceneBounds = spriteBounds
      local size = sceneBounds.size
      size.z = 0
      sceneBounds.size = size
      table.sort(subScenes, function(x, y)
        return x.sortingOrder > y.sortingOrder
      end)
    end
    spineSortingOrder = maxSortingOrder - 1
  end
  if not camera then
    local go = GameObject("Explore AFK Camera")
    local component = go:GetOrAddComponent(typeof(CS.UnityEngine.Camera))
    component.orthographic = true
    component.orthographicSize = CAMERA_ORTHOGRAPHICSIZE
    local camTrans = component.transform
    camTrans.position = Vector3(SHOW_PIVOT.x, SHOW_PIVOT.y, -10) + CAMERA_OFFSET
    camTrans.eulerAngles = Vector3.right * -0.01
    component.cullingMask = component.cullingMask & -33
    component.depth = -2
    component.clearFlags = CS.UnityEngine.CameraClearFlags.SolidColor
    component.backgroundColor = CS.UnityEngine.Color.black
    camera = component
  end
  if not camera.targetTexture then
    local size = loader.size
    camera.targetTexture = CS.RTManager.GetRenderTexture(size.x, size.y)
    local orthographicSize = camera.orthographicSize
    local aspect = size.x / size.y
    local height = 2 * orthographicSize
    local width = height * aspect
    local center = camera.transform.position
    center.z = 0
    cameraBounds = CS.UnityEngine.Bounds(center, Vector3(width, height, 0))
    local heightScale, heightDelta = 0.1, -1.5
    local y = (center.y + height * heightScale * 0.5 + (center.y - height * heightScale * 0.5 + heightDelta)) * 0.5
    local halfW = 0.5 * width
    viewBounds = CS.UnityEngine.Bounds(Vector3(center.x + halfW * 0.3, y), Vector3(halfW, height * heightScale - heightDelta, 0))
    RTManager:ShowRTtoLoader(camera.targetTexture, loader)
  end
  currentGroupId = groupId
end
local CreateCard = function(groupId, index, cardId, animation, loop, animationCompleteCallback)
  cardCollection = cardCollection or {}
  local cardData = CardData.GetCardDataById(cardId)
  local go
  if animation == SPINE_STATE_ENUM.IN then
    go = Instantiate(cardData.fashionId, animation, loop, animationCompleteCallback, false, nil, 0.8)
  else
    go = Instantiate(cardData.fashionId, animation, loop, animationCompleteCallback)
  end
  local transform = go.transform
  local half = (MAX_CARD_COUNT - 1) / 2
  local j = index - 1 - half
  transform.position = SHOW_PIVOT + Vector3.right * CARD_GAP * j + SPINE_OFFSET
  local entry = {
    go = go,
    cardId = cardId,
    state = CARD_STATE_ENUM.IDLE
  }
  cardCollection[index] = entry
  return entry
end
local CreateDispatchShow = function(groupInfo, loader, dispatchState)
  local cards = groupInfo.cards
  local groupId = groupInfo.groupId
  local groupChanged = not currentGroupId or currentGroupId ~= groupId
  CreateDispatchScene(groupId, loader)
  cardCollection = cardCollection or {}
  backgroundMoveSpeed = BG_MOVE_SPEED
  if groupChanged then
    ClearCollection()
    if cards then
      local count = #cards
      for i = 1, count do
        CreateCard(groupId, i, cards[i], dispatchState == DISPATCH_STATE.IN_PROGRESS and SPINE_STATE_ENUM.RUN or SPINE_STATE_ENUM.IDLE, true)
      end
    end
  end
  currentDispatchState = dispatchState
  if currentDispatchState == DISPATCH_STATE.START then
    elapse = 0
  end
  currentGroupId = groupInfo.groupId
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(Update)
end
local ClearSpines = function(finished)
  ClearCollection()
  if finished then
    currentDispatchState = DISPATCH_STATE.FINISHED
  end
end
local ReleaseDispatchShow = function()
  ClearCollection()
  if camera then
    local rt = camera.targetTexture
    camera.targetTexture = nil
    CS.RTManager.ReleaseTemporary(rt)
    GameObject.Destroy(camera.gameObject)
  end
  if scene then
    ResourceManager.DestroyGameObject(scene)
  end
  camera = nil
  scene = nil
  currentGroupId = nil
  UpdateManager.RemoveUpdateHandler(Update)
end
return {
  IsCardSelected = IsCardSelected,
  IsSelected = IsSelected,
  IsGroupReady = IsGroupReady,
  IsGroupCompleted = IsGroupCompleted,
  IsGroupAvailable = IsGroupAvailable,
  IsCardAvailable = IsCardAvailable,
  StartDispatch = StartDispatch,
  CreateDispatchShow = CreateDispatchShow,
  CreateDispatchScene = CreateDispatchScene,
  ReleaseDispatchShow = ReleaseDispatchShow,
  IsDispatchShowFinished = IsDispatchShowFinished,
  ClearSpines = ClearSpines,
  CreateCard = CreateCard,
  ClearCollection = ClearCollection
}
