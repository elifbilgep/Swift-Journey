//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import Foundation

struct FavoriteModel : Identifiable{
    var id = UUID() //new Id every create time
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable{
    var id = UUID()
    var name : String
    var imageName :String
    var description : String
}

//Kpop Groups
let mamamoo = FavoriteElements(name: "Mamamoo", imageName: "mamamoo", description: "My favorite k-pop group")
let blackpink = FavoriteElements(name: "Blackpink", imageName: "blackpink", description: "Most popular girl pop group")
let gidle = FavoriteElements(name: "G-idle", imageName: "gidle", description: "My second favorite group")

let favoriteKpopBands = FavoriteModel(title: "Favorite K-pop Groups", elements: [mamamoo,blackpink,gidle ])

//Movies
let avatar = FavoriteElements(name: "Avatar", imageName: "avatar", description: "My favorite film")
let loveAndPrejudice = FavoriteElements(name: "Love and Prejudice", imageName: "lap", description: "My favorite love film")
let matrix = FavoriteElements(name: "Matrix", imageName: "matrix", description: "My favorite science fiction film")

let favoriteFilms = FavoriteModel(title: "Favorite Movies", elements: [avatar,loveAndPrejudice,matrix ])

let myFavorites = [favoriteFilms,favoriteKpopBands]
