//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Elif Bilge Parlak on 12.02.2023.
//

import Foundation

class SuperMusician : Musicians{
    func sing2(){
        print("enter night")
    }
    
    override func sing() {
        super.sing() //super üst sınıfı çağırmak
        print("mariaaa mariaaaa")
    }
}
