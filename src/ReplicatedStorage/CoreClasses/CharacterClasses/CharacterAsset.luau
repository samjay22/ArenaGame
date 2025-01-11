--!strict
local InsertService : InsertService = game:GetService("InsertService")

local IdentifiableClass = require(game.ReplicatedStorage.Classes.Identifiable)

-- Class implementing CharacterAsset
local CharacterAssetClass = {}
CharacterAssetClass.__index = CharacterAssetClass
setmetatable(CharacterAssetClass, IdentifiableClass)

function CharacterAssetClass.new(RobloxAssetId: number, PrefabInstance: Instance?, systemId: string | number): CharacterAssetClass
    local self = IdentifiableClass.new(systemId)
    setmetatable(self, CharacterAssetClass)
    self.RobloxAssetId = RobloxAssetId
    self.PrefabInstance = PrefabInstance
    return self
end

function CharacterAssetClass:Load()
    print("Loading asset with ID:", self.RobloxAssetId)
    local success, asset = pcall(function()
        return InsertService:LoadAsset(self.RobloxAssetId)
    end)
  
    if not success or not asset then
        warn(`Asset {self.RobloxAssetId} failed to load`)
    end

   self.PrefabInstance = asset:GetChildren()[1]
end

return CharacterAssetClass
