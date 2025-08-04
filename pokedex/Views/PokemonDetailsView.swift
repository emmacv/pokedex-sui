//
//  PokemonDetail.swift
//  pokedex
//
//  Created by Emmanuel Canto on 29/07/25.
//

import SwiftUI

struct PokemonDetailsView: View {
    @StateObject var viewModel: PokemonViewModel = .init()
    let url: String
    let name: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading")
            } else {
                Text(viewModel.result?.name ?? "")
            }
        }
        .navigationTitle(name)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onAppear {
            Task {
                await viewModel.fetchPokemonDetails(url: url)
            }
        }
    }
}
