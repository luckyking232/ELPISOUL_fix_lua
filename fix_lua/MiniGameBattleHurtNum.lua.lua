MiniGameBattleHurtNum = {}
local hudCom, battlePopObjectPool
local MiniGameBattleHurtNumType = {
  NOR_HURT = "NormalHitNumberTips",
  CRI_HURT = "CritHitNumberTips",
  NOR_TREATMENT = "GreenHpNumberTips"
}
local MiniGameBattleHurtNumComName = {
  NOR_HURT = "NormalHitNumber",
  CRI_HURT = "CritHitNumber",
  NOR_TREATMENT = "GreenHpNumber"
}
local battleHurtNumUrlList = {}

function MiniGameBattleHurtNum.Init()
  if nil == battlePopObjectPool then
    battlePopObjectPool = FairyGUI.GObjectPool(CS.Launch.Singleton.transform)
  end
  if nil == hudCom then
    hudCom = UIMgr:GetLayerRoot("Bottom")
  end
  for i, v in pairs(MiniGameBattleHurtNumType) do
    local url = UIMgr:GetItemUrl("ActivityDungeon1017Battle", v)
    battleHurtNumUrlList[i] = url
  end
end

function MiniGameBattleHurtNum.ClearPool()
  if battlePopObjectPool then
    battlePopObjectPool:Clear()
  end
  battlePopObjectPool = nil
end

local GetHurtNumRes = function(hurt_type)
  local url = battleHurtNumUrlList[hurt_type]
  local hurtObject = battlePopObjectPool:GetObject(url)
  local resName = MiniGameBattleHurtNumComName[hurt_type]
  local text = hurtObject:GetChild(resName):GetChild("NumberTxt")
  return hurtObject, text
end

function MiniGameBattleHurtNum.ShowHurtNum(hurt_type, num, bindObject, hurtExtraParams)
  local pt = bindObject.UIPosition
  if nil == pt then
    return
  end
  local hurtObject, text
  hurtObject, text = GetHurtNumRes(hurt_type)
  if text then
    num = math.floor(math.abs(num))
    text.text = num
  end
  hurtObject:RemoveFromParent()
  hudCom:AddChild(hurtObject)
  table.insert(bindObject.cachedDisplayHurtTips, hurtObject)
  for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
    v.y = v.y - v.height / 2
  end
  hurtObject:SetXY(math.floor(pt.x), math.floor(pt.y - 40))
  local trans = hurtObject:GetTransition("in")
  if trans then
    trans:Play(function()
      if nil == battlePopObjectPool then
        if hurtObject then
          hurtObject:Dispose()
        end
        return
      end
      if hurtObject then
        battlePopObjectPool:ReturnObject(hurtObject)
        for i, v in ipairs(bindObject.cachedDisplayHurtTips) do
          if v == hurtObject then
            table.remove(bindObject.cachedDisplayHurtTips, i)
            return
          end
        end
      end
    end)
    trans.ignoreEngineTimeScale = false
  end
end

function MiniGameBattleHurtNum.ClearHurtNum()
  hudCom = nil
  battleHurtNumUrlList = {}
  MiniGameBattleHurtNum.ClearPool()
end
