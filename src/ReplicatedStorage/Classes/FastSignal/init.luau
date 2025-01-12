--!strict
local DeferredSignal = require(script.Deferred)

export type Class<T...> = DeferredSignal.Signal<T...>
export type Signal<T...> = DeferredSignal.Signal<T...>
export type ScriptConnection = DeferredSignal.Connection

return DeferredSignal :: typeof(DeferredSignal) 