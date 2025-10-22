require("ExploreSign02_ExploreWordByName")
require("ExploreSign02_Place1AniByName")
require("ExploreSign02_Place2AniByName")
require("ExploreSign02_Place3AniByName")
require("ExploreSign02_Place4AniByName")
require("ExploreSign02_Place5AniByName")
require("ExploreSign02_Place6AniByName")

function GetExploreSign02_MapUis(ui)
  local uis = {}
  uis.MapLoader = ui:GetChild("MapLoader")
  uis.MapHolder = ui:GetChild("MapHolder")
  uis.ExploreWord = GetExploreSign02_ExploreWordUis(ui:GetChild("ExploreWord"))
  uis.Place1 = GetExploreSign02_Place1AniUis(ui:GetChild("Place1"))
  uis.Place2 = GetExploreSign02_Place2AniUis(ui:GetChild("Place2"))
  uis.Place3 = GetExploreSign02_Place3AniUis(ui:GetChild("Place3"))
  uis.Place4 = GetExploreSign02_Place4AniUis(ui:GetChild("Place4"))
  uis.Place5 = GetExploreSign02_Place5AniUis(ui:GetChild("Place5"))
  uis.Place6 = GetExploreSign02_Place6AniUis(ui:GetChild("Place6"))
  uis.root = ui
  return uis
end
