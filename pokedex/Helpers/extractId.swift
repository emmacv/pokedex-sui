//
//  extractId.swift
//  pokedex
//
//  Created by Emmanuel Canto on 05/08/25.
//

import Foundation

func extractId(from url: String) -> Int {
    return Int(url.split(separator: "/").last!)!
}
