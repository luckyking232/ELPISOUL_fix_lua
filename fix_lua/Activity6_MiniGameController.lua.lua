ld("Physics")
local VertexPath = require("VertexPath")
local GAP = 0
local BALL_RADIUS = 0.24
local BALL_DIAMETER = 2 * BALL_RADIUS
local CLOSE_TERMINAL_DIST_PERCENT = 0.2
local MOVE_FORWARD_SPEED_WHEN_CLOSE_TERMINAL = 0.2
local MOVE_FORWARD_SPEED = 0.5
local INITIAL_NUM = 18
local LAUNCH_SPEED = 8
local INSERT_BALL_DURATION = 0.1
local SPAWN_READY_BALL_INTERVAL = 0.1
local MAX_SPAWN_COUNT = 50
local ENTRANCE_ANIMATION_DURATION = 1.2
local ROLL_TO_END_TERMINAL_DURATION = 0.5
local COMBO_ANIMATION_DURATION_PER_GAP = 0.08
local EFFECT_SPAWN_GAP_MIN = 10
local EFFECT_SPAWN_GAP_MAX = 15
local BOOM_RADIUS = 2
local FREEZE_DURATION = 5
local ROLLBACK_SPEED = 4
local PROBABILITY = {
  PROBABILITY_1 = 0.06,
  PROBABILITY_2 = 0.5,
  PROBABILITY_3 = 0.35,
  PROBABILITY_4 = 0.06,
  PROBABILITY_5 = 0.03
}
PROBABILITY[1] = PROBABILITY.PROBABILITY_5 + PROBABILITY.PROBABILITY_4 + PROBABILITY.PROBABILITY_3 + PROBABILITY.PROBABILITY_2 + PROBABILITY.PROBABILITY_1
PROBABILITY[2] = PROBABILITY.PROBABILITY_5 + PROBABILITY.PROBABILITY_4 + PROBABILITY.PROBABILITY_3 + PROBABILITY.PROBABILITY_2
PROBABILITY[3] = PROBABILITY.PROBABILITY_5 + PROBABILITY.PROBABILITY_4 + PROBABILITY.PROBABILITY_3
PROBABILITY[4] = PROBABILITY.PROBABILITY_5 + PROBABILITY.PROBABILITY_4
PROBABILITY[5] = PROBABILITY.PROBABILITY_5
local EPSILON = 0.01
local ballRadius, allBalls, reusableBalls, bodyBallLookup, nextBall, getReadyPoint, tracks, world, trackIdAllocator, chainIdAllocator, spawnInterval, shootNum, combo, gameOver, hp, elapse, ballTypeRandomList, pause, shootable, shootDirection, bounds
local BALL_STATE = {
  NONE = "NONE",
  READY = "READY",
  LAUNCHING = "LAUNCHING",
  ON_CHAIN = "ON_CHAIN",
  DESTROYED = "DESTROYED"
}
local TRACK_STATE = {
  NONE = "NONE",
  ANIMATION = "ANIMATION",
  MOVE_FORWARD = "MOVE_FORWARD",
  ROLLBACK = "ROLLBACK",
  FINISHED = "FINISHED"
}
local BALL_TYPE = {
  RED = "RED",
  YELLOW = "YELLOW",
  BLUE = "BLUE",
  GREEN = "GREEN"
}
local BALL_TYPE_RANDOM_LIST = {
  [1] = BALL_TYPE.RED,
  [2] = BALL_TYPE.YELLOW,
  [3] = BALL_TYPE.BLUE,
  [4] = BALL_TYPE.GREEN
}
local BALL_EFFECT = {
  NONE = "NONE",
  FREEZE = "FREEZE",
  BOOM = "BOOM",
  ROLLBACK = "ROLLBACK"
}
local BALL_EFFECT_RANDOM_LIST = {
  [1] = BALL_EFFECT.FREEZE,
  [2] = BALL_EFFECT.BOOM,
  [3] = BALL_EFFECT.ROLLBACK
}
local __oncreateball, __ondestroyball, __onupdateball, __onfinished
local CompareDistance = function(x, y)
  return x.dist > y.dist
end
local CompareFirstBallDist = function(x, y)
  return CompareDistance(x.balls[1], y.balls[1])
end
local GetTrack = function(trackId)
  if tracks then
    local index = table.keyof(tracks, trackId, "id")
    if index then
      return tracks[index]
    end
  end
end
local SortChainBalls = function(track)
  local inst
  if type(track) == "table" then
    inst = track
  elseif type(track) == "number" then
    inst = GetTrack(track)
  end
  table.sort(inst.chainBalls, CompareFirstBallDist)
end
local SwitchTrackState = function(track, stateEnum)
  local inst
  if type(track) == "table" then
    inst = track
  elseif type(track) == "number" then
    inst = GetTrack(track)
  end
  if inst.state == stateEnum then
    printError("error switch game state", stateEnum, debug.traceback())
    return
  end
  inst.prevState = inst.state
  inst.state = stateEnum
end
local RevertTrackState = function(track)
  local inst
  if type(track) == "table" then
    inst = track
  elseif type(track) == "number" then
    inst = GetTrack(track)
  end
  if inst.prevState then
    SwitchTrackState(track, inst.prevState)
  end
end
local AddBall = function(ball)
  table.insert(allBalls, ball)
end
local RemoveBall = function(ball)
  local index = table.keyof(allBalls, ball)
  if index then
    table.remove(allBalls, index)
  end
end
local GetBallsByChainId = function(chainBalls, chainId)
  if chainBalls then
    local k = table.keyof(chainBalls, chainId, "chainId")
    if k then
      local chain = chainBalls[k]
      return chain.balls, k
    end
  end
end
local GetBallsByTrackIdAndChainId = function(trackId, chainId)
  local track = GetTrack(trackId)
  if track then
    return GetBallsByChainId(track.chainBalls, chainId)
  end
end
local RemoveChain = function(trackId, chainId)
  local track = GetTrack(trackId)
  local chainBalls = track.chainBalls
  local k = table.keyof(chainBalls, chainId, "chainId")
  if k then
    return table.remove(chainBalls, k)
  end
end
local AddBallToChain = function(trackId, chainId, ball, index)
  local track = GetTrack(trackId)
  local balls = GetBallsByChainId(track.chainBalls, chainId)
  if not balls then
    balls = {}
    table.insert(track.chainBalls, {chainId = chainId, balls = balls})
  end
  if not table.keyof(balls, ball) then
    ball.trackId = trackId
    ball.chainId = chainId
    ball.state = BALL_STATE.ON_CHAIN
    if type(index) == "number" then
      table.insert(balls, index, ball)
    else
      table.insert(balls, ball)
    end
    local prev = false
    for _, v in ipairs(balls) do
      if prev then
        prev.next = v
      end
      v.prev = prev
      prev = v
    end
  end
