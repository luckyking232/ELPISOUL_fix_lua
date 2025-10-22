local BULLET_RADIUS = 0.125
local PLAYER_RADIUS = 0.05
local HORIZONTAL_POSITIONS_GRANULARITY, VERTICAL_POSITIONS_GRANULARITY = 50, 50
local DEFAULT_HP = 3
local DEFAULT_SPEED = 5
local INVINCIBLE_DURATION = 3
local DELAY_SPAWN_BULLET = 2
local PHASE_CONFIG = {
  [1] = {
    time = 0,
    bullet_speed_min = 2,
    bullet_speed_max = 3,
    spawn_bullet_interval = 1.0,
    spawn_bullet_count = 1,
    disturb_x = 0.2,
    disturb_y = 0.2,
    bullets = {
      0,
      1,
      2
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [2] = {
    time = 10,
    bullet_speed_min = 2,
    bullet_speed_max = 4,
    spawn_bullet_interval = 0.8,
    spawn_bullet_count = 1,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [3] = {
    time = 20,
    bullet_speed_min = 3,
    bullet_speed_max = 5,
    spawn_bullet_interval = 0.7,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [4] = {
    time = 30,
    bullet_speed_min = 3,
    bullet_speed_max = 5,
    spawn_bullet_interval = 0.6,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [5] = {
    time = 40,
    bullet_speed_min = 3,
    bullet_speed_max = 6,
    spawn_bullet_interval = 0.6,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3,
      4
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [6] = {
    time = 60,
    bullet_speed_min = 4,
    bullet_speed_max = 6,
    spawn_bullet_interval = 0.5,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3,
      4
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 1
  },
  [7] = {
    time = 90,
    bullet_speed_min = 4,
    bullet_speed_max = 7,
    spawn_bullet_interval = 0.5,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3,
      4
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 2
  },
  [8] = {
    time = 150,
    bullet_speed_min = 4,
    bullet_speed_max = 7,
    spawn_bullet_interval = 0.5,
    spawn_bullet_count = 2,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3,
      4
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 2
  },
  [9] = {
    time = 240,
    bullet_speed_min = 4,
    bullet_speed_max = 7,
    spawn_bullet_interval = 0.4,
    spawn_bullet_count = 3,
    disturb_x = 0.1,
    disturb_y = 0.1,
    bullets = {
      0,
      1,
      2,
      3,
      4
    },
    bullet_rdm_min = 1,
    bullet_rdm_max = 2
  }
}
local worldCenter, worldSize, spawnBulletTimer, spawnBulletTasks, positions, player, hp, speed, invincibleDuration, elapse, gameOver, pause, bulletIdx, bullets, __oncreateplayer, __ondestroyplayer, __oncreatebullet, __ondestroybullet, __oncollision, __ongameover, OnCollision
local AdaptScale = function(value)
  local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
  return value * scale
end
local FindBullet = function(collider)
  local k = table.keyof(bullets, collider, "collider")
  if k then
    return bullets[k]
  end
end
local physics = CS.UnityEngine.Physics2D
local collisionUtils = CS.CollisionUtils
local CreateBullet = function(x, y, color)
  bulletIdx = (bulletIdx or 0) + 1
  local go = GameObject(string.format("ACTIVITY17_BULLET_%s", bulletIdx))
  local transform = go.transform
  transform.position = Vector3(x, y)
  local collider = go:AddComponent(typeof(CS.UnityEngine.CircleCollider2D))
  collider.radius = AdaptScale(BULLET_RADIUS)
  collider.isTrigger = true
  local rigidbody = go:AddComponent(typeof(CS.UnityEngine.Rigidbody2D))
  rigidbody.gravityScale = 0
  rigidbody.collisionDetectionMode = CS.UnityEngine.CollisionDetectionMode2D.Continuous
  rigidbody.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezeRotation
  rigidbody.interpolation = CS.UnityEngine.RigidbodyInterpolation2D.Interpolate
  local inst = {}
  inst.color = color
  inst.collider = collider
  inst.rigidbody = rigidbody
  inst.go = go
  inst.transform = transform
  for _, other in ipairs(bullets) do
    physics.IgnoreCollision(inst.collider, other.collider)
  end
  table.insert(bullets, inst)
  if type(__oncreatebullet) == "function" then
    __oncreatebullet(inst)
  end
  return inst
end
local DestroyBullet = function(bullet, immediate)
  local k = table.keyof(bullets, bullet)
  if k then
    table.remove(bullets, k)
    local go = bullet.go
    CS.UnityEngine.Object.Destroy(go)
    if type(__ondestroybullet) == "function" then
      __ondestroybullet(bullet, immediate)
    end
    table.clear(bullet)
  end
end
local CreatePlayer = function(x, y)
  local go = GameObject("ACTIVITY17_PLAYER")
  local transform = go.transform
  transform.position = Vector3(x, y)
  local collider = go:AddComponent(typeof(CS.UnityEngine.CircleCollider2D))
  collider.radius = AdaptScale(PLAYER_RADIUS)
  collider.isTrigger = true
  local rigidbody = go:AddComponent(typeof(CS.UnityEngine.Rigidbody2D))
  rigidbody.gravityScale = 0
  rigidbody.collisionDetectionMode = CS.UnityEngine.CollisionDetectionMode2D.Continuous
  rigidbody.constraints = CS.UnityEngine.RigidbodyConstraints2D.FreezeRotation
  rigidbody.interpolation = CS.UnityEngine.RigidbodyInterpolation2D.Interpolate
  local inst = {}
  inst.collider = collider
  inst.rigidbody = rigidbody
  inst.go = go
  inst.transform = transform
  collisionUtils.RemoveTriggerStay2DListener(go, OnCollision)
  collisionUtils.AddTriggerStay2DListener(go, OnCollision)
  if type(__oncreateplayer) == "function" then
    __oncreateplayer(inst)
  end
  return inst
end
local DestroyPlayer = function(inst)
  local go = inst.go
  collisionUtils.RemoveTriggerStay2DListener(go, OnCollision)
  CS.UnityEngine.Object.Destroy(go)
  if type(__ondestroyplayer) == "function" then
    __ondestroyplayer(inst)
  end
end

function OnCollision(go, collider)
  if gameOver then
    return
  end
  if type(invincibleDuration) == "number" and invincibleDuration > 0 then
    return
  end
  local bullet = FindBullet(collider)
  if bullet then
    DestroyBullet(bullet)
    if type(__oncollision) == "function" then
      __oncollision(player, bullet)
    end
    hp = math.max(0, hp - 1)
    if hp <= 0 then
      gameOver = true
      if type(__ongameover) == "function" then
        __ongameover(elapse)
      end
    else
      invincibleDuration = INVINCIBLE_DURATION
    end
  end
end

local GetPhaseConfig = function(t)
  local result
  for _, entry in ipairs(PHASE_CONFIG) do
    if t > entry.time then
      result = entry
    end
  end
  return result
end
local AutoDestroyOutOfBoundsBullet = function()
  if bullets then
    local worldExtents = worldSize * 0.6
    local worldMax = worldCenter + worldExtents
    local worldMin = worldCenter - worldExtents
    local len = #bullets
    for i = len, 1, -1 do
      local bullet = bullets[i]
      local bounds = bullet.collider.bounds
      local min, max = bounds.min, bounds.max
      if max.x < worldMin.x or max.y < worldMin.y or min.x > worldMax.x or min.y > worldMax.y then
        DestroyBullet(bullet)
      end
    end
  end
end
local AutoSpawnBullet = function(random)
  if not player then
    return player
  end
  local playerPosition = player.transform.position
  local randomIndex = math.random(1, #positions)
  local position = positions[randomIndex]
  local x, y = position.x, position.y
  local config = GetPhaseConfig(elapse)
  local bullet = CreateBullet(x, y, config.bullets[math.random(1, #config.bullets)])
  local bulletSpeedMin, bulletSpeedMax = config.bullet_speed_min, config.bullet_speed_max
  local randomSpeed = math.random(Mathf.FloorToInt(bulletSpeedMin * 100), Mathf.FloorToInt(bulletSpeedMax * 100)) / 100
  if not random then
    local disturbX, disturbY = (math.random(0, config.disturb_x * 20000) - config.disturb_x * 10000) / 10000, (math.random(0, config.disturb_y * 20000) - config.disturb_y * 10000) / 10000
    bullet.rigidbody.velocity = Vector2(playerPosition.x - x + disturbX, playerPosition.y - y + disturbY).normalized * randomSpeed
  else
    local randomIndex2 = randomIndex
    while randomIndex == randomIndex2 do
      randomIndex2 = math.random(1, #positions)
    end
    local randomPosition = positions[randomIndex2]
    bullet.rigidbody.velocity = Vector2(randomPosition.x - x, randomPosition.y - y).normalized * randomSpeed
  end
end
local Move = function(dx, dy)
  if gameOver then
    return
  end
  if pause then
    return
  end
  if not player then
    return
  end
  local position = player.transform.position
  local worldExtents, playerExtents = worldSize * 0.5, player.collider.bounds.extents
  local worldMax = worldCenter + worldExtents
  local worldMin = worldCenter - worldExtents
  local deltaTime = Time.deltaTime
  local deltaX = dx * speed * deltaTime
  local deltaY = dy * speed * deltaTime
  local x = math.min(math.max(position.x + deltaX, worldMin.x + playerExtents.x), worldMax.x - playerExtents.x)
  local y = math.min(math.max(position.y + deltaY, worldMin.y + playerExtents.y), worldMax.y - playerExtents.y)
  player.rigidbody:MovePosition(Vector2(x, y))
end
local dl = CS.UnityEngine.Debug.DrawLine
local Debug_DrawPositions = function()
  local gridWidth, gridHeight = worldSize.x / HORIZONTAL_POSITIONS_GRANULARITY, worldSize.y / VERTICAL_POSITIONS_GRANULARITY
  for _, v in ipairs(positions) do
    local x, y = v.x, v.y
    local minX, maxX = x - gridWidth * 0.5, x + gridWidth * 0.5
    local minY, maxY = y - gridHeight * 0.5, y + gridHeight * 0.5
    local c = Color.white
    dl(Vector3(minX, minY), Vector3(maxX, minY), c)
    dl(Vector3(maxX, minY), Vector3(maxX, maxY), c)
    dl(Vector3(maxX, maxY), Vector3(minX, maxY), c)
    dl(Vector3(minX, maxY), Vector3(minX, minY), c)
  end
end
local OnUpdate = function()
  if pause then
    return
  end
  local deltaTime = Time.deltaTime
  elapse = elapse + deltaTime
  if elapse > DELAY_SPAWN_BULLET then
    AutoDestroyOutOfBoundsBullet()
    local config = GetPhaseConfig(elapse)
    local spawnBulletInterval = config.spawn_bullet_interval
    spawnBulletTimer = spawnBulletTimer + deltaTime
    if spawnBulletInterval <= spawnBulletTimer then
      spawnBulletTasks = spawnBulletTasks or {}
      for _ = 1, config.spawn_bullet_count do
        table.insert(spawnBulletTasks, {
          delay = math.random(0, 200) / 1000,
          random = false
        })
      end
      for _ = 1, math.random(config.bullet_rdm_min, config.bullet_rdm_max) do
        table.insert(spawnBulletTasks, {
          delay = math.random(0, 200) / 1000,
          random = true
        })
      end
      spawnBulletTimer = 0
    end
    if spawnBulletTasks then
      local len = #spawnBulletTasks
      for i = len, 1, -1 do
        local task = spawnBulletTasks[i]
        if type(task.delay) == "number" then
          task.delay = task.delay - deltaTime
        end
        if type(task.delay) ~= "number" or task.delay < 0 then
          table.remove(spawnBulletTasks, i)
          AutoSpawnBullet(task.random)
        end
      end
    end
    if type(invincibleDuration) == "number" and invincibleDuration > 0 then
      invincibleDuration = invincibleDuration - deltaTime
    end
  end
end
local Release = function()
  if player then
    DestroyPlayer(player)
  end
  player = nil
  if bullets then
    local len = #bullets
    for i = len, 1, -1 do
      DestroyBullet(bullets[i], true)
    end
  end
  bullets = nil
  UpdateManager.RemoveUpdateHandler(OnUpdate)
end
local InitializePositions = function()
  positions = {}
  local width, height = worldSize.x / HORIZONTAL_POSITIONS_GRANULARITY, worldSize.y / VERTICAL_POSITIONS_GRANULARITY
  local origin = worldCenter - worldSize * 0.5
  for x = 1, HORIZONTAL_POSITIONS_GRANULARITY do
    for y = 1, VERTICAL_POSITIONS_GRANULARITY do
      if 1 == y or y == VERTICAL_POSITIONS_GRANULARITY or 1 == x or x == HORIZONTAL_POSITIONS_GRANULARITY then
        table.insert(positions, {
          x = origin.x + (x - 1) * width + width * 0.5,
          y = origin.y + (y - 1) * height + height * 0.5
        })
      end
    end
  end
end
local Initialize = function(center, size, onCreatePlayer, onDestroyPlayer, onCreateBullet, onDestroyBullet, onCollision, onGameOver)
  Release()
  worldCenter = center
  worldSize = size
  bullets = {}
  elapse = 0
  bulletIdx = 0
  gameOver = false
  pause = false
  invincibleDuration = 0
  spawnBulletTimer = 0
  spawnBulletTasks = {}
  hp = DEFAULT_HP
  speed = DEFAULT_SPEED
  __oncreateplayer = onCreatePlayer
  __ondestroyplayer = onDestroyPlayer
  __oncreatebullet = onCreateBullet
  __ondestroybullet = onDestroyBullet
  __oncollision = onCollision
  __ongameover = onGameOver
  InitializePositions()
  player = CreatePlayer(center.x, center.y)
  UpdateManager.AddUpdateHandler(OnUpdate)
end
local GetHp = function()
  return hp
end
local GetElapse = function()
  return elapse
end
local Pause = function(flag)
  pause = flag
  if pause then
    for i, bullet in ipairs(bullets) do
      bullet.rigidbody.simulated = false
    end
  else
    for i, bullet in ipairs(bullets) do
      bullet.rigidbody.simulated = true
    end
  end
end
return {
  Release = Release,
  Initialize = Initialize,
  Move = Move,
  GetHp = GetHp,
  GetElapse = GetElapse,
  Pause = Pause
}
