//
//  PokemonDetail.swift
//  pokedex
//
//  Created by Emmanuel Canto on 29/07/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailsView: View {
    @StateObject var viewModel: PokemonViewModel = .init()
    let url: String
    let name: String
    let title: String!
    let image: String
    
    init(url: String, name: String, image: String) {
        self.name = name
        self.url = url
        self.image = image
        
        let splittedName = name.split(separator: "")
        let (firsLetter, rest) = (splittedName[0].capitalized, splittedName[1...].joined())
        title = "\(firsLetter)\(rest)"
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            if viewModel.isLoading {
                ProgressView("Loading").tint(Color(UIColor.systemBackground))
            } else if viewModel.errorMessage != nil {
                Text(viewModel.errorMessage!)
            } else {
                VStack(alignment: .center, spacing: 16) {
                    ZStack {
                        Image("pokeball")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                        WebImage(url: URL(string: image))
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 250, maxHeight: 250)
                    }
                    Text("\(viewModel.result.map(\.id) ?? 0) - \(title)")
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("Sprites")
                        ScrollView(.horizontal) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.result?.sprites ?? [], id: \.self) {
                                    WebImage(url: URL(string: $0))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 128, maxHeight: 128)
                                }
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Stats")
                        PokemonChart(stats: viewModel.result?.stats ?? [])
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle(title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .task {
            await viewModel.fetchPokemonDetails(url: url)
            print(viewModel.result?.stats[0].baseStat ?? 0)
        }
    }
}

func stat(_ stat: Stat) -> Int{
    print(stat)
    return 8
}
