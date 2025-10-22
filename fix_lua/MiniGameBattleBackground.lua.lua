MiniGameBattleBackground = {
  model = nil,
  modelUp = nil,
  sound = nil
}

function MiniGameBattleBackground.Init()
  local stageConfig = MiniGameBattleData.stageConfig
  local model = ResourceManager.Instantiate(stageConfig.background_path)
  SoundUtil.PlayMusic(stageConfig.sound_id)
  MiniGameBattleBackground.model = model
  LuaUtil.ChangeLayer(model.transform, "Default")
  local scale = 1
  BattleResourceManager:AddGameObject(model, 0, 0, 0, scale, scale, scale)
  local SortingHelper = require("SortingHelper")
  SortingHelper.SetOrderInLayer(model, BATTLE_CONFIG_ENUM.SORTING_ORDER_BACKGROUND)
end

function MiniGameBattleBackground.Clear()
  if MiniGameBattleBackground.model then
    MiniGameBattleBackground.model = nil
  end
  SoundUtil.StopCurMusic(false, true)
end
