//
//  NetworkManager.swift
//  pokedex
//
//  Created by Emmanuel Canto on 31/07/25.
//

import Foundation

class PokemonApiClient {
    private static let url = "https://pokeapi.co/api/v2"
    
    static func getPokemonListResult() async throws -> PokemonResult? {
        let (data, _) = try await URLSession.shared.data(from: URL(string: "\(url)/pokemon?limit=20")!)
        
        let res = try JSONDecoder().decode(PokemonResult.self, from: data)
        return res
    }
    
    static func getPokemonDetailResult(url: String) async throws -> Pokemon? {
        let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
        
        let res = try JSONDecoder().decode(Pokemon.self, from: data)
        return res
    }
}
