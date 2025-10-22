ld("Physics")
local GRAVITY = 16
local VERTICAL_JUMP_IMPULSE_MIN = 6.5
local VERTICAL_JUMP_IMPULSE_FACTOR = 4
local VERTICAL_JUMP_IMPULSE_MAX = 12
local HORIZONTAL_JUMP_IMPULSE_FACTOR = 6.5
local HORIZONTAL_JUMP_IMPULSE_MIN = 4.5
local HORIZONTAL_JUMP_IMPULSE_MAX = 15
local HORIZONTAL_JUMP_IMPULSE_EXTEND_MAX = 15
local EXTEND_ITEM_GET_NUM = 3
local HORIZONTAL_VELOCITY_DAMPING = 0
local OBSTACLE_SHRINK_SPEED = Vector2(0, 3)
local OBSTACLE_MOVE_INTERVAL_MIN = 1
local OBSTACLE_MOVE_INTERVAL_MAX = 2
local PILLAR_GAP_MIN = 8
local MAX_SPAWN_COUNT = 20
local ITEM_RADIUS = 0.4
local PER_PIXELS_UNIT = 0.013333333333333334
local SCENE_WIDTH = 2048 * PER_PIXELS_UNIT
local PILLAR_CONFIG = {
  [1] = {
    id = 1,
    width = 2.3,
    height = 6.42,
    dist = 0
  },
  [2] = {
    id = 2,
    width = 1.7,
    height = 6.42,
    dist = SCENE_WIDTH * 1 * 3
  },
  [3] = {
    id = 3,
    width = 1.0,
    height = 6.42,
    dist = SCENE_WIDTH * 3 * 3
  }
}
local OBSTACLE_CONFIG = {
  [1] = {
    id = 1,
    width = 0.22,
    height = 6.14,
    dist = 0
  },
  [2] = {
    id = 2,
    width = 0.22,
    height = 6.14,
    dist = SCENE_WIDTH * 1 * 3
  },
  [3] = {
    id = 3,
    width = 0.22,
    height = 6.14,
    dist = SCENE_WIDTH * 3 * 3
  }
}
local EPSILON = 0.001
local CAMERA_FOLLOW_X_OFFSET = 2
local WORLD_WIDTH, WORLD_HEIGHT
local SCALE = 100 * PER_PIXELS_UNIT
local COLLIDER_TYPE = {
  PLAYER = "PLAYER",
  PILLAR = "PILLAR",
  ITEM = "ITEM",
  OBSTACLE = "OBSTACLE",
  WALL = "WALL"
}
local ITEM_TYPE = {
  HP = "HP",
  INVINCIBLE = "INVINCIBLE",
  EXTEND = "EXTEND"
}
local RANDOM_ITEM_LIST = {
  ITEM_TYPE.HP,
  ITEM_TYPE.INVINCIBLE,
  ITEM_TYPE.EXTEND
}
local nextItemTypes, spawnItemPhase, spawnItemPos, spawnItemGap, spawnItemConfigs
local ITEM_ID_TYPE_LOOKUP = {
  [70076581] = ITEM_TYPE.HP,
  [70076582] = ITEM_TYPE.INVINCIBLE,
  [70076583] = ITEM_TYPE.EXTEND
}
local MOVABLE_PILLAR_CONFIG = {
  [1] = {
    dist = 30000,
    gap = 8,
    speed = Vector2(10, 0),
    range = Vector2(50, 0)
  },
  [2] = {
    dist = 50000,
    gap = 6,
    speed = Vector2(15, 0),
    range = Vector2(75, 0)
  },
  [3] = {
    dist = 80000,
    gap = 5,
    speed = Vector2(20, 0),
    range = Vector2(100, 0)
  },
  [4] = {
    dist = 120000,
    gap = 4,
    speed = Vector2(25, 0),
    range = Vector2(100, 0)
  },
  [5] = {
    dist = 200000,
    gap = 3,
    speed = Vector2(30, 0),
    range = Vector2(125, 0)
  }
}
local SCENE_SEQUENCES = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_scene_a.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_scene_a2b.prefab",
  [3] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_scene_b.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_scene_b2c.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame008/MiniGame008_scene_c.prefab"
}
local scenePrefabs, world, worldCenter, jumping, gameOver, allowDestroyOutOfBoundsCollider, passedNum, destroyedNum, elapse, spawnCount, startPosition, player, stand, lastStand, horizontalSpeed, hp, invincible, extend, camera, cameraBounds, rollbacking, rollbackTween, sceneEntry, bodyColliderLookup, allColliders, __oncreate, __ondestroy, __onupdate, __ongameover, __oncollide, __onseparated, __onrefreshinfo, __onrevive
local DIST_PHASE = {
  0,
  SCENE_WIDTH * 1 * 3,
  SCENE_WIDTH * 3 * 3
}
local GetConfigByDist = function(dist)
  local result
  local idOffset = 70910017
  dist = math.max(0, dist)
  for i = #DIST_PHASE, 1, -1 do
    if dist >= DIST_PHASE[i] then
      result = TableData.GetConfig(idOffset + i, "BaseActivityGameMap")
      break
    end
  end
  return result
