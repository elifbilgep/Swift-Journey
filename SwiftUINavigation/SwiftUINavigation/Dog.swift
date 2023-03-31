//
//  Dog.swift
//  SwiftUINavigation
//
//  Created by Elif Bilge Parlak on 31.03.2023.
//

import Foundation

struct Dog : Identifiable, Hashable{
    var id = UUID()
    let name : String
}

let dogs : [Dog] = [Dog(name: "Duman"), Dog(name: "Köpke"),Dog(name: "Hav Hav")]
