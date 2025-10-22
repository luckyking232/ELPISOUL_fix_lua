MiniGameBattleAction = {}

function MiniGameBattleAction.DealStart(battleUnit)
  battleUnit:SetState(BATTLE_STATE_ENUM.STAND)
end

function MiniGameBattleAction.DealStand(unit)
  if unit.isTrick == true then
    return
  end
  if unit.canMove == false and false == unit.canAttack then
    return
  end
  if unit.camp == BATTLE_CAMP_FLAG.RIGHT then
    if unit:IsWallInAttackTarget() then
      if unit:MeetAttackTimeCondition() then
        unit:SetState(BATTLE_STATE_ENUM.ATTACK)
      end
    else
      unit:SetState(BATTLE_STATE_ENUM.MOVE)
    end
  elseif unit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
    if unit:HaveMonsterInAttackRange() and unit:MeetAttackTimeCondition() then
      unit:SetState(BATTLE_STATE_ENUM.ATTACK)
    end
  elseif unit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD_SUMMON and unit.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
    unit:SetState(BATTLE_STATE_ENUM.MOVE)
  end
end

function MiniGameBattleAction.DealMove(battleUnit)
  if battleUnit.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
    local moveArea = {
      minX = MiniGameBattleScene.wallUnit.position.x,
      minY = MiniGameBattleScene.minY,
      maxX = MiniGameBattleScene.initX + MiniGameBattleScene.mapXCount * MiniGameBattleScene.ceilLength,
      maxY = MiniGameBattleScene.maxY
    }
    local speed = battleUnit.speed
    local curPosition = battleUnit.position
    local targetPosition = {
      x = 0,
      y = 0,
      z = 0
    }
    if curPosition.x + speed.x + battleUnit.coverRadiusR >= moveArea.maxX then
      speed.x = -speed.x
      targetPosition.x = moveArea.maxX - battleUnit.coverRadiusR
    elseif curPosition.x + speed.x - battleUnit.coverRadiusR <= moveArea.minX then
      speed.x = -speed.x
      targetPosition.x = moveArea.minX + battleUnit.coverRadiusR
    else
      targetPosition.x = curPosition.x + speed.x
    end
    if curPosition.y + speed.y + battleUnit.coverRadiusR >= moveArea.maxY then
      speed.y = -speed.y
      targetPosition.y = moveArea.maxY - battleUnit.coverRadiusR
    elseif curPosition.y + speed.y - battleUnit.coverRadiusR <= moveArea.minY then
      speed.y = -speed.y
      targetPosition.y = moveArea.minY + battleUnit.coverRadiusR
    else
      targetPosition.y = curPosition.y + speed.y
    end
    battleUnit:SavePosition(targetPosition.x, targetPosition.y, targetPosition.z)
  else
    local speed = battleUnit:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS
    local wallUnit = MiniGameBattleScene.wallUnit
    if wallUnit then
      local dis = battleUnit.position.x - wallUnit.position.x - battleUnit.coverRadiusR - battleUnit.tempRangeAtk
      speed = math.min(speed, dis)
    end
    if speed <= 0 then
      MiniGameBattleAction.ForceChangeState(battleUnit, BATTLE_STATE_ENUM.ATTACK)
    else
      battleUnit.speed = {
        -speed,
        0,
        0
      }
      local position = battleUnit.position
      battleUnit:SavePosition(position.x - speed, position.y, position.z)
    end
  end
end

