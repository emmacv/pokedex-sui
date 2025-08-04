// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Wrapper
struct PokemonResult: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [PokemonListItem]
}

// MARK: - Result
struct PokemonListItem: Codable {
    let name: String
    let url: String
}
