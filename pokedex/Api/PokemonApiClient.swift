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
    
    static func getPokemonDetailResult(url: String) async throws -> Pokemon2? {
        do {
            let (data, d) = try await URLSession.shared.data(from: URL(string: url)!)
            
            print(data, d)
            
            let res = try JSONDecoder().decode(Pokemon2.self, from: data)
            print("res: \(res)")
            return res
        } catch (let error) {
            print(error)
            throw error
        }
    }
}
