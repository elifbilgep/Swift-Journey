//
//  Musicians.swift
//  MusicianClass
//
//  Created by Elif Bilge Parlak on 12.02.2023.
//

import Foundation

enum MusicianType{
    case LeadGuitar
    case Vocalist
    case Bassist
    case Violenist
}

class Musicians {
    
    //property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    init(name: String, age: Int, instrument: String,type: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
        
    }
    
    func sing(){
        print("Nothing else matters")
    }
}
