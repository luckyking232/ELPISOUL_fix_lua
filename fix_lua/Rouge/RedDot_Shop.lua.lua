RedDotShop = {}

function RedDotShop.HomeTaskRed()
  return RedDotShop.CanFreeGift() or RedDotShop.CanFirstGift() or RedDotShop.CanAgreementGift()
end

function RedDotShop.CanFreeGift(bannerGroup)
  local data = TableData.GetTable("BaseGift")
  for i, v in pairs(data) do
    if (nil == bannerGroup or v.banner_group and v.banner_group == bannerGroup) and v.group_id and nil == v.not_show_red then
      local bol = ShopData.GetGiftInfoById(v.id)
      if not bol then
        local arr = Split(v.condition[1], ":")
        local lockLv = tonumber(arr[2])
        if 2 == #arr and tonumber(arr[1]) == CONDITION_ENUM.LV and lockLv <= ActorData.GetLevel() then
          return true
        end
      end
    end
  end
end

function RedDotShop.CanFirstGift()
  local data = TableData.GetConfig(27000100, "BaseGift")
  if data and (ShopData.isBought or table.getLen(ShopData.limitRecord) > 0) and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SHOP, false) then
    for i = 1, #data.gift_reward_ids do
      if ShopData.canRewards and table.contain(ShopData.canRewards, data.gift_reward_ids[i]) then
        return true
      end
    end
  end
end

function RedDotShop.CanAgreementGift()
  if ShopData and ShopData.agreementInfo and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SHOP, false) then
    for i = 1, #ShopData.agreementInfo.datas do
      if RedDotShop.CanAgreementGiftBySeasonId(ShopData.agreementInfo.datas[i].season) then
        return true
      end
    end
  end
  return false
end

function RedDotShop.CanAgreementGiftBySeasonId(seasonId)
  local info = ShopData.GetAgreementInfoById(seasonId)
  if info and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SHOP, false) then
    local data = TableData.GetConfig(info.season, "BaseActivityAgreement")
    if data then
      local CanReward = function(groupId)
        local lock = table.contain(info.openList, groupId)
        local rewards = ShopMgr.GetOneGiftReward(groupId)
        for i = 1, #rewards do
          local data = rewards[i]
          if lock and data.need_day <= ShopData.agreementInfo.curDay and not table.contain(info.rewards, data.id) then
            return true
          end
        end
      end
      if CanReward(data.free_group_id) then
        return true
      end
      if table.contain(info.openList, data.pay_group_id) and CanReward(data.pay_group_id) then
        return true
      end
    end
  end
  return false
end

function RedDotShop.CanWeekShop()
  if ShopData and ShopData.weekPayInfo and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_SHOP, false) then
    local config = TableData.GetTable("BaseActivityPayWeek")
    local tb = {}
    for i, v in pairs(config) do
      if v.index == ShopData.weekPayInfo.index then
        if 1 == v.type and v.parameter > ShopData.weekPayInfo.bindDiamondReward and ShopData.weekPayInfo.consumeBindDiamond >= v.parameter then
          return true
        elseif 2 == v.type and v.parameter > ShopData.weekPayInfo.rechargeReward and ShopData.weekPayInfo.rechargeAmount >= v.parameter then
          return true
        end
      end
    end
  end
  return false
end