end
local GetLastChainId = function(trackId)
  local track = GetTrack(trackId)
  local chainBalls = track.chainBalls
  local lastChainId, minDist = -1, math.huge
  for _, entry in ipairs(chainBalls) do
    local balls = entry.balls
    local chainId = entry.chainId
    for _, v in ipairs(balls) do
      if v.dist >= 0 and minDist > v.dist then
        minDist = v.dist
        lastChainId = chainId
      end
    end
  end
  return lastChainId
end
local GetChain = function(track, chainId, nextOrPrev)
  SortChainBalls(track)
  local chainBalls = track.chainBalls
  local chain = GetBallsByChainId(chainBalls, chainId)
  if nextOrPrev then
    local firstOne = chain[1]
    local result
    for _, entry in ipairs(chainBalls) do
      if chainId ~= entry.chainId then
        for _, v in ipairs(entry.balls) do
          if v.dist > firstOne.dist then
            result = entry.chainId
          end
        end
      end
    end
    return result
  else
    local lastOne = chain[#chain]
    for _, entry in ipairs(chainBalls) do
      if chainId ~= entry.chainId then
        for _, v in ipairs(entry.balls) do
          if v.dist < lastOne.dist then
            return entry.chainId
          end
        end
      end
    end
  end
end
local GetDistBetween = function(chainBalls, further, closer)
  local balls0 = GetBallsByChainId(chainBalls, further)
  local balls1 = GetBallsByChainId(chainBalls, closer)
  local lastBall = balls0[#balls0]
  local firstBall = balls1[1]
  local diff = lastBall.dist - firstBall.dist
  return diff
end
local IndexOfBallInChain = function(trackId, chainId, ball)
  local balls = GetBallsByTrackIdAndChainId(trackId, chainId)
  if balls then
    return table.keyof(balls, ball)
  end
end
local MatchBall = function(ball, balls, isInsert)
  if not balls then
    return
  end
  local index = table.keyof(balls, ball)
  local destroyGroup
  local prevCnt, nextCnt = 0, 0
  if index then
    for i = index + 1, #balls do
      if balls[i].type ~= ball.type then
        break
      end
      nextCnt = nextCnt + 1
      destroyGroup = destroyGroup or {}
      table.insert(destroyGroup, balls[i])
    end
    for i = index, 1, -1 do
      if balls[i].type ~= ball.type then
        break
      end
      prevCnt = prevCnt + 1
      destroyGroup = destroyGroup or {}
      table.insert(destroyGroup, balls[i])
    end
    table.sort(destroyGroup, CompareDistance)
  end
  return destroyGroup and #destroyGroup >= 3 and (isInsert or prevCnt > 0 and nextCnt > 0), destroyGroup
end
local MatchBallInChain = function(ball, trackId, chainId, isInsert)
  local balls = GetBallsByTrackIdAndChainId(trackId, chainId)
  if not balls then
    printError("error chainId", debug.traceback())
    return
  end
  return MatchBall(ball, balls, isInsert)
end
local CreateBall = function(x, y, effect, ballType, state)
  local ball
  if reusableBalls and #reusableBalls > 0 then
    ball = table.remove(reusableBalls)
  else
    ball = {}
  end
  local circle = Circle.New(x, y, ballRadius)
  circle:setMass(1)
  circle.damping = 0
  circle.isTrigger = true
  circle:init()
  local body = circle
  body.velX = 0
  body.velY = 0
  ball.dist = -1
  ball.state = state or BALL_STATE.NONE
  ball.prev = false
  ball.next = false
  ball.type = ballType or #ballTypeRandomList > 0 and ballTypeRandomList[math.random(1, #ballTypeRandomList)]
  ball.effect = effect or BALL_EFFECT.NONE
  ball.chainId = false
  ball.trackId = false
  ball.body = body
  ball.destroyed = false
  ball._target_dist = false
  ball._target_point = false
  ball._move_duration = false
  ball._move_speed = false
  ball._move_complete_callback = false
  world:addBody(body)
  bodyBallLookup = bodyBallLookup or {}
  bodyBallLookup[body] = ball
  AddBall(ball)
  if type(__oncreateball) == "function" then
    __oncreateball(ball)
  end
  return ball
end
local SetBallMoveTarget = function(ball, targetPoint, targetDist, duration, callback)
  ball._target_point = targetPoint
  ball._target_dist = targetDist
  ball._move_duration = duration
  ball._move_complete_callback = callback
end
local ResetBallMoveTarget = function(ball)
  SetBallMoveTarget(ball, false, false, false, false)
  ball._move_speed = false
end
local RemoveBallFromChain = function(trackId, chainId, ball)
  local balls, _ = GetBallsByTrackIdAndChainId(trackId, chainId)
  if balls then
    local k = table.keyof(balls, ball)
    local removed = table.remove(balls, k)
    removed.state = BALL_STATE.NONE
    local prev = removed.prev
    if prev then
      prev.next = false
    end
    local next = removed.next
    if next then
      next.prev = false
    end
    removed.prev = false
    removed.next = false
    local removeChain = false
    if not _G.next(balls) then
      RemoveChain(trackId, chainId)
      removeChain = true
    end
    return removed, removeChain
  end
end
local SetBallDist = function(track, ball, dist, awakeBody)
  local path = track.path
  local point = path:GetPointAtDistance(dist, EndOfPathInstruction.STOP)
  ball.body:setPos(point.x, point.y)
  ball.dist = dist
  if awakeBody then
    ball.body:awake()
  end
end
local DestroyBall = function(ball, matched, lose)
  if ball then
    local body = ball.body
    RemoveBall(ball)
    local _, removeChain = RemoveBallFromChain(ball.trackId, ball.chainId, ball)
    world:removeBody(body)
    bodyBallLookup[body] = nil
    ball.state = BALL_STATE.DESTROYED
    if matched then
      local track = GetTrack(ball.trackId)
      if ball.effect == BALL_EFFECT.FREEZE then
        track.freezeDuration = FREEZE_DURATION
      elseif ball.effect == BALL_EFFECT.ROLLBACK then
        track.rollback = true
      end
    end
    if type(__ondestroyball) == "function" then
      __ondestroyball(ball, matched, lose)
    end
    reusableBalls = reusableBalls or {}
    table.insert(reusableBalls, ball)
    return removeChain
  end
end
local nextEffects, nextTypes, nextTypeIndex, nextTypeCnt, prevType
local CreateBallOnChain = function(trackId, chainId, distanceTravelled, ballEffect, ballType)
  local track = GetTrack(trackId)
  if track then
    local pointOnPath = track.path:GetPointAtDistance(distanceTravelled, EndOfPathInstruction.STOP)
    if not ballEffect then
      if track.effectSpawnGap > EFFECT_SPAWN_GAP_MIN + math.random(0, EFFECT_SPAWN_GAP_MAX - EFFECT_SPAWN_GAP_MIN) then
        track.effectSpawnGap = 0
        nextEffects = nextEffects or {}
        if 0 == #nextEffects then
          for _, v in ipairs(BALL_EFFECT_RANDOM_LIST) do
            table.insert(nextEffects, v)
          end
        end
        ballEffect = table.remove(nextEffects, math.random(1, #nextEffects))
      else
        ballEffect = BALL_EFFECT.NONE
      end
    end
    if not ballType then
      nextTypes = nextTypes or {}
      if type(nextTypeCnt) ~= "number" or nextTypeCnt <= 0 then
        local perc = math.random(1, 1000) / 1000
        for i = #PROBABILITY, 1, -1 do
          if perc < PROBABILITY[i] then
            nextTypeCnt = i
            break
          end
        end
        if nextTypeIndex then
          prevType = nextTypes[nextTypeIndex]
          table.remove(nextTypes, nextTypeIndex)
        end
        nextTypeIndex = nil
      end
      if 0 == #nextTypes then
        for _, v in ipairs(ballTypeRandomList) do
          table.insert(nextTypes, v)
        end
      end
      if not nextTypeIndex then
        local randomIndex = math.random(1, #nextTypes)
        while prevType and nextTypes[randomIndex] == prevType do
          randomIndex = math.random(1, #nextTypes)
        end
        nextTypeIndex = randomIndex
      end
      ballType = nextTypes[nextTypeIndex]
      nextTypeCnt = nextTypeCnt - 1
    end
    track.effectSpawnGap = track.effectSpawnGap + 1
    local ball = CreateBall(pointOnPath.x, pointOnPath.y, ballEffect, ballType, BALL_STATE.ON_CHAIN)
    ball.trackId = trackId
    ball.dist = distanceTravelled
    AddBallToChain(trackId, chainId, ball)
    return ball
  end
end
local CutChain = function(trackId, chainId, index)
  local list = GetBallsByTrackIdAndChainId(trackId, chainId)
  if list then
    local len = #list
    if index > 1 and index < len then
      chainIdAllocator = chainIdAllocator + 1
      for i = len, index, -1 do
        local ball = list[i]
        local oldChainId = ball.chainId
        RemoveBallFromChain(trackId, oldChainId, ball)
        local newChainId = chainIdAllocator
        AddBallToChain(trackId, newChainId, ball, 1)
      end
      return chainIdAllocator
    end
    return chainId
  end
end
local ConnectChain = function(track, mainChainId, chainId, autoDistance)
  local chainBalls = track.chainBalls
  local mainBalls = GetBallsByChainId(chainBalls, mainChainId)
  local balls = GetBallsByChainId(chainBalls, chainId)
  if not mainBalls or not balls then
    return
  end
  local trackId = track.id
  local len = #balls
  while len > 0 do
    local ball = balls[1]
    RemoveBallFromChain(trackId, chainId, ball)
    AddBallToChain(trackId, mainChainId, ball)
    len = len - 1
  end
end
local DOTweenConnectChain = function(track, furtherChainId, closerChainId, reverse, callback, duration, awakeBody)
  local chainBalls = track.chainBalls
  local furtherBalls, closerBalls = GetBallsByChainId(chainBalls, furtherChainId), GetBallsByChainId(chainBalls, closerChainId)
  local progress = 0
  if not reverse then
    local numBalls = #closerBalls
    local lastBallDist = furtherBalls[#furtherBalls].dist
    for i, ball in ipairs(closerBalls) do
      local dist = ball.dist
      local targetDist = lastBallDist - i * (BALL_DIAMETER + GAP)
      local tweenId = LeanTween.value(dist, targetDist, duration):setOnUpdate(function(val)
        SetBallDist(track, ball, val)
      end):setOnComplete(function()
        SetBallDist(track, ball, targetDist, awakeBody)
        progress = progress + 1
        if progress >= numBalls then
          ConnectChain(track, furtherChainId, closerChainId)
          if type(callback) == "function" then
            callback()
          end
        end
      end):setEase(LeanTweenType.easeInOutSine).id
      table.insert(track.tweeners, tweenId)
    end
  else
    local numBalls = #furtherBalls
    local firstBallDist = closerBalls[1].dist
    for j = 1, numBalls do
      local ball = furtherBalls[j]
      local dist = ball.dist
      local targetDist = (numBalls - j + 1) * (BALL_DIAMETER + GAP) + firstBallDist
      local tweenId = LeanTween.value(dist, targetDist, duration):setOnUpdate(function(val)
        SetBallDist(track, ball, val)
      end):setOnComplete(function()
        SetBallDist(track, ball, targetDist, awakeBody)
        progress = progress + 1
        if progress >= numBalls then
          ConnectChain(track, furtherChainId, closerChainId)
          if type(callback) == "function" then
            callback()
          end
        end
      end):setEase(LeanTweenType.easeInOutSine).id
      table.insert(track.tweeners, tweenId)
    end
  end
end
local RollToEnd = function(track, callback)
  local totalBalls = 0
  local chainBalls = track.chainBalls
  local numChains = #chainBalls
  for i = 1, numChains do
    local entry = chainBalls[i]
    local numBalls = #entry.balls
    totalBalls = totalBalls + numBalls
  end
  if totalBalls > 0 then
    SwitchTrackState(track, TRACK_STATE.ANIMATION)
    local progress = 0
    local numTweens = 0
    local DOTweenConnect, DOTweenRollToEnd
    
    function DOTweenRollToEnd()
      local offsetIndex = 0
      local numChains = #chainBalls
      for i = 1, numChains do
        local entry = chainBalls[i]
        local balls = entry.balls
        local numBalls = #balls
        local path = track.path
        local pathLength = path.length
        for j = 1, numBalls do
          numTweens = numTweens + 1
          local ball = balls[j]
          local index = offsetIndex + j
          local targetDist = pathLength + (totalBalls - index) * (BALL_DIAMETER + GAP)
          local dist = ball._target_dist and ball._target_dist or ball.dist
          local diff = targetDist - dist
          local duration = diff / 10 * ROLL_TO_END_TERMINAL_DURATION
          local tweenId
          tweenId = LeanTween.value(dist, targetDist, duration):setOnUpdate(function(val)
            SetBallDist(track, ball, val)
            if val >= pathLength - EPSILON then
              LeanTween.cancel(tweenId)
              DestroyBall(ball)
              progress = progress + 1
              if progress >= numTweens then
                table.clear(track.tweeners)
                if callback then
                  callback()
                end
              end
            end
          end).id
          table.insert(track.tweeners, tweenId)
        end
        offsetIndex = offsetIndex + numBalls
      end
    end
    
    if numChains > 1 then
      function DOTweenConnect()
        if #chainBalls <= 1 then
          DOTweenRollToEnd()
          
          return
        end
        SortChainBalls(track)
        local prevChain, nextChain = chainBalls[#chainBalls - 1], chainBalls[#chainBalls]
        local firstBall, lastBall = nextChain.balls[1], prevChain.balls[#prevChain.balls]
        local diff = (lastBall._target_dist and lastBall._target_dist or lastBall.dist) - (firstBall._target_dist and firstBall._target_dist or firstBall.dist)
        local duration = diff / 10 * ROLL_TO_END_TERMINAL_DURATION
        DOTweenConnectChain(track, prevChain.chainId, nextChain.chainId, false, function()
          DOTweenConnect(1)
        end, duration)
      end
      
      DOTweenConnect()
    else
      DOTweenRollToEnd()
    end
  elseif callback then
    callback()
  end
end
local FindBall = function(body)
  if allBalls then
    local k = table.keyof(allBalls, body, "body")
    if k then
      return allBalls[k], k
    end
  end
end
local CalculateFrontBallForProjectile = function(track, projectile, collideBall, collidingChain)
  local path = track.path
  local projectileBody, collideBody = projectile.body, collideBall.body
  local position = Vector3((projectileBody.x + collideBody.x) * 0.5, (projectileBody.y + collideBody.y) * 0.5, path.transform.position.z)
  local dist = path:GetClosestDistanceAlongPath(position)
  local frontBallIndex = -1
  local head = collidingChain[1]
  local headDist = head.dist >= 0 and head.dist or head._target_dist
  if dist > headDist then
    return true, frontBallIndex
  end
  local chainBallsCnt = #collidingChain
  for i = 2, chainBallsCnt do
    local prev = collidingChain[i - 1]
    local cur = collidingChain[i]
    local prevDist = prev.dist > 0 and prev.dist or prev._target_dist
    local curDist = cur.dist > 0 and cur.dist or cur._target_dist
    if dist <= prevDist and dist >= curDist then
      frontBallIndex = i - 1
      return true, frontBallIndex
    end
  end
  frontBallIndex = chainBallsCnt
  return true, frontBallIndex
end
local DestroyBallAndCutChain = function(ball)
  local trackId = ball.trackId
  local oldChainId = ball.chainId
  local indexOfChain = IndexOfBallInChain(trackId, oldChainId, ball)
  if not indexOfChain then
    return
  end
  local newChainId = CutChain(trackId, oldChainId, indexOfChain)
  local indexOfNewChain = IndexOfBallInChain(trackId, newChainId, ball)
  local lastChainId = CutChain(trackId, newChainId, indexOfNewChain + 1)
  DestroyBall(ball, true)
  return lastChainId
end

local function CollectBoomBall(ball, radius, buffer)
  if table.keyof(buffer, ball) then
    return
  end
  if ball.state == BALL_STATE.ON_CHAIN then
    table.insert(buffer, ball)
  end
  local body = ball.body
  local cx, cy = body.x, body.y
  local sqrR = radius ^ 2
  for _, v in ipairs(allBalls) do
    local vb = v.body
    local x, y = vb.x, vb.y
    local sqrDist = (cx - x) ^ 2 + (cy - y) ^ 2
    if v ~= ball and v.trackId == ball.trackId and v.state == BALL_STATE.ON_CHAIN and sqrR >= sqrDist and not table.keyof(buffer, v) then
      table.insert(buffer, v)
      if v.effect == BALL_EFFECT.BOOM then
        CollectBoomBall(v, BOOM_RADIUS, buffer)
      end
    end
  end
end

local function DestroyMatchedBalls(track, matchedBalls)
  combo = combo + 1
  local extraBoomBalls
  for _, ball in ipairs(matchedBalls) do
    DestroyBallAndCutChain(ball)
  end
  for _, ball in ipairs(matchedBalls) do
    if ball.effect == BALL_EFFECT.BOOM then
      extraBoomBalls = extraBoomBalls or {}
      CollectBoomBall(ball, BOOM_RADIUS, extraBoomBalls)
    end
  end
  if extraBoomBalls then
    for _, ball in ipairs(extraBoomBalls) do
      DestroyBallAndCutChain(ball)
    end
  end
  SortChainBalls(track)
  local chainBalls = track.chainBalls
  local numChains = #chainBalls
  local ballsBuffer = {}
  for i = 1, numChains do
    local nextI = i + 1
    if numChains < nextI then
      break
    end
    local prevChainId, nextChainId = chainBalls[i].chainId, chainBalls[nextI].chainId
    local prevBalls, nextBalls = GetBallsByChainId(chainBalls, prevChainId), GetBallsByChainId(chainBalls, nextChainId)
    local matchedBall
    table.clear(ballsBuffer)
    for _, v in ipairs(prevBalls) do
      table.insert(ballsBuffer, v)
      matchedBall = v
    end
    for _, v in ipairs(nextBalls) do
      table.insert(ballsBuffer, v)
    end
    local result, destroyGroup = MatchBall(matchedBall, ballsBuffer)
    if result then
      SwitchTrackState(track, TRACK_STATE.ANIMATION)
      local lastBall = prevBalls[#prevBalls]
      local firstBall = nextBalls[1]
      local diff = lastBall.dist - firstBall.dist
      local duration = math.min(math.max(diff / (BALL_DIAMETER + GAP) * COMBO_ANIMATION_DURATION_PER_GAP, COMBO_ANIMATION_DURATION_PER_GAP), 0.35)
      DOTweenConnectChain(track, prevChainId, nextChainId, true, function()
        RevertTrackState(track)
        DestroyMatchedBalls(track, destroyGroup)
      end, duration, true)
      break
    end
  end
end

local InsertProjectileBall = function(projectile, collidingTrackId, collidingChainId, collidingChain, frontBallIndex)
  local track = GetTrack(collidingTrackId)
  local onCompleted = function()
    local chainId = projectile.chainId
    local destroy, destroyGroup = MatchBallInChain(projectile, collidingTrackId, chainId, true)
    if destroyGroup and #destroyGroup >= 1 then
      local firstBall, lastBall = destroyGroup[1], destroyGroup[#destroyGroup]
      local chainBalls = track.chainBalls
      local furtherChainId, closerChainId
      if not firstBall.prev then
        furtherChainId = GetChain(track, firstBall.chainId, true)
        if furtherChainId then
          local furtherChainBalls = GetBallsByChainId(chainBalls, furtherChainId)
          local buffer = {}
          local matchBall
          for _, v in ipairs(furtherChainBalls) do
            matchBall = v
            table.insert(buffer, v)
          end
          for _, v in ipairs(destroyGroup) do
            table.insert(buffer, v)
          end
          local result, balls = MatchBall(matchBall, buffer)
          if result then
            for _, v in ipairs(balls) do
              if not table.keyof(destroyGroup, v) then
                table.insert(destroyGroup, v)
              end
            end
          else
            furtherChainId = nil
          end
        end
      end
      if not lastBall.next then
        closerChainId = GetChain(track, firstBall.chainId, false)
        if closerChainId then
          local closerChainBalls = GetBallsByChainId(chainBalls, closerChainId)
          local buffer = {}
          for _, v in ipairs(destroyGroup) do
            table.insert(buffer, v)
          end
          for _, v in ipairs(closerChainBalls) do
            table.insert(buffer, v)
          end
          local result, balls = MatchBall(lastBall, buffer)
          if result then
            for _, v in ipairs(balls) do
              if not table.keyof(destroyGroup, v) then
                table.insert(destroyGroup, v)
              end
            end
          else
            closerChainId = nil
          end
        end
      end
      if furtherChainId and closerChainId then
        local diff0 = GetDistBetween(chainBalls, furtherChainId, chainId)
        local diff1 = GetDistBetween(chainBalls, chainId, closerChainId)
        local duration0 = math.min(math.max(diff0 / (BALL_DIAMETER + GAP) * COMBO_ANIMATION_DURATION_PER_GAP, COMBO_ANIMATION_DURATION_PER_GAP), 0.35)
        local duration1 = math.min(math.max(diff1 / (BALL_DIAMETER + GAP) * COMBO_ANIMATION_DURATION_PER_GAP, COMBO_ANIMATION_DURATION_PER_GAP), 0.35)
        SwitchTrackState(track, TRACK_STATE.ANIMATION)
        DOTweenConnectChain(track, furtherChainId, chainId, true, function()
          DOTweenConnectChain(track, furtherChainId, closerChainId, true, function()
            RevertTrackState(track)
            DestroyMatchedBalls(track, destroyGroup)
          end, duration1, true)
        end, duration0, true)
      elseif furtherChainId then
        local diff0 = GetDistBetween(chainBalls, furtherChainId, chainId)
        local duration0 = math.min(math.max(diff0 / (BALL_DIAMETER + GAP) * COMBO_ANIMATION_DURATION_PER_GAP, COMBO_ANIMATION_DURATION_PER_GAP), 0.35)
        SwitchTrackState(track, TRACK_STATE.ANIMATION)
        DOTweenConnectChain(track, furtherChainId, chainId, true, function()
          RevertTrackState(track)
          DestroyMatchedBalls(track, destroyGroup)
        end, duration0, true)
      elseif closerChainId then
        local diff1 = GetDistBetween(chainBalls, chainId, closerChainId)
        local duration1 = math.min(math.max(diff1 / (BALL_DIAMETER + GAP) * COMBO_ANIMATION_DURATION_PER_GAP, COMBO_ANIMATION_DURATION_PER_GAP), 0.35)
        SwitchTrackState(track, TRACK_STATE.ANIMATION)
        DOTweenConnectChain(track, chainId, closerChainId, true, function()
          RevertTrackState(track)
          DestroyMatchedBalls(track, destroyGroup)
        end, duration1, true)
      elseif destroy then
        DestroyMatchedBalls(track, destroyGroup)
      end
    end
  end
  local dist, moveDuration
  local path = track.path
  if -1 == frontBallIndex then
    frontBallIndex = 0
    local head = collidingChain[1]
    local headDist = head.dist >= 0 and head.dist or head._target_dist
    dist = headDist + (BALL_DIAMETER + GAP)
    moveDuration = 0.5 * INSERT_BALL_DURATION
  else
    local frontBall = collidingChain[frontBallIndex]
    local frontBallDist = frontBall.dist > 0 and frontBall.dist or frontBall._target_dist
    dist = frontBallDist
    moveDuration = INSERT_BALL_DURATION
    for i = 1, frontBallIndex do
      local ball = collidingChain[i]
      local targetDist = dist + (BALL_DIAMETER + GAP) * (frontBallIndex - i + 1)
      local targetPoint = path:GetPointAtDistance(targetDist, EndOfPathInstruction.STOP)
      local callback = ball._move_complete_callback
      ResetBallMoveTarget(ball)
      SetBallMoveTarget(ball, targetPoint, targetDist, moveDuration, callback)
    end
  end
  local point = path:GetPointAtDistance(dist, EndOfPathInstruction.STOP)
  local body = projectile.body
  body.velX = 0
  body.velY = 0
  ResetBallMoveTarget(projectile)
  SetBallMoveTarget(projectile, point, dist, moveDuration, onCompleted)
  AddBallToChain(collidingTrackId, collidingChainId, projectile, frontBallIndex + 1)
end
local ConvertProjectileToBalls = function(projectile, collideBall)
  local collidingTrackId, collidingChainId = collideBall.trackId, collideBall.chainId
  local track = GetTrack(collidingTrackId)
  if track.state == TRACK_STATE.ANIMATION then
    return
  end
  local collidingChain = GetBallsByChainId(track.chainBalls, collidingChainId)
  local result, frontBallIndex = CalculateFrontBallForProjectile(track, projectile, collideBall, collidingChain)
  if result then
    InsertProjectileBall(projectile, collidingTrackId, collidingChainId, collidingChain, frontBallIndex)
  else
    printError("Failed to define where in balls should insert ball. Couldn't find from ball")
  end
end
local Collide = function(bodyA, bodyB)
  local ballA, _ = FindBall(bodyA)
  local ballB, _ = FindBall(bodyB)
  if ballA and ballB then
    if ballA.state == BALL_STATE.NONE or ballB.state == BALL_STATE.NONE or ballA.state == BALL_STATE.READY or ballB.state == BALL_STATE.READY or ballA.state == BALL_STATE.DESTROYED or ballB.state == BALL_STATE.DESTROYED then
      return
    end
    if ballA.state ~= BALL_STATE.LAUNCHING and ballB.state ~= BALL_STATE.LAUNCHING and type(ballA.chainId) == "number" and type(ballB.chainId) == "number" and "number" == type(ballA.trackId) and "number" == type(ballB.trackId) and ballA.trackId == ballB.trackId and ballA.chainId ~= ballB.chainId then
      local a_greater_b = ballA.dist > ballB.dist
      local first = a_greater_b and ballA or ballB
      local second = a_greater_b and ballB or ballA
      if first.next or second.pre then
        return
      end
      local furtherChainId, closerChainId = first.chainId, second.chainId
      local trackId = first.trackId
      local track = GetTrack(trackId)
      local path = track.path
      local furtherBalls = GetBallsByChainId(track.chainBalls, furtherChainId)
      local furtherBallsLen = #furtherBalls
      local furtherChainLastBall = furtherBalls[furtherBallsLen]
      ConnectChain(track, furtherChainId, closerChainId, false)
      local tailChainFirstBall = furtherBalls[furtherBallsLen + 1]
      local flag = false
      for i = furtherBallsLen + 1, #furtherBalls do
        local ball = furtherBalls[i]
        local targetDist = ball._target_dist
        local targetPoint = ball._target_point
        local moveDuration = ball._move_duration
        if targetDist and targetPoint and moveDuration then
          flag = true
          break
        end
      end
      local dist = tailChainFirstBall._target_dist or tailChainFirstBall.dist
      for i = 1, furtherBallsLen do
        local ball = furtherBalls[i]
        local targetDist = dist + (furtherBallsLen - i + 1) * (BALL_DIAMETER + GAP)
        local diff = math.abs(targetDist - (ball._target_dist or ball.dist))
        if diff > EPSILON then
          flag = true
          local moveDuration = diff / (BALL_DIAMETER + GAP) * INSERT_BALL_DURATION
          local targetPoint = path:GetPointAtDistance(targetDist, EndOfPathInstruction.STOP)
          ResetBallMoveTarget(ball)
          SetBallMoveTarget(ball, targetPoint, targetDist, moveDuration)
        end
      end
      return
    end
    if ballA.state ~= ballB.state and ballA.state ~= BALL_STATE.NONE and ballB.state ~= BALL_STATE.NONE and (ballA.state == BALL_STATE.LAUNCHING or ballB.state == BALL_STATE.LAUNCHING) then
      local projectile = ballA.state == BALL_STATE.LAUNCHING and ballA or ballB
      local collideBall = ballA.state == BALL_STATE.LAUNCHING and ballB or ballA
      ConvertProjectileToBalls(projectile, collideBall)
    end
  end
end
local onColliding = function(_, bodyA, bodyB, arbiter, timeStep)
  Collide(bodyA, bodyB)
end
local onCollided = function(_, bodyA, bodyB, arbiter, timeStep)
  Collide(bodyA, bodyB)
end
local onSeparated = function(_, bodyA, bodyB, timeStep)
end
local typesBuffer
local CreateNextBall = function()
  if not nextBall then
    local allTrackSpawnFinished = true
    for _, track in ipairs(tracks) do
      if track.spawnCnt > 0 then
        allTrackSpawnFinished = false
        break
      end
    end
    if allTrackSpawnFinished then
      typesBuffer = typesBuffer or {}
      table.clear(typesBuffer)
      for _, track in ipairs(tracks) do
        local spawnPool = track.spawnPool
        local chainBalls = track.chainBalls
        if spawnPool then
          for _, record in ipairs(spawnPool) do
            if not table.keyof(typesBuffer, record.type) then
              table.insert(typesBuffer, record.type)
            end
          end
        end
        for _, entry in ipairs(chainBalls) do
          local balls = entry.balls
          for _, ball in ipairs(balls) do
            if not table.keyof(typesBuffer, ball.type) then
              table.insert(typesBuffer, ball.type)
            end
          end
        end
      end
      if #typesBuffer ~= #ballTypeRandomList then
        table.clear(ballTypeRandomList)
        for _, v in ipairs(typesBuffer) do
          table.insert(ballTypeRandomList, v)
        end
      end
    end
    local point = getReadyPoint()
    local ball = CreateBall(point.x, point.y, BALL_EFFECT.NONE, nil, BALL_STATE.READY)
    nextBall = ball
  end
end
local Shoot = function(direction)
  if not shootable or shootNum <= 0 or hp <= 0 or gameOver then
    return false
  end
  if nextBall then
    combo = 0
    local point = getReadyPoint()
    nextBall.body:setPos(point.x, point.y)
    shootNum = math.max(0, shootNum - 1)
    local velocity = direction.normalized * LAUNCH_SPEED
    nextBall.body.velX = velocity.x
    nextBall.body.velY = velocity.y
    nextBall.state = BALL_STATE.LAUNCHING
    nextBall = nil
    return true
  end
end
local MoveAnimation = function(track, deltaTime)
  local finished = true
  local chainBalls = track.chainBalls
  for _, entry in ipairs(chainBalls) do
    local balls = entry.balls
    for _, ball in ipairs(balls) do
      if ball._target_dist and ball._target_point and ball._move_duration then
        local body = ball.body
        local x, y = body.x, body.y
        local tx, ty = ball._target_point.x, ball._target_point.y
        local sqrDist = (tx - x) ^ 2 + (ty - y) ^ 2
        local point
        if sqrDist > EPSILON then
          body:awake()
          if ball.dist and ball.dist >= 0 then
            if not ball._move_speed then
              ball._move_speed = math.abs(ball._target_dist - ball.dist) / ball._move_duration
            end
            local dist = Mathf.MoveTowards(ball.dist, ball._target_dist, ball._move_speed * deltaTime)
            point = track.path:GetPointAtDistance(dist, EndOfPathInstruction.STOP)
            ball.dist = dist
          else
            local pos = Vector3(x, y, 0)
            if not ball._move_speed then
              ball._target_point.z = 0
              ball._move_speed = (ball._target_point - pos) / ball._move_duration.magnitude
            end
            local delta = ball._move_speed * deltaTime
            point = Vector3.MoveTowards(pos, ball._target_point, delta)
          end
          body:setPos(point.x, point.y)
          ball._move_duration = math.max(0, ball._move_duration - deltaTime)
          finished = false
        else
          ball.dist = ball._target_dist
          ball.body:setPos(ball._target_point.x, ball._target_point.y)
          ball._target_dist = false
          ball._target_point = false
          ball._move_duration = false
        end
      end
    end
  end
  if finished then
    for _, entry in ipairs(chainBalls) do
      local balls = entry.balls
      for _, ball in ipairs(balls) do
        local callback = ball._move_complete_callback
        if type(callback) == "function" then
          callback()
          ResetBallMoveTarget(ball)
        end
      end
    end
  end
  return finished
end
local MoveChain = function(track, chainId, speed)
  local balls = GetBallsByChainId(track.chainBalls, chainId)
  if balls then
    for _, ball in ipairs(balls) do
      local dist = ball.dist + speed
      ball.dist = dist
      if ball.dist > 0 then
        local point = track.path:GetPointAtDistance(dist, EndOfPathInstruction.STOP)
        ball.body:setPos(point.x, point.y)
        ball.body:awake()
      else
        ball.body.sleeping = true
      end
    end
  end
end
local CheckAndSpawnBall = function(track)
  local trackId = track.id
  local chainBalls = track.chainBalls
  local lastChainId = GetLastChainId(trackId)
  local restart, dist
  if lastChainId >= 0 then
    local balls = GetBallsByChainId(chainBalls, lastChainId)
    local lastBall = balls[#balls]
    local diff = lastBall.dist - BALL_DIAMETER
    if diff < 0 then
      return
    end
    local count = diff / BALL_DIAMETER
    dist = diff
    restart = count > 1.1
  else
    restart = true
  end
  local spawnPool = track.spawnPool
  if spawnPool and _G.next(spawnPool) then
    local len = #spawnPool
    if len > 0 then
      if restart then
        chainIdAllocator = chainIdAllocator + 1
        lastChainId = chainIdAllocator
        dist = 0
      end
      local record = table.remove(spawnPool)
      CreateBallOnChain(trackId, lastChainId, dist, record.effect, record.type)
      len = len - 1
    end
  elseif track.spawnCnt > 0 then
    if restart then
      chainIdAllocator = chainIdAllocator + 1
      lastChainId = chainIdAllocator
      dist = 0
    end
    CreateBallOnChain(trackId, lastChainId, dist)
    track.spawnCnt = track.spawnCnt - 1
  end
end
local DestroyAndPoolBall = function(track)
  local chainBalls = track.chainBalls
  local spawnPool = track.spawnPool
  spawnPool = spawnPool or {}
  for _, entry in pairs(chainBalls) do
    local balls = entry.balls
    local len = #balls
    for i = len, 1, -1 do
      local ball = balls[i]
      if ball.dist <= 0 then
        table.insert(spawnPool, {
          type = ball.type,
          effect = ball.effect
        })
        DestroyBall(ball)
      end
    end
  end
  track.spawnPool = spawnPool
end
local Intersects = function(minX, maxX, minY, maxY)
  local max, min = bounds.max, bounds.min
  return maxX >= min.x and minX <= max.x and maxY >= min.y and minY <= max.y
end
local CheckAndDestroyBall = function(track)
  local path = track.path
  local chainBalls = track.chainBalls
  local length = path.length
  for _, entry in ipairs(chainBalls) do
    for _, ball in ipairs(entry.balls) do
      if length <= ball.dist then
        hp = math.max(0, hp - 1)
        DestroyBall(ball, false, true)
      end
    end
  end
end
local CheckAndShootBall = function()
end
local DestroyOutOfBoundsBalls = function()
  for i = #allBalls, 1, -1 do
    local v = allBalls[i]
    if v.state == BALL_STATE.LAUNCHING then
      local box = v.body.aabb
      local minX, maxX = box[1], box[3]
      local minY, maxY = box[2], box[4]
      if not Intersects(minX, maxX, minY, maxY) then
        DestroyBall(v)
      end
    end
  end
end
local AllTrackFinished = function()
  for _, track in ipairs(tracks) do
    if track.state ~= TRACK_STATE.FINISHED then
      return false
    end
  end
  return true
end
local CheckFinished = function(track)
  if not gameOver then
    local remainBalls = 0
    for _, v in ipairs(tracks) do
      local chainBalls = v.chainBalls
      for _, entry in ipairs(chainBalls) do
        local balls = entry.balls
        local numBalls = #balls
        if numBalls > 0 then
          for _, ball in ipairs(allBalls) do
            if ball.state == BALL_STATE.LAUNCHING then
              return
            end
          end
        end
        remainBalls = remainBalls + numBalls
      end
      remainBalls = remainBalls + (v.spawnCnt or 0) + (v.spawnPool and #v.spawnPool or 0)
    end
    local finished = 0 == remainBalls or hp <= 0 or shootNum <= 0
    if finished then
      local dotween
      local win = remainBalls <= hp
      shootable = false
      if #track.chainBalls > 0 then
        dotween = true
        RollToEnd(track, function()
          SwitchTrackState(track, TRACK_STATE.FINISHED)
          if AllTrackFinished() then
            gameOver = true
            __onfinished(win)
          end
        end)
      end
      if not dotween then
        SwitchTrackState(track, TRACK_STATE.FINISHED)
        if AllTrackFinished() then
          gameOver = true
          __onfinished(win)
        end
      end
    end
  end
end
local UpdateNextBallPosition = function()
  if nextBall then
    local point = getReadyPoint()
    nextBall.body:setPos(point.x, point.y)
    nextBall.body:awake()
  end
end
local Execute = function(deltaTime)
  for _, track in ipairs(tracks) do
    local trackId = track.id
    local trackState = track.state
    local chainBalls = track.chainBalls
    local freezeDuration = track.freezeDuration
    local path = track.path
    if trackState == TRACK_STATE.MOVE_FORWARD then
      if track.rollback then
        track.rollback = false
        SortChainBalls(track)
        if _G.next(chainBalls) then
          local ball = chainBalls[1].balls[1]
          local diff = ball.dist - track.initialNumBalls * (BALL_DIAMETER + GAP)
          if diff > 0 then
            track.rollbackDuration = diff / ROLLBACK_SPEED
            track.state = TRACK_STATE.ROLLBACK
            track.soundEvent = SoundManager:PlaySfxSound("event:/sfx/sfx_ui/ui_sys/sfx_zuma_sk_reverse", "bank:/sfx/sfx_ui/ui_sys/ui_sys")
            return
          end
        end
      end
      if world then
        world:step(deltaTime)
      end
      if type(freezeDuration) == "number" and freezeDuration > 0 then
        freezeDuration = math.max(0, freezeDuration - deltaTime)
        track.freezeDuration = freezeDuration
      end
      if MoveAnimation(track, deltaTime) then
        if type(freezeDuration) ~= "number" or freezeDuration <= 0 then
          local lastChainId = GetLastChainId(trackId)
          local balls = GetBallsByChainId(chainBalls, lastChainId)
          local speed = MOVE_FORWARD_SPEED
          if balls then
            local diff = path.length - balls[1].dist
            if diff <= CLOSE_TERMINAL_DIST_PERCENT * path.length then
              speed = MOVE_FORWARD_SPEED_WHEN_CLOSE_TERMINAL
            end
          end
          MoveChain(track, lastChainId, speed * deltaTime)
          CheckAndSpawnBall(track)
        end
        if track.state ~= TRACK_STATE.ANIMATION then
          CheckFinished(track)
        end
        CheckAndDestroyBall(track)
      end
    elseif trackState == TRACK_STATE.ROLLBACK then
      local rollbackDuration = track.rollbackDuration
      if type(rollbackDuration) ~= "number" or rollbackDuration <= 0 then
        track.state = TRACK_STATE.MOVE_FORWARD
        track.soundEvent = nil
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_sk_reverse_stop")
        return
      end
      track.rollbackDuration = rollbackDuration - deltaTime
      if world then
        world:step(deltaTime)
      end
      if type(freezeDuration) == "number" and freezeDuration > 0 then
        freezeDuration = math.max(0, freezeDuration - deltaTime)
        track.freezeDuration = freezeDuration
      end
      if MoveAnimation(track, deltaTime) then
        SortChainBalls(track)
        local numChains = #chainBalls
        if numChains > 0 then
          local firstChainId = chainBalls[1].chainId
          MoveChain(track, firstChainId, -ROLLBACK_SPEED * deltaTime)
        end
        DestroyAndPoolBall(track)
        if track.state ~= TRACK_STATE.ANIMATION then
          CheckFinished(track)
        end
        CheckAndDestroyBall(track)
      end
    end
  end
  UpdateNextBallPosition()
  DestroyOutOfBoundsBalls()
end
local Update = function()
  if type(__onupdateball) == "function" then
    for _, ball in ipairs(allBalls) do
      local indexOfChain = IndexOfBallInChain(ball.trackId, ball.chainId, ball)
      local track = GetTrack(ball.trackId)
      local freezing = track and type(track.freezeDuration) == "number" and track.freezeDuration > 0
      __onupdateball(ball, freezing, indexOfChain)
    end
  end
end
local FixedUpdate = function()
  if pause then
    return
  end
  local iterations = 1
  local deltaTime = Time.fixedDeltaTime / iterations
  elapse = elapse + deltaTime
  for _ = 1, iterations do
    Execute(deltaTime)
  end
  if not nextBall and not gameOver and shootNum > 0 then
    spawnInterval = (spawnInterval or 0) + deltaTime
    if spawnInterval > SPAWN_READY_BALL_INTERVAL then
      CreateNextBall()
      spawnInterval = 0
    end
  end
end
local CreateTrack = function(id, path, maxSpawnCount, initialNumBalls)
  local track = {
    id = id,
    path = path,
    state = TRACK_STATE.NONE,
    prevState = false,
    spawnCnt = maxSpawnCount,
    spawnPool = false,
    chainBalls = {},
    tweeners = {},
    freezeDuration = false,
    rollback = false,
    rollbackDuration = false,
    initialNumBalls = initialNumBalls,
    effectSpawnGap = 0
  }
  table.insert(tracks, track)
  local progress = 0
  SwitchTrackState(track, TRACK_STATE.ANIMATION)
  for i = 1, initialNumBalls do
    local targetDist = (initialNumBalls - i) * (BALL_DIAMETER + GAP)
    local dist = -(i - 1) * (BALL_DIAMETER + GAP)
    local ball = CreateBallOnChain(id, chainIdAllocator, dist)
    local tweenId
    tweenId = LeanTween.value(dist, targetDist, ENTRANCE_ANIMATION_DURATION):setOnUpdate(function(val)
      SetBallDist(track, ball, val)
    end):setOnComplete(function()
      SetBallDist(track, ball, targetDist)
      progress = progress + 1
      if progress >= initialNumBalls then
        table.clear(track.tweeners)
        SwitchTrackState(track, TRACK_STATE.MOVE_FORWARD)
        shootable = true
      end
    end):setEase(LeanTweenType.easeInOutQuad).id
    table.insert(track.tweeners, tweenId)
  end
  chainIdAllocator = chainIdAllocator + 1
end
local Initialize = function(dataPath, position)
  local bytes = ResourceManager.LoadTextAssetBytes(dataPath)
  local stream = CS.ReadWriteStream(bytes)
  local numTracks = stream:ReadInt32()
  local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
  ballRadius = BALL_RADIUS * scale
  spawnInterval = SPAWN_READY_BALL_INTERVAL
  for i = 1, numTracks do
    local go = GameObject(string.format("TRACK%s", i))
    local transform = go.transform
    transform.position = position
    local pathBytes = stream:ReadBytes()
    local path = VertexPath.New(transform, pathBytes)
    transform.localScale = Vector3.one * scale
    CreateTrack(trackIdAllocator, path, math.floor(MAX_SPAWN_COUNT / numTracks), math.floor(INITIAL_NUM / numTracks))
    trackIdAllocator = trackIdAllocator + 1
  end
  bounds = CS.UnityEngine.Bounds(Vector3.negativeInfinity, Vector3.negativeInfinity)
  for _, track in ipairs(tracks) do
    local path = track.path
    for i, _ in ipairs(path.localPoints) do
      bounds:Encapsulate(path:GetPoint(i))
    end
  end
  bounds:Expand(Vector3(10, 5))
end
local Reset = function()
  if tracks then
    for _, track in ipairs(tracks) do
      if track.tweeners then
        for _, v in ipairs(track.tweeners) do
          LeanTween.cancel(v)
        end
      end
      local pathTransform = track.path.transform
      if pathTransform then
        CS.UnityEngine.Object.Destroy(pathTransform.gameObject)
      end
    end
  end
  pause = false
  shootable = false
  elapse = 0
  allBalls = {}
  tracks = {}
  reusableBalls = {}
  bodyBallLookup = {}
  trackIdAllocator = 0
  chainIdAllocator = 0
  nextBall = nil
  combo = 0
  gameOver = false
  nextEffects = nil
  nextTypes = nil
  nextTypeIndex = nil
  nextTypeCnt = nil
end
local StartGame = function(dataPath, position, getReadPointFunc, rdmBallsType, maxSpawn, moveSpeed, effSpawnGap)
  Reset()
  getReadyPoint = getReadPointFunc
  world = World.New(onColliding, onCollided, onSeparated)
  world.gravityY = 0
  rdmBallsType = rdmBallsType or 4
  ballTypeRandomList = {}
  for _, v in ipairs(BALL_TYPE_RANDOM_LIST) do
    table.insert(ballTypeRandomList, v)
  end
  local diff = #ballTypeRandomList - rdmBallsType
  for _ = 1, diff do
    table.remove(ballTypeRandomList, math.random(1, #ballTypeRandomList))
  end
  MAX_SPAWN_COUNT = maxSpawn or MAX_SPAWN_COUNT
  MOVE_FORWARD_SPEED = moveSpeed or MOVE_FORWARD_SPEED
  if type(effSpawnGap) == "number" then
    EFFECT_SPAWN_GAP_MIN = effSpawnGap
    EFFECT_SPAWN_GAP_MAX = effSpawnGap + 5
  elseif "table" == type(effSpawnGap) then
    EFFECT_SPAWN_GAP_MIN = effSpawnGap[1]
    EFFECT_SPAWN_GAP_MAX = effSpawnGap[2]
  end
  Initialize(dataPath, position)
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.RemoveUpdateHandler(FixedUpdate)
  UpdateManager.AddUpdateHandler(Update)
  UpdateManager.AddUpdateHandler(FixedUpdate)
end
local Release = function()
  UpdateManager.RemoveUpdateHandler(Update)
  UpdateManager.RemoveUpdateHandler(FixedUpdate)
  if tracks then
    for _, track in ipairs(tracks) do
      if track.tweeners then
        for _, v in ipairs(track.tweeners) do
          LeanTween.cancel(v)
        end
      end
      if track.soundEvent then
        SoundUtil.StopSoundEvent(track.soundEvent)
        track.soundEvent = nil
      end
      local pathTransform = track.path.transform
      if pathTransform then
        CS.UnityEngine.Object.Destroy(pathTransform.gameObject)
      end
    end
  end
  tracks = nil
  allBalls = nil
  reusableBalls = nil
  bodyBallLookup = nil
end
local SetCallback = function(onCreate, onDestroy, onUpdate, onFinished)
  __oncreateball = onCreate
  __ondestroyball = onDestroy
  __onupdateball = onUpdate
  __onfinished = onFinished
end
local SetShootNum = function(val)
  shootNum = val
end
local GetShootNum = function()
  return shootNum
end
local SetHp = function(val)
  hp = val
end
local GetHp = function()
  return hp
end
local GetCombo = function()
  return combo
end
local GetElapse = function()
  return elapse
end
local GetNumTracks = function()
  return #tracks
end
local Pause = function(isPause)
  pause = isPause
  if tracks then
    local func = pause and LeanTween.pause or LeanTween.resume
    for _, track in ipairs(tracks) do
      if track.tweeners then
        for _, v in ipairs(track.tweeners) do
          func(v)
        end
      end
    end
  end
end
return {
  StartGame = StartGame,
  Release = Release,
  Shoot = Shoot,
  CreateNextBall = CreateNextBall,
  SetCallback = SetCallback,
  SetShootNum = SetShootNum,
  GetShootNum = GetShootNum,
  SetHp = SetHp,
  GetHp = GetHp,
  GetCombo = GetCombo,
  GetElapse = GetElapse,
  GetNumTracks = GetNumTracks,
  Pause = Pause
}
