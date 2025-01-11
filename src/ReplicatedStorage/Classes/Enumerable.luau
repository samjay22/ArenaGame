-- Class implementing IAsyncEnumerable<T>
local AsyncEnumerable = {}
AsyncEnumerable.__index = AsyncEnumerable

export type AsyncEnumerable<T> = IAsyncEnumerable<T> & {
    _iterable: {T},
}

function AsyncEnumerable.new<T>(iterable: {T}): AsyncEnumerable<T>
    local self: AsyncEnumerable<T> = setmetatable({
        _iterable = iterable,
    }, AsyncEnumerable)
    return self
end

function AsyncEnumerable:GetAsyncEnumerator()
    return AsyncEnumerator.new(self._iterable)
end

return AsyncEnumerable
