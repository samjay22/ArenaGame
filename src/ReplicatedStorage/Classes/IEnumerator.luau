--!strict

local EnumeratorClass = require(script.Parent.IEnumerator)

-- Class implementing IList<T>
local List = {}
List.__index = List

export type List<T> = IList<T> & {
    Items: {T},
}

function List.new<T>(): List<T>
    local self: List<T> = setmetatable({
        Items = {},
        Count = 0,
    }, List)
    return self
end

function List:Add(item: any)
    table.insert(self.Items, item)
    self.Count += 1
end

function List:RemoveAt(index: number)
    table.remove(self.Items, index)
    self.Count -= 1
end

function List:Insert(index: number, item: any)
    table.insert(self.Items, index, item)
    self.Count += 1
end

function List:IndexOf(item: any)
    for i, v in ipairs(self.Items) do
        if v == item then
            return i
        end
    end
    return nil
end

function List:GetItem(index: number)
    return self.Items[index]
end

function List:SetItem(index: number, value: any)
    self.Items[index] = value
end

function List:GetEnumerator()
  return EnumeratorClass.new(self.Items)
end

return List
