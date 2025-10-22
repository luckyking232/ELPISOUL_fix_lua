MiniGameBattleDataCount = {}
local baoji_max, baoji_min

function MiniGameBattleDataCount.Init()
  local SkillParameterData = TableData.GetTable("BaseSkillParameter")
  baoji_max = SkillParameterData[40001003].data
  baoji_min = SkillParameterData[40001004].data
end

local PanDingBaoJi = function(atkUnit, defUnit, skillConfig)
  local baoji_atk = atkUnit:GetAttr(ATTR_ENUM.crt)
  if atkUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.NORMAL then
    local add = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_NORMAL_BULLET_CRI_ADD)
    baoji_atk = baoji_atk + add
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE then
    local add = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_PASSIVE_BULLET_SPLIT_CRT_ADD)
    baoji_atk = baoji_atk + add
  end
  local baojilv = math.min(baoji_max, math.max(baoji_min, baoji_atk))
  if baojilv >= MiniGameBattleMgr.GetRandom() then
    return 10000
  else
    return 0
  end
end

function MiniGameBattleDataCount.GetSkillHurt(atkUnit, defUnit, skillConfig)
  local hurt = 0
  local hurtExtraParams = {}
  local gongji_atk = atkUnit:GetAttr(ATTR_ENUM.atk)
  local damageRate = skillConfig.damage_rate
  local baoji_jiacheng = PanDingBaoJi(atkUnit, defUnit, skillConfig)
  if baoji_jiacheng > 0 then
    hurtExtraParams.isCrit = true
  end
  local damageAddPer = 0
  if atkUnit.id == MINI_GAME_SPECIAL_CARD.ANNISI and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.TALENT then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.ANNISI_TALENT_SKILL_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.DINA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.DINA_PASSIVE_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_PASSIVE_BULLET_SPLIT_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.NILISHA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.TALENT then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.NILISHA_TALENT_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.FEINISI and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_PASSIVE_BLEEDING_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.FEINISI and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.TALENT then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.FEINISI_TALENT_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  elseif atkUnit.id == MINI_GAME_SPECIAL_CARD.LIEDIXIYA and skillConfig.type == MINI_GAME_BATTLE_SKILL_TYPE.PASSIVE then
    local value = MiniGameBattleBuffMgr.GetValueById(atkUnit, MINI_GAME_BUFF_EFFECT_ID.LIEDIXIYA_PASSIVE_DAMAGE_ADD)
    damageAddPer = damageAddPer + value
  end
  local damage_add_atk = atkUnit:GetAttr(ATTR_ENUM.damage_add)
  local damage_sub_def = defUnit:GetAttr(ATTR_ENUM.damage_sub)
  hurt = math.floor(gongji_atk * damageRate / 10000 * (10000 + baoji_jiacheng) / 10000 * (10000 + damage_add_atk + damage_sub_def) / 10000 * (10000 + damageAddPer) / 10000)
  return hurt, hurtExtraParams
end
