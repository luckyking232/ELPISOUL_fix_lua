require("ActivityDungeon1004_MiniStart_EndRewardWindowByName")
local Activity5MiniGameSubmitWindow = {}
local uis, contentPane, succeed, score, consumeSeconds, unmetlist
local gameId = 70441005

function Activity5MiniGameSubmitWindow.ReInitData()
end

function Activity5MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameSubmitWindow.package, WinResConfig.Activity5MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    succeed = bridgeObj.argTable[1]
    score = bridgeObj.argTable[2]
    consumeSeconds = bridgeObj.argTable[3]
    unmetlist = bridgeObj.argTable[4]
    uis = GetActivityDungeon1004_MiniStart_EndRewardWindowUis(contentPane)
    Activity5MiniGameSubmitWindow.UpdateInfo()
    Activity5MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity5MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20618)
  local failureTitleTxt = T(20615)
  local scoreTxt = T(20532)
  local failureTxt = T(20616)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  UIUtil.SetText(uis.Main.root, succeed and succeedTitleTxt or failureTitleTxt, "TitleTxt")
  UIUtil.SetText(uis.Main.root, scoreTxt, "NumberWordTxt")
  UIUtil.SetText(uis.Main.root, score, "NumberTxt")
  local endFail = uis.Main.root:GetChild("EndFail")
  UIUtil.SetText(endFail, failureTxt, "NumberWordTxt")
  ChangeUIController(uis.Main.root, "c1", succeed and 0 or 1)
  local itemlist = endFail:GetChild("ItemList")
  
  function itemlist.itemRenderer(i, gcmp)
    local info = unmetlist[i + 1]
    local conf = TableData.GetConfig(info.id, "BaseActivityGameItem")
    gcmp:GetChild("PicLoader").url = UIUtil.GetResUrl(conf.icon)
    UIUtil.SetText(gcmp, info.count, "NumberTxt")
  end
  
  itemlist.numItems = unmetlist and #unmetlist or 0
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_end")
end

function Activity5MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity5_MiniGameService.MiniGameSubmitReq(gameId, {}, score, consumeSeconds, function()
      UIMgr:CloseToWindow(WinResConfig.Activity5MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity5_MiniGameService.MiniGameSubmitReq(gameId, {}, score, consumeSeconds, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity5MiniGameWindow.name, WindowMsgEnum.Activity5_MiniGame.RESET)
      UIMgr:CloseWindow(WinResConfig.Activity5MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity5MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5MiniGameSubmitWindow
