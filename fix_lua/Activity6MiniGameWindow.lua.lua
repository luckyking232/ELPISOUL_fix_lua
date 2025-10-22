require("ActivityDungeon1005_MiniGameStartWindowByName")
local Activity6MiniGameWindow = {}
local uis, contentPane
local controller = require("Activity6_MiniGameController")
local ballObjLookup, ballFreezingHolderLookup, ballTextLookup, score
local gameId = 70441007
local mapObj, config, shapeMode
local WorldToScreenPoint = function(x, y)
  local cam = UICamera
  local sp = cam:WorldToScreenPoint(Vector3(x, y, 0))
  local pos = Vector2(sp.x, Screen.height - sp.y)
  return pos
end
local ScreenToWorldPoint = function(global)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(global.x, Screen.height - global.y, -sc.transform.position.z))
  return position
end
local OnCreateBall = function(ball)
  local ballObj = UIMgr:CreateObject("ActivityDungeon1005", "MiniStart_BallAni")
  local child = ballObj:GetChild("Ball")
  ballObj.name = "ballObj"
  local ballType, effect = ball.type, ball.effect
  local ctrlIndex
  if "RED" == ballType then
    ctrlIndex = 2
  elseif "YELLOW" == ballType then
    ctrlIndex = 3
  elseif "BLUE" == ballType then
    ctrlIndex = 1
  elseif "GREEN" == ballType then
    ctrlIndex = 0
  end
  ChangeUIController(child, "c1", ctrlIndex)
  ChangeUIController(child, "c2", shapeMode and 1 or 0)
  if "NONE" == effect then
    ctrlIndex = 0
  elseif "FREEZE" == effect then
    ctrlIndex = 2
  elseif "BOOM" == effect then
    ctrlIndex = 1
  elseif "ROLLBACK" == effect then
    ctrlIndex = 3
  end
  ChangeUIController(ballObj, "c1", ctrlIndex)
  ballObjLookup = ballObjLookup or {}
  ballObjLookup[ball] = ballObj
  local x, y = ball.body.x, ball.body.y
  PlayUITrans(ballObj, "appear")
  local parent = mapObj
  if ball.state == "READY" then
    ballObj.sortingOrder = 120
    local launcher = mapObj:GetChild("NextBall")
    launcher:AddChild(ballObj)
    local ballHolder = launcher:GetChild("BallHolder")
    local xy = ballHolder.xy
    ballObj:SetXY(xy.x, xy.y)
  else
    local screenPosition = WorldToScreenPoint(x, y)
    local point = parent:GlobalToLocal(screenPosition)
    ballObj:SetXY(point.x, point.y)
    ballObj.sortingOrder = 50
    parent:AddChild(ballObj)
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
    UIUtil.SetHolderCenter(holder)
  end
  return holder
end
local combo, comboTipsObj
local DisplayComboTips = function(combo)
  if not comboTipsObj then
    local parent = uis.Main.OperateRegion.root
    comboTipsObj = UIMgr:CreateObject("ActivityDungeon1005", "MiniStart_EffectTipsAni")
    comboTipsObj.sortingOrder = 200
    comboTipsObj.touchable = false
    parent:AddChild(comboTipsObj)
    comboTipsObj:Center()
  end
  comboTipsObj.visible = true
  ChangeUIController(comboTipsObj:GetChild("Tips"), "c1", math.min(combo - 2, 3))
  local tips = comboTipsObj:GetChild("Tips")
  local comboLevel = math.min(math.max(1, combo - 1), 4)
  SoundUtil.PlayUISfx(string.format("event:/sfx/sfx_ui/ui_sys/sfx_zuma_comb_%s", comboLevel))
  UIUtil.SetText(tips, T(20628, math.max(1, combo - 1)), "WordTxt")
  PlayUITrans(comboTipsObj, "up")
