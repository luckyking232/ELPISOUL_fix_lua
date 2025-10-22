require("ActivityDungeon1015_MiniGameStartWindowByName")
local Activity15MiniGameWindow = {}
local uis, contentPane, score, configData, directionCom, bottom, chrAnimEffectHolder, allBall, gameTime, curData, playerRadius, createTime, startJumpPlayerInfo, idIndex, gameStop, jumpBtn, root, interval
local guguSpeed = 50
local moveSpeed = 400
local oneJumpDis = 150
local twoJumpDis = 100
local timeUpSpeed = 500
local timeDownSpeed = 580
local down = 650
local chrW = 30
local disNum = 20
local chrCom, chrAnim, chrTweenX, chrTweenY
local offsetTime = {-0.5, 0.5}

function Activity15MiniGameWindow.ReInitData()
end

function Activity15MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15MiniGameWindow.package, WinResConfig.Activity15MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_MiniGameStartWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1015/MiniGame_1001"
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", uis.Main.BackGround.BackGroundHolder)
    Activity15MiniGameWindow.InitBtn()
    chrCom = UIMgr:CreateObject("ActivityDungeon1015", "MiniStart_GuGu")
    UIUtil.SetHolderCenter(chrCom)
    playerRadius = chrCom.width / 2
    chrAnim = UIUtil.SetEffectToUI("Assets/Art/Models/UI_spine/prefab/minigame017_gugu.prefab", chrCom:GetChild("EffectHolder"))
    chrAnimEffectHolder = chrCom:GetChild("Effect1Holder")
    root = uis.Main.OperateRegion.root
    root:AddChild(chrCom)
    root:AddChild(chrAnimEffectHolder)
    if GuideData.CanShowCaption(Activity15_MiniGameData.gameId) then
      OpenWindow(WinResConfig.Activity15MiniExplainWindow.name, nil, function()
        Activity15MiniGameWindow.UpdateInfo()
      end)
      GuideData.SaveCaptionOpen(Activity15_MiniGameData.gameId)
    else
      Activity15MiniGameWindow.UpdateInfo()
    end
  end)
end

function Activity15MiniGameWindow.UpdateInfo()
  SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
  end)
  score = 0
  bottom = 0
  gameTime = 0
  allBall = {}
  createTime = Time.time
  idIndex = 0
  gameStop = nil
  chrCom:SetXY(root.width / 2, down)
  local info = Activity15_MiniGameData.GetMiniGameInfo()
  configData = Activity15MiniGameWindow.GetItemConfig()
  Activity15MiniGameWindow.InitInput()
  ChangeUIController(jumpBtn, "c1", 0)
  uis.Main.Integral.Number1Txt.text = T(2042, info.miniHighScore)
  Activity15MiniGameWindow.UpdateIntegral()
  UpdateManager.AddUpdateHandler(Activity15MiniGameWindow.Update)
end

function Activity15MiniGameWindow.Update()
  if gameStop then
    return
  end
  if Input.GetKeyDown(KeyCode.D) then
    directionCom.RightBtn.onClick:Call()
  elseif Input.GetKeyDown(KeyCode.A) then
    directionCom.LeftBtn.onClick:Call()
  elseif Input.GetKeyDown(KeyCode.Space) then
    jumpBtn.onClick:Call()
  end
  gameTime = gameTime + Time.deltaTime
  curData = Activity15MiniGameWindow.GetConfigByTime()
  if curData then
    if nil == interval then
      interval = curData.act + offsetTime[math.random(1, 2)]
    end
    if #allBall < curData.totality and Time.time - createTime >= interval then
      for i = 1, curData.type_item do
        if i > 1 and math.random(0, 100) > curData.bottom_num then
          break
        end
        local ball = Activity15MiniGameWindow.CreateBall(curData.speed)
        table.insert(allBall, ball)
      end
      createTime = Time.time
      interval = nil
    end
    for i = #allBall, 1, -1 do
      allBall[i].UpdateBallPos(Time.deltaTime)
      if Vector2.Distance(allBall[i].item.xy, chrCom.xy) <= chrCom.height - 10 then
        gameStop = true
        Activity15MiniGameWindow.OnGameOver()
        allBall[i].stopMove = true
        if chrTweenY then
          chrTweenY:Kill()
          chrTweenY = nil
        end
        if chrTweenX then
          chrTweenX:Kill()
          chrTweenX = nil
        end
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_15_shenfa_fail")
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_die.prefab", chrCom:GetChild("Effect2Holder"), nil, true)
      end
      if allBall[i].CanDispose() then
        allBall[i].item:Dispose()
        table.remove(allBall, i)
      end
    end
    if 0 ~= bottom then
      Activity15MiniGameWindow.CheckJumpOver()
    end
  end
