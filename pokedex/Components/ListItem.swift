//
//  ItemContainer.swift
//  pokedex
//
//  Created by Emmanuel Canto on 04/08/25.
//

import SwiftUI

struct ListItem: View {
    let pokemon: PokemonResultsWithID
    let image: String!
    
    init(pokemon: PokemonResultsWithID) {
        self.pokemon = pokemon
        image = getImageUrl(for: pokemon.id)
    }
    
    var body: some View {
        ZStack {
            Card(id: pokemon.id, name: pokemon.name, image: image)
            NavigationLink {
                PokemonDetailsView(
                    url: pokemon.url, name: pokemon.name, image: image
                )
            } label: {
                EmptyView()
            }.opacity(0)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