end
local scoreTween
local RefreshScore = function()
  if scoreTween then
    LeanTween.cancel(scoreTween)
  end
  local text = uis.Main.Integral.NumberTxt.text
  local origin
  if string.isEmptyOrNil(text) then
    origin = 0
  else
    origin = tonumber(text)
  end
  scoreTween = LeanTween.value(origin, score, 0.2):setOnUpdate(function(val)
    uis.Main.Integral.NumberTxt.text = math.floor(val)
  end):setOnComplete(function()
    scoreTween = nil
  end).id
end
local RefreshHp = function()
  uis.Main.Info2.NumberTxt.text = controller.GetHp()
end
local tipsUseUp
local RefreshShootNum = function()
  uis.Main.Info1.NumberTxt.text = math.max(0, controller.GetShootNum())
  if not tipsUseUp and controller.GetShootNum() <= 0 then
    FloatTipsUtil.ShowWarnTips(T(20627))
    tipsUseUp = true
  end
end
local OnDestroyBall = function(ball, matched, lose)
  if ballObjLookup then
    local obj = ballObjLookup[ball]
    if obj then
      if matched then
        local parent = mapObj
        local index = parent.numChildren
        local holder = GetOrCreateHolder(parent, string.format("EffectHolder%s%s", ball.body.x, ball.body.y), index)
        local path
        if ball.effect == "BOOM" then
          path = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame007/MiniGame007_boom.prefab"
        else
          path = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame007/MiniGame007_ball_dis.prefab"
        end
        if ball.effect == "FREEZE" then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_sk_freeze")
        elseif ball.effect == "BOOM" then
          SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_sk_expl")
        end
        local effect = ResourceManager.Instantiate(path)
        effect.transform:GetChild(0).localPosition = Vector3.zero
        holder:SetXY(obj.x, obj.y)
        UIUtil.SetObjectToUI(effect, holder)
        EffectUtil.SetAutoDestroyCallback(effect, function()
          ResourceManager.DestroyGameObject(effect)
          holder:Dispose()
        end)
        if controller.GetCombo() ~= combo then
          combo = controller.GetCombo()
          if combo >= 2 then
            DisplayComboTips(combo)
          end
        end
        local ratio = 1 + 0.5 * (combo - 1)
        score = math.floor(score + 10 * ratio)
        RefreshScore()
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_xiaochu")
      end
      if lose then
        RefreshHp()
        FloatTipsUtil.ShowWarnTips(T(20629, controller.GetHp()))
      end
      PlayUITrans(obj, "disappear", function()
        obj:Dispose()
      end)
      ballObjLookup[ball] = nil
    end
  end
  if ballFreezingHolderLookup then
    local holder = ballFreezingHolderLookup[ball]
    ballFreezingHolderLookup[ball] = nil
    if holder then
      holder:Dispose()
    end
  end
end
local OnUpdateBall = function(ball, freezing, index)
  if ballObjLookup then
    local parent = mapObj
    local obj = ballObjLookup[ball]
    if obj then
      local x, y = ball.body.x, ball.body.y
      local pos = WorldToScreenPoint(x, y)
      local point = parent:GlobalToLocal(pos)
      if ball.state ~= "READY" then
        if obj.parent ~= parent then
          parent:AddChild(obj)
        end
        if ball.state == "ON_CHAIN" then
          obj.sortingOrder = 50
        end
        obj:SetXY(point.x, point.y)
        if freezing and ball.state ~= "LAUNCHING" then
          ballFreezingHolderLookup = ballFreezingHolderLookup or {}
          local holder = ballFreezingHolderLookup[ball]
          if not holder then
            holder = GetOrCreateHolder(parent, string.format("FREEZE%s", ball))
            holder.sortingOrder = 55
            ballFreezingHolderLookup[ball] = holder
            local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame007/MiniGame007_ball_freezz.prefab")
            UIUtil.SetObjectToUI(effect, holder)
          end
          holder:SetXY(point.x, point.y)
        elseif ballFreezingHolderLookup then
          local holder = ballFreezingHolderLookup[ball]
          if holder then
            holder:Dispose()
            ballFreezingHolderLookup[ball] = nil
          end
        end
        local PI = 3.14
        local r = 24
        local scale = UIContentScaler.scaleFactor * Stage.inst.scaleX * 100
        local rad = scale * (ball.dist * 180) / (PI * r) * 0.5
        local deg = -math.deg(rad)
        local rotObj = obj:GetChild("Ball")
        rotObj.rotation = deg
      end
    end
  end
