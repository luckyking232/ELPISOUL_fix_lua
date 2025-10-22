require("ActivityDungeon1017_MiniGameStartWindowByName")
local Activity17DodgerGameWindow = {}
local uis, contentPane
local PLAYER_TWINKLE_DURATION = 0.333
local PLAYER_TWINKLE_COUNT = 9
local JOYSTICK_RADIUS = 240
local gameId = 70441021
local controller = require("Activity17_DodgerGameController")
local joystick, playerObj, objLookup, playerTwinkleDuration, playerTwinkleCount, twinkleColor, pause
local Screen2WorldPosition = function(screenPosition)
  local sc = StageCamera.main
  local position = sc:ScreenToWorldPoint(Vector3(screenPosition.x, Screen.height - screenPosition.y, -sc.transform.position.z))
  return position
end
local World2ScreenPosition = function(worldPosition)
  local sc = StageCamera.main
  local sp = sc:WorldToScreenPoint(worldPosition)
  return Vector2(sp.x, Screen.height - sp.y)
end
local SyncPosition = function(inst, obj)
  if obj then
    local parent = uis.Main.MapRegion.root
    local screenPosition = World2ScreenPosition(inst.transform.position)
    local position = parent:GlobalToLocal(screenPosition)
    obj:SetXY(position.x, position.y)
  end
end
local OnCreatePlayer = function(player)
  objLookup = objLookup or {}
  local obj = UIMgr:CreateObject("ActivityDungeon1017", "MiniStart_Player")
  obj:SetPivot(0.5, 0.5, true)
  objLookup[player] = obj
  local go = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame021/Minigame021.prefab")
  local holder = obj:GetChild("EffectHolder")
  local dot = obj:GetChild("Dot")
  holder.sortingOrder = 10
  dot.sortingOrder = 15
  UIUtil.SetObjectToUI(go, holder)
  SkeletonAnimationUtil.SetAnimation(go, 0, "idle", true)
  local parent = uis.Main.MapRegion.root
  parent:AddChild(obj)
  playerObj = go
  SyncPosition(player, obj)
end
local OnDestroyPlayer = function(player)
  if objLookup then
    local obj = objLookup[player]
    objLookup[player] = nil
    if obj then
      obj:Dispose()
    end
  end
end
local OnCreateBullet = function(bullet)
  objLookup = objLookup or {}
  local obj = UIMgr:CreateObject("ActivityDungeon1017", "MiniStart_ItemAni")
  obj:SetPivot(0.5, 0.5, true)
  local parent = uis.Main.MapRegion.root
  obj.sortingOrder = 15
  parent:AddChild(obj)
  objLookup[bullet] = obj
  local item = obj:GetChild("Item")
  ChangeUIController(item, "item", bullet.color)
  PlayUITrans(obj, "appear")
  SyncPosition(bullet, obj)
end
local OnDestroyBullet = function(bullet, immediate)
  if objLookup then
    local obj = objLookup[bullet]
    objLookup[bullet] = nil
    if obj then
      if immediate then
        obj:Dispose()
      else
        PlayUITrans(obj, "disappear", function()
          obj:Dispose()
        end)
      end
    end
  end
end
local OnCollision = function(player, bullet)
  FloatTipsUtil.ShowWarnTips(T(20791))
  if playerObj then
    playerTwinkleCount = PLAYER_TWINKLE_COUNT
    playerTwinkleDuration = PLAYER_TWINKLE_DURATION
    twinkleColor = Color.red
    LuaUtil.SetColor(playerObj, "_Color", twinkleColor)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_17_hit")
  end
end
local OnGameOver = function(elapse)
  local integer = Mathf.RoundToInt(math.floor(elapse * 10))
  Activity17_MiniGameService.MiniGameSubmitReq(gameId, {}, integer, Mathf.RoundToInt(elapse), function()
    OpenWindow(WinResConfig.Activity17DodgerGameSubmitWindow.name, nil, integer / 10)
  end)
end
local FormatSeconds = function(seconds)
  local sec = tostring(math.floor(seconds * 10) / 10)
  return T(20786, sec)