end
local UpdatePassedNum = function(pillar)
  local buffer = {}
  for i, collider in ipairs(allColliders) do
    if collider.type == COLLIDER_TYPE.PILLAR then
      table.insert(buffer, collider)
    end
  end
  local result = table.keyof(buffer, pillar) or 0
  passedNum = destroyedNum + result
  if result and result == #buffer and 0 == spawnCount then
    gameOver = true
    if type(__ongameover) == "function" then
      __ongameover(true)
    end
  end
end
local ScaleValue = function(val)
  return val * SCALE
end
local createRect = function(w, h)
  w = w or 1
  h = h or 1
  local vertices = {
    {
      -w / 2,
      -h / 2
    },
    {
      w / 2,
      -h / 2
    },
    {
      w / 2,
      h / 2
    },
    {
      -w / 2,
      h / 2
    }
  }
  return vertices
end
local CreateSceneEntry = function(sceneObj, index)
  local srs = sceneObj:GetComponentsInChildren(typeof(CS.UnityEngine.SpriteRenderer))
  if srs and srs.Length > 0 then
    local subScenes = {}
    local maxSortingOrder = -1
    local spriteBounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
    for i = 0, srs.Length - 1 do
      maxSortingOrder = math.max(srs[i].sortingOrder, maxSortingOrder)
      local exists
      for j, v in pairs(subScenes) do
        for _, entry in ipairs(v.list) do
          local sr = entry.spriteRenderer
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
            [1] = {
              spriteRenderer = srs[i],
              index = index
            }
          }
        })
      else
        table.insert(subScenes[exists].list, {
          spriteRenderer = srs[i],
          index = index
        })
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
    local sceneBounds = spriteBounds
    local size = sceneBounds.size
    size.z = 0
    sceneBounds.size = size
    table.sort(subScenes, function(x, y)
      return x.sortingOrder > y.sortingOrder
    end)
    return {
      root = sceneObj.transform,
      bounds = sceneBounds,
      subScenes = subScenes
    }
  end
end
local translatePoints = function(points, x, y)
  for i = 1, #points do
    points[i][1] = points[i][1] + x
    points[i][2] = points[i][2] + y
  end
  return points
end
local DestroyCollider = function(collider, playEffect)
  if not collider then
    return
  end
  local body = collider.body
  local owner = collider.owner
  if owner then
    owner.item = nil
  end
  collider.owner = nil
  collider.item = nil
  bodyColliderLookup[body] = nil
  local key = table.keyof(allColliders, collider)
  if key then
    table.remove(allColliders, key)
  end
  world:removeBody(body)
  __ondestroy(collider, owner, playEffect)
end
local CreateRectangleBody = function(width, height, x, y, mass, scale)
  local vertices = createRect(width * (scale or 1), height * (scale or 1))
  vertices = translatePoints(vertices, x, y)
  local rectangle = Rectangle.New()
  rectangle.bodyType = BodyType.Dynamic
  rectangle.vertices = vertices
  rectangle.friction = 1
  rectangle.mass = mass
  rectangle:init()
  return rectangle
end
local CloneSubscene = function(sceneIndex, childname)
  local clone
  local prefab = scenePrefabs[sceneIndex]
  local prefabTransform = prefab.transform
  for k = 0, prefabTransform.childCount - 1 do
    local child = prefabTransform:GetChild(k)
    local childGo = child.gameObject
    if string.find(childGo.name, childname) then
      clone = CS.UnityEngine.Object.Instantiate(childGo)
      clone.name = childGo.name
      break
    end
  end
  return clone
end
local SceneMotion = function(scene, delta)
  local root = scene.root
  local subScenes = scene.subScenes
  local len = #subScenes
  for i = 1, len do
    local list = subScenes[i].list
    local subscenesBounds = subScenes[i].bounds
    local n = #list
    for j, v in ipairs(list) do
      local index = v.index
      local sr = v.spriteRenderer
      local transform = sr.transform
      local go = sr.gameObject
      local extents = subscenesBounds.extents
      local position = transform.position + Vector3.right * delta * ((len - i + 1) / len)
      transform.position = position
      local sceneMin, sceneMax = position - extents, position + extents
      if 1 == j then
        local rightDiff = sceneMax.x - cameraBounds.max.x
        local leftDiff = sceneMin.x - cameraBounds.min.x
        if rightDiff <= 0 then
          local origin = cameraBounds.max + extents + rightDiff * Vector3.right
          origin.y = position.y
          origin.x = origin.x - 2 * PER_PIXELS_UNIT
          if n < 2 then
            local clone
            local nextSceneIndex = index + 1
            if nextSceneIndex <= #scenePrefabs then
              local splits = Split(sr.name, "_")
              clone = CloneSubscene(nextSceneIndex, splits[3])
            else
              clone = CS.UnityEngine.Object.Instantiate(go)
              clone.name = go.name
            end
            local cloneTransform = clone.transform
            cloneTransform.position = origin
            cloneTransform:SetParent(root, true)
            table.insert(list, {
              spriteRenderer = clone:GetComponent(typeof(CS.UnityEngine.SpriteRenderer)),
              index = nextSceneIndex
            })
            break
          else
            local entry = list[2]
            local trans = entry.spriteRenderer.transform
            trans.position = origin
          end
        elseif leftDiff > 0 then
          local origin = cameraBounds.min - extents + leftDiff * Vector3.right
          origin.y = position.y
          origin.x = origin.x + 2 * PER_PIXELS_UNIT
          local clone
          local prevSceneIndex = index - 1
          if prevSceneIndex > 0 and prevSceneIndex <= #scenePrefabs then
            local splits = Split(sr.name, "_")
            clone = CloneSubscene(prevSceneIndex, splits[3])
          else
            clone = CS.UnityEngine.Object.Instantiate(go)
            clone.name = go.name
          end
          local cloneTransform = clone.transform
          cloneTransform.position = origin
          cloneTransform:SetParent(root, true)
          table.insert(list, 1, {
            spriteRenderer = clone:GetComponent(typeof(CS.UnityEngine.SpriteRenderer)),
            index = prevSceneIndex
          })
          if #list > 2 then
            local removed = table.remove(list, 3)
            CS.UnityEngine.Object.DestroyImmediate(removed.spriteRenderer.gameObject)
          end
          break
        end
      end
      if 2 == j and sceneMin.x <= cameraBounds.min.x then
        local removed = table.remove(list, 1)
        CS.UnityEngine.Object.DestroyImmediate(removed.spriteRenderer.gameObject)
      end
    end
  end
