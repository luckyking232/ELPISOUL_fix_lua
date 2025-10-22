require("ExploreDungeon_ExploreAdventureWindowByName")
local ExploreDungeonMainWindow = {}
local uis, contentPane
local ENTRANCE_LIST = {
  [1] = {
    name = T(20741),
    desc = T(20742),
    window = WinResConfig.ExploreDungeonUpgradeWindow.name,
    func_id = FEATURE_ENUM.SEAL_DUNGEON_UPGRADE
  },
  [2] = {
    name = T(20743),
    desc = T(20744),
    window = WinResConfig.ExploreDungeonBreakthroughWindow.name,
    func_id = FEATURE_ENUM.SEAL_DUNGEON_BREAKTHROUGH
  },
  [3] = {
    name = T(20745),
    desc = T(20746),
    func_id = FEATURE_ENUM.SEAL_DUNGEON_AMPLIFY
  }
}
local EntranceItemRenderer = function(i, gcmp)
  local item = ENTRANCE_LIST[i + 1]
  local unlock = EnterClampUtil.WhetherToEnter(item.func_id, false)
  UIUtil.SetText(gcmp, item.name, "NameTxt")
  UIUtil.SetText(gcmp, item.desc, "WordTxt")
  ChangeUIController(gcmp, "c1", i)
  ChangeUIController(gcmp, "lock", unlock and 0 or 1)
  gcmp.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(item.func_id, true) then
      OpenWindow(item.window)
    end
  end)
end

function ExploreDungeonMainWindow.ReInitData()
end

function ExploreDungeonMainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ExploreDungeonMainWindow.package, WinResConfig.ExploreDungeonMainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDungeon_ExploreAdventureWindowUis(contentPane)
    ExploreDungeonMainWindow.UpdateInfo()
    ExploreDungeonMainWindow.InitBtn()
  end)
end

function ExploreDungeonMainWindow.UpdateInfo()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ExploreDungeonMainWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.SEAL_DUNGEON_ENTRANCE)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_enter.prefab", uis.Main.root:GetChild("EffectHolder"))
  local list = uis.Main.EnterList
  list.itemRenderer = EntranceItemRenderer
  list.numItems = #ENTRANCE_LIST
end

function ExploreDungeonMainWindow.InitBtn()
end

function ExploreDungeonMainWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ExploreDungeonMainWindow
