--!strict

local IdentifiableClass = require(game.ReplicatedStorage.Classes.Identifiable)

-- Class implementing CharacterStats
local CharacterStatsClass = {}
CharacterStatsClass.__index = CharacterStatsClass
setmetatable(CharacterStatsClass, IdentifiableClass)

function CharacterStatsClass.new(Name: string, Stats: {[string]: any}, systemId: string | number): CharacterStatsClass
    local self = IdentifiableClass.new(systemId)
    setmetatable(self, CharacterStatsClass)
    self.Name = Name
    self.Stats = Stats or {}
    return self
end

return CharacterStatsClass
