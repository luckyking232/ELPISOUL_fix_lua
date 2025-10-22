require("ActivityDungeon1004_MiniStart2_End2WindowByName")
local Activity5FishNewEndWindow = {}
local uis, contentPane, fishId, v2

function Activity5FishNewEndWindow.ReInitData()
end

function Activity5FishNewEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishNewEndWindow.package, WinResConfig.Activity5FishNewEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniStart2_End2WindowUis(contentPane)
    fishId = bridgeObj.argTable[1]
    v2 = bridgeObj.argTable[2]
    Activity5FishNewEndWindow.UpdateInfo()
    Activity5FishNewEndWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_fish_reward")
  end)
end

function Activity5FishNewEndWindow.UpdateInfo()
  uis.Main.TitleTxt.text = T(1709)
  local data = TableData.GetConfig(fishId, "BaseActivityGameItem")
  if data then
    uis.Main.PicLoader.url = UIUtil.GetResUrl(data.icon)
    uis.Main.NameTxt.text = data.name()
    uis.Main.WordTxt.text = T(1707, data.name())
  end
end

function Activity5FishNewEndWindow.InitBtn()
  uis.Main.root.onClick:Set(function()
    if v2 then
      uis.Main.root.touchable = false
      local icon = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Loader)
      icon.url = uis.Main.PicLoader.url
      GRoot.inst:AddChild(icon)
      local startPos = uis.Main.PicLoader:LocalToRoot(Vector2.zero, GRoot.inst.root)
      icon:SetXY(startPos.x, startPos.y)
      uis.Main.root:TweenFade(0, 0.35):OnComplete(function()
        icon:TweenMove(v2, 0.6)
        icon:TweenScale(Vector2(0.4, 0.4), 0.6):SetEase(EaseType.CircInOut):OnComplete(function()
          icon:Dispose()
          UIMgr:CloseWindow(WinResConfig.Activity5FishNewEndWindow.name)
          UIMgr:SendWindowMessage(WinResConfig.Activity5FishWindow.name, WindowMsgEnum.Activity5_MiniGame.RESET)
        end)
      end)
    end
  end)
end

function Activity5FishNewEndWindow.OnClose()
  uis = nil
  contentPane = nil
  fishId = nil
  v2 = nil
end

return Activity5FishNewEndWindow