end
local OnFinished = function(win)
  LeanTween.delayedCall(0.5, function()
    OpenWindow(WinResConfig.Activity6MiniGameSubmitWindow.name, nil, win, score, math.floor(controller.GetElapse()), config)
  end)
end

function Activity6MiniGameWindow.ReInitData()
end

function Activity6MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity6MiniGameWindow.package, WinResConfig.Activity6MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1005_MiniGameStartWindowUis(contentPane)
    config = bridgeObj.argTable[1]
    shapeMode = bridgeObj.argTable[2]
    Activity6MiniGameWindow.UpdateInfo()
    Activity6MiniGameWindow.InitBtn()
  end)
end

local LoadEffects = function(mapObj, numTrack)
  for i = 1, numTrack do
    local endPoint = mapObj:GetChild(string.format("EndPoint%s", i))
    local startPoint = mapObj:GetChild(string.format("StartingPoint%s", i))
    if endPoint then
      local holder = endPoint:GetChild("Effect1Holder")
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame007/MiniGame007_dis.prefab")
      UIUtil.SetObjectToUI(effect, holder)
      holder.sortingOrder = 40
      LuaUtil.PlayEffect(effect)
    end
    if startPoint then
      startPoint.sortingOrder = 200
    end
  end
  local launcher = mapObj:GetChild("NextBall")
  launcher.sortingOrder = 100
  local effectHolder = launcher:GetChild("Effect1Holder")
  local launcherEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame007/MiniGame007_point.prefab")
  UIUtil.SetObjectToUI(launcherEffect, effectHolder)
  launcherEffect.transform.localEulerAngles = Vector3(0, 0, 180)
end

local function GetDifficulties(day)
  local maxDay = 0
  local data = TableData.GetTable("BaseActivityGame")
  local result = {}
  for _, v in pairs(data) do
    if v.game_id == gameId then
      if v.game_day == day then
        table.insert(result, v)
      end
      if maxDay < v.game_day then
        maxDay = v.game_day
      end
    end
  end
  table.sort(result, function(a, b)
    return a.id < b.id
  end)
  if #result < 1 then
    return GetDifficulties(maxDay)
  end
  return result
end

local GetCurrentMiniGameConfig = function()
  local activityInfo = ActivityDungeonData.GetActivityInfo()
  local info = Activity6_MiniGameData.GetMiniGameInfo(gameId)
  local curDay = math.ceil((LoginData.GetCurServerTime() - activityInfo.baseInfo.startStamp) / 86400)
  local difficulties = GetDifficulties(curDay)
  local miniDailyNum = info.miniDailyNum + 1
  local index = miniDailyNum > #difficulties and math.random(1, #difficulties) or miniDailyNum
  return difficulties[index]
end
local StartGame = function()
  combo = 0
  score = 0
  controller.SetCallback(OnCreateBall, OnDestroyBall, OnUpdateBall, OnFinished)
  tipsUseUp = false
  if ballObjLookup then
    for ball, obj in pairs(ballObjLookup) do
      obj:Dispose()
      ballObjLookup[ball] = nil
    end
  end
  if ballFreezingHolderLookup then
    for ball, holder in pairs(ballFreezingHolderLookup) do
      holder:Dispose()
      ballFreezingHolderLookup[ball] = nil
    end
  end
  if mapObj then
    mapObj:Dispose()
  end
  local obj = UIMgr:CreateObject("ActivityDungeon1005", config.map_path)
  local mapRoot = uis.Main.OperateRegion.root
  mapRoot:AddChild(obj)
  mapObj = obj
  local mapImg = mapObj:GetChild("n0")
  local position = ScreenToWorldPoint(mapImg:LocalToGlobal(Vector2(mapImg.width * 0.5, mapImg.height * 0.5)))
  controller.SetHp(tonumber(config.win))
  controller.SetShootNum(config.act)
  local path = config.data_path
  controller.StartGame(path, position, function()
    local ballHolder = mapObj:GetChild("NextBall"):GetChild("BallHolder")
    local screenPoint = ballHolder:LocalToGlobal(Vector2.zero)
    local readyPoint = ScreenToWorldPoint(screenPoint)
    return readyPoint
  end, config.type_item, config.totality, config.speed / 10, config.interval)
  LoadEffects(mapObj, controller.GetNumTracks())
  RefreshScore()
  RefreshHp()
  RefreshShootNum()
