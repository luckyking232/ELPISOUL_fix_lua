require("ActivityDungeon1019_MiniGameStartWindowByName")
local Activity19MiniGameWindow = {}
local uis, contentPane
local HP_REDUCE_DELAY = 1
local WAIT_FOR_SECONDS_WHEN_HP_REDUCE = 2
local controller = require("Activity19_MiniGameController")
local delayTween, itemObjLookup, touched, finger, backgroundTemplates, backgrounds, viewCenter, viewHeight
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
local SyncItemPosition = function(item, obj)
  if itemObjLookup and not obj then
    obj = itemObjLookup[item]
  end
  if obj and not obj.isDisposed then
    local position = item.transform.position
    if item.tag == "TRAY" then
      position.y = position.y - item.height * 0.5
    end
    local sp = WorldToScreenPoint(position.x, position.y)
    local parent = uis.Main.OperateRegion.root
    local lp = parent:GlobalToLocal(sp)
    obj:SetXY(lp.x, lp.y)
  end
end
local OnUpdate = function()
  if itemObjLookup then
    for item, obj in pairs(itemObjLookup) do
      SyncItemPosition(item, obj)
    end
  end
  local hp = controller.GetHp()
  local hpText = T(20847, hp)
  uis.Main.Hp.WordTxt.text = hpText
  uis.Main.Integral.NumberTxt.text = controller.GetScore()
end
local OnCreate = function(item)
  local parent = uis.Main.OperateRegion.root
  local obj
  local tag = item.tag
  if "DROPPED_ITEM" == tag then
    obj = UIMgr:CreateObject("ActivityDungeon1019", "MiniStart_Block")
    obj:SetPivot(0.5, 0.5, true)
    ChangeUIController(obj, "c1", item.color or 0)
  elseif "TRAY" == tag then
    obj = UIMgr:CreateObject("ActivityDungeon1019", "MiniStart_GuGu")
    obj:SetPivot(0.5, 1, true)
    local o = ResourceManager.Instantiate("Assets/Art/Models/UI_spine/prefab/MiniGame/MiniGame008/minigame008_gugu.prefab")
    SkeletonAnimationUtil.SetAnimation(o, 0, "idle", true)
    local holder = obj:GetChild("EffectHolder")
    holder:Center()
    UIUtil.SetObjectToUI(o, holder)
  end
  if obj then
    itemObjLookup[item] = obj
    parent:AddChild(obj)
    SyncItemPosition(item, obj)
  end
end
local OnDestroy = function(item, outofbounds)
  if itemObjLookup then
    local obj = itemObjLookup[item]
    if obj then
      obj:Dispose()
    end
    if outofbounds and item.tag == "DROPPED_ITEM" then
      controller.Pause(true)
      if controller.GetHp() > 0 then
        uis.Main.c1Ctr.selectedIndex = 1
        FloatTipsUtil.ShowWarnTips(T(20845))
        uis.Main.WordTips.WordTxt.text = T(20846)
        delayTween = LeanTween.delayedCall(HP_REDUCE_DELAY, function()
          delayTween = nil
          uis.Main.c1Ctr.selectedIndex = 0
          controller.Pause(false)
          controller.ClearDroppedItems()
          controller.WaitForSeconds(WAIT_FOR_SECONDS_WHEN_HP_REDUCE)
        end).id
      end
    end
  end
end
local OnCaught = function(item)
  local obj = itemObjLookup[item]
  if obj then
    local holder = obj:GetChild("EffectHolder")
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame024/Minigame024_light.prefab", holder)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_19_catch")
  end
end
local CreateBackground = function(index)
  local template = backgroundTemplates[index]
  local inst = template:create()
  table.insert(backgrounds, inst)
  return inst
