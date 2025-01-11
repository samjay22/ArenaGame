--!strict

-- Class implementing IAsyncEnumerator<T>
local AsyncEnumerator = {}
AsyncEnumerator.__index = AsyncEnumerator

export type AsyncEnumerator<T> = IAsyncEnumerator<T> & {
    _iterator: thread,
    Current: T?,
}

function AsyncEnumerator.new<T>(iterable: {T}): AsyncEnumerator<T>
    local self: AsyncEnumerator<T> = setmetatable({}, AsyncEnumerator)

    self._iterator = coroutine.create(function()
        for _, item in ipairs(iterable) do
            coroutine.yield(item)
        end
    end)

    return self
end

function AsyncEnumerator:MoveNextAsync()
    local success, value = coroutine.resume(self._iterator)
    if success and coroutine.status(self._iterator) ~= "dead" then
        self.Current = value
        return true
    else
        self.Current = nil
        return false
    end
end


return AsyncEnumerator