end

function Activity15MiniGameWindow.CheckJumpOver()
  local item
  for i = 1, #allBall do
    if not allBall[i].jump then
      item = allBall[i].item
      local horizontalOverlap = math.abs(chrCom.x - item.x) < disNum
      allBall[i].movingTop = allBall[i].movingTop and allBall[i].movingTop or item.y
      local wasAbove = startJumpPlayerInfo.bottom > allBall[i].movingTop
      local nowBelow = chrCom.y + disNum < item.y
      if wasAbove and nowBelow and horizontalOverlap then
        allBall[i].jump = true
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_nff_knife_green.prefab", item:GetChild("EffectHolder"))
        Activity15MiniGameWindow.DisposeItem(allBall[i].id)
        score = score + 1
        Activity15MiniGameWindow.UpdateIntegral()
        return true
      end
    end
  end
end

function Activity15MiniGameWindow.SaveStartJumpState()
  local mt = {}
  for i = 1, #allBall do
    allBall[i].movingTop = allBall[i].y - allBall[i].heightRadius
    allBall[i].lastX = allBall[i].item.x
  end
  startJumpPlayerInfo = {
    bottom = chrCom.y + playerRadius,
    x = chrCom.x
  }
end

function Activity15MiniGameWindow.DisposeItem(id)
  LeanTween.delayedCall(0.2, function()
    if uis then
      if gameStop then
        return
      end
      local ball = Activity15MiniGameWindow.GetBallById(id)
      if ball then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_nff_cross_green.prefab", ball.item:GetChild("EffectHolder"))
        ball.stopMove = true
        LeanTween.delayedCall(0.25, function()
          if uis then
            if gameStop then
              return
            end
            Activity15MiniGameWindow.RemoveBallById(id)
          end
        end)
      end
    end
  end)
end

function Activity15MiniGameWindow.GetBallById(id)
  for i = 1, #allBall do
    if allBall[i].id == id then
      return allBall[i]
    end
  end
end

function Activity15MiniGameWindow.RemoveBallById(id)
  for i = 1, #allBall do
    if allBall[i].id == id then
      allBall[i].item:Dispose()
      table.remove(allBall, i)
      return
    end
  end
end

function Activity15MiniGameWindow.CreateBall(speed)
  local ball = {
    x = 0,
    y = 0,
    speed = speed,
    radius = 0
  }
  local angle = math.rad(45)
  ball.vx = (math.random() > 0.5 and 1 or -1) * math.cos(angle) * ball.speed
  ball.vy = math.sin(angle) * ball.speed
  ball.item = UIMgr:CreateObject("ActivityDungeon1015", "MiniStart_Item")
  UIUtil.SetHolderCenter(ball.item)
  ball.item.gameObjectName = idIndex
  ball.id = idIndex
  idIndex = idIndex + 1
  idIndex = idIndex > 99999999 and 0 or idIndex
  local width = ball.item.width * 0.5
  local height = ball.item.height * 0.5
  ball.widthRadius = width
  ball.heightRadius = height
  ball.jump = false
  ball.y = height
  local gameWidth = root.width - width
  local gameHeight = root.height - height
  ball.x = math.random(0, gameWidth)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_nff_knife.prefab", ball.item:GetChild("EffectHolder"))
  root:AddChildAt(ball.item, 0)
  
  function ball.UpdateBallPos(deltaTime)
    if ball.stopMove then
      return
    end
    local dx = ball.vx * deltaTime
    local dy = ball.vy * deltaTime
    local newX = ball.x + dx
    local newY = ball.y + dy
    if newX < ball.radius + width then
      ball.vx = math.abs(ball.vx)
      newX = ball.radius + width
    elseif newX > gameWidth - ball.radius then
      ball.vx = -math.abs(ball.vx)
      newX = gameWidth - ball.radius
    end
    if newY > gameHeight - ball.radius then
      ball.vy = -math.abs(ball.vy)
      newY = gameHeight - ball.radius
    end
    ball.direction = ball.vx > 0 and 1 or -1
    ball.x = newX
    ball.y = newY
    ball.item:SetXY(ball.x, ball.y)
  end
  
  function ball.CanDispose()
    if ball.y < ball.heightRadius - 1 then
      return true
    end
  end
  
  return ball
