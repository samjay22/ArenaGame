--!strict
export type Identifiable = {
    SystemId : string | number
}

export type ICollection<T> = {
    Find : (entity : T) -> number,
    RemoveByIndex : (index : number) -> T,
    RemoveByEntity : (entity : T) -> number,
}

export type IUpdatable = {
    Update: (dt: number) -> ()
}

export type ISerializable = {
    Serialize: () -> string,
    Deserialize: (data: string) -> ISerializable
}

export type ILoadable = {
    Load: () -> (),
    Unload: () -> (),
    IsLoaded: () -> boolean
}

export type IRunnable = {
    Run: () -> (),
    Stop: () -> (),
    IsRunning: () -> boolean
}

export type IDisposable = {
    Dispose: () -> ()
}

export type IDictionary<TKey, TValue> = {
    Add: (key: TKey, value: TValue) -> (),
    Remove: (key: TKey) -> boolean,
    ContainsKey: (key: TKey) -> boolean,
    TryGetValue: (key: TKey) -> (boolean, TValue?),
    Keys: () -> {TKey},
    Values: () -> {TValue},
    Item: (key: TKey) -> TValue,
    SetItem: (key: TKey, value: TValue) -> ()
}

export type IList<T> = {
    Count: number,
    Add: (item: T) -> (),
    RemoveAt: (index: number) -> (),
    Insert: (index: number, item: T) -> (),
    IndexOf: (item: T) -> number,
    Item: (index: number) -> T,
    SetItem: (index: number, value: T) -> (),
    GetEnumerator: () -> IEnumerator<T>
}

export type IEnumerator<T> = {
    MoveNext: () -> boolean,
    Reset: () -> (),
    Current: T
}

export type IEnumerable<T> = {
    GetEnumerator: () -> IEnumerator<T>
}

export type ICloneable = {
    Clone: () -> ICloneable
}

export type IEquatable<T> = {
    Equals: (other: T) -> boolean
}

export type IComparable<T> = {
    CompareTo: (other: T) -> number
}

return 0