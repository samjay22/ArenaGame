-- PlayerInventory.lua
local Cloneable = require(script.Cloneable)
local Comparable = require(script.Comparable)
local Identifiable = require(script.Identifiable)
local Disposable = require(script.Disposable)
local ListBase = require(script.ListBase)

local PlayerInventory = {}
PlayerInventory.__index = PlayerInventory

function PlayerInventory.new(systemId)
    local self = {
        -- Composition: Instances of base classes
        cloneable = Cloneable.new(),
        comparable = Comparable.new(),
        identifiable = Identifiable.new(systemId),
        disposable = Disposable.new(),
        
        -- Inventory Lists
        Skins = ListBase.new(),
        Characters = ListBase.new(),
    }
    
    setmetatable(self, PlayerInventory)
    return self
end

-- Delegating Identifiable Interface
function PlayerInventory:GetSystemId()
    return self.identifiable:GetSystemId()
end

-- Implementing ICloneable Interface
function PlayerInventory:Clone()
    local clone = PlayerInventory.new(self:GetSystemId())
    
    -- Clone Skins
    for i = 1, self.Skins.Count do
        local skin = self.Skins:GetItem(i)
        if skin then
            clone.Skins:Add(skin)
        end
    end
    
    -- Clone Characters
    for i = 1, self.Characters.Count do
        local character = self.Characters:GetItem(i)
        if character then
            clone.Characters:Add(character)
        end
    end
    
    return clone
end

-- Implementing IComparable Interface
function PlayerInventory:CompareTo(other)
    local selfTotal = self.Skins.Count + self.Characters.Count
    local otherTotal = other.Skins.Count + other.Characters.Count
    return selfTotal - otherTotal
end

-- Implementing IDisposable Interface
function PlayerInventory:Dispose()
    self.Skins = nil
    self.Characters = nil
    self.identifiable = nil
    self.cloneable = nil
    self.comparable = nil
    self.disposable = nil
end

return PlayerInventory