end

function Activity15MiniGameWindow.InitInput()
  local pageType = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ACTIVITY15_GAME_SETTER_INDEX)
  ChangeController(uis.Main.c1Ctr, pageType)
  directionCom = 0 == pageType and uis.Main.MiniStart_Direction1 or uis.Main.MiniStart_Direction2
  jumpBtn = 0 == pageType and uis.Main.MiniStart_JumpBtn1 or uis.Main.MiniStart_JumpBtn2
  local time = 0.1
  local trigger = 0
  local leftBtn = directionCom.LeftBtn
  local leftPress = LongPressGesture.GetLongPressGesture(leftBtn)
  leftPress.trigger = trigger
  leftPress.interval = time
  local moveDis, target
  local LeftFun = function()
    if gameStop then
      return
    end
    Activity15MiniGameWindow.ClearTween(chrTweenX)
    target = math.max(chrCom.x - guguSpeed, chrW)
    moveDis = math.abs(chrCom.x - target)
    if chrCom.x <= chrW then
      return
    end
    chrCom:SetScale(-1, 1)
    if 0 == bottom then
      SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "move", true)
    end
    chrTweenX = chrCom:TweenMoveX(target, moveDis / moveSpeed):SetEase(EaseType.Linear):OnComplete(function()
      chrTweenX = nil
      if 0 == bottom then
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
        end)
      end
    end)
  end
  leftPress.onBegin:Set(LeftFun)
  leftPress.onAction:Set(LeftFun)
  leftPress.onEnd:Set(function()
    if chrTweenX then
      chrTweenX:Kill()
      if 0 == bottom then
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
        end)
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_move_r.prefab", chrCom:GetChild("Effect3Holder"), nil, true)
      end
      chrTweenX = nil
    end
  end)
  local rightBtn = directionCom.RightBtn
  local rightPress = LongPressGesture.GetLongPressGesture(rightBtn)
  rightPress.trigger = trigger
  rightPress.interval = time
  local rightMaxX = root.width - chrW
  local RightFun = function()
    if gameStop then
      return
    end
    Activity15MiniGameWindow.ClearTween(chrTweenX)
    target = math.min(chrCom.x + guguSpeed, rightMaxX)
    moveDis = math.abs(target - chrCom.x)
    if chrCom.x >= rightMaxX then
      return
    end
    chrCom:SetScale(1, 1)
    if 0 == bottom then
      SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "move", true)
    end
    chrTweenX = chrCom:TweenMoveX(target, moveDis / moveSpeed):SetEase(EaseType.Linear):OnComplete(function()
      chrTweenX = nil
      if 0 == bottom then
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
        end)
      end
    end)
  end
  rightPress.onBegin:Set(RightFun)
  rightPress.onAction:Set(RightFun)
  rightPress.onEnd:Set(function()
    if chrTweenX then
      chrTweenX:Kill()
      if 0 == bottom then
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
        end)
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_move_r.prefab", chrCom:GetChild("Effect3Holder"), nil, true)
      end
      chrTweenX = nil
    end
  end)
  jumpBtn.onClick:Set(function()
    if bottom > 1 then
      return
    end
    if 1 == bottom then
      Activity15MiniGameWindow.ClearTween(chrTweenY)
      bottom = bottom + 1
      guguSpeed = twoJumpDis
      time = guguSpeed / timeUpSpeed
      SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "jump2", true)
      chrAnimEffectHolder:SetXY(chrCom.x, chrCom.y + chrW)
      ChangeUIController(jumpBtn, "c1", 1)
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_jump2.prefab", chrAnimEffectHolder)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_15_shenfa_jump2")
    else
      Activity15MiniGameWindow.SaveStartJumpState()
      bottom = bottom + 1
      guguSpeed = oneJumpDis
      time = guguSpeed / timeUpSpeed
      ChangeUIController(jumpBtn, "c1", 0)
      SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "jump_up", true)
      chrAnimEffectHolder:SetXY(chrCom.x, chrCom.y + 10 + chrW)
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_jump.prefab", chrAnimEffectHolder)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_15_shenfa_jump1")
    end
    chrTweenY = chrCom:TweenMoveY(chrCom.y - guguSpeed, time):SetEase(EaseType.QuadOut):OnComplete(function()
      SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "jump_mid", true)
      chrTweenY = chrCom:TweenMoveY(down, math.abs(down - chrCom.y) / timeDownSpeed):SetEase(EaseType.QuintIn):OnStart(function()
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "jump_down", true)
      end):OnComplete(function()
        SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "idle", true, 0, function()
        end)
        chrAnimEffectHolder:SetXY(chrCom.x, chrCom.y + 3 + chrW)
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame017/MiniGame017_Chareff_down.prefab", chrAnimEffectHolder)
        bottom = 0
        chrTweenY = nil
        ChangeUIController(jumpBtn, "c1", 0)
        Activity15MiniGameWindow.SaveStartJumpState()
      end)
    end)
  end)
