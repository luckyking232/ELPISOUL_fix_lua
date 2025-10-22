MiniGameBattleActionDisplay = {}

function MiniGameBattleActionDisplay.PlayStart(unit)
  unit:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.IDLE)
end

function MiniGameBattleActionDisplay.PlayStand(unit)
  unit:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.IDLE)
end

function MiniGameBattleActionDisplay.PlayMove(unit)
  unit:UpdateModelPosition()
  unit:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.RUN)
end

function MiniGameBattleActionDisplay.PlayAttack(unit)
  unit:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.SKILL_1)
end

function MiniGameBattleActionDisplay.PlayDead(unit)
  unit:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.DIE, false)
end

function MiniGameBattleActionDisplay.PlayStun(unit)
  if unit.model then
    unit:ChangeAnimation(SPINE_STATE_ENUM.DIZZY, true)
  end
end

function MiniGameBattleActionDisplay.PlayBeatBack(unit)
  unit:UpdateModelPosition()
  unit:ChangeAnimation(SPINE_STATE_ENUM.HIT, false)
end

function MiniGameBattleActionDisplay.PlayHurt(unit)
  local hurtList = unit.savedHurtDisplayList
  if #hurtList > 0 then
    local info, num, hurtNumType, absorbHurt, hurtExtraParams, hurtEffectParams, hitEffect
    for i = #hurtList, 1, -1 do
      info = hurtList[i]
      num = info.num
      hurtNumType = info.displayType
      hurtExtraParams = info.hurtExtraParams
      hurtEffectParams = info.hurtEffectParams
      hitEffect = info.hitEffect
      if unit.messageBar then
        unit.messageBar:UpdateHp(unit)
      end
      if num > 0 then
        MiniGameBattleHurtNum.ShowHurtNum(hurtNumType or HURT_NUM_ENUM.NOR_HURT, num, unit, hurtExtraParams)
      elseif num < 0 then
        MiniGameBattleHurtNum.ShowHurtNum(hurtNumType or HURT_NUM_ENUM.NOR_TREATMENT, -num, unit, hurtExtraParams)
      end
      SkeletonAnimationUtil.TwinkleColor(unit.childModel, Application.targetFrameRate / 3)
    end
    unit.savedHurtDisplayList = {}
  end
end

function MiniGameBattleActionDisplay.PlayHitEffect(unit, hitEffect)
  local effect = ResourceManager.Instantiate(hitEffect)
  local position = MathUtil.GetVector3Add(unit.position, unit.hitPosition)
  local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
  BattleResourceManager:AddGameObject(effect, position.x / pixelsPerUnit, position.y / pixelsPerUnit, position.z)
  EffectUtil.SetAutoDestroyCallback(effect, function()
    if effect then
      BattleResourceManager:DestroyGameObject(effect)
    end
  end)
end

function MiniGameBattleActionDisplay.PlayMonsterAppearEffect(monster)
  local path = "Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_monster_appear.prefab"
  local effect = ResourceManager.Instantiate(path)
  local position = monster.position
  local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
  BattleResourceManager:AddGameObject(effect, position.x / pixelsPerUnit, position.y / pixelsPerUnit, position.z)
  EffectUtil.SetAutoDestroyCallback(effect, function()
    if effect then
      BattleResourceManager:DestroyGameObject(effect)
    end
  end)
end

function MiniGameBattleActionDisplay.PlayEffect(effectPath, position, scale)
  local effect = ResourceManager.Instantiate(effectPath)
  local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
  BattleResourceManager:AddGameObject(effect, position.x / pixelsPerUnit, position.y / pixelsPerUnit, position.z, scale, scale, 1)
  EffectUtil.SetAutoDestroyCallback(effect, function()
    if effect then
      BattleResourceManager:DestroyGameObject(effect)
    end
  end)
  return effect
end

function MiniGameBattleActionDisplay.PlaySound(soundId, gameObject)
  if soundId then
    local soundConfig = TableData.GetConfig(soundId, "BaseSoundPath")
    if soundConfig then
      return SoundUtil.PlaySfxInBattle(soundConfig.path, soundConfig.bank, gameObject)
    end
  end
end
