require("GuildBoss_BossBattleWindowByName")
local GuildWarLevelSelectedWindow = {}
local uis, contentPane, timer, timer2, delayTween
local GetOrCreateHolder = function(root, name)
  local holder = root:GetChild(name)
  if not holder then
    holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    holder.name = name
    holder.pivotAsAnchor = true
    holder:SetPivot(0.5, 0.5)
    root:AddChild(holder)
    holder:Center()
  end
  return holder
end
local index_locked = {}
local LevelItemRenderer = function(i, gcmp)
  local progressInfo = GuildWarData.GetGuildWarProgressInfo()
  local entry = progressInfo.allBoss[i + 1]
  local round = entry.round
  local stageId = entry.stageId
  local locked = entry.locked
  local bossStates = entry.bossStates
  local index = entry.index
  local stageConf = TableData.GetConfig(stageId, "BaseStage")
  local child = gcmp
  UIUtil.SetText(child:GetChild("Name"), stageConf.name and stageConf.name() or stageConf.id, "NameTxt")
  UIUtil.SetText(child:GetChild("Lock"), T(20775), "WordTxt")
  UIUtil.SetText(child:GetChild("Kill"), T(20514), "WordTxt")
  UIUtil.SetText(child:GetChild("Ing"), T(20567), "WordTxt")
  local loader = child:GetChild("PicLoader")
  loader.url = UIUtil.GetResUrl(stageConf.icon)
  if not locked then
    if index_locked[index] then
      local holder = GetOrCreateHolder(child, "EFFECT_HOLDER")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_midunlock.prefab", holder, nil, true)
    end
    local hpProgressBar = child:GetChild("HpProgressBar")
    local percent = 100
    if bossStates and _G.next(bossStates) then
      local totalMaxHp, totalHp = 0, 0
      for _, state in ipairs(bossStates) do
        totalHp = totalHp + state.hp
        totalMaxHp = totalMaxHp + state.maxHp
      end
      percent = totalHp / totalMaxHp * 100
    end
    hpProgressBar.value = percent
    local integer, frac = math.modf(percent)
    local content = frac > 0 and string.format("%.2f%%", percent) or string.format("%s%%", integer)
    UIUtil.SetText(hpProgressBar, content, "NumberTxt")
    UIUtil.SetText(child:GetChild("MosterRound"), T(20772, round), "NumberTxt")
    ChangeUIController(child, "c1", 1)
  else
    ChangeUIController(child, "c1", 0)
  end
  local monsterConf = TableData.GetConfig(stageConf.boss_id, "BaseMonster")
  UIUtil.ShowElementList(child:GetChild("ElementList"), monsterConf)
  local cmp = child:GetChild("Occupation")
  if cmp then
    if monsterConf.type then
      cmp.visible = true
      ChangeUIController(cmp, "c1", monsterConf.type - 1)
    else
      cmp.visible = false
    end
  end
  child.onClick:Set(function()
    if not locked then
      OpenWindow(WinResConfig.GuildWarLevelDetailInfoWindow.name, nil, stageConf)
    else
      FloatTipsUtil.ShowWarnTips(T(20777))
    end
  end)
  local count = GuildWarData.GetInBattleCount(index)
  ChangeUIController(child, "c2", type(count) == "number" and count > 0 and 1 or 0)
  UIUtil.SetText(child:GetChild("Member"), T(20750), "WordTxt")
  UIUtil.SetText(child:GetChild("Member"), T(20749, count or 0), "NumberTxt")
  index_locked[index] = locked
end
local RefreshPanelInfo = function()
  uis.Main.Round.WordTxt.text = T(20773, GuildWarMgr.GetMinRound())
  UIUtil.SetText(uis.Main.Round.root:GetChild("n3"), T(20774), "WordTxt")
  uis.Main.Round.root.onClick:Set(function()
    local ctrl = uis.Main.Round.root:GetController("c1")
    local selectedIndex = (ctrl.selectedIndex + 1) % ctrl.pageCount
    ctrl.selectedIndex = selectedIndex
    if delayTween then
      delayTween = nil
      LeanTween.cancel(delayTween)
    end
    if 1 == selectedIndex then
      delayTween = LeanTween.delayedCall(1, function()
        ctrl.selectedIndex = 0
        delayTween = nil
      end).id
    end
  end)
  for i = 1, 5 do
    local child = uis.Main.root:GetChild(string.format("Tips%s", i))
    LevelItemRenderer(i - 1, child)
  end
end

function GuildWarLevelSelectedWindow.ReInitData()
end

function GuildWarLevelSelectedWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildWarLevelSelectedWindow.package, WinResConfig.GuildWarLevelSelectedWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_BossBattleWindowUis(contentPane)
    GuildWarLevelSelectedWindow.UpdateInfo()
    GuildWarLevelSelectedWindow.InitBtn()
  end)
end

function GuildWarLevelSelectedWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_LEVEL_SELECTED, "BaseFeature").back_ground)
  RefreshPanelInfo()
  timer = TimerUtil.setInterval(5, -1, function()
    GuildWarService.GetGuildWarAllInfoReq()
  end)
  timer:start()
  GuildWarService.GetGuildWarInBattleCountReq()
  timer2 = TimerUtil.setInterval(2, -1, function()
    GuildWarService.GetGuildWarInBattleCountReq()
  end)
  timer2:start()
end

function GuildWarLevelSelectedWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildWarLevelSelectedWindow.name)
  end)
  local data = TableData.GetConfig(FEATURE_ENUM.GUILD_WAR_LEVEL_SELECTED, "BaseFeature")
  local detailBtn = uis.Main.FunctionDetailsBtn
  if data and data.caption_id then
    detailBtn.visible = true
    local root = uis.Main.root
    detailBtn.onClick:Set(function()
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
    end)
    if data.auto_open_caption and GuideData.CanShowCaption(data.id) then
      root.touchable = false
      LeanTween.delayedCall(0.25, function()
        detailBtn.onClick:Call()
        root.touchable = true
      end)
      GuideData.SaveCaptionOpen(data.id)
    end
  else
    detailBtn.visible = false
  end
end

function GuildWarLevelSelectedWindow.OnClose()
  uis = nil
  contentPane = nil
  if timer then
    timer:stop()
  end
  if timer2 then
    timer2:stop()
  end
  timer = nil
  timer2 = nil
  if delayTween then
    delayTween = nil
    LeanTween.cancel(delayTween)
  end
end

function GuildWarLevelSelectedWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.GuildWar.RECV_GUILD_WAR_ALL_INFO then
    RefreshPanelInfo()
  end
end

return GuildWarLevelSelectedWindow
