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
    @Environment(\.colorScheme) var colorScheme
    
    init(pokemon: PokemonResultsWithID) {
        self.pokemon = pokemon
        //        bkgColor = colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.7)
    }
    
    var body: some View {
        ZStack {
            Card(id: pokemon.id, name: pokemon.name)
            NavigationLink {
                PokemonDetailsView(
                    url: pokemon.url, name: pokemon.name
                )
            } label: {
                EmptyView()
            }.opacity(0)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        //            NavigationLink {
        //                PokemonDetailsView(
        //                    url: pokemon.url, name: pokemon.name
        //                )
        //            } label: {
        //                EmptyView()
        //            }
    }
}

struct Card: View {
    let id: Int
    let name: String
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: getImageUrl(for: id)))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding([.leading, .trailing], 20)
                .background(Color.white)
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


