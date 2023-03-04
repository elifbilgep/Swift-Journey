//
//  MusiciansStruct.swift
//  AdvancedSwiftProject
//
//  Created by Elif Bilge Parlak on 1.03.2023.
//

import Foundation

struct MusicianStruct{
    var name: String
    var age: Int
    var instrument: String
    
    
    mutating func happyBirthday(){
        self.age += 1
    }
}

