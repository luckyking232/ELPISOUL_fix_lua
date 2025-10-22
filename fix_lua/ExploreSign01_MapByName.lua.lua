require("ExploreSign01_ExploreWordByName")
require("ExploreSign01_Place1AniByName")
require("ExploreSign01_Place2AniByName")
require("ExploreSign01_Place3AniByName")
require("ExploreSign01_Place4AniByName")
require("ExploreSign01_Place5AniByName")
require("ExploreSign01_Place6AniByName")

function GetExploreSign01_MapUis(ui)
  local uis = {}
  uis.MapLoader = ui:GetChild("MapLoader")
  uis.MapHolder = ui:GetChild("MapHolder")
  uis.ExploreWord = GetExploreSign01_ExploreWordUis(ui:GetChild("ExploreWord"))
  uis.Place1 = GetExploreSign01_Place1AniUis(ui:GetChild("Place1"))
  uis.Place2 = GetExploreSign01_Place2AniUis(ui:GetChild("Place2"))
  uis.Place3 = GetExploreSign01_Place3AniUis(ui:GetChild("Place3"))
  uis.Place4 = GetExploreSign01_Place4AniUis(ui:GetChild("Place4"))
  uis.Place5 = GetExploreSign01_Place5AniUis(ui:GetChild("Place5"))
  uis.Place6 = GetExploreSign01_Place6AniUis(ui:GetChild("Place6"))
  uis.root = ui
  return uis
end
