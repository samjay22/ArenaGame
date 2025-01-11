--!strict

local IdentifiableClass = require(game.ReplicatedStorage.Classes.Identifiable)

-- Class implementing CharacterAbilityStats
local CharacterAbilityStatsClass = {}
CharacterAbilityStatsClass.__index = CharacterAbilityStatsClass
setmetatable(CharacterAbilityStatsClass, IdentifiableClass)

function CharacterAbilityStatsClass.new(
    ActiveAbilities: {number}, 
    PassiveAbilities: {number}, 
    UltimateAbility: number, systemId: string | number): CharacterAbilityStatsClass
  
    local self = IdentifiableClass.new(systemId)
    setmetatable(self, CharacterAbilityStatsClass)
    self.ActiveAbilities = ActiveAbilities or {}
    self.PassiveAbilities = PassiveAbilities or {}
    self.UltimateAbility = UltimateAbility
    return self
end

return CharacterAbilityStatsClass