end
local Shoot = function(screenPosition)
  local launcher = mapObj:GetChild("NextBall")
  local ballObj = launcher:GetChild("ballObj")
  if ballObj and IsUITransPlaying(ballObj, "appear") then
    return
  end
  local direction = ScreenToWorldPoint(screenPosition) - ScreenToWorldPoint(launcher:LocalToGlobal(Vector2.zero))
  local shot = controller.Shoot(direction)
  if shot then
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_shot")
  end
  RefreshShootNum()
end
local UpdateLauncherRotation = function(touchPoint)
  local launcher = mapObj:GetChild("NextBall")
  local parent = launcher.parent
  local localPosition = parent:GlobalToLocal(touchPoint)
  local direction = localPosition - launcher.xy
  local angle = Vector2.SignedAngle(Vector2.up, direction)
  launcher.rotation = angle
end

function Activity6MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1005/MiniGame_1001"
  uis.Main.Integral.NumberWordTxt.text = T(20526)
  uis.Main.Integral.NumberWord1Txt.text = T(20527)
  uis.Main.Info1.WordTxt.text = T(20622)
  uis.Main.Info2.WordTxt.text = T(20623)
  local info = Activity6_MiniGameData.GetMiniGameInfo(gameId)
  if info then
    uis.Main.Integral.Number1Txt.text = info.miniHighScore
  end
  StartGame()
end

function Activity6MiniGameWindow.InitBtn()
  uis.Main.OperateRegion.root.onTouchBegin:Set(function(context)
    context:CaptureTouch()
    local finger = context.inputEvent.position
    UpdateLauncherRotation(finger)
  end)
  uis.Main.OperateRegion.root.onTouchMove:Set(function(context)
    local finger = context.inputEvent.position
    UpdateLauncherRotation(finger)
  end)
  uis.Main.OperateRegion.root.onTouchEnd:Set(function(context)
    local finger = context.inputEvent.position
    UpdateLauncherRotation(finger)
    Shoot(finger)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    controller.Pause(true)
    MessageBox.Show(T(20533), {
      touchCallback = function()
        controller.Release()
        Activity6_MiniGameService.MiniGameSubmitReq(gameId, {}, score, math.ceil(controller.GetElapse()), function()
          UIMgr:CloseToWindow(WinResConfig.Activity6MiniGameMainWindow.name)
        end)
      end
    }, {
      touchCallback = function()
        controller.Pause(false)
      end
    }, {
      touchCallback = function()
        controller.Pause(false)
      end
    })
  end)
end

function Activity6MiniGameWindow.OnClose()
  uis = nil
  contentPane = nil
  if ballObjLookup then
    for i, v in pairs(ballObjLookup) do
      v:Dispose()
    end
    ballObjLookup = nil
  end
  if ballFreezingHolderLookup then
    for i, v in pairs(ballFreezingHolderLookup) do
      v:Dispose()
    end
    ballFreezingHolderLookup = nil
  end
  if comboTipsObj then
    comboTipsObj:Dispose()
  end
  comboTipsObj = nil
  controller.Release()
  if mapObj then
    mapObj:Dispose()
  end
  mapObj = nil
end

function Activity6MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity6_MiniGame.RESET then
    StartGame()
  elseif msgId == WindowMsgEnum.Activity6_MiniGame.REFRESH_MINIGAME_INFO then
    local info = Activity6_MiniGameData.GetMiniGameInfo(gameId)
    if info then
      uis.Main.Integral.Number1Txt.text = info.miniHighScore
    end
  end
end

return Activity6MiniGameWindow
