require("Battle_Card10080ByName")
require("Battle_Card10059ByName")
require("Battle_Card10101ByName")
require("Battle_Card10103ByName")
require("Battle_Card10108ByName")
require("Battle_Card10075ByName")

function GetBattle_CardSignUis(ui)
  local uis = {}
  uis.Card10080 = GetBattle_Card10080Uis(ui:GetChild("Card10080"))
  uis.Card10059 = GetBattle_Card10059Uis(ui:GetChild("Card10059"))
  uis.Card10101 = GetBattle_Card10101Uis(ui:GetChild("Card10101"))
  uis.Card10103 = GetBattle_Card10103Uis(ui:GetChild("Card10103"))
  uis.Card10108 = GetBattle_Card10108Uis(ui:GetChild("Card10108"))
  uis.Card10075 = GetBattle_Card10075Uis(ui:GetChild("Card10075"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
