--!strict

-- Class implementing ICollection<T>
local Collection = {}
Collection.__index = Collection

type Collection<T> = ICollection<T> & {
    Items: {T},
}

function Collection.new<T>(): Collection<T>
    local self: Collection<T> = setmetatable({
        Items = {},
    }, Collection)
    return self
end

function Collection:Find(entity: any)
    for index, item in ipairs(self.Items) do
        if item == entity then
            return index
        end
    end
    return nil
end

function Collection:RemoveByIndex(index: number)
    local item = self.Items[index]
    table.remove(self.Items, index)
    return item
end

function Collection:RemoveByEntity(entity: any)
    local index = self:Find(entity)
    if index then
        self:RemoveByIndex(index)
        return index
    end
    return nil
end

return Collection
