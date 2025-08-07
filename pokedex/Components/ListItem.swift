//
//  ItemContainer.swift
//  pokedex
//
//  Created by Emmanuel Canto on 04/08/25.
//

import SwiftUI
import SDWebImageSwiftUI

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

struct Card: View {
    let id: Int
    let name: String
    let image: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: image))
                .resizable()
                .scaledToFit()
                .clipShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding([.leading, .trailing], 20)
                .background(
                    colorScheme == .dark ? Color.white.opacity(1) : Color.black.opacity(1)
                )
                .cornerRadius(16)
            VStack {
                Spacer()
                Text(name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.5))
            }
        }.frame(minHeight: 150)

    }
}


