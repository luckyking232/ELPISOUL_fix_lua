require("Story_Card_BgAniByName")

function GetStory_AnBtnUis(ui)
  local uis = {}
  uis.BgAni = GetStory_Card_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
