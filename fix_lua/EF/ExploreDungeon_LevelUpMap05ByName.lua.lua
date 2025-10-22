require("ExploreDungeon_LevelUp_TipsAniByName")

function GetExploreDungeon_LevelUpMap05Uis(ui)
  local uis = {}
  uis.Tips1 = GetExploreDungeon_LevelUp_TipsAniUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetExploreDungeon_LevelUp_TipsAniUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetExploreDungeon_LevelUp_TipsAniUis(ui:GetChild("Tips3"))
  uis.root = ui
  return uis
end