end
local AutoCorrectSubscenesPositions = function(scene)
  local root = scene.root
  local subScenes = scene.subScenes
  local len = #subScenes
  for i = 1, len do
    local list = subScenes[i].list
    local subscenesBounds = subScenes[i].bounds
    local n = #list
    local first = list[1]
    local position = first.spriteRenderer.transform.position
    local extents = subscenesBounds.extents
    if n > 1 then
      for j = 2, n do
        local entry = list[j]
        entry.spriteRenderer.transform.position = Vector3(position.x + extents.x * j - 2 * PER_PIXELS_UNIT, position.y, position.z)
      end
    end
  end
end
local RollbackPlayer = function()
  stand = nil
  if lastStand then
    horizontalSpeed = 0
    jumping = false
    local standBody = lastStand.body
    local playerBody = player.body
    playerBody.sleeping = true
    local x = standBody.x
    local diff = worldCenter.x - x
    spawnItemPos = spawnItemPos + diff
    startPosition = startPosition + diff
    local lastVal, delta = 0, 0
    rollbacking = true
    rollbackTween = LeanTween.delayedCall(0.3, function()
      rollbackTween = LeanTween.value(0, diff, 0.7):setOnUpdate(function(val)
        delta = val - lastVal
        for _, v in ipairs(allColliders) do
          if v.type ~= COLLIDER_TYPE.WALL and v.type ~= COLLIDER_TYPE.PLAYER then
            v.body:setPos(v.body.x + delta, v.body.y)
            if v.__origin_x then
              v.__origin_x = v.__origin_x + delta
            end
          end
        end
        SceneMotion(sceneEntry, delta)
        AutoCorrectSubscenesPositions(sceneEntry)
        lastVal = val
      end):setOnComplete(function()
        rollbackTween = nil
        rollbacking = false
        playerBody.sleeping = false
        playerBody.velX = 0
        playerBody.velY = 0
        playerBody.gravityY = -GRAVITY
        local offset = ScaleValue((lastStand.height + player.height) * 0.5)
        playerBody:setPos(standBody.x, standBody.y + offset)
        player.standOffset = 0
        if type(__onrevive) == "function" then
          __onrevive(player, lastStand)
        end
      end):setEase(LeanTweenType.easeInOutCubic).id
    end).id
  else
    printError("error rollback nil stand !!!")
  end
end
local SetAllObstacleIsTrigger = function(isTrigger)
  for _, v in ipairs(allColliders) do
    if v.type == COLLIDER_TYPE.OBSTACLE then
      v.body.isTrigger = isTrigger
    end
  end
end
local Collide = function(bodyA, bodyB, arbiter)
  if gameOver or rollbacking then
    return
  end
  if bodyA ~= player.body and bodyB ~= player.body then
    return
  end
  local collide = player.body == bodyA and bodyB or bodyA
  local collider = bodyColliderLookup[collide]
  if collider then
    local invincibleFlag, rollback
    if collider.type == COLLIDER_TYPE.OBSTACLE then
      jumping = false
      if invincible > 0 then
        invincibleFlag = true
      else
        horizontalSpeed = 0
      end
    elseif collider.type == COLLIDER_TYPE.PILLAR then
      jumping = false
      horizontalSpeed = 0
      local normal = arbiter.normal
      if 0 ~= normal[2] then
        player.standOffset = player.body.x - collide.x
        stand = collider
        lastStand = collider
        allowDestroyOutOfBoundsCollider = true
        UpdatePassedNum(collider)
        local item = collider.item
        if type(item) == "table" then
          local itemType = item.itemType
          if itemType == ITEM_TYPE.HP then
            hp = hp + 1
          elseif itemType == ITEM_TYPE.INVINCIBLE then
            invincible = invincible + 1
            SetAllObstacleIsTrigger(true)
          elseif itemType == ITEM_TYPE.EXTEND then
            extend = extend + EXTEND_ITEM_GET_NUM
          end
          DestroyCollider(item, true)
          collider.item = nil
        end
      end
    elseif collider.type == COLLIDER_TYPE.WALL then
      if hp > 0 then
        hp = hp - 1
        rollback = true
      else
        gameOver = true
      end
    elseif collider.type == COLLIDER_TYPE.ITEM then
    end
    __onrefreshinfo(hp, invincible, extend)
    if type(__oncollide) == "function" then
      local normal = type(arbiter) == "table" and arbiter.normal
      __oncollide(collider, player, normal, invincibleFlag)
    end
    if rollback then
      RollbackPlayer()
    end
    if gameOver and type(__ongameover) == "function" then
      __ongameover(false)
    end
  end
