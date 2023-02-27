//
//  PlaceModel.swift
//  Foursqare Clone
//
//  Created by Elif Bilge Parlak on 27.02.2023.
//

import Foundation
import UIKit

class PlaceModel{
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init(){}
}
