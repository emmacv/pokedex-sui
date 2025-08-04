//
//  ContentView.swift
//  pokedex
//
//  Created by Emmanuel Canto on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokedexViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
//                Image("pokeball")
//                    .offset(x: 60, y: 250.0)
                if viewModel.isLoading {
                    ProgressView("Loading")
                } else {
                    List {
                        ForEach(viewModel.result?.results ?? [], id: \.name) {item in
                            NavigationLink(destination: {
                                PokemonDetailsView(url: item.url, name: item.name)
                            }, label: {
                                ListItem(name: item.name)
                            })
                        }
                    }
                    .listStyle(.plain)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
        }
        .onAppear {
            Task {
                await viewModel.fetchPokemonList()
            }
        }
    }
}

#Preview {
    ContentView()
}
