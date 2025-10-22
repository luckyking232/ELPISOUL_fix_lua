MiniGameBattleBuffEffect = {}
local tonumber = tonumber
local floor = math.floor
local ceil = math.ceil
local ATTR_ID = ProtoEnum.ATTR_ID

function MiniGameBattleBuffEffect.NewEffect(effectStr, belongBuffUid)
  local effect = {}
  
  function effect:Init()
    local strs = Split(effectStr, ":")
    self.updateValueBeforeHurt = false
    self.effectId = tonumber(strs[1])
    self.effectDepend = tonumber(strs[2])
    self.effectCalType = tonumber(strs[3])
    self.effectCalAttrId = tonumber(strs[4])
    self.effectCalValue = tonumber(strs[5])
    self.effectCalAttrCalType = tonumber(strs[6])
    self.effectCommonParam = tonumber(strs[7])
    self.finalValue = 0
    self.belongBuffUid = belongBuffUid
    local belongBuff = MiniGameBattleBuffMgr.savedBuffList[belongBuffUid]
    self.settleFrame = belongBuff.settleFrame
    self.fromUnitUid = belongBuff.fromUnitUid
    self.toUnitUid = belongBuff.toUnitUid
    self.lastToUnitUid = nil
    if self.effectId == MINI_GAME_BUFF_EFFECT_ID.ATK_CHANGE then
      self.attributeId = ATTR_ID.ATK
    elseif self.effectId == MINI_GAME_BUFF_EFFECT_ID.MOVE_SPD_CHANGE or self.effectId == MINI_GAME_BUFF_EFFECT_ID.MOVE_SPD_CHANGE_WITH_EFFECT then
      self.attributeId = ATTR_ID.SPD_MOVE_ENHANCE
    elseif self.effectId == MINI_GAME_BUFF_EFFECT_ID.CRT_CHANGE then
      self.attributeId = ATTR_ID.CRT
    elseif self.effectId == MINI_GAME_BUFF_EFFECT_ID.HP_CHANGE then
      self.attributeId = ATTR_ID.HP
    elseif self.effectId == MINI_GAME_BUFF_EFFECT_ID.DAMAGE_SUB_CHANGE then
      self.attributeId = ATTR_ID.DAMAGE_SUB
    elseif self.effectId == MINI_GAME_BUFF_EFFECT_ID.ATK_SPD_CHANGE then
      self.attributeId = ATTR_ID.SPD_ATK_ENHANCE
    end
    self:UpdateValue()
  end
  
  function effect:UpdateValue()
    if self.effectCalType ~= BUFF_EFFECT_VALUE.NONE then
      self.finalValue = MiniGameBattleBuffEffect.GetEffectValue(self)
    end
  end
  
  function effect:Destroy()
    self = {}
    self = nil
  end
  
  effect:Init()
  return effect
end

function MiniGameBattleBuffEffect.GetEffectValue(effect)
  local finalValue = 0
  local addAtkValue
  local effectCalType = effect.effectCalType
  local attributeId = effect.effectCalAttrId
  local effectCalValue = effect.effectCalValue
  local effectDepend = effect.effectDepend
  if effectCalType == BUFF_EFFECT_VALUE.NONE then
    return 0
  elseif effectCalType == BUFF_EFFECT_VALUE.VALUE then
    finalValue = effectCalValue
    return finalValue
  end
  local unitUid
  if effectDepend == BATTLE_DEPEND_TYPE.FROM then
    unitUid = effect.fromUnitUid
  elseif effectDepend == BATTLE_DEPEND_TYPE.TO then
    unitUid = effect.toUnitUid
  end
  local dependUnit, dependValue
  if unitUid then
    dependUnit = MiniGameBattleSceneMgr.GetUnitByUid(unitUid)
    if nil == dependUnit then
      return finalValue
    end
    if 0 ~= attributeId then
      local attrConfig = TableData.GetConfig(attributeId, "BaseAttribute")
      if attrConfig then
        local attrName = attrConfig.name
        local effectCalAttrCalType = effect.effectCalAttrCalType
        if effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.CURRENT then
          dependValue = dependUnit:GetAttr(attrName)
        elseif effectCalAttrCalType == EFFECT_ATTR_CAL_TYPE.BASIC then
          dependValue = dependUnit:GetBaseAttr(attrName)
        end
      end
    end
  end
  if effectCalType == BUFF_EFFECT_VALUE.ATTR_PERCENT and dependValue then
    if addAtkValue then
      dependValue = ceil(dependValue * (10000 + addAtkValue) / 10000)
    end
    if effectCalValue > 0 then
      finalValue = ceil(dependValue * effectCalValue / 10000)
    else
      finalValue = floor(dependValue * effectCalValue / 10000)
    end
  end
  return finalValue
end