end
local OnUpdate = function()
  if pause then
    return
  end
  uis.Main.Integral.NumberTxt.text = FormatSeconds(controller.GetElapse())
  uis.Main.Info.NumberTxt.text = controller.GetHp()
  if objLookup then
    for inst, obj in pairs(objLookup) do
      SyncPosition(inst, obj)
    end
  end
  if playerObj and type(playerTwinkleCount) == "number" and playerTwinkleCount > 0 and type(playerTwinkleDuration) == "number" and playerTwinkleDuration > 0 then
    playerTwinkleDuration = playerTwinkleDuration - Time.deltaTime
    if playerTwinkleDuration <= 0 then
      playerTwinkleDuration = PLAYER_TWINKLE_DURATION
      playerTwinkleCount = playerTwinkleCount - 1
      twinkleColor = twinkleColor == Color.red and Color.white or Color.red
      LuaUtil.SetColor(playerObj, "_Color", twinkleColor)
    end
  end
end
local OnFixedUpdate = function()
  if joystick then
    local x, y, angle = joystick.x, joystick.y, joystick.angle
    if 0 ~= x or 0 ~= y then
      controller.Move(x, y)
      local lightenIndex = 0
      if angle > 0 and angle < 45 or angle > 315 and angle < 360 then
        lightenIndex = 1
      elseif angle > 45 and angle < 135 then
        lightenIndex = 2
      elseif angle > 135 and angle < 225 then
        lightenIndex = 3
      elseif angle > 225 and angle < 315 then
        lightenIndex = 4
      end
      for i, v in pairs(joystick.buttons) do
        ChangeUIController(v, "c1", i == lightenIndex and 1 or 0)
      end
      if playerObj then
        local scaleX = SkeletonAnimationUtil.GetScaleX(playerObj)
        local abs = math.abs(scaleX)
        scaleX = x < 0 and -abs or x > 0 and abs or scaleX
        SkeletonAnimationUtil.SetFlip(playerObj, scaleX < 0, false)
      end
    else
      for _, v in pairs(joystick.buttons) do
        ChangeUIController(v, "c1", 0)
      end
    end
  end
  if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
    local h, v = CS.UnityEngine.Input.GetAxisRaw("Horizontal"), CS.UnityEngine.Input.GetAxisRaw("Vertical")
    local dx, dy = 0, 0
    if not Mathf.Approximately(h, 0) then
      dx = h > 0 and 1 or -1
    end
    if not Mathf.Approximately(v, 0) then
      dy = v > 0 and 1 or -1
    end
    if 0 ~= dx or 0 ~= dy then
      local dir = Vector2(dx, dy).normalized
      controller.Move(dir.x, dir.y)
      if playerObj then
        local scaleX = SkeletonAnimationUtil.GetScaleX(playerObj)
        local abs = math.abs(scaleX)
        scaleX = dx < 0 and -abs or dx > 0 and abs or scaleX
        SkeletonAnimationUtil.SetFlip(playerObj, scaleX < 0, false)
      end
    end
  end
end
local InitializeJoystick = function(joystickObj, radius)
  local inst = {
    gobj = joystickObj,
    buttons = {
      joystickObj:GetChild("Up"),
      joystickObj:GetChild("Right"),
      joystickObj:GetChild("Down"),
      joystickObj:GetChild("Left")
    },
    x = 0,
    y = 0,
    angle = 0
  }
  local Initialize = function(self, touchObj, radius, pivotX, pivotY)
    pivotX, pivotY = pivotX or 0.5, pivotY or 0.5
    local pivot = Vector2(touchObj.width * pivotX, touchObj.height * pivotY)
    local Update = function(localFingerPosition)
      local different = localFingerPosition - pivot
      local magnitude = different.magnitude
      if magnitude <= radius then
        local normalized = different.normalized
        self.x = normalized.x
        self.y = -normalized.y
        local signedAngle = Vector2.SignedAngle(Vector2(self.x, self.y), Vector2.up)
        self.angle = signedAngle < 0 and signedAngle + 360 or signedAngle
        return true
      end
      return false
    end
    local Reset = function()
      self.x = 0
      self.y = 0
      self.angle = 0
    end
    touchObj.onTouchBegin:Set(function(context)
      context:CaptureTouch()
      local position = context.inputEvent.position
      local localPosition = touchObj:GlobalToLocal(position)
      Update(localPosition)
    end)
    touchObj.onTouchMove:Set(function(context)
      local position = context.inputEvent.position
      local localPosition = touchObj:GlobalToLocal(position)
      if not Update(localPosition) then
        Reset()
        Stage.inst:RemoveTouchMonitor(touchObj)
      end
    end)
    touchObj.onTouchEnd:Set(function(context)
      Reset()
    end)
  end
  local Release = function()
    local gobj = inst.gobj
    inst.gobj = nil
    table.clear(inst.buttons)
    gobj.onTouchBegin:Clear()
    gobj.onTouchMove:Clear()
    gobj.onTouchEnd:Clear()
  end
  inst.Release = Release
  Initialize(inst, joystickObj, radius, 0.5, 0.5)
  return inst
