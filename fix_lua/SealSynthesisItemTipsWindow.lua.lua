require("ExploreDevelop_SynthesisItemTipsWindowByName")
local SealSynthesisItemTipsWindow = {}
local uis, contentPane, sealId, combinedCount, resultCount
local LevelText = function(lv_size1, lv_size2, lv_val)
  return string.format("Lv.%s", lv_val)
end

function SealSynthesisItemTipsWindow.ReInitData()
end

function SealSynthesisItemTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SealSynthesisItemTipsWindow.package, WinResConfig.SealSynthesisItemTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDevelop_SynthesisItemTipsWindowUis(contentPane)
    sealId = bridgeObj.argTable[1]
    combinedCount = bridgeObj.argTable[2]
    resultCount = bridgeObj.argTable[3]
    SealSynthesisItemTipsWindow.UpdateInfo()
    SealSynthesisItemTipsWindow.InitBtn()
  end)
end

function SealSynthesisItemTipsWindow.UpdateInfo()
  local count = math.floor(combinedCount / 2)
  local panel = uis.Main.GetItemTips1
  panel.TitleTxt.text = T(20584)
  panel.SubtitleTxt.text = T(20587)
  UIUtil.SetText(panel.Title1.root, T(20601), "Title")
  UIUtil.SetText(panel.Title2.root, T(20602), "Title")
  panel.Title1.WordTxt.text = T(20583, count, resultCount)
  panel.Title2.WordTxt.text = T(20603)
  local itemlist = panel.Title1.ItemList.ItemList
  local conf = TableData.GetConfig(sealId, "BaseSeal")
  
  function itemlist.itemRenderer(i, gcmp)
    local loader = gcmp:GetChild("PicLoader")
    local failure = T(20585)
    local success = T(20586)
    local level = conf.level
    local quality, sealId
    if i + 1 <= resultCount then
      level = level + 1
      UIUtil.SetText(gcmp, success, "WordTxt")
      UIUtil.SetIconById(loader, conf.next_seal_id)
      sealId = conf.next_seal_id
      quality = TableData.GetConfig(conf.next_seal_id, "BaseItem").quality
      ChangeUIController(gcmp, "c1", 0)
    else
      UIUtil.SetText(gcmp, failure, "WordTxt")
      UIUtil.SetIconById(loader, conf.id)
      sealId = conf.id
      quality = TableData.GetConfig(conf.id, "BaseItem").quality
      ChangeUIController(gcmp, "c1", 1)
    end
    UIUtil.SetText(gcmp, LevelText(16, 26, level), "LevelTxt")
    ChangeUIController(gcmp, "c2", 0)
    ChangeUIController(gcmp, "color", quality)
    gcmp.onClick:Set(function()
      OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {id = sealId, notShowWay = false})
    end)
  end
  
  itemlist:SetVirtual()
  itemlist.numItems = count
  for i = 0, itemlist.numChildren - 1 do
    local quality
    if i + 1 <= resultCount then
      quality = TableData.GetConfig(conf.next_seal_id, "BaseItem").quality
    else
      quality = TableData.GetConfig(conf.id, "BaseItem").quality
    end
    local gcmp = itemlist:GetChildAt(i)
    gcmp.alpha = 0
    gcmp.visible = false
    local holder = gcmp:GetChild("EffectHolder")
    UIUtil.SetEffectToUI(string.format(RES_PATH_PREFIX.GET_ITEM_PATH, math.min(math.max(quality + 2, 2), 6)), holder, nil, true)
    TimerUtil.setTimeout(i * 0.15, function()
      if uis and gcmp and not gcmp.isDisposed then
        gcmp.visible = true
        gcmp:TweenFade(1, i * 0.15)
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM)
      end
    end)
  end
  local returnCnt = count - resultCount
  itemlist = panel.Title2.ItemList.ItemList
  
  function itemlist.itemRenderer(i, gcmp)
    local loader = gcmp:GetChild("PicLoader")
    local level = conf.level
    local quality
    UIUtil.SetIconById(loader, conf.id)
    quality = TableData.GetConfig(conf.id, "BaseItem").quality
    ChangeUIController(gcmp, "c1", 1)
    ChangeUIController(gcmp, "c2", 1)
    UIUtil.SetText(gcmp, LevelText(16, 26, level), "LevelTxt")
    ChangeUIController(gcmp, "color", quality)
    gcmp.onClick:Set(function()
      OpenWindow(WinResConfig.ItemGetTipsWindow.name, nil, {
        id = conf.id,
        notShowWay = false
      })
    end)
  end
  
  itemlist:SetVirtual()
  itemlist.numItems = returnCnt
  uis.Main.GetItemTips1.c1Ctr.selectedIndex = returnCnt > 0 and 1 or 0
end

function SealSynthesisItemTipsWindow.InitBtn()
  uis.Main.GetItemTips1.root.opaque = false
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.SealSynthesisItemTipsWindow.name)
  end)
end

function SealSynthesisItemTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return SealSynthesisItemTipsWindow
