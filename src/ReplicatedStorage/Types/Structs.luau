local Abstract = require(game.ReplicatedStorage.Types.Abstract)

type listOf<T> = {T} & Abstract.IList<T>

export type PlayerInventory = {
    Skins : listOf<number>,
    Characters : listOf<number>,
} & Abstract.ICloneable 
& Abstract.IComparable 
& Abstract.Identifiable
& Abstract.IDisposable


--Character structs
export type CharacterAsset = {
    RobloxAssetId : number,
    PrefabInstance : Instance?
} & Abstract.ILoadable
& Abstract.Identifiable


export type CharacterStats = {
    --Insert service can import this asset
    Name : string,
    Stats : {
        [string] : any
    }
    
}& Abstract.Identifiable

export type CharacterAbilitiyStats = {
    ActiveAbilities : listOf<number>,
    PassiveAbilities : listOf<number>,
    UltimateAbility : number,
} & Abstract.Identifiable

return 0