end
local OnCollided = function(_, bodyA, bodyB, arbiter, timeStep)
  Collide(bodyA, bodyB, arbiter)
end
local OnColliding = function(_, bodyA, bodyB, arbiter, timeStep)
  if gameOver or rollbacking then
    return
  end
  if bodyA ~= player.body and bodyB ~= player.body then
    return
  end
end
local OnSeparated = function(_, bodyA, bodyB, timeStep)
  if gameOver then
    return
  end
  if bodyA ~= player.body and bodyB ~= player.body then
    return
  end
  local separated = player.body == bodyA and bodyB or bodyA
  local collider = bodyColliderLookup[separated]
  if not collider then
    return
  end
  if jumping and collider == stand and type(__onseparated) == "function" then
    __onseparated(player, stand, true)
  end
  if collider.type == COLLIDER_TYPE.OBSTACLE then
    if invincible <= 0 then
      player.body.velX = 0
    end
    invincible = math.max(0, invincible - 1)
    if type(__onrefreshinfo) == "function" then
      __onrefreshinfo(hp, invincible, extend)
    end
    if 0 == invincible then
      SetAllObstacleIsTrigger(false)
    end
  end
end
local CreateCollider = function(id, colliderType, x, y, w, h)
  local notPlayer = colliderType ~= COLLIDER_TYPE.PLAYER
  local rectBody = CreateRectangleBody(w, h, x, y, notPlayer and MathConst.Infinity or 1, SCALE)
  rectBody.ignoreG = notPlayer
  rectBody.restitution = 1
  rectBody.damping = 0
  local collider = {
    id = id,
    type = colliderType,
    body = rectBody,
    width = w,
    height = h
  }
  world:addBody(rectBody)
  bodyColliderLookup[rectBody] = collider
  __oncreate(collider)
  table.insert(allColliders, collider)
  return collider
end
local CreateItem = function(itemType, x, y, radius)
  local circle = Circle.New(x, y, radius * SCALE)
  circle.ignoreG = true
  circle.isTrigger = true
  circle:setMass(1)
  circle:init()
  local collider = {
    type = COLLIDER_TYPE.ITEM,
    itemType = itemType,
    body = circle,
    width = radius * 2,
    height = radius * 2
  }
  world:addBody(circle)
  bodyColliderLookup[circle] = collider
  __oncreate(collider)
  table.insert(allColliders, collider)
  return collider
end
local CreatePlayer = function(x, y)
  local w, h = 0.3, 0.5
  local posY = y + ScaleValue(h * 0.5)
  local collider = CreateCollider(0, COLLIDER_TYPE.PLAYER, x, posY, w, h)
  collider.body:setMass(1)
  return collider
end
local CreatePillar = function(id, x, w, h, offsetY)
  offsetY = type(offsetY) == "number" and offsetY or 0
  local posY = worldCenter.y - WORLD_HEIGHT * 0.5 - ScaleValue(h * 0.5) + ScaleValue(offsetY)
  return CreateCollider(id, COLLIDER_TYPE.PILLAR, x, posY, w, h)
end
local CreateObstacle = function(id, x, w, h, offsetY)
  offsetY = type(offsetY) == "number" and offsetY or 0
  local posY = worldCenter.y + WORLD_HEIGHT * 0.5 + ScaleValue(h * 0.5 - offsetY)
  local obstacle = CreateCollider(id, COLLIDER_TYPE.OBSTACLE, x, posY, w, h)
  return obstacle
end
local DestroyOutOfBoundsCollider = function()
  if allColliders and allowDestroyOutOfBoundsCollider then
    local len = #allColliders
    local threshold = cameraBounds.min.x - WORLD_WIDTH * 0.2
    for i = len, 1, -1 do
      local collider = allColliders[i]
      local body = collider.body
      if threshold > body.x + ScaleValue(collider.width) * 0.5 then
        DestroyCollider(collider)
        destroyedNum = destroyedNum + 1
      end
    end
  end
end
local CalculateS = function(v0, a, t, clamp)
  if v0 * a < 0 and clamp then
    t = math.min(t, v0 / -a)
  end
  return v0 * t + 0.5 * a * t ^ 2
