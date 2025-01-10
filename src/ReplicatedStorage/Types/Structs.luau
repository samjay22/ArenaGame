local Abstract = require(game.ReplicatedStorage.Types.Abstract)

type listOf<T> = {T} & Abstract.IList<T>

export type PlayerInventory = {
    Skins : listOf<number>,
    Characters : listOf<number>,
} & Abstract.ICloneable 
& Abstract.IComparable 
& Abstract.Identifiable
& Abstract.IDisposable

export type CharacterMetadata = {
    ActiveAbilities : listOf<number>,
    PassiveAbilities : listOf<number>,
    UltimateAbility : number,

    --Insert service can import this asset
    Name : string,
    RobloxAssetId : number,
    Stats : {
        [string] : any
    }
    
} & Abstract.ICloneable 
& Abstract.IComparable 
& Abstract.Identifiable
& Abstract.IDisposable

return 0