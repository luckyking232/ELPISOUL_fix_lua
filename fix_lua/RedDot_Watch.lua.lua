RedDotWatch = {}

function RedDotWatch.ShowHome()
  local config = TableData.GetTable("BaseFashion")
  local tb = {}
  local newFashion = OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.SPECIAL_FASHION_NEW)
  for i, v in pairs(config) do
    if 2 == v.skin_type and CardData.FashionIsContain(v.id) and not table.contain(newFashion, v.id) then
      return true
    end
  end
end