end
local movablePillarGap
local SpawnPillar = function()
  local max = worldCenter.x - WORLD_WIDTH * 0.5
  for _, collider in ipairs(allColliders) do
    if collider.type == COLLIDER_TYPE.PILLAR then
      local body = collider.body
      local maxX = body.x + ScaleValue(collider.width) * 0.5
      if max < maxX then
        max = maxX
      end
    end
  end
  local MAX_HEIGHT_DIFF = VERTICAL_JUMP_IMPULSE_MAX ^ 2 / (2 * GRAVITY)
  local threshold = worldCenter.x + WORLD_WIDTH * 0.6
  while max < threshold do
    if type(spawnCount) == "number" then
      if spawnCount > 0 then
        spawnCount = math.max(0, spawnCount - 1)
      elseif 0 == spawnCount then
        break
      end
    end
    local dist = max - startPosition
    local conf = GetConfigByDist(dist)
    local config
    for i = #PILLAR_CONFIG, 1, -1 do
      if dist > PILLAR_CONFIG[i].dist - WORLD_WIDTH * 0.5 then
        config = PILLAR_CONFIG[i]
        break
      end
    end
    local width, height = config.width, config.height
    local randomPillarGap = conf.pillar_interval
    local gap = randomPillarGap[math.random(1, #randomPillarGap)] / 100
    local scaleX, scaleY = 1, 1
    local scaledWidth, scaledHeight = width * scaleX, height * scaleY
    local pos = max + ScaleValue(gap + scaledWidth * 0.5)
    local randomPillarHeight = conf.pillar_height
    local offsetY = randomPillarHeight[math.random(1, #randomPillarHeight)] / 100
    local pillar = CreatePillar(config.id, pos, scaledWidth, scaledHeight, offsetY)
    local movable
    for _, v in ipairs(MOVABLE_PILLAR_CONFIG) do
      if pos - startPosition >= v.dist / 100 and movablePillarGap >= v.gap then
        movable = v
      end
    end
    if not nextItemTypes or #nextItemTypes <= 0 then
      for i = #spawnItemConfigs, 1, -1 do
        local v = spawnItemConfigs[i]
        if spawnItemPhase >= v.phase then
          nextItemTypes = nextItemTypes or {}
          spawnItemGap = v.gap
          spawnItemPhase = spawnItemPhase + 1
          for _, entry in ipairs(v.entries) do
            table.insert(nextItemTypes, {
              type = entry.type,
              count = entry.count
            })
          end
          break
        end
      end
    end
    if nextItemTypes and #nextItemTypes > 0 and pos - spawnItemPos >= spawnItemGap then
      local randomIndex = math.random(1, #nextItemTypes)
      local entry = nextItemTypes[randomIndex]
      local itemType, count = entry.type, entry.count
      count = count - 1
      if count <= 0 then
        table.remove(nextItemTypes, randomIndex)
      else
        entry.count = count
      end
      spawnItemPos = pos
      local item = CreateItem(itemType, pos, pillar.body.y + ScaleValue(pillar.height * 0.5) + ScaleValue(ITEM_RADIUS), ITEM_RADIUS)
      pillar.item = item
      item.owner = pillar
    end
    if movable then
      pillar.moveSpeed = movable.speed / 100
      pillar.moveRange = movable.range / 100
      movablePillarGap = 0
    else
      movablePillarGap = movablePillarGap + 1
    end
    max = pos + ScaleValue(scaledWidth) * 0.5
  end
end
local SpawnObstacle = function()
  local max = worldCenter.x - WORLD_WIDTH * 0.5
  for _, collider in ipairs(allColliders) do
    if collider.type == COLLIDER_TYPE.OBSTACLE then
      local body = collider.body
      local maxX = body.x + ScaleValue(collider.width) * 0.5
      if max < maxX then
        max = maxX
      end
    end
  end
  local threshold = worldCenter.x + WORLD_WIDTH * 0.6
  while max < threshold do
    local dist = max - startPosition
    local conf = GetConfigByDist(dist)
    local config
    for i = #OBSTACLE_CONFIG, 1, -1 do
      if dist + EPSILON >= OBSTACLE_CONFIG[i].dist - WORLD_WIDTH * 0.5 then
        config = OBSTACLE_CONFIG[i]
        break
      end
    end
    local width, height = config.width, config.height
    local randomObstacleHeight = conf.cirrus_len
    local offsetY
    if type(randomObstacleHeight) == "table" then
      offsetY = randomObstacleHeight[math(1, #randomObstacleHeight)] / 100
    elseif type(randomObstacleHeight) == "number" then
      offsetY = randomObstacleHeight / 100
    else
      break
    end
    local randomObstacleGap = conf.cirrus_interval
    local gap = randomObstacleGap[math.random(1, #randomObstacleGap)] / 100
    local scaleX, scaleY = 1, 1
    local scaledWidth, scaledHeight = width * scaleX, height * scaleY
    local pos = max + ScaleValue(gap + scaledWidth * 0.5)
    local obstacle = CreateObstacle(config.id, pos, scaledWidth, scaledHeight, offsetY)
    if invincible > 0 then
      obstacle.body.isTrigger = true
    end
    local randomObstacleShrink = conf.cirrus_range
    if randomObstacleShrink and _G.next(randomObstacleShrink) then
      local shrink = randomObstacleShrink[math.random(1, #randomObstacleShrink)] / 100
      obstacle.moveSpeed = OBSTACLE_SHRINK_SPEED
      obstacle.moveRange = Vector2(0, shrink)
      obstacle.moveInterval = OBSTACLE_MOVE_INTERVAL_MIN + math.random(1, OBSTACLE_MOVE_INTERVAL_MAX * 10) / 10
      obstacle.oneway = true
      obstacle.__move_speed_sign_y = -1
    end
    max = pos + ScaleValue(scaledWidth) * 0.5
  end
end
local points = {}
local DRAW_TRACK_TIME = 1.5
local DRAW_TIME_FIXED_TIME = 0.3
local increase = true
local CalculateTrack = function(pressTime, smoothness, fixedTime)
  table.clear(points)
  smoothness = smoothness or 20
  local horizontalMaxTime = (VERTICAL_JUMP_IMPULSE_MAX - VERTICAL_JUMP_IMPULSE_MIN) / VERTICAL_JUMP_IMPULSE_FACTOR
  local verticalMaxTime = ((extend > 0 and HORIZONTAL_JUMP_IMPULSE_EXTEND_MAX or HORIZONTAL_JUMP_IMPULSE_MAX) - HORIZONTAL_JUMP_IMPULSE_MIN) / HORIZONTAL_JUMP_IMPULSE_FACTOR
  if increase and pressTime >= math.max(horizontalMaxTime, verticalMaxTime) then
    increase = false
  else
  end
  local verticalVel = math.min(VERTICAL_JUMP_IMPULSE_MIN + VERTICAL_JUMP_IMPULSE_FACTOR * pressTime, VERTICAL_JUMP_IMPULSE_MAX)
  local horizontalVel = math.min(HORIZONTAL_JUMP_IMPULSE_MIN + HORIZONTAL_JUMP_IMPULSE_FACTOR * pressTime, extend > 0 and HORIZONTAL_JUMP_IMPULSE_EXTEND_MAX or HORIZONTAL_JUMP_IMPULSE_MAX)
  local trackTime = fixedTime and DRAW_TIME_FIXED_TIME or verticalVel / GRAVITY * DRAW_TRACK_TIME
  for i = 1, smoothness do
    local t = i / smoothness * trackTime
    local x = CalculateS(horizontalVel, -HORIZONTAL_VELOCITY_DAMPING, t, true)
    local y = CalculateS(verticalVel, -GRAVITY, t)
    table.insert(points, Vector3(x, y, 0))
  end
  return points, extend > 0
end
local Jump = function(pressTime)
  if jumping or gameOver then
    return
  end
  if player then
    player.body.velY = 0
    player.body.gravityY = -GRAVITY
    stand = nil
    local body = player.body
    body:applyImpulse(0, math.min(VERTICAL_JUMP_IMPULSE_MIN + VERTICAL_JUMP_IMPULSE_FACTOR * pressTime, VERTICAL_JUMP_IMPULSE_MAX))
    horizontalSpeed = -math.min(HORIZONTAL_JUMP_IMPULSE_MIN + HORIZONTAL_JUMP_IMPULSE_FACTOR * pressTime, extend > 0 and HORIZONTAL_JUMP_IMPULSE_EXTEND_MAX or HORIZONTAL_JUMP_IMPULSE_MAX)
    jumping = true
    allowDestroyOutOfBoundsCollider = false
    extend = math.max(0, extend - 1)
  end
end
local InView = function(minX, maxX, minY, maxY)
  local max, min = cameraBounds.max, cameraBounds.min
  return maxX >= min.x and minX <= max.x and maxY >= min.y and minY <= max.y
end
local Update = function()
  __onupdate(player, allColliders)
  if sceneEntry then
    AutoCorrectSubscenesPositions(sceneEntry)
  end
end
local iteration = 2
local MoveTowards = CS.UnityEngine.Mathf.MoveTowards
local FixedUpdate = function()
  local timeStep = Time.fixedDeltaTime / iteration
  for _ = 1, iteration do
    if world and not rollbacking then
      world:step(timeStep)
    end
    if not gameOver then
      elapse = elapse + timeStep
      local deltaX = horizontalSpeed * timeStep
      for _, collider in ipairs(allColliders) do
        local c_type = collider.type
        if c_type == COLLIDER_TYPE.PILLAR or c_type == COLLIDER_TYPE.OBSTACLE then
          local body = collider.body
          local x, y = body.x, body.y
          local extentWidth, extentHeight = ScaleValue(collider.width) * 0.5, ScaleValue(collider.height) * 0.5
          local minX, maxX = x - extentWidth, x + extentWidth
          local minY, maxY = y - extentHeight, y + extentHeight
          local visible = InView(minX, maxX, minY, maxY)
          local moveSpeed = collider.moveSpeed
          local moveInterval = collider.moveInterval
          if moveInterval then
            collider.__move_timer = math.max(0, (collider.__move_timer or moveInterval) - timeStep)
          end
          if (not moveInterval or collider.__move_timer <= 0) and moveSpeed then
            local resultX = x
            if 0 ~= moveSpeed.x then
              if collider.__origin_x then
                collider.__origin_x = collider.__origin_x + deltaX
              end
              collider.__move_speed_sign_x = collider.__move_speed_sign_x or 1
              if not collider.__origin_x then
                collider.__origin_x = x
              end
              local moveDeltaX = collider.__move_speed_sign_x * moveSpeed.x * timeStep
              local relativeDeltaX = moveDeltaX + deltaX
              local relativeDeltaXSign = relativeDeltaX >= 0 and 1 or -1
              if relativeDeltaXSign == collider.__move_speed_sign_x then
                local targetX = collider.__origin_x + collider.__move_speed_sign_x * collider.moveRange.x
                resultX = MoveTowards(x, targetX, math.abs(relativeDeltaX))
                if math.abs(math.abs(resultX - collider.__origin_x) - collider.moveRange.x) <= EPSILON then
                  collider.__move_speed_sign_x = collider.__move_speed_sign_x * -1
                  collider.__origin_x = resultX
                  collider.__move_timer = moveInterval
                end
              else
                resultX = x + relativeDeltaX
              end
            else
              resultX = x + deltaX
            end
            local resultY = y
            if 0 ~= moveSpeed.y then
              collider.__move_speed_sign_y = collider.__move_speed_sign_y or 1
              if not collider.__origin_y then
                collider.__origin_y = y
              end
              local targetY = collider.__origin_y + collider.__move_speed_sign_y * collider.moveRange.y
              resultY = MoveTowards(y, targetY, moveSpeed.y * timeStep)
              if math.abs(math.abs(resultY - collider.__origin_y) - collider.moveRange.y) <= EPSILON then
                collider.__move_speed_sign_y = collider.__move_speed_sign_y * -1
                collider.__origin_y = resultY
                if collider.oneway then
                  collider.__move_timer = collider.__move_speed_sign_y < 0 and moveInterval or 0
                else
                  collider.__move_timer = moveInterval
                end
              end
            end
            body:setPos(resultX, resultY)
          else
            body:setPos(x + deltaX, y)
          end
          local item = collider.item
          if item then
            item.body:setPos(body.x, body.y + ScaleValue(collider.height * 0.5) + ScaleValue(ITEM_RADIUS))
          end
          if visible then
            body:awake()
            if item then
              item.body:awake()
            end
          end
        elseif c_type == COLLIDER_TYPE.WALL then
          local body = collider.body
          local x, y = body.x, body.y
          body:setPos(player.body.x + 2, y)
          body:awake()
        end
      end
      spawnItemPos = spawnItemPos + deltaX
      startPosition = startPosition + deltaX
      local cameraTransform = camera.transform
      local position = cameraTransform.position
      position.x = worldCenter.x + CAMERA_FOLLOW_X_OFFSET
      cameraTransform.position = position
      position.z = cameraBounds.center.z
      cameraBounds.center = position
      SceneMotion(sceneEntry, deltaX)
    end
    if not rollbacking then
      SpawnPillar()
      SpawnObstacle()
      DestroyOutOfBoundsCollider()
    end
    local abs = math.abs(horizontalSpeed)
    if abs > EPSILON then
      local sign = horizontalSpeed > 0 and 1 or -1
      horizontalSpeed = sign * math.max(0, abs - timeStep * HORIZONTAL_VELOCITY_DAMPING)
    else
      horizontalSpeed = 0
    end
    if stand and not jumping then
      local playerBody = player.body
      local diff = math.abs(stand.body.x - player.body.x)
      local dist = ScaleValue(stand.width + player.width) * 0.5
      if diff > dist then
        if type(__onseparated) then
          __onseparated(player, stand, false)
        end
        stand = nil
        playerBody.gravityY = -GRAVITY
        return
      end
      playerBody:setPos(stand.body.x + player.standOffset, stand.body.y + ScaleValue(stand.height + player.height) * 0.5 - EPSILON * 5)
      playerBody:awake()
    end
  end
end
local Release = function()
  if rollbackTween then
    LeanTween.cancel(rollbackTween)
  end
  rollbackTween = nil
  __onupdate = nil
  __ongameover = nil
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.RemoveFixedUpdateHandler(FixedUpdate)
  world = nil
  allColliders = nil
  bodyColliderLookup = nil
  if camera then
    local rt = camera.targetTexture
    camera.targetTexture = nil
    if rt and not rt:IsNull() then
      CS.RTManager.ReleaseTemporary(rt)
      GameObject.Destroy(camera.gameObject)
    end
  end
  if sceneEntry then
    ResourceManager.DestroyGameObject(sceneEntry.root.gameObject, false)
    sceneEntry = nil
  end
  if scenePrefabs then
    for i, v in ipairs(scenePrefabs) do
      ResourceManager.DestroyGameObject(v)
    end
    table.clear(scenePrefabs)
  end
  scenePrefabs = nil
  camera = nil
end
local DEV_ASPECT = 1.7786666666666666
local InitializeCamera = function(loader)
  if not camera then
    local go = GameObject("ACTIVITY8_CAMERA")
    local component = go:GetOrAddComponent(typeof(CS.UnityEngine.Camera))
    local orthographicSize = 5
    component.orthographic = true
    component.orthographicSize = orthographicSize
    local camTrans = component.transform
    local z = StageCamera.main.transform.position.z
    camTrans.position = Vector3(worldCenter.x, worldCenter.y, z)
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
    RTManager:ShowRTtoLoader(camera.targetTexture, loader)
  end
end
local Initialize = function(position, width, height)
  if allColliders then
    for i, v in ipairs(allColliders) do
      __ondestroy(v)
    end
  end
  if sceneEntry then
    ResourceManager.DestroyGameObject(sceneEntry.root.gameObject, false)
    sceneEntry = nil
  end
  if scenePrefabs then
    for _, v in ipairs(scenePrefabs) do
      ResourceManager.DestroyGameObject(v)
    end
    table.clear(scenePrefabs)
  end
  worldCenter, WORLD_WIDTH, WORLD_HEIGHT = position, width, height
  jumping = false
  gameOver = false
  rollbacking = false
  stand = nil
  allColliders = {}
  bodyColliderLookup = {}
  world = World.New(OnColliding, OnCollided, OnSeparated)
  world.gravityY = -GRAVITY
  horizontalSpeed = 0
  passedNum = 0
  destroyedNum = 0
  elapse = 0
  spawnCount = 10000000
  hp = 2
  invincible = 0
  extend = 0
  movablePillarGap = 0
  if nextItemTypes then
    table.clear(nextItemTypes)
  end
  local config = PILLAR_CONFIG[1]
  local firstHeight = config.height
  startPosition = worldCenter.x
  spawnItemPhase = 1
  spawnItemPos = startPosition
  local tbl = TableData.GetTable("BaseActivityGame")
  spawnItemConfigs = {}
  for i, v in pairs(tbl) do
    if v.game_id == 70441009 then
      local conf = {
        id = i,
        gap = v.interval_item,
        phase = v.game_stage,
        entries = {}
      }
      table.insert(spawnItemConfigs, conf)
      for _, str in ipairs(v.item_num) do
        local splits = Split(str, ":")
        local id = tonumber(splits[1])
        table.insert(conf.entries, {
          type = ITEM_ID_TYPE_LOOKUP[id],
          count = tonumber(splits[2])
        })
      end
    end
  end
  table.sort(spawnItemConfigs, function(x, y)
    return x.id < y.id
  end)
  local conf = GetConfigByDist(0)
  local randomPillarHeight = conf.pillar_height
  local origin = CreatePillar(config.id, worldCenter.x, config.width, firstHeight, randomPillarHeight[math.random(1, #randomPillarHeight)] / 100)
  player = CreatePlayer(origin.body.x, origin.body.y + 0.5 * ScaleValue(firstHeight) + 0.1)
  local wallHeight = 0.8
  local wall = CreateCollider(0, COLLIDER_TYPE.WALL, worldCenter.x, worldCenter.y - WORLD_HEIGHT * 0.5 - ScaleValue(wallHeight) * 0.6, WORLD_WIDTH, wallHeight)
  wall.body.isTrigger = true
  scenePrefabs = scenePrefabs or {}
  for _, path in ipairs(SCENE_SEQUENCES) do
    local prefab = ResourceManager.Instantiate(path)
    prefab:SetActive(false)
    table.insert(scenePrefabs, prefab)
  end
  local initialIndex = 1
  local clone = CS.UnityEngine.Object.Instantiate(scenePrefabs[initialIndex])
  clone:SetActive(true)
  clone.transform.position = Vector3(worldCenter.x + (SCENE_WIDTH - WORLD_WIDTH) * 0.5 - EPSILON, worldCenter.y, 0)
  sceneEntry = CreateSceneEntry(clone, initialIndex)
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.RemoveFixedUpdateHandler(FixedUpdate)
  UpdateManager.AddUpdateHandler(Update)
  UpdateManager.AddFixedUpdateHandler(FixedUpdate)
end
local StartGame = function(viewLoader, worldCenterPosition, worldWidth, worldHeight, onCreate, onDestroy, onUpdate, onCollide, onSeparated, onGameOver, onRefreshInfo, onRevive)
  __oncreate = onCreate
  __ondestroy = onDestroy
  __onupdate = onUpdate
  __oncollide = onCollide
  __onseparated = onSeparated
  __ongameover = onGameOver
  __onrefreshinfo = onRefreshInfo
  __onrevive = onRevive
  Initialize(worldCenterPosition, worldWidth, worldHeight)
  InitializeCamera(viewLoader)
end
local GetPassedNum = function()
  return passedNum
end
local GetDist = function()
  return player.body.x - startPosition
end
local GetElapse = function()
  return elapse
end
local GetHp = function()
  return hp
end
local GetInvincible = function()
  return invincible
end
local GetExtend = function()
  return extend
end
local GetCamera = function()
  return camera
end
local GetTimeReachMaxVel_Vertical = function()
  return (VERTICAL_JUMP_IMPULSE_MAX - VERTICAL_JUMP_IMPULSE_MIN) / VERTICAL_JUMP_IMPULSE_FACTOR
end
local GetTimeReachMaxVel_Horizontal = function()
  return ((extend > 0 and HORIZONTAL_JUMP_IMPULSE_EXTEND_MAX or HORIZONTAL_JUMP_IMPULSE_MAX) - HORIZONTAL_JUMP_IMPULSE_MIN) / HORIZONTAL_JUMP_IMPULSE_FACTOR
end
return {
  Release = Release,
  StartGame = StartGame,
  CalculateTrack = CalculateTrack,
  Jump = Jump,
  GetPassedNum = GetPassedNum,
  GetDist = GetDist,
  GetElapse = GetElapse,
  GetHp = GetHp,
  GetInvincible = GetInvincible,
  GetExtend = GetExtend,
  GetCamera = GetCamera,
  GetTimeReachMaxVel_Vertical = GetTimeReachMaxVel_Vertical,
  GetTimeReachMaxVel_Horizontal = GetTimeReachMaxVel_Horizontal
}
