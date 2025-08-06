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
//        NavigationStack {
//            ZStack(alignment: .center) {
//                Color.red.ignoresSafeArea(.all)
//                Image("pokeball")
//                    .offset(x: 80, y: 300)
//                
//                if viewModel.isLoading {
//                    ProgressView("Loading")
//                } else if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .padding()
//                } else {
//                    PokemonList(pokemonList: viewModel.result?.results ?? [])
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .onAppear {
//            Task {
//                await viewModel.fetchPokemonList()
//            }
//        }
        
            NavigationStack {
                NavigationLink {
                    MyView()
                } label: {
                    
                    Text("Go to Pokemon List")
                }
            }
            .background(Color.red)
    }
        
}

struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ContentView()
}
