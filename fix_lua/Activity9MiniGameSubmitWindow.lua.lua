require("ActivityDungeon1008_MiniStart_EndRewardWindowByName")
local Activity9MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral, stageId, fail

function Activity9MiniGameSubmitWindow.ReInitData()
end

function Activity9MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniGameSubmitWindow.package, WinResConfig.Activity9MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniStart_EndRewardWindowUis(contentPane)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    stageId = bridgeObj.argTable[2]
    fail = bridgeObj.argTable[3]
    if not fail then
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_vic")
    else
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_activity9_chidou_fail")
    end
    Activity9MiniGameSubmitWindow.UpdateInfo()
    Activity9MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_END)
  end)
end

function Activity9MiniGameSubmitWindow.UpdateInfo()
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
  local againTxt = T(20490)
  if info and not fail and not info.extraCount[stageId] then
    info.extraCount[stageId] = 1
    if not Activity9MiniGameSubmitWindow.CanPassAllStage(info.extraCount) then
      againTxt = T(1876)
    end
  end
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = fail and T(1873) or T(1860)
  uis.Main.NumberWordTxt.text = T(1861)
  uis.Main.WordTxt.text = T(1862)
  uis.Main.EndFail.NumberWordTxt.text = T(1863)
  ChangeController(uis.Main.c1Ctr, fail and 1 or 0)
  uis.Main.NumberTxt.text = nowIntegral
end

function Activity9MiniGameSubmitWindow.CanPassAllStage(haveData)
  local data = TableData.GetTable("BaseActivityGame")
  local difficulty = {}
  for i, v in pairs(data) do
    if v.game_id == Activity9_MiniGameData.gameId then
      table.insert(difficulty, v)
    end
  end
  table.sort(difficulty, function(a, b)
    return a.game_stage < b.game_stage
  end)
  local len = #difficulty
  if haveData[difficulty[len].id] then
    return true
  end
  return false
end

function Activity9MiniGameSubmitWindow.InitBtn()
  local map = {}
  if not fail then
    map[stageId] = 1
  end
  uis.Main.CloseBtn.onClick:Set(function()
    Activity9_MiniGameService.MiniGameSubmitReq(Activity9_MiniGameData.gameId, map, nowIntegral, stageId, function()
      UIMgr:CloseToWindow(WinResConfig.Activity9MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity9_MiniGameService.MiniGameSubmitReq(Activity9_MiniGameData.gameId, map, nowIntegral, stageId, function()
      UIMgr:CloseWindow(WinResConfig.Activity9MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity9MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  stageId = nil
  nowIntegral = nil
  fail = nil
end

return Activity9MiniGameSubmitWindow
