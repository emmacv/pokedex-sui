//
//  transformPokemonResult.swift
//  pokedex
//
//  Created by emmanuel.canto on 07/08/25.
//

func transformPokemonResult(_ result: Pokemon) -> Pokemon2 {
    let sprites = [
        result.sprites.backDefault,
        result.sprites.frontDefault,
        result.sprites.backShiny,
        result.sprites.backShinyFemale,
        result.sprites.backFemale,
        result.sprites.frontFemale,
        result.sprites.frontShiny,
        result.sprites.frontShinyFemale,
    ]
        .filter { $0 != nil }
        .map{ $0! }
    
    return .init(
        height: result.height,
        id: result.id,
        name: result.name,
        abilities: result.abilities,
        stats: result.stats,
        sprites: sprites
    )
}
