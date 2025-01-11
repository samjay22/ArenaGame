--!strict

-- Class implementing IDictionary<TKey, TValue>
local Dictionary = {}
Dictionary.__index = Dictionary

export type Dictionary<TKey, TValue> = IDictionary<TKey, TValue> & {
    Items: {[TKey]: TValue},
}

function Dictionary.new<TKey, TValue>(): Dictionary<TKey, TValue>
    local self: Dictionary<TKey, TValue> = setmetatable({
        Items = {},
    }, Dictionary)
    return self
end

function Dictionary:Add(key: any, value: any)
    self.Items[key] = value
end

function Dictionary:Remove(key: any)
    if self.Items[key] ~= nil then
        self.Items[key] = nil
        return true
    end
    return false
end

function Dictionary:ContainsKey(key: any)
    return self.Items[key] ~= nil
end

function Dictionary:TryGetValue(key: any)
    local value = self.Items[key]
    if value ~= nil then
        return true, value
    end
    return false, nil
end

function Dictionary:Keys()
    local keys = {}
    for key, _ in pairs(self.Items) do
        table.insert(keys, key)
    end
    return keys
end

function Dictionary:Values()
    local values = {}
    for _, value in pairs(self.Items) do
        table.insert(values, value)
    end
    return values
end

function Dictionary:GetItem(key: any)
    return self.Items[key]
end

return Dictionary