function MiniGameBattleAction.DealAttack(attackUnit)
  local curSkillFrame = attackUnit.curSkillFrame
  if nil == curSkillFrame then
    curSkillFrame = 0
  end
  if 0 == curSkillFrame then
    attackUnit.lastSkillFrame = MiniGameBattleControl.curFixedFrame
  end
  curSkillFrame = curSkillFrame + 1
  attackUnit.curSkillFrame = curSkillFrame
  if curSkillFrame == attackUnit.attackSoundFrame then
    MiniGameBattleActionDisplay.PlaySound(attackUnit.attackSound, attackUnit.model)
  end
  if curSkillFrame == attackUnit.curSkillHurtPointFrame then
    local targetUnit = attackUnit:GetAttackTarget()
    if nil == targetUnit then
      MiniGameBattleAction.ForceChangeState(attackUnit)
      return
    end
    local bulletSpeed = attackUnit.normalSkillConfig.bullet_speed
    if bulletSpeed and bulletSpeed > 0 then
      local count = (attackUnit.normalSkillConfig.pierce_num or 1) + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.HURT_CROSS_COUNT_ADD)
      local bulletCount = 1
      if attackUnit.id == MINI_GAME_SPECIAL_CARD.DINA then
        bulletCount = bulletCount + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_NORMAL_BULLET_NUM_ADD)
      elseif attackUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA then
        bulletCount = bulletCount + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_NORMAL_BULLET_NUM_ADD)
      elseif attackUnit.id == MINI_GAME_SPECIAL_CARD.LIEDIXIYA then
        bulletCount = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_NORMAL_BULLET_DEFAULT_NUM) + MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_NORMAL_BULLET_NUM_ADD)
      end
      local tempAttackUnitUidList = {}
      local buffIdList = MiniGameBattleBuffMgr.GetValueListByEffectId(attackUnit, MINI_GAME_BUFF_EFFECT_ID.BULLET_HURT_BUFF)
      for i = 1, bulletCount do
        if i > 1 then
          targetUnit = MiniGameBattleChoose.GetNearestMonster(1, tempAttackUnitUidList)[1]
        end
        if targetUnit then
          local extraNum = 0
          if attackUnit.id == MINI_GAME_SPECIAL_CARD.FEINISI then
            extraNum = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_NORMAL_BULLET_EXTRA_NUM)
          elseif attackUnit.id == MINI_GAME_SPECIAL_CARD.LIEDIXIYA then
            extraNum = MiniGameBattleBuffMgr.GetValueById(attackUnit, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_NORMAL_BULLET_EXTRA_NUM)
          end
          for index = 1, extraNum + 1 do
            local bullet = MiniGameBattleSceneMgr.AddBullet(attackUnit, MathUtil.GetVector3Add(attackUnit.position, attackUnit.bulletPosition), MathUtil.GetVector3Add(targetUnit.position, targetUnit.hitPosition), {
              hitSound = attackUnit.hitSound,
              hurtMaxCount = count,
              skillId = attackUnit.normalSkillId,
              delayFrame = (index - 1) * 3
            })
            if #buffIdList > 0 then
              bullet:SetHurtBuff(buffIdList)
            end
            if attackUnit.id == MINI_GAME_SPECIAL_CARD.FEINISI then
              MiniGameBattleBuff.NewBuff(78040401, {
                unitUid = attackUnit.uid
              }, {
                bulletUid = bullet.uid
              }, true, {})
            end
          end
          table.insert(tempAttackUnitUidList, targetUnit.uid)
        end
      end
    elseif attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.NORMAL_ENEMY or attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY or attackUnit.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY then
      local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(attackUnit, targetUnit, attackUnit.normalSkillConfig)
      if hurt > 0 then
        local realNum = MiniGameBattleAction.DealHurt(attackUnit, targetUnit, hurt, nil, hurtExtraParams)
      end
    end
  end
  if curSkillFrame >= attackUnit.curSkillTotalFrame then
    attackUnit:SetState(BATTLE_STATE_ENUM.ATTACK_OVER)
  end
end

function MiniGameBattleAction.DealAttackOver(battleUnit)
  MiniGameBattleAction.ForceChangeState(battleUnit)
end

function MiniGameBattleAction.ClearAttackInfo(battleUnit)
  battleUnit.curSkillFrame = nil
end

function MiniGameBattleAction.DealDying(battleUnit)
  battleUnit:ClearControlState()
  battleUnit:SetStateToDead()
end

