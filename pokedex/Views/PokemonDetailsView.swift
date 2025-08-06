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
    let title: String!
    
    init(url: String, name: String) {
        self.name = name
        self.url = url
        
        let splittedName = name.split(separator: "")
        let (firsLetter, rest) = (splittedName[0].capitalized, splittedName[1...].joined())
        title = "\(firsLetter)\(rest)"
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading")
            } else {
                Text(viewModel.result?.name ?? "")
            }
        }
        .navigationTitle(title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .task {
            await viewModel.fetchPokemonDetails(url: url)
        }
    }
}
