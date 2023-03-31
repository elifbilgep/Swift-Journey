//
//  Cat.swift
//  SwiftUINavigation
//
//  Created by Elif Bilge Parlak on 31.03.2023.
//

import Foundation

struct Cat : Identifiable, Hashable{
    var id = UUID()
    let name : String
}

let cats : [Cat] = [Cat(name: "Pamuk"),Cat(name: "Elma"),Cat(name: "Minnnie")]
