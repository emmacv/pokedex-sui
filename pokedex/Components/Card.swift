//
//  Card.swift
//  pokedex
//
//  Created by emmanuel.canto on 07/08/25.
//

import SwiftUI
import SDWebImageSwiftUI

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

#Preview {
    Card(id: 1, name: "bulbasaur", image: "https://pokeapi.co/api/v2/pokemon/1/")
}
