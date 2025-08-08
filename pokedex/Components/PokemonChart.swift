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
                x: .value("Value", $0.baseStat),
                y: .value("Stat", $0.stat.name)
            )
            .foregroundStyle(by: .value("stats", $0.stat.name))
        }
    }
}