function MiniGameBattleAction.DealDead(battleUnit)
  if battleUnit.needDealAddExp then
    MiniGameBattleDataMgr.AddExp(math.ceil(battleUnit.baseConfig.exp * (10000 + battleUnit.addExpPer) / 10000))
    battleUnit.needDealAddExp = false
  end
  local waitFrameDestroy = battleUnit.waitFrameDestroy
  if nil == waitFrameDestroy or waitFrameDestroy <= 0 then
    battleUnit.waitFrameDestroy = nil
    battleUnit:SetStateToDestroy()
  else
    waitFrameDestroy = waitFrameDestroy - 1
    battleUnit.waitFrameDestroy = waitFrameDestroy
  end
end

function MiniGameBattleAction.InitBeatBackUnitData(battleUnit, summonFromUnitUid)
  local totalFrames = 15
  battleUnit.beatBackFrames = totalFrames
  local dis = MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.BEAT_BACK)
  if summonFromUnitUid then
    local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(summonFromUnitUid)
    dis = dis + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_TALENT_BULLET_BEAT_BACK_DIS_ADD)
  end
  battleUnit.beatBackPerFrame = {
    x = dis / totalFrames,
    y = 0,
    z = 0
  }
end

function MiniGameBattleAction.DealBeatBack(battleUnit)
  local beatBackFrames = battleUnit.beatBackFrames
  beatBackFrames = beatBackFrames - 1
  if beatBackFrames < 0 then
    battleUnit.beatBackFrames = nil
    battleUnit:UpdateModelPosition()
    battleUnit:SetState(BATTLE_STATE_ENUM.STAND, true)
  else
    battleUnit.beatBackFrames = beatBackFrames
    local position = battleUnit.position
    position = MathUtil.GetVector3Add(position, battleUnit.beatBackPerFrame)
    battleUnit:SavePosition(position.x, position.y, position.z)
  end
end

function MiniGameBattleAction.ForceChangeState(battleUnit, changeToState, triggerBuff)
  if battleUnit.curState == changeToState then
    return
  end
  if battleUnit.curState == BATTLE_STATE_ENUM.MOVE then
    MiniGameBattleAction.DealStopMove(battleUnit, changeToState)
  elseif battleUnit.curState == BATTLE_STATE_ENUM.ATTACK or battleUnit.curState == BATTLE_STATE_ENUM.ATTACK_OVER then
    MiniGameBattleAction.DealStopAttack(battleUnit, changeToState)
  else
    battleUnit:SetState(changeToState)
  end
end

function MiniGameBattleAction.DealStopMove(battleUnit, changeToState)
  battleUnit:UpdateModelPosition()
  battleUnit.speed = {
    x = 0,
    y = 0,
    z = 0
  }
  battleUnit:SetState(changeToState or BATTLE_STATE_ENUM.STAND)
end

function MiniGameBattleAction.DealStopAttack(battleUnit, changeToState)
  battleUnit:ResetNextAttackFrame()
  MiniGameBattleAction.ClearAttackInfo(battleUnit)
  battleUnit:SetState(changeToState or BATTLE_STATE_ENUM.STAND)
  MiniGameBattleBuffMgr.UnRegisterSettleListenerByUnitUid(battleUnit.uid)
end

function MiniGameBattleAction.DealHurt(atkUnit, defUnit, num, hurtDisplayType, hurtExtraParams, hitEffect)
  hurtExtraParams = hurtExtraParams or {}
  local realNum = 0
  if num then
    if num > 0 then
      local curHp = defUnit:GetHp()
      if curHp - num < 0 then
        realNum = curHp
      else
        realNum = num
      end
      hurtDisplayType = hurtDisplayType or HURT_NUM_ENUM.NOR_HURT
      if hurtExtraParams.isCrit == true then
        hurtDisplayType = HURT_NUM_ENUM.CRI_HURT
      end
      if realNum > 0 then
        defUnit.totalHurt = defUnit.totalHurt + realNum
      end
    elseif num < 0 then
      local curHp = defUnit:GetHp()
      local maxHp = defUnit:GetAttr(ATTR_ENUM.max_hp)
      if maxHp < curHp - num then
        realNum = curHp - maxHp
      else
        realNum = num
      end
      hurtDisplayType = HURT_NUM_ENUM.NOR_TREATMENT
    end
    if 0 ~= realNum then
      defUnit:ChangeAttr(ATTR_ENUM.hp, -realNum)
      if realNum > 0 and atkUnit then
        atkUnit:SaveDamage(realNum)
      end
      defUnit:UpdateTempHpPer()
    end
    table.insert(defUnit.savedHurtDisplayList, 1, {
      attackUnitUid = atkUnit and atkUnit.uid,
      num = num,
      displayType = hurtDisplayType,
      hurtExtraParams = hurtExtraParams,
      hitEffect = hitEffect
    })
  end
  return realNum