end

function Activity15MiniGameWindow.ClearTween(tween)
  if tween then
    tween:Kill()
  end
  tween = nil
end

function Activity15MiniGameWindow.UpdateIntegral()
  uis.Main.Integral.NumberTxt.text = T(2042, score)
end

function Activity15MiniGameWindow.GetConfigByTime()
  for i = #configData, 1, -1 do
    if gameTime >= configData[i].interval_item then
      return configData[i]
    end
  end
end

function Activity15MiniGameWindow.GetItemConfig()
  local data = TableData.GetTable("BaseActivityGame")
  local tb = {}
  for i, v in pairs(data) do
    if v.game_id == Activity15_MiniGameData.gameId then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.interval_item < b.interval_item
  end)
  return tb
end

function Activity15MiniGameWindow.OnGameOver()
  UpdateManager.RemoveUpdateHandler(Activity15MiniGameWindow.Update)
  uis.Main.root.touchable = false
  SkeletonAnimationUtil.SetAnimation(chrAnim, 0, "die", false, 0, function()
  end)
  LeanTween.delayedCall(1, function()
    OpenWindow(WinResConfig.Activity15MiniGameSubmitWindow.name, nil, score)
    uis.Main.root.touchable = true
  end)
end

function Activity15MiniGameWindow.OnNext()
  for i = #allBall, 1, -1 do
    allBall[i].item:Dispose()
    table.remove(allBall, i)
  end
  allBall = {}
  Activity15MiniGameWindow.UpdateInfo()
end

function Activity15MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    gameStop = true
    MessageBox.Show(T(2049), {
      touchCallback = function()
        Activity15_MiniGameService.MiniGameSubmitReq({}, score, nil, 0, function()
          UIMgr:CloseWindow(WinResConfig.Activity15MiniGameWindow.name)
        end)
      end
    }, {
      touchCallback = function()
        gameStop = nil
      end
    })
  end)
  uis.Main.Integral.NumberWordTxt.text = T(2044)
  uis.Main.Integral.NumberWord1Txt.text = T(2045)
  uis.Main.FunctionDetailsBtn.onClick:Set(function()
    gameStop = true
    OpenWindow(WinResConfig.Activity15MiniExplainWindow.name, nil, function()
      LeanTween.delayedCall(1, function()
        if uis then
          gameStop = nil
        end
      end)
    end)
  end)
end

function Activity15MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity15_MiniGame.START_GAME then
    Activity15MiniGameWindow.OnNext()
  elseif msgId == WindowMsgEnum.Activity15_MiniGame.RESET then
    local info = Activity15_MiniGameData.GetMiniGameInfo()
    uis.Main.Integral.Number1Txt.text = T(2042, info.miniHighScore)
  end
end

function Activity15MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  UpdateManager.RemoveUpdateHandler(Activity15MiniGameWindow.Update)
  score = nil
  configData = nil
  directionCom = nil
  bottom = nil
  chrAnimEffectHolder = nil
  allBall = nil
  gameTime = nil
  curData = nil
  playerRadius = nil
  createTime = nil
  startJumpPlayerInfo = nil
  idIndex = nil
  chrCom = nil
  jumpBtn = nil
end

return Activity15MiniGameWindow
