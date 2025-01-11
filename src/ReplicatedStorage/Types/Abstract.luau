-- Improved Roblox Luau types

-- Identifiable interface
export type Identifiable = {
    SystemId: string | number,
}

-- Generic collection interface
export type ICollection<T> = {
    Find: (self: ICollection<T>, entity: T) -> number?,
    RemoveByIndex: (self: ICollection<T>, index: number) -> T?,
    RemoveByEntity: (self: ICollection<T>, entity: T) -> number?,
}

-- Interface for updatable entities
export type IUpdatable = {
    Update: (self: IUpdatable, dt: number) -> (),
}

-- Interface for serializable entities
export type ISerializable = {
    Serialize: (self: ISerializable) -> string,
    Deserialize: (self: ISerializable, data: string) -> (),
}

-- Interface for loadable entities
export type ILoadable = {
    Load: (self: ILoadable) -> (),
    Unload: (self: ILoadable) -> (),
    IsLoaded: (self: ILoadable) -> boolean,
}

-- Interface for runnable entities
export type IRunnable = {
    Run: (self: IRunnable) -> (),
    Stop: (self: IRunnable) -> (),
    IsRunning: (self: IRunnable) -> boolean,
}

-- Interface for disposable entities
export type IDisposable = {
    Dispose: (self: IDisposable) -> (),
}

-- Dictionary interface
export type IDictionary<TKey, TValue> = {
    Add: (self: IDictionary<TKey, TValue>, key: TKey, value: TValue) -> (),
    Remove: (self: IDictionary<TKey, TValue>, key: TKey) -> boolean,
    ContainsKey: (self: IDictionary<TKey, TValue>, key: TKey) -> boolean,
    TryGetValue: (self: IDictionary<TKey, TValue>, key: TKey) -> (boolean, TValue?),
    Keys: (self: IDictionary<TKey, TValue>) -> {TKey},
    Values: (self: IDictionary<TKey, TValue>) -> {TValue},
    GetItem: (self: IDictionary<TKey, TValue>, key: TKey) -> TValue?,
    SetItem: (self: IDictionary<TKey, TValue>, key: TKey, value: TValue) -> (),
}

-- List interface
export type IList<T> = {
    Count: number,
    Add: (self: IList<T>, item: T) -> (),
    RemoveAt: (self: IList<T>, index: number) -> (),
    Insert: (self: IList<T>, index: number, item: T) -> (),
    IndexOf: (self: IList<T>, item: T) -> number?,
    GetItem: (self: IList<T>, index: number) -> T?,
    SetItem: (self: IList<T>, index: number, value: T) -> (),
    GetEnumerator: (self: IList<T>) -> IEnumerator<T>,
}

-- Enumerator interface
export type IEnumerator<T> = {
    MoveNext: (self: IEnumerator<T>) -> boolean,
    Reset: (self: IEnumerator<T>) -> (),
    Current: T,
}

-- Enumerable interface
export type IEnumerable<T> = {
    GetEnumerator: (self: IEnumerable<T>) -> IEnumerator<T>,
}

-- Cloneable interface
export type ICloneable<T> = {
    Clone: (self: ICloneable<T>) -> T,
}

-- Equatable interface
export type IEquatable<T> = {
    Equals: (self: IEquatable<T>, other: T) -> boolean,
}

-- Comparable interface
export type IComparable<T> = {
    CompareTo: (self: IComparable<T>, other: T) -> number,
}

-- Added abstract interfaces

-- Event emitter interface
export type IEventEmitter = {
    On: (self: IEventEmitter, event: string, listener: (...any) -> ()) -> (),
    Off: (self: IEventEmitter, event: string, listener: (...any) -> ()) -> (),
    Emit: (self: IEventEmitter, event: string, ...any) -> boolean,
}

-- Persistable interface
export type IPersistable = {
    Save: (self: IPersistable) -> (),
    Load: (self: IPersistable) -> (),
}

-- Observable interface for reactive programming
export type IObservable<T> = {
    Subscribe: (self: IObservable<T>, observer: IObserver<T>) -> IDisposable,
}

export type IObserver<T> = {
    OnNext: (self: IObserver<T>, value: T) -> (),
    OnError: (self: IObserver<T>, err: any) -> (),
    OnCompleted: (self: IObserver<T>) -> (),
}

-- Asynchronous enumerator interface
export type IAsyncEnumerator<T> = {
    MoveNextAsync: (self: IAsyncEnumerator<T>) -> boolean,
    Current: T,
}

-- Asynchronous enumerable interface
export type IAsyncEnumerable<T> = {
    GetAsyncEnumerator: (self: IAsyncEnumerable<T>) -> IAsyncEnumerator<T>,
}

-- Loggable interface
export type ILoggable = {
    Log: (self: ILoggable, message: string) -> (),
}

-- Versionable interface
export type IVersionable = {
    Version: string,
}

return 0