end
local Release = function()
  playerObj = nil
  if joystick then
    joystick.Release()
    table.clear(joystick)
  end
  joystick = nil
  if controller then
    controller.Release()
  end
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  UpdateManager.RemoveFixedUpdateHandler(OnFixedUpdate)
end
local StartGame = function()
  Release()
  pause = false
  playerTwinkleDuration = 0
  playerTwinkleCount = 0
  twinkleColor = Color.white
  LuaUtil.SetColor(playerObj, "_Color", twinkleColor)
  local joystickMode = PlayerPrefsUtil.GetInt("ACTIVITY17_DODGER_GAME_JOYSTICK", 0)
  uis.Main.joystickCtr.selectedIndex = joystickMode
  if 0 == joystickMode then
    joystick = InitializeJoystick(uis.Main.JoystickLeft.root, JOYSTICK_RADIUS)
  else
    joystick = InitializeJoystick(uis.Main.JoystickRight.root, JOYSTICK_RADIUS)
  end
  local info = Activity17_MiniGameData.GetMiniGameInfo(gameId)
  uis.Main.Integral.Number1Txt.text = T(20786, info and info.miniHighScore / 10 or 0)
  local container = uis.Main.MapRegion.root
  local max = Screen2WorldPosition(container:LocalToGlobal(container.size))
  local min = Screen2WorldPosition(container:LocalToGlobal(Vector2.zero))
  local center = (max + min) * 0.5
  controller.Initialize(center, Vector3(max.x - min.x, math.abs(max.y - min.y)), OnCreatePlayer, OnDestroyPlayer, OnCreateBullet, OnDestroyBullet, OnCollision, OnGameOver)
  UpdateManager.AddUpdateHandler(OnUpdate)
  UpdateManager.AddFixedUpdateHandler(OnFixedUpdate)
end

function Activity17DodgerGameWindow.ReInitData()
end

function Activity17DodgerGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17DodgerGameWindow.package, WinResConfig.Activity17DodgerGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_MiniGameStartWindowUis(contentPane)
    Activity17DodgerGameWindow.UpdateInfo()
    Activity17DodgerGameWindow.InitBtn()
  end)
end

function Activity17DodgerGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1017/MiniGame_1001"
  uis.Main.Info.WordTxt.text = T(20790)
  uis.Main.Integral.NumberWordTxt.text = T(20789)
  uis.Main.Integral.NumberWord1Txt.text = T(20785)
  StartGame()
end

local cancelParam = {
  touchCallback = function()
    pause = false
    controller.Pause(false)
  end
}

function Activity17DodgerGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    pause = true
    controller.Pause(true)
    MessageBox.Show(T(20533), {
      touchCallback = function()
        local elapse = controller.GetElapse()
        local integer = Mathf.RoundToInt(math.floor(elapse * 10))
        Activity17_MiniGameService.MiniGameSubmitReq(gameId, {}, integer, Mathf.RoundToInt(elapse), function()
          UIMgr:CloseToWindow(WinResConfig.Activity17DodgerGameMainWindow.name)
        end)
      end
    }, cancelParam, cancelParam)
  end)
end

function Activity17DodgerGameWindow.OnClose()
  uis = nil
  contentPane = nil
  Release()
end

function Activity17DodgerGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity17_MiniGame.RESET then
    StartGame()
  end
end

return Activity17DodgerGameWindow
