//
//  ItemContainer.swift
//  pokedex
//
//  Created by Emmanuel Canto on 04/08/25.
//

import SwiftUI

struct ListItem: View {
    let name: String
    
    var body: some View {
        ZStack {
            Rectangle()
            Spacer(minLength: 0)
            VStack {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .frame(height: 150)
        .cornerRadius(32)
        .background(Color.blue)
    }
}

#Preview {
    ListItem(name: "Lorem ipsum")
}

