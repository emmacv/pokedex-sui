//
//  PokemonChart.swift
//  pokedex
//
//  Created by emmanuel.canto on 07/08/25.
//

import SwiftUI
import Charts

struct PokemonChart: View {
    let stats: [Stat]
    
    var body: some View {
        Chart(stats) {
            BarMark (
                x: .value("Stat", $0.stat.name),
                y: .value("Value", $0.baseStat)
            )
            .foregroundStyle(by: .value("stats", $0.stat.name))
        }
        .padding(12)
        .background(Color.black.opacity(0.8))
        .padding()
    }
}
