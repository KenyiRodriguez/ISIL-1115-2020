//
//  PlaceBE.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import CoreLocation

class PlaceBE {
    
    var place_name      : String
    var place_coordinate: CLLocationCoordinate2D
    var place_urlImage  : String
    var place_address   : String
    
    init(name: String, address: String, coordinate: CLLocationCoordinate2D, urlImage: String) {
        
        self.place_name         = name
        self.place_address      = address
        self.place_coordinate   = coordinate
        self.place_urlImage     = urlImage
    }
}
