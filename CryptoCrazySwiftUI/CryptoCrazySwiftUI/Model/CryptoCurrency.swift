//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Elif Bilge Parlak on 26.03.2023.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable{
    let currency : String
    let price : String
    let id = UUID()
    
    private enum CodingKeys : String,CodingKey{
        case currency = "currency"
        case price = "price"
    }
}
