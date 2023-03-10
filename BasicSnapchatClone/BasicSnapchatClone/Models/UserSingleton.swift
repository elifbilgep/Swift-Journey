//
//  UserSingleton.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 9.03.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    var email = ""
    var userName = ""
    
    private init(){
        
    }
}
