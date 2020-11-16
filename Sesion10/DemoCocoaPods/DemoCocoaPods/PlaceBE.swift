//
//  PlaceBE.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 11/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import CoreLocation

class PlaceBE {
    
    var place_name      : String
    var place_address   : String
    var place_urlImage  : String
    var place_coordinate: CLLocationCoordinate2D
    
    init(name: String, address: String, urlImage: String, coordinate: CLLocationCoordinate2D) {
        
        self.place_name         = name
        self.place_address      = address
        self.place_urlImage     = urlImage
        self.place_coordinate   = coordinate
    }
}
