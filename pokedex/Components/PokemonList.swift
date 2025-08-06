//
//  List.swift
//  pokedex
//
//  Created by Emmanuel Canto on 05/08/25.
//

import SwiftUI

struct PokemonList: View {
    let pokemonList: [PokemonResults]
    let pokemonListWithId: [PokemonResultsWithID]!
    
    init(pokemonList: [PokemonResults]) {
        self.pokemonList = pokemonList
        
        pokemonListWithId = pokemonList.map {
            PokemonResultsWithID(
                name: $0.name, url: $0.url, id: extractId(from: $0.url)
            )
        }
    }
    
    var body: some View {
        List {
            ForEach(pokemonListWithId, id: \.name) { pokemon in
                ListItem(pokemon: pokemon)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    PokemonList(pokemonList: [PokemonResults(name: "one", url: "")])
}
