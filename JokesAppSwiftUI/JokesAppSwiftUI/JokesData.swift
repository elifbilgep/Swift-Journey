//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by Elif Bilge Parlak on 31.03.2023.
//

import Foundation

struct Welcome: Identifiable, Codable {
    let id = UUID()
    let type: String
    let value: [Value]
}

struct Value: Identifiable,Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