end
local UpdateBackground = function(delta)
  local topBoundary, bottomBoundary = viewCenter.y + viewHeight * 0.5, viewCenter.y - viewHeight * 0.5
  local prevMaxY
  for _, inst in ipairs(backgrounds) do
    local pos = inst:getpos()
    local py = pos.y - delta
    if prevMaxY then
      py = prevMaxY + inst.height * 0.5
    end
    inst:setpos(inst.x, py)
    prevMaxY = py + inst.height * 0.5
  end
  while true do
    local maxY = -math.huge
    for _, inst in ipairs(backgrounds) do
      local pos = inst:getpos()
      maxY = math.max(pos.y + inst.height * 0.5, maxY)
    end
    if topBoundary <= maxY then
      break
    end
    local inst = CreateBackground(math.min(backgrounds[#backgrounds].next, #backgroundTemplates))
    inst:setpos(inst.x, maxY + inst.height * 0.5)
  end
  local len = #backgrounds
  for i = len, 1, -1 do
    local inst = backgrounds[i]
    local pos = inst:getpos()
    if bottomBoundary > pos.y + inst.height * 0.5 then
      inst:destroy()
      table.remove(backgrounds, i)
    end
  end
end
local OnGameOver = function()
  local score = controller.GetScore()
  local info = Activity19_MiniGameData.GetMiniGameInfo()
  local highestScore = info and info.miniHighScore or 0
  Activity19_MiniGameService.MiniGameSubmitReq({}, score, math.ceil(controller.GetElapse()), function()
    OpenWindow(WinResConfig.Activity19MiniGameSubmitWindow.name, nil, score, score > highestScore)
  end)
end
local UI_OnTouchBegin = function(context)
  touched = true
  context:CaptureTouch()
  finger = context.inputEvent.position
end
local UI_OnTouchMove = function(context)
  uis.Main.c1Ctr.selectedIndex = 0
  local delta = ScreenToWorldPoint(context.inputEvent.position) - ScreenToWorldPoint(finger)
  controller.Move(delta.x, 1)
  finger = context.inputEvent.position
end
local UI_OnTouchEnd = function()
  touched = false
end
local Release = function()
  finger = nil
  touched = nil
  if backgrounds then
    for i, v in ipairs(backgrounds) do
      v:destroy()
    end
    table.clear(backgrounds)
  end
  controller.Release()
  UpdateManager.RemoveUpdateHandler(OnUpdate)
  if delayTween then
    LeanTween.cancel(delayTween)
  end
  delayTween = nil
end
local InitializeCloud = function(background, index)
  if index >= 1 and index <= 3 then
    local c1 = UIMgr:CreateObject("ActivityDungeon1019", string.format("MiniStart_Cloud%02d", 3 * index - 2))
    background:AddChild(c1)
    c1:SetXY(256, 83)
    local c2 = UIMgr:CreateObject("ActivityDungeon1019", string.format("MiniStart_Cloud%02d", 3 * index - 1))
    background:AddChild(c2)
    c2:SetXY(1061, 36)
    local c3 = UIMgr:CreateObject("ActivityDungeon1019", string.format("MiniStart_Cloud%02d", 3 * index))
    background:AddChild(c3)
    c3:SetXY(1131, 297)
  end
end
local InitializeBackgroundTemplates = function()
  local setpos = function(o, x, y)
    local sp = WorldToScreenPoint(x, y)
    local parent = uis.Main.BackGround.root
    local pos = parent:GlobalToLocal(sp)
    o._gobj:SetXY(pos.x, pos.y)
  end
  local getpos = function(o)
    local sp = o._gobj:LocalToGlobal(Vector2.zero)
    return ScreenToWorldPoint(sp)
  end
  local destroy = function(o)
    if o._gobj and not o._gobj.isDisposed then
      o._gobj:Dispose()
    end
    o._gobj = nil
  end
  local list = {}
  for i = 1, 5 do
    local create = function()
      local entry = {}
      entry.setpos = setpos
      entry.getpos = getpos
      entry.destroy = destroy
      local parent = uis.Main.BackGround.root
      local gobj = UIMgr:CreateObject("ActivityDungeon1019", string.format("MiniStart_Map%02d", i))
      gobj:SetPivot(0.5, 0.5, true)
      parent:AddChild(gobj)
      gobj:Center()
      gobj.x = parent.width * 0.5
      InitializeCloud(gobj, i)
      local max = ScreenToWorldPoint(gobj:LocalToGlobal(gobj.size))
      local min = ScreenToWorldPoint(gobj:LocalToGlobal(Vector2.zero))
      entry._gobj = gobj
      entry.width = math.abs(max.x - min.x)
      entry.height = math.abs(max.y - min.y)
      local pos = entry:getpos()
      entry.x = pos.x
      if i <= 4 then
        entry.next = i + 1
      elseif 5 == i then
        entry.next = 4
      end
      return entry
    end
    table.insert(list, {index = i, create = create})
  end
  return list
end
local StartGame = function()
  Release()
  itemObjLookup = {}
  local container = uis.Main.OperateRegion.root
  local max = ScreenToWorldPoint(container:LocalToGlobal(container.size))
  local min = ScreenToWorldPoint(container:LocalToGlobal(Vector2.zero))
  if not backgroundTemplates then
    backgroundTemplates = InitializeBackgroundTemplates()
  end
  local root = uis.Main.root
  local rootMax = ScreenToWorldPoint(root:LocalToGlobal(root.size))
  local rootMin = ScreenToWorldPoint(root:LocalToGlobal(Vector2.zero))
  viewCenter, viewHeight = (rootMax + rootMin) * 0.5, math.abs(rootMax.y - rootMin.y)
  backgrounds = backgrounds or {}
  CreateBackground(1)
  uis.Main.c1Ctr.selectedIndex = 0
  controller.Initialize((min + max) * 0.5, math.abs(max.x - min.x), math.abs(max.y - min.y), OnCreate, OnDestroy, UpdateBackground, OnCaught, OnGameOver)
  local touchPanel = uis.Main.TouchBtn
  touchPanel.onTouchBegin:Set(UI_OnTouchBegin)
  touchPanel.onTouchMove:Set(UI_OnTouchMove)
  touchPanel.onTouchEnd:Set(UI_OnTouchEnd)
  UpdateManager.AddUpdateHandler(OnUpdate)
  uis.Main.Integral.NumberTxt.text = controller.GetScore()
  local info = Activity19_MiniGameData.GetMiniGameInfo()
  uis.Main.Integral.Number1Txt.text = info and info.miniHighScore or 0
end

function Activity19MiniGameWindow.ReInitData()
end

function Activity19MiniGameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity19MiniGameWindow.package, WinResConfig.Activity19MiniGameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1019_MiniGameStartWindowUis(contentPane)
    Activity19MiniGameWindow.UpdateInfo()
    Activity19MiniGameWindow.InitBtn()
  end)
end

function Activity19MiniGameWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://ActivityDungeon1019/MiniGame_1001"
  uis.Main.Integral.NumberWordTxt.text = T(20843)
  uis.Main.Integral.NumberWord1Txt.text = T(20840)
  uis.Main.OperateTips.WordTxt.text = T(20844)
  local holder = uis.Main.BackGround.BackGroundHolder
  holder.sortingOrder = 100
  UIUtil.SetHolderCenter(holder)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame003/FX_minigame_003_eff.prefab", holder)
  StartGame()
end

local Pause = function(flag)
  controller.Pause(flag)
  if delayTween then
    local func = flag and LeanTween.pause or LeanTween.resume
    func(delayTween)
  end
end
local cancelBtnParam = {
  touchCallback = function()
    Pause(false)
  end
}

function Activity19MiniGameWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Pause(true)
    MessageBox.Show(T(20861), {
      touchCallback = function()
        Activity19_MiniGameService.MiniGameSubmitReq({}, math.floor(controller.GetScore()), math.ceil(controller.GetElapse()), function()
          UIMgr:CloseToWindow(WinResConfig.Activity19MiniGameMainWindow.name)
        end)
      end
    }, cancelBtnParam, cancelBtnParam)
  end)
end

function Activity19MiniGameWindow.OnClose()
  Release()
  uis = nil
  contentPane = nil
end

function Activity19MiniGameWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Activity19_MiniGame.RESET then
    StartGame()
  end
end

return Activity19MiniGameWindow
