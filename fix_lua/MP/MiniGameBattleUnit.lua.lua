MiniGameBattleUnit = {}
local RestraintAddName = {
  "restraint_add1",
  "restraint_add2",
  "restraint_add3",
  "restraint_add4",
  "restraint_add5"
}
local RestraintSubName = {
  "restraint_sub1",
  "restraint_sub2",
  "restraint_sub3",
  "restraint_sub4",
  "restraint_sub5"
}
local hudCom

function MiniGameBattleUnit.NewUnit(data)
  local unit = {}
  local ATTR_ID = ProtoEnum.ATTR_ID
  local ceil = math.ceil
  local pairs = pairs
  
  function unit:Init()
    self:InitBaseData()
    if data.isGrid then
      self.isGrid = true
    end
    self:InitData(data)
    if data.position then
      local position = data.position
      if self.camp == BATTLE_CAMP_FLAG.RIGHT and self.summonFromUnitId then
        local area = {
          minX = MiniGameBattleScene.wallUnit.position.x,
          minY = MiniGameBattleScene.minY,
          maxX = MiniGameBattleScene.initX + MiniGameBattleScene.mapXCount * MiniGameBattleScene.ceilLength,
          maxY = MiniGameBattleScene.maxY
        }
        if position.x + self.coverRadiusR > area.maxX then
          position.x = area.maxX - self.coverRadiusR
        elseif position.x - self.coverRadiusR < area.minX then
          position.x = area.minX + self.coverRadiusR
        end
        if position.y + self.coverRadiusR > area.maxY then
          position.y = area.maxY - self.coverRadiusR
        elseif position.y - self.coverRadiusR < area.minY then
          position.y = area.minY + self.coverRadiusR
        end
      end
      self:SavePosition(position.x, position.y, position.z)
    elseif self.isGrid then
      local x, y, z = MiniGameBattleSceneMgr.GetInitPosition(self.positionIndex)
      self:SavePosition(x, y, z)
      self:CreateModel()
      self:UpdateModelPosition()
      return
    elseif self.positionIndex and 0 ~= self.positionIndex then
      local x, y, z = MiniGameBattleSceneMgr.GetInitPosition(self.positionIndex)
      self:SavePosition(x, y, z)
    end
    self:CreateModel()
    self:UpdateModelPosition()
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY or self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY then
      self.messageBar = MiniGameBattleMessageBar.BindInfo(self)
    end
    self:AddStateAction(BATTLE_STATE_ENUM.START, MiniGameBattleAction.DealStart, MiniGameBattleActionDisplay.PlayStart)
    self:AddStateAction(BATTLE_STATE_ENUM.STAND, MiniGameBattleAction.DealStand, MiniGameBattleActionDisplay.PlayStand)
    self:AddStateAction(BATTLE_STATE_ENUM.MOVE, MiniGameBattleAction.DealMove, MiniGameBattleActionDisplay.PlayMove)
    self:AddStateAction(BATTLE_STATE_ENUM.ATTACK, MiniGameBattleAction.DealAttack, MiniGameBattleActionDisplay.PlayAttack)
    self:AddStateAction(BATTLE_STATE_ENUM.ATTACK_OVER, MiniGameBattleAction.DealAttackOver)
    self:AddStateAction(BATTLE_STATE_ENUM.DEAD, MiniGameBattleAction.DealDead, MiniGameBattleActionDisplay.PlayDead)
    self:AddStateAction(BATTLE_STATE_ENUM.BEAT_BACK, MiniGameBattleAction.DealBeatBack, MiniGameBattleActionDisplay.PlayBeatBack)
    if data.state then
      self:SetState(data.state)
    end
  end
  
  function unit:InitBaseData()
    self.positionIndex = 0
    self.positionIndexX = 0
    self.positionIndexY = 0
    self.position = {
      x = 0,
      y = 0,
      z = 0
    }
    self.bulletPosition = {
      x = 0,
      y = 0,
      z = 0
    }
    self.hitPosition = {
      x = 0,
      y = 0,
      z = 0
    }
    self.sortingOrder = nil
    self.fixedSortingOrder = nil
    self.totalHurt = 0
    self.lastHpPer = nil
    self.tempHpPer = nil
    self.states = {}
    self.model = nil
    self.childModel = nil
    self.savedFlip = nil
    self.moveSpdEffect = nil
    self.freezeEffect = nil
    self.bloodEffect = nil
    self.buffUidList = {}
    self.cachedBuffAttr = {}
    self.cachedBuffEffect = {}
    self.cachedBuffEffectId = {}
    self.savedHurtDisplayList = {}
    self.savedTriggerSkillList = {}
    self.isFreeze = false
    self.isTimePause = false
    self.damageRecord = 0
    self.damagedRecord = 0
    self.treatRecord = 0
    self.treatedRecord = 0
    self.UIPosition = nil
    self.messageBar = nil
    self.isFlip = false
    self.speed = {
      x = 0,
      y = 0,
      z = 0
    }
    self.beatBackPerFrame = {
      x = 0,
      y = 0,
      z = 0
    }
    self.attackTargetUid = nil
    self.needDestroy = nil
    self.modelTimeScale = 1
    self.savedModelTimeScale = 1
    self.curState = nil
    self.preState = nil
    self.curAnimation = nil
    self.skillEffectList = {}
    self.otherEffectList = {}
    self.isDisplayDestroyed = false
    self.nextAttackFrame = 0
    self.waitFrameDestroy = nil
    self.id = nil
    self.uid = nil
    self.name = nil
    self.addHpPer = 0
    self.addExpPer = 0
    self.battleUnitType = nil
    self.initCoverRadiusR = nil
    self.coverRadiusR = nil
    self.isGrid = false
    self.canMove = true
    self.canAttack = true
    self.camp = nil
    self.enemyCamp = nil
    self.skillTriggerTable = {}
    self.skillIdList = {}
    self.attrMap = {}
    self.baseConfig = nil
    self.normalSkillId = nil
    self.normalSkillConfig = nil
    self.passiveSkillId = nil
    self.talentSkillId = nil
    self.skillList = {}
    self.allSkillForChoose = {}
    self.skill2Level = {}
    self.curSkillFrame = nil
    self.curSkillTotalFrame = nil
    self.curSkillHurtPointFrame = nil
    self.lastSkillFrame = nil
    self.savedAttackSoundList = {}
    self.savedAttackSoundTargetList = {}
    self.remainTime = nil
    self.summonFromUnitUid = nil
    self.summonFromUnitId = nil
    self.range = nil
    self.cachedSummonUids = {}
    self.tempRangeAtk = nil
    self.cachedDisplayHurtTips = {}
    self.beatBackFrames = 0
    self.beatBackPerFrame = {}
    self.attackSoundFrame = 0
    self.attackSound = 0
    self.hitSound = 0
    self.loopSound = nil
    self.createSound = nil
  end
  
  function unit:InitData(dataParam)
    self.positionIndex = dataParam.positionIndex
    self.positionIndexX = dataParam.positionIndexX
    self.positionIndexY = dataParam.positionIndexY
    if dataParam.isGrid == true then
      self.uid = dataParam.uid
      return
    end
    self.uid = dataParam.uid
    self.summonFromUnitUid = dataParam.summonFromUnitUid
    self.summonFromUnitId = dataParam.summonFromUnitId
    self.range = dataParam.range
    self.id = dataParam.id
    self.addHpPer = dataParam.addHpPer or 0
    self.addExpPer = dataParam.addExpPer or 0
    local baseConfig = TableData.GetConfig(self.id, "BaseShootCard")
    self.baseConfig = baseConfig
    if baseConfig.monster_time then
      if self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
        local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.summonFromUnitUid)
        self.remainTime = (baseConfig.monster_time + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_TIME_ADD)) * BATTLE_CONFIG_ENUM.FIXED_FPS
      else
        self.remainTime = baseConfig.monster_time * BATTLE_CONFIG_ENUM.FIXED_FPS
      end
    end
    if baseConfig.attack_sound then
      local attackSoundStrings = Split(baseConfig.attack_sound, "|")
      self.attackSoundFrame = tonumber(attackSoundStrings[1])
      self.attackSound = tonumber(attackSoundStrings[2])
    end
    if baseConfig.hit_sound then
      self.hitSound = tonumber(baseConfig.hit_sound)
    end
    self.createSound = dataParam.createSound
    self.battleUnitType = baseConfig.type
    self.isMonster = self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.NORMAL_ENEMY or self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY or self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY
    self.camp = data.camp
    if self.camp == BATTLE_CAMP_FLAG.LEFT then
      self.enemyCamp = BATTLE_CAMP_FLAG.RIGHT
    elseif self.camp == BATTLE_CAMP_FLAG.RIGHT then
      self.enemyCamp = BATTLE_CAMP_FLAG.LEFT
    else
      self.enemyCamp = nil
    end
    self:SetModelFlip(self.camp == BATTLE_CAMP_FLAG.RIGHT)
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
      self.canMove = false
    elseif self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.WALL then
      self.canAttack = false
    end
    self.coverRadiusR = baseConfig.range
    self.initCoverRadiusR = self.coverRadiusR
    if self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
      local fromUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.summonFromUnitUid)
      self.coverRadiusR = self.coverRadiusR + MiniGameBattleBuffMgr.GetValueById(fromUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_RANGE_ADD)
    end
    self.skillIdList = {}
    self.normalSkillId = baseConfig.normal_skill
    if self.normalSkillId then
      self.normalSkillConfig = TableData.GetConfig(self.normalSkillId, "BaseShootSkill")
      self.curSkillTotalFrame = self.normalSkillConfig.total_f
      self.curSkillHurtPointFrame = self.normalSkillConfig.hurt_point
    end
    self.passiveSkillId = baseConfig.special_skill
    self.talentSkillId = baseConfig.talent_skill
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
      self:InitAllSKillForChoose()
    end
    self:InitAttrMap()
    self:UpdateTempHpPer()
    self.tempRangeAtk = self:GetAttr(ATTR_ENUM.range_atk)
    if self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
      local randomAngle = MiniGameBattleMgr.GetRandomNum(0, 360)
      local speed = self:GetSpdMove() / BATTLE_CONFIG_ENUM.FIXED_FPS
      self.speed = {
        x = speed * math.sin(randomAngle * math.pi / 180),
        y = speed * math.cos(randomAngle * math.pi / 180),
        z = 0
      }
    end
  end
  
  function unit:InitAllSKillForChoose()
    local config = TableData.GetTable("BaseShootSkill")
    for _, v in pairs(config) do
      if v.type ~= MINI_GAME_BATTLE_SKILL_TYPE.NORMAL and v.card_id == self.id then
        table.insert(self.allSkillForChoose, v.id)
      end
    end
  end
  
  function unit:GetCurSkillListForChoose(curDealLevel)
    local skillList = {}
    local skillConfig, appear_pre, appear_round, level_max, skillLevel
    for _, id in ipairs(self.allSkillForChoose) do
      skillConfig = TableData.GetConfig(id, "BaseShootSkill")
      appear_pre = skillConfig.appear_pre
      appear_round = skillConfig.appear_round
      level_max = skillConfig.level_max
      skillLevel = self:GetSkillLevel(id)
      if (level_max < 0 or level_max > skillLevel) and curDealLevel >= appear_round and self:HaveSkills(appear_pre) then
        table.insert(skillList, {
          id = id,
          prob = skillConfig.appear_prob,
          unit = self
        })
      end
    end
    return skillList
  end
  
  function unit:HaveSkills(skillIds)
    if nil == skillIds or 0 == #skillIds then
      return true
    end
    for i, v in ipairs(skillIds) do
      if 0 == self:GetSkillLevel(v) then
        return false
      end
    end
    return true
  end
  
  function unit:GetTotalSkillLevel()
    local totalLevel = 0
    for _, level in pairs(self.skill2Level) do
      totalLevel = totalLevel + level
    end
    return totalLevel
  end
  
  function unit:GetSkillListForUI()
    return {
      {
        id = self.normalSkillId,
        level = self:GetSkillLevelBySkillTypes({
          MINI_GAME_BATTLE_SKILL_TYPE.NORMAL,
          MINI_GAME_BATTLE_SKILL_TYPE.NORMAL_EXTRA
        })
      },
      {
        id = self.baseConfig.special_skill,
        level = self:GetSkillLevelBySkillTypes({
          MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE,
          MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE_EXTRA
        })
      },
      {
        id = self.baseConfig.talent_skill,
        level = self:GetSkillLevelBySkillTypes({
          MINI_GAME_BATTLE_SKILL_TYPE.TALENT,
          MINI_GAME_BATTLE_SKILL_TYPE.TALENT_EXTRA
        })
      }
    }
  end
  
  function unit:GetSkillLevelBySkillTypes(types)
    local totalLevel = 0
    for id, level in pairs(self.skill2Level) do
      local skillConfig = TableData.GetConfig(id, "BaseShootSkill")
      if table.contain(types, skillConfig.type) then
        totalLevel = totalLevel + level
      end
    end
    return totalLevel
  end
  
  function unit:GetSkillLevel(skillId)
    return self.skill2Level[skillId] or 0
  end
  
  function unit:SaveSkill(skillId)
    if self.skill2Level[skillId] then
      self.skill2Level[skillId] = self.skill2Level[skillId] + 1
    else
      self.skill2Level[skillId] = 1
    end
    local skillConfig = TableData.GetConfig(skillId, "BaseShootSkill")
    self:SaveSkillTrigger(skillId, skillConfig.trigger_condition)
    if skillConfig.active_buff_list then
      MiniGameBattleBuffMgr.AnalysisBuffList(skillConfig.active_buff_list, {
        unitUid = self.uid
      }, nil, true, {skillId = skillId})
    end
  end
  
  function unit:DealBasicBuff()
    local basic_buff = self.baseConfig.basic_buff
    if basic_buff and #basic_buff > 0 then
      for _, buffId in ipairs(basic_buff) do
        MiniGameBattleBuff.NewBuff(buffId, {
          unitUid = self.uid
        }, {
          unitUid = self.uid
        }, true)
      end
    end
  end
  
  function unit:AddSummonUid(uid)
    table.insert(self.cachedSummonUids, uid)
    self:UpdateSkin()
  end
  
  function unit:RemoveSummonUid(uid)
    local uids = self.cachedSummonUids
    for i, v in ipairs(uids) do
      if v == uid then
        table.remove(self.cachedSummonUids, i)
      end
    end
    self:UpdateSkin()
  end
  
  function unit:SaveSkillTrigger(skillId, triggerCondition)
    self.skillIdList[skillId] = 1
    if triggerCondition then
      local list = self.skillTriggerTable
      for i = 1, #triggerCondition do
        local condition = triggerCondition[i]
        local isCached = false
        local t = list[condition]
        if nil == t then
          t = {}
        else
          for j = 1, #t do
            if t[j].skillId == skillId then
              isCached = true
              break
            end
          end
        end
        if isCached then
          break
        end
        t[#t + 1] = {skillId = skillId, enable = true}
        table.sort(t, function(a, b)
          return a.skillId < b.skillId
        end)
        list[condition] = t
      end
    end
  end
  
  function unit:CreateModel()
    if self.isGrid then
      if Application.platform == RuntimePlatform.WindowsEditor or Application.platform == RuntimePlatform.OSXEditor then
        self.model = ResourceManager.Instantiate("Assets/Art/Test/green.prefab")
        self.model.name = string.format("格子_%s_%s", self.positionIndexX, self.positionIndexY)
      else
        self.model = ResourceManager.Instantiate("Assets/Art/Test/empty.prefab")
      end
      local scale = 0.5
      BattleResourceManager:AddGameObject(self.model, self.position.x, self.position.y, self.position.z, scale, scale, scale)
      return
    end
    local model = ResourceManager.Instantiate(self.baseConfig.spd)
    LuaUtil.ChangeLayer(model.transform, "Default")
    model.name = self:GetName()
    local scale = BATTLE_CONFIG_ENUM.CARD_SCALE * self.baseConfig.spd_scale / 10000
    local scaleX, scaleY = scale, scale
    if self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.DINA then
      scale = scale * self.range / 100
      scaleX = scale
      scaleY = scale
    elseif self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.NILISHA then
      local summonUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.summonFromUnitUid)
      local widthAddRatio = MiniGameBattleBuffMgr.GetValueById(summonUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_RANGE_ADD)
      scale = scale * (10000 + widthAddRatio) / 10000
      scaleY = scale
    elseif self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
      scale = scale * (self.coverRadiusR / self.initCoverRadiusR)
      scaleX = scale
      scaleY = scale
    end
    BattleResourceManager:AddGameObject(model, 0, 0, 0, scaleX, scaleY, 1)
    self.model = model
    self.childModel = LuaUtil.FindChild(model, "model")
    if self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.DINA then
      self.waitFrameDestroy = 0
      self.fixedSortingOrder = BATTLE_CONFIG_ENUM.SORTING_ORDER_TRAP
      self.loopSound = MiniGameBattleActionDisplay.PlaySound(70940043, self.model)
    elseif self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.NILISHA then
      local summonUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.summonFromUnitUid)
      if summonUnit then
        local target = MiniGameBattleChoose.GetOneFarthestMonster()
        if target then
          local position = target.position
          self.targetPosition = position
          local direction = MathUtil.GetVector3Subtract(position, self.position)
          self.model.transform.right = Vector3(direction.x, direction.y, direction.z)
        else
          local direction = {
            x = 1000,
            y = 0,
            z = 0
          }
          self.targetPosition = MathUtil.GetVector3Add(self.position, direction)
          self.model.transform.right = Vector3(direction.x, direction.y, direction.z)
        end
      end
      self.waitFrameDestroy = 0
      self.fixedSortingOrder = BATTLE_CONFIG_ENUM.SORTING_ORDER_MAP_EFFECT
      self.loopSound = MiniGameBattleActionDisplay.PlaySound(70940034)
    elseif self.summonFromUnitId == MINI_GAME_SPECIAL_CARD.FEINISI then
      self.waitFrameDestroy = 0
      self.fixedSortingOrder = BATTLE_CONFIG_ENUM.SORTING_ORDER_MAP_EFFECT
      self.loopSound = MiniGameBattleActionDisplay.PlaySound(70940024)
    else
      self.waitFrameDestroy = math.floor(self:GetAnimationTime(MINI_GAME_UNIT_ANIMATION.DIE) * BATTLE_CONFIG_ENUM.FIXED_FPS)
    end
    if self.camp == BATTLE_CAMP_FLAG.RIGHT then
      self:SetModelFlip(true)
      self:UpdateFlip()
    end
    self:ChangeAnimation(MINI_GAME_UNIT_ANIMATION.RUN, true)
    local tempScaleX = self.model.transform.localScale.x
    local tempScaleY = self.model.transform.localScale.y
    local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
    local bullet = LuaUtil.FindChild(model, "bullet", true)
    if bullet then
      local bulletPosition = bullet.transform.localPosition
      self.bulletPosition = {
        x = bulletPosition.x * tempScaleX * pixelsPerUnit,
        y = bulletPosition.y * scale * pixelsPerUnit,
        z = 0
      }
    end
    local hit = LuaUtil.FindChild(model, "hit", true)
    if hit then
      local hitPosition = hit.transform.localPosition
      self.hitPosition = {
        x = hitPosition.x * tempScaleX * pixelsPerUnit,
        y = hitPosition.y * tempScaleY * pixelsPerUnit,
        z = 0
      }
    end
    if self.camp == BATTLE_CAMP_FLAG.RIGHT then
      MiniGameBattleActionDisplay.PlayMonsterAppearEffect(self)
    end
  end
  
  function unit:GetAnimationTime(animationName)
    if self.model and self.battleUnitType ~= MINI_GAME_BATTLE_UNIT_TYPE.WALL then
      local animator = self.model:GetComponentInChildren(typeof(CS.UnityEngine.Animator), true)
      if animator then
        local clips = animator.runtimeAnimatorController.animationClips
        for i = 0, clips.Length - 1 do
          local clip = clips[i]
          if clip.name == animationName then
            return clip.length
          end
        end
      end
    end
    return 0
  end
  
  function unit:SetAnimation(state)
    LuaUtil.PlayAnimator(self.model, state)
  end
  
  function unit:AddAnimationEvent(func)
  end
  
  function unit:RemoveAnimationEvent(func)
  end
  
  function unit:UpdateFlip()
    if self.isFlip ~= self.savedFlip then
      self.isFlip = self.savedFlip
      if self.model then
        LuaUtil.SetScale(self.model, -1, 1, 1, true)
      end
    end
  end
  
  function unit:SetModelFlip(isFlip)
    self.savedFlip = isFlip
  end
  
  function unit:SavePosition(x, y, z)
    self.position = {
      x = x,
      y = y,
      z = z
    }
  end
  
  function unit:UpdateModelPosition()
    if self.model then
      local position = self.position
      local pixelsPerUnit = MiniGameBattleScene.pixelsPerUnit
      LuaUtil.SetLocalPos(self.model, position.x / pixelsPerUnit, position.y / pixelsPerUnit, position.z / pixelsPerUnit)
      self:UpdateSortingOrder()
      hudCom = hudCom or UIMgr:GetLayerRoot("HUD")
      self.UIPosition = self.model:Get3DPositionToUIPosition(MiniGameBattleCamera, hudCom)
    end
  end
  
  function unit:UpdateSortingOrder()
    local order = self.fixedSortingOrder or BATTLE_CONFIG_ENUM.SORTING_ORDER_INIT - self.position.y
    if self.sortingOrder ~= order then
      self.sortingOrder = order
      if self.model then
        SortingHelper.SetOrderInLayer(self.model, order)
      end
    end
  end
  
  function unit:ChangeAnimation(animationName)
    if self.curAnimation == animationName then
      return false
    end
    if self.curState == BATTLE_STATE_ENUM.DESTROY and animationName ~= MINI_GAME_UNIT_ANIMATION.DIE then
      return
    end
    self.curAnimation = animationName
    self:SetAnimation(animationName)
    return true
  end
  
  function unit:DestroyModel()
    if self.isDisplayDestroyed == true then
      return
    end
    self:RemoveAllEffect()
    if self.messageBar then
      self.messageBar:Destroy()
      self.messageBar = nil
    end
    if self.moveSpdEffect then
      ResourceManager.DestroyGameObject(self.moveSpdEffect)
      self.moveSpdEffect = nil
    end
    if self.freezeEffect then
      ResourceManager.DestroyGameObject(self.freezeEffect)
      self.freezeEffect = nil
    end
    if self.bloodEffect then
      ResourceManager.DestroyGameObject(self.bloodEffect)
      self.bloodEffect = nil
    end
    if self.loopSound then
      SoundUtil.StopSoundEvent(self.loopSound)
      self.loopSound = nil
    end
    if self.childModel then
      local twinkle = self.childModel:GetComponentInChildren(typeof(CS.ColorTwinkle), true)
      if twinkle then
        GameObject.DestroyImmediate(twinkle)
      end
      local helper = self.childModel:GetComponentInChildren(typeof(CS.MaterialPropertyHelper), true)
      if helper then
        GameObject.DestroyImmediate(helper)
      end
    end
    if self.model then
      BattleResourceManager:DestroyGameObject(self.model)
      self.model = nil
    end
    self.childModel = nil
    self.isDisplayDestroyed = true
  end
  
  function unit:Destroy()
    self:DestroyModel()
    self:InitBaseData()
  end
  
  function unit:ClearBuff(isClear)
    local maxHpName = ATTR_ENUM.max_hp
    if true == isClear then
      local maxHpBuffValue = self:GetBuffAttr(maxHpName)
      if 0 ~= maxHpBuffValue then
        self.lastHpPer = self.tempHpPer
      end
    end
    if true ~= isClear then
      local buff
      local savedBuffList = MiniGameBattleBuffMgr.savedBuffList
      local buffUidList = self.buffUidList
      local buffUidArray = table.mapKey2Array(buffUidList, function(array)
        table.sort(array, function(a, b)
          return a < b
        end)
      end)
      for _, uid in ipairs(buffUidArray) do
        buff = savedBuffList[uid]
        if buff then
          buff:Remove()
        end
      end
    end
    self.cachedBuffEffect = {}
    self.cachedBuffEffectId = {}
    self.cachedBuffAttr = {}
    self.buffUidList = {}
    if true == isClear and self.lastHpPer ~= nil then
      self:UpdateTempHpPerAndMessageBar()
    end
  end
  
  function unit:ContainEffectId(effectId)
    return 1 == self.cachedBuffEffectId[effectId]
  end
  
  function unit:SetState(state, fromControl)
    if self.curState == BATTLE_STATE_ENUM.DESTROY then
      return
    end
    if self.curState ~= nil then
      self.preState = self.curState
    end
    self.curState = state
  end
  
  function unit:SetStateToDead()
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.NORMAL_ENEMY or self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY or self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY then
      MiniGameBattleData.killEnemyCount = MiniGameBattleData.killEnemyCount + 1
      self.needDealAddExp = true
    end
    self:ClearBuff()
    MiniGameBattleSceneMgr.RemoveFromAliveList(self)
    MiniGameBattleSceneMgr.DealClearTarget(self)
    MiniGameBattleAction.ForceChangeState(self, BATTLE_STATE_ENUM.DEAD)
  end
  
  function unit:SetStateToDestroy()
    MiniGameBattleSceneMgr.RemoveUnit(self)
    self:Destroy()
  end
  
  function unit:AddStateAction(state, action, actionDisplay)
    self.states[state] = {action = action, actionDisplay = actionDisplay}
  end
  
  function unit:Update()
    if self:IsDestroy() == true then
      return
    end
    local remainTime = self.remainTime
    if remainTime and remainTime > 0 then
      remainTime = remainTime - 1
      if remainTime <= 0 then
        self.needDestroy = true
      end
      self.remainTime = remainTime
    end
    if true == self.isTimePause or true == self.isFreeze then
      self:SetModelTimeScale(0)
      return
    else
      self:SetModelTimeScale(1)
    end
    self:DealTriggerSkill(MINI_GAME_TRIGGER_CONDITION.CD)
    self:UpdateState()
    if self.isMonster then
      MiniGameBattleBuffMgr.TriggerUnitListener(self, MINI_GAME_BUFF_DEDUCE_TYPE.SETTLE_HP_LESS)
    end
  end
  
  function unit:DealTriggerSkill(specificCondition, triggerFromUnitUid)
    local skillTable = self.skillTriggerTable[specificCondition]
    if nil ~= skillTable then
      MiniGameBattleAction.DealTriggerSkill(self, specificCondition, skillTable, triggerFromUnitUid)
    end
  end
  
  function unit:UpdateState()
    local action = self.states[self.curState]
    if action and action.action then
      action = action.action
      action(self)
    end
  end
  
  function unit:UpdateRagePerSecond(ratio)
    if self:IsDestroy() then
      return
    end
    local rageTime = self:GetAttr(ATTR_ENUM.rage_time) * ratio
    if rageTime > 0 then
      MiniGameBattleAction.DealRageChange(self, rageTime)
    end
  end
  
  function unit:UpdateDisplay()
    if self.isDisplayDestroyed == true then
      return
    end
    self:UpdateStateDisplay()
    self:UpdateBuffEffect()
    MiniGameBattleActionDisplay.PlayHurt(self)
  end
  
  local effectScaleList = {
    [MINI_GAME_BATTLE_UNIT_TYPE.NORMAL_ENEMY] = 1,
    [MINI_GAME_BATTLE_UNIT_TYPE.ELIT_ENEMY] = 2,
    [MINI_GAME_BATTLE_UNIT_TYPE.BOSS_ENEMY] = 2.5
  }
  
  function unit:UpdateBuffEffect()
    if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.MOVE_SPD_CHANGE_WITH_EFFECT) and self.moveSpdEffect == nil then
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_slowmotion_buff.prefab")
      effect.transform.parent = self.model.transform
      LuaUtil.SetLocalPos(effect, 0, 0, 0)
      SortingHelper.SetOrderInLayer(effect, BATTLE_CONFIG_ENUM.SORTING_ORDER_EFFECT_LINE)
      self.moveSpdEffect = effect
    elseif self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.MOVE_SPD_CHANGE_WITH_EFFECT) == false and self.moveSpdEffect then
      ResourceManager.DestroyGameObject(self.moveSpdEffect)
      self.moveSpdEffect = nil
    end
    if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) and nil == self.freezeEffect then
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000118_frost.prefab")
      effect.transform.parent = self.model.transform
      LuaUtil.SetLocalPos(effect, 0, 0, 0)
      local scale = effectScaleList[self.battleUnitType] / math.abs(self.model.transform.localScale.x)
      LuaUtil.SetScale(effect, scale, scale, 1)
      SortingHelper.SetOrderInLayer(effect, self.sortingOrder + 1)
      self.freezeEffect = effect
    elseif false == self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_FREEZE) and self.freezeEffect then
      ResourceManager.DestroyGameObject(self.freezeEffect)
      self.freezeEffect = nil
    end
    if self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING) and nil == self.bloodEffect then
      local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/MiniGame/MiniGame022/Minigame022_10000101_skill2_buff.prefab")
      effect.transform.parent = self.model.transform
      LuaUtil.SetLocalPos(effect, 0, 0, 0)
      local scale = effectScaleList[self.battleUnitType] / math.abs(self.model.transform.localScale.x)
      LuaUtil.SetScale(effect, scale, scale, 1)
      SortingHelper.SetOrderInLayer(effect, self.sortingOrder + 1)
      self.bloodEffect = effect
    elseif false == self:ContainEffectId(MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING) and self.bloodEffect then
      ResourceManager.DestroyGameObject(self.bloodEffect)
      self.bloodEffect = nil
    end
  end
  
  function unit:CreateEffect(path, scale)
    local effect = ResourceManager.Instantiate(path)
    effect.transform.parent = self.model.transform
    LuaUtil.SetLocalPos(effect, 0, 0, 0)
    LuaUtil.SetScale(effect, scale, scale, 1)
    SortingHelper.SetOrderInLayer(effect, self.sortingOrder + 1)
    return effect
  end
  
  function unit:SetModelTimeScale(timeScale)
    self.savedModelTimeScale = timeScale
    self:UpdateModelTimeScale()
  end
  
  function unit:UpdateModelTimeScale()
    if self.modelTimeScale ~= self.savedModelTimeScale and self.model then
      local timeScale = self.savedModelTimeScale
      local animator = self.model:GetComponentInChildren(typeof(CS.UnityEngine.Animator), true)
      animator.speed = timeScale
      self.modelTimeScale = timeScale
    end
  end
  
  function unit:UpdateStateDisplay()
    local action = self.states[self.curState]
    if action and action.actionDisplay then
      action = action.actionDisplay
      action(self)
    end
  end
  
  function unit:UpdateEffectFlip(key, isSkill)
    if nil == key then
      return
    end
    local info
    if true == isSkill then
      info = self.skillEffectList[key]
    else
      info = self.otherEffectList[key]
    end
    if info then
      local effect = info.effect
      if effect and SkillEffectsHelper.IsRotationWithAttackDirection(effect) == false then
        EffectUtil.Overturn(effect, self.isFlip)
      end
      local effectList = info.effectList
      if effectList then
        for i, eff in ipairs(effectList) do
          if SkillEffectsHelper.IsRotationWithAttackDirection(eff) == false then
            EffectUtil.Overturn(eff, self.isFlip)
          end
        end
      end
    end
  end
  
  function unit:RemoveEffect(key, isSkill)
    if nil == key then
      return
    end
    local info
    if true == isSkill then
      info = self.skillEffectList[key]
    else
      info = self.otherEffectList[key]
    end
    if info then
      if info.reference then
        info.reference = info.reference - 1
      end
      if nil == info.reference or info.reference <= 0 then
        local effect = info.effect
        if effect then
          BattleResourceManager:DestroyGameObject(effect)
        end
        local effectList = info.effectList
        if effectList then
          for i, eff in ipairs(effectList) do
            BattleResourceManager:DestroyGameObject(eff)
          end
        end
        if true == isSkill then
          self.skillEffectList[key] = nil
        else
          self.otherEffectList[key] = nil
        end
      end
    end
  end
  
  function unit:RemoveAllEffect()
    self:RemoveAllBuffEffect()
    self:RemoveAllSkillEffect()
  end
  
  function unit:RemoveAllBuffEffect()
    for name, _ in pairs(self.otherEffectList) do
      self:RemoveEffect(name)
    end
  end
  
  function unit:RemoveAllSkillEffect()
    local list = self.skillEffectList
    for key, v in pairs(list) do
      self:RemoveEffect(key, true)
    end
  end
  
  function unit:IsWallInAttackTarget()
    local wallUnit = MiniGameBattleScene.wallUnit
    if wallUnit then
      local dis = self.position.x - wallUnit.position.x - self.coverRadiusR
      if dis <= self.tempRangeAtk then
        return true
      end
    end
    return false
  end
  
  function unit:IsTargetInAttackRange(targetUnit)
    if self.tempRangeAtk >= targetUnit.position.x - self.position.x - targetUnit.coverRadiusR then
      return true
    end
    return false
  end
  
  function unit:HaveMonsterInAttackRange()
    local allMonster = MiniGameBattleScene.aliveMonsterList
    local monster
    for i = #allMonster, 1, -1 do
      monster = allMonster[i]
      if self.tempRangeAtk >= monster.position.x - self.position.x - monster.coverRadiusR then
        return true
      end
    end
  end
  
  function unit:GetDefaultWaitFrame()
    local value = MiniGameBattleBuffMgr.GetValueById(self, MINI_GAME_BUFF_EFFECT_ID.NORMAL_INTERVAL_CHANGE)
    if 0 ~= value then
      value = value + MiniGameBattleBuffMgr.GetValueById(self, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_TALENT_CD_CHANGE)
    end
    return math.max(1, self.baseConfig.interval + value)
  end
  
  function unit:ResetNextAttackFrame()
    self.nextAttackFrame = MiniGameBattleControl.curFixedFrame + self:GetDefaultWaitFrame()
  end
  
  function unit:MeetAttackTimeCondition()
    return MiniGameBattleControl.curFixedFrame >= self.nextAttackFrame
  end
  
  function unit:IsCannotChooseType()
    if self.isCannotChooseType == nil then
      if self.isBuilding == true and self.buildingType ~= BATTLE_BUILDING_TYPE.BLOCK and self.buildingType ~= BATTLE_BUILDING_TYPE.ATTACK then
        self.isCannotChooseType = true
        return true
      end
      self.isCannotChooseType = false
      return false
    end
    return self.isCannotChooseType
  end
  
  function unit:CanRangeChosen()
    if self:IsCannotChooseType() then
      return false
    end
    return self:IsAlive()
  end
  
  function unit:CanBuffChosen()
    if self:IsCannotChooseType() then
      return false
    end
    return self:IsAlive()
  end
  
  function unit:IsAlive()
    if self.isGrid then
      return true
    end
    local state = self.curState
    if state == BATTLE_STATE_ENUM.DESTROY then
      return false
    end
    if state == BATTLE_STATE_ENUM.DEAD then
      return false
    end
    return true
  end
  
  function unit:IsDying()
    return self:IsDead() or self.haveHp and self:GetHp() <= 0
  end
  
  function unit:IsDead()
    return self.curState == BATTLE_STATE_ENUM.DEAD
  end
  
  function unit:IsDestroy()
    return self.curState == BATTLE_STATE_ENUM.DESTROY
  end
  
  function unit:InitRestraint(baseConfig)
    baseConfig = baseConfig or self:GetBaseCardOrMonsterConfig()
    local attrName
    for i = 1, 5 do
      attrName = RestraintAddName[i]
      self:SetInitAttr(attrName, baseConfig[attrName])
      attrName = RestraintSubName[i]
      self:SetInitAttr(attrName, baseConfig[attrName])
    end
  end
  
  function unit:InitAttrMap()
    local config = self.baseConfig
    local maxHp
    if config.max_hp then
      maxHp = math.ceil(config.max_hp * (10000 + self.addHpPer) / 10000)
    end
    self.attrMap = {
      [ATTR_ENUM.max_hp] = maxHp,
      [ATTR_ENUM.atk] = config.atk,
      [ATTR_ENUM.crt] = config.crt,
      [ATTR_ENUM.spd_atk] = config.spd_atk,
      [ATTR_ENUM.hp] = maxHp
    }
    if config.spd_move then
      local spdMove = config.spd_move
      if #spdMove > 1 then
        self.attrMap[ATTR_ENUM.spd_move] = MiniGameBattleMgr.GetRandomNum(spdMove[1], spdMove[2])
      else
        self.attrMap[ATTR_ENUM.spd_move] = spdMove[1]
      end
    end
    if config.range_atk then
      local rangeAtk = config.range_atk
      if #rangeAtk > 1 then
        self.attrMap[ATTR_ENUM.range_atk] = MiniGameBattleMgr.GetRandomNum(rangeAtk[1], rangeAtk[2])
      else
        self.attrMap[ATTR_ENUM.range_atk] = rangeAtk[1]
      end
    end
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.WALL then
      MiniGameBattleData.selfMaxHp = self:GetHp()
      MiniGameBattleData.selfHp = MiniGameBattleData.selfMaxHp
    end
  end
  
  function unit:SetInitAttr(name, value)
    self.attrMap[name] = value
  end
  
  function unit:SetAttr(name, value)
    self.attrMap[name] = value
  end
  
  function unit:ChangeAttr(name, changeValue)
    self.attrMap[name] = self.attrMap[name] + changeValue
    if name == ATTR_ENUM.hp and self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.WALL then
      MiniGameBattleData.selfHp = self:GetHp()
    end
  end
  
  function unit:GetHp()
    return self.attrMap[ATTR_ENUM.hp] or 0
  end
  
  function unit:GetRage()
    return self.attrMap[ATTR_ENUM.rage] or 0
  end
  
  function unit:GetSpdAtk()
    local enhanceBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_atk_enhance] or 0
    local enhanceBaseValue = self.attrMap[ATTR_ENUM.spd_atk_enhance] or 0
    local baseValue = self.attrMap[ATTR_ENUM.spd_atk] or 0
    local baseBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_atk] or 0
    local value_enhance = enhanceBaseValue + enhanceBuffValue
    local value_base = baseValue + baseBuffValue
    if value_enhance < 0 then
      return ceil(MathUtil.TruncateFloat(value_base * 10000 / (10000 - value_enhance))), value_base, value_enhance
    elseif value_enhance > 0 then
      return ceil(MathUtil.TruncateFloat(value_base * (10000 + value_enhance) / 10000)), value_base, value_enhance
    end
    return value_base, value_base, value_enhance
  end
  
  function unit:GetSpdMove()
    local enhanceBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_move_enhance] or 0
    local enhanceBaseValue = self.attrMap[ATTR_ENUM.spd_move_enhance] or 0
    local baseValue = self.attrMap[ATTR_ENUM.spd_move] or 0
    local baseBuffValue = self.cachedBuffAttr[ATTR_ENUM.spd_move] or 0
    local value_enhance = enhanceBaseValue + enhanceBuffValue
    local value_base = baseValue + baseBuffValue
    if value_enhance < 0 then
      return ceil(MathUtil.TruncateFloat(value_base * 10000 / (10000 - value_enhance))), value_base, value_enhance
    elseif value_enhance > 0 then
      return ceil(MathUtil.TruncateFloat(value_base * (10000 + value_enhance) / 10000)), value_base, value_enhance
    end
    return value_base, value_base, value_enhance
  end
  
  function unit:GetAttr(name)
    return (self.attrMap[name] or 0) + (self.cachedBuffAttr[name] or 0)
  end
  
  function unit:GetBaseAttr(name)
    return self.attrMap[name] or 0
  end
  
  function unit:GetBuffAttr(name)
    return self.cachedBuffAttr[name] or 0
  end
  
  function unit:UpdateAttrCacheFromBuff(attributeId)
    local value = 0
    local valueMax = 0
    local buff
    local buffUidList = self.buffUidList
    local buffList = MiniGameBattleBuffMgr.savedBuffList
    local tempValue, maxValue
    for buffUid, enable in pairs(buffUidList) do
      buff = buffList[buffUid]
      tempValue, maxValue = buff:GetAttributeValue(attributeId)
      value = value + tempValue
      valueMax = valueMax + maxValue
    end
    local name = CardAttribute.GetNameById(attributeId)
    self.cachedBuffAttr[name] = value
  end
  
  function unit:UpdateCachedBuffEffect()
    local cachedBuffEffect = {}
    local cachedBuffEffectId = {}
    local buffUidList = self.buffUidList
    local buffUidArray = table.mapKey2Array(buffUidList, function(array)
      table.sort(array, function(a, b)
        return a < b
      end)
    end)
    local effectId, buff, effectList, temp, effect
    local buffList = MiniGameBattleBuffMgr.savedBuffList
    for _, buffUid in ipairs(buffUidArray) do
      buff = buffList[buffUid]
      effectList = buff.effectList
      for i = 1, #effectList do
        effect = effectList[i]
        effectId = effect.effectId
        temp = cachedBuffEffect[effectId]
        if nil == temp then
          temp = {}
        end
        temp[#temp + 1] = effect
        cachedBuffEffect[effectId] = temp
        cachedBuffEffectId[effectId] = 1
      end
    end
    self.cachedBuffEffect = cachedBuffEffect
    self.cachedBuffEffectId = cachedBuffEffectId
  end
  
  function unit:GetEffectTotalValue(effectId)
    local value = 0
    if self.cachedBuffEffect[effectId] then
      local effectList = self.cachedBuffEffect[effectId]
      for i, v in ipairs(effectList) do
        value = value + v.finalValue
      end
    end
    return value
  end
  
  function unit:GetLastFrameBySkillId(skillId)
    local triggerSkillList = self.savedTriggerSkillList
    local skillTriggerInfo
    local len = #triggerSkillList
    for i = len, 1, -1 do
      skillTriggerInfo = triggerSkillList[i]
      if skillTriggerInfo.id == skillId then
        return skillTriggerInfo.frame
      end
    end
    return 0
  end
  
  function unit:GetSkillAlreadyTriggerCount(skillId)
    local count = 0
    local triggerSkillList = self.savedTriggerSkillList
    local skillTriggerInfo, lastTriggerFrame
    local len = #triggerSkillList
    for i = len, 1, -1 do
      skillTriggerInfo = triggerSkillList[i]
      if skillTriggerInfo.id == skillId then
        if nil == lastTriggerFrame then
          lastTriggerFrame = skillTriggerInfo.frame
        end
        count = count + 1
      end
    end
    return count, lastTriggerFrame
  end
  
  function unit:SaveTriggerSkill(skillId)
    local savedTriggerSkillList = self.savedTriggerSkillList
    savedTriggerSkillList[#savedTriggerSkillList + 1] = {
      id = skillId,
      frame = MiniGameBattleControl.curFixedFrame
    }
  end
  
  function unit:GetName()
    local name = self.baseConfig.name
    return name and name()
  end
  
  function unit:AddBuff(uid, buffContainIcon)
    self.buffUidList[uid] = 1
    self:UpdateCachedBuffEffect()
  end
  
  function unit:RemoveBuff(uid, buffContainIcon)
    self.buffUidList[uid] = nil
    self:UpdateCachedBuffEffect()
  end
  
  function unit:SetFreeze(isFreeze)
    if self.isFreeze == false and true == isFreeze then
      print_battle("冰冻")
      self.isFreeze = true
      MiniGameBattleActionDisplay.PlaySound(70940054, self.model)
    elseif self.isFreeze == true and false == isFreeze then
      print_battle("解除冰冻")
      self.isFreeze = false
    end
  end
  
  function unit:SetTimePause(isTimePause)
    if self.isTimePause == false and true == isTimePause then
      print_battle("时停")
      self.isTimePause = true
    elseif self.isTimePause == true and false == isTimePause then
      print_battle("解除时停")
      self.isTimePause = false
    end
  end
  
  function unit:ClearControlState()
  end
  
  function unit:OnBuffAttrChanged(attributeId, value)
    if self:IsDead() == true or true == self:IsDestroy() then
      return
    end
    if attributeId == ATTR_ID.RANGE_ATK then
      self.tempRangeAtk = self:GetAttr(ATTR_ENUM.range_atk)
    end
  end
  
  function unit:UpdateTempHpPerAndMessageBar()
    self:UpdateTempHpPer()
    if self.messageBar then
      self.messageBar:UpdateHp(self)
    end
  end
  
  function unit:UpdateTempHpPer()
    self.tempHpPer = MathUtil.TruncateFloatN(self:GetHp() / self:GetAttr(ATTR_ENUM.max_hp), 8)
  end
  
  function unit:GetAttackTarget()
    if self.battleUnitType == MINI_GAME_BATTLE_UNIT_TYPE.CARD then
      if self.attackTargetUid then
        local targetUnit = MiniGameBattleSceneMgr.GetUnitByUid(self.attackTargetUid)
        if targetUnit:IsAlive() == false then
          self.attackTargetUid = nil
        elseif false == self:IsTargetInAttackRange(targetUnit) then
          self.attackTargetUid = nil
        end
      end
      if self.attackTargetUid == nil then
        local monsterList = SimpleCopy(MiniGameBattleScene.aliveMonsterList)
        if #monsterList > 0 then
          table.sort(monsterList, function(a, b)
            if a.position.x == b.position.x then
              return a.position.y > b.position.y
            else
              return a.position.x < b.position.x
            end
          end)
          return monsterList[1]
        end
      end
    else
      return MiniGameBattleScene.wallUnit
    end
  end
  
  function unit:SetAttackTargetUid(attackTargetUid)
    self.attackTargetUid = attackTargetUid
  end
  
  function unit:SaveDamage(damage)
    if damage > 0 then
      self.damageRecord = self.damageRecord + damage
    elseif damage < 0 then
      self.treatRecord = self.treatRecord - damage
    end
  end
  
  function unit:SaveDamaged(damage)
    if damage > 0 then
      self.damagedRecord = self.damagedRecord + damage
    elseif damage < 0 then
      self.treatedRecord = self.treatedRecord - damage
    end
  end
  
  unit:Init()
  return unit
end