end

function MiniGameBattleAction.DealTriggerSkill(battleUnit, specificCondition, skillList, triggerFromUnitUid)
  local isTrigger, skill
  for i = 1, #skillList do
    skill = skillList[i]
    if skill.enable == true then
      isTrigger = MiniGameBattleAction.DealTriggerSkillCondition(battleUnit, skill.skillId, specificCondition)
      if isTrigger then
        MiniGameBattleAction.DealUnitSkill(battleUnit, skill.skillId, triggerFromUnitUid)
      end
    end
  end
end

function MiniGameBattleAction.DealTriggerSkillCondition(battleUnit, skillId, specificCondition)
  if specificCondition == MINI_GAME_TRIGGER_CONDITION.CD then
    local lastTriggerFrame = battleUnit:GetLastFrameBySkillId(skillId)
    if 0 == lastTriggerFrame then
      return true
    end
    local skillConfig = TableData.GetConfig(skillId, "BaseShootSkill")
    if MiniGameBattleControl.curFixedFrame - lastTriggerFrame >= skillConfig.trigger_cd then
      return true
    end
  elseif specificCondition == MINI_GAME_TRIGGER_CONDITION.NORMAL_HURT then
    return true
  end
  return false
end

function MiniGameBattleAction.DealUnitSkill(battleUnit, skillId, triggerFromUnitUid)
  local skillConfig = TableData.GetConfig(skillId, "BaseShootSkill")
  local randomAdd
  local tos = {}
  if battleUnit.id == MINI_GAME_SPECIAL_CARD.ANNISI then
    if skillId == battleUnit.talentSkillId then
      local allMonster = SimpleCopy(MiniGameBattleScene.aliveMonsterList)
      if 0 == allMonster then
        return false
      end
      local count = 1 + MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_SKILL_TARGET_ADD)
      local centerUnitList = {}
      if #allMonster > 1 then
        allMonster = table.randomSort(allMonster)
      end
      for i = 1, count do
        table.insert(centerUnitList, allMonster[i] or allMonster[1])
      end
      local range = skillConfig.range_x + MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_SKILL_RANGE_ADD)
      for i, centerUnit in ipairs(centerUnitList) do
        local position = {
          x = centerUnit.position.x + MiniGameBattleMgr.GetRandomNum(-10, 10),
          y = centerUnit.position.y + MiniGameBattleMgr.GetRandomNum(-10, 10),
          z = 0
        }
        local effect = MiniGameBattleActionDisplay.PlayEffect(skillConfig.effect, position, range / 100)
        SortingHelper.SetOrderInLayer(effect, BATTLE_CONFIG_ENUM.SORTING_ORDER_TRAP)
        local targetUnitList = MiniGameBattleChoose.GetSkillTargetUnitList(nil, nil, skillConfig, {centerPosition = position, range = range})
        for _, target in ipairs(targetUnitList) do
          local hurt, hurtExtraParams = MiniGameBattleDataCount.GetSkillHurt(battleUnit, target, skillConfig)
          if hurt > 0 then
            local realNum = MiniGameBattleAction.DealHurt(battleUnit, target, hurt, nil, hurtExtraParams)
          end
          table.insert(tos, {
            unitUid = target.uid
          })
        end
      end
    end
  elseif battleUnit.id == MINI_GAME_SPECIAL_CARD.DINA then
    if skillId == battleUnit.talentSkillId then
      local range = skillConfig.bullet_size * (10000 + MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_TALENT_BULLET_RANGE_ADD)) / 10000
      local scale = range / 100
      local bulletCount = 1 + MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_TALENT_BULLET_COUNT_ADD)
      local buffId = MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_TALENT_BULLET_HURT_BUFF)
      for i = 1, bulletCount do
        local position = {
          x = MiniGameBattleScene.wallUnit.position.x,
          y = MiniGameBattleMgr.GetRandomNum(MiniGameBattleScene.minY + range, MiniGameBattleScene.maxY - range),
          z = 0
        }
        local bullet = MiniGameBattleSceneMgr.AddBullet(battleUnit, position, {
          x = position.x + 1000,
          y = position.y,
          z = 0
        }, {
          hurtMaxCount = 9999,
          skillId = battleUnit.talentSkillId,
          scale = scale,
          range = range
        })
        if buffId > 0 then
          bullet:SetHurtBuff({buffId})
        end
        MiniGameBattleActionDisplay.PlaySound(70940044, bullet.model)
      end
    end
  elseif battleUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA then
    if skillId == battleUnit.talentSkillId then
      local summonCardId = MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_SUMMON)
      if summonCardId > 0 then
        local summonUnit = MiniGameBattleSceneMgr.AddUnit({
          id = summonCardId,
          position = MathUtil.GetVector3Add(battleUnit.position, battleUnit.bulletPosition),
          camp = BATTLE_CAMP_FLAG.LEFT,
          state = BATTLE_STATE_ENUM.START,
          summonFromUnitUid = battleUnit.uid,
          summonFromUnitId = battleUnit.id
        })
        table.insert(MiniGameBattleScene.cardSummonList, 1, summonUnit)
        MiniGameBattleBuff.NewBuff(78040322, {
          unitUid = battleUnit.uid
        }, {
          unitUid = summonUnit.uid
        }, true, {})
      end
    end
  elseif battleUnit.id == MINI_GAME_SPECIAL_CARD.FEINISI then
    if skillId == battleUnit.passiveSkillId then
      randomAdd = MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING_RANDOM_ADD)
    elseif skillId == battleUnit.talentSkillId then
      local summonCardId = MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_SUMMON)
      if summonCardId > 0 then
        local randomMonster = MiniGameBattleChoose.GetRandomMonster()
        local position
        if randomMonster then
          position = randomMonster.position
        else
          local cardConfig = TableData.GetConfig(summonCardId, "BaseShootCard")
          local range = cardConfig.range + MiniGameBattleBuffMgr.GetValueById(battleUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_RANGE_ADD)
          position = {
            x = MiniGameBattleMgr.GetRandomNum(MiniGameBattleScene.minX + range, MiniGameBattleScene.maxX - range),
            y = MiniGameBattleMgr.GetRandomNum(MiniGameBattleScene.minY + range, MiniGameBattleScene.maxY - range),
            z = 0
          }
        end
        if position then
          local summonUnit = MiniGameBattleSceneMgr.AddUnit({
            id = summonCardId,
            position = position,
            camp = BATTLE_CAMP_FLAG.LEFT,
            state = BATTLE_STATE_ENUM.START,
            summonFromUnitUid = battleUnit.uid,
            summonFromUnitId = battleUnit.id
          })
          table.insert(MiniGameBattleScene.cardSummonList, 1, summonUnit)
          MiniGameBattleBuff.NewBuff(78040422, {
            unitUid = battleUnit.uid
          }, {
            unitUid = summonUnit.uid
          }, true, {})
        end
      end
    end
  end
  local buffList = skillConfig.buff_list
  if buffList then
    MiniGameBattleBuffMgr.AnalysisBuffList(buffList, {
      unitUid = battleUnit.uid
    }, tos, true, {randomAdd = randomAdd, triggerFromUnitUid = triggerFromUnitUid})
  end
  battleUnit:SaveTriggerSkill(skillId)
end
