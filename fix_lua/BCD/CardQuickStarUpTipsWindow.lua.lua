require("Card_QuickStarUpTipsWindowByName")
local CardQuickStarUpTipsWindow = {}
local uis, contentPane

function CardQuickStarUpTipsWindow.ReInitData()
end

function CardQuickStarUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.CardQuickStarUpTipsWindow.package, WinResConfig.CardQuickStarUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_QuickStarUpTipsWindowUis(contentPane)
    CardQuickStarUpTipsWindow.InitBtn()
    uis.Main.Tips1.root.opaque = false
    local itemId = bridgeObj.argTable[1]
    local cardId = bridgeObj.argTable[2]
    if cardId and itemId then
      CardQuickStarUpTipsWindow.UpdateInfo(itemId, cardId)
    end
  end)
end

function CardQuickStarUpTipsWindow.UpdateInfo(itemId, cardId)
  local itemData = TableData.GetConfig(itemId, "BaseItem")
  local conf = TableData.GetConfig(cardId, "BaseCard")
  local info = CardData.GetCardDataById(cardId)
  if itemData and info and conf then
    local url = UIUtil.GetResUrl(itemData.icon)
    UIUtil.ShowStarList(uis.Main.Tips1.Star1List, info, conf)
    local count = ActorData.GetItemCount(itemId)
    local lv = info.grade + count
    UIUtil.ShowStarList(uis.Main.Tips1.Star2List, {grade = lv}, conf)
    uis.Main.Tips1.WordTxt.text = T(2017, url, count, conf.name(), lv)
    UIUtil.SetPopupBtnGroup(uis.Main.Popup_Opal.BtnGroup.root, {
      touchCallback = function()
        local newInfo = {
          grade = info.grade,
          cardId = info.cardId
        }
        CardService.MultiGradeUpCardReq(cardId, function()
          OpenWindow(WinResConfig.CardQuickStarUpSuccessWindow.name, nil, newInfo, function()
            CardStarUpWindow.RefreshStarUp()
          end)
          UIMgr:CloseWindow(WinResConfig.CardQuickStarUpTipsWindow.name)
        end)
      end
    }, {
      touchCallback = function()
        UIMgr:CloseWindow(WinResConfig.CardQuickStarUpTipsWindow.name)
      end
    })
  end
end

function CardQuickStarUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.CardQuickStarUpTipsWindow.name)
  end)
end

function CardQuickStarUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return CardQuickStarUpTipsWindow
