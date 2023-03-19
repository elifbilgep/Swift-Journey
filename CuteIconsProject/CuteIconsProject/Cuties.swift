//
//  Cuties.swift
//  CuteIconsProject
//
//  Created by Elif Bilge Parlak on 19.03.2023.
//

import Foundation

struct Cutie : Identifiable, Codable{
    
    var id: String{image}
    
    let image : String
    let name : String
    let realName : String
    
}

let cat = Cutie(image: "cat", name: "Cat", realName: "Anie")
let cloud = Cutie(image: "cloud", name: "Cloud", realName: "Puffy")
let donut = Cutie(image: "donat", name: "Donat", realName: "Strawberry Donat")
