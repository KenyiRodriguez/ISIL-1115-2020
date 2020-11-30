//
//  DiscBL.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 30/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscBL {
    
    class func getAllDiscs(_ success: @escaping Discs) {
        
        DiscWS.getAllDiscs { (arrayDisc) in
            
            let arraySorted = arrayDisc.sorted(by: { $0.disc_releaseDate > $1.disc_releaseDate })
            success(arraySorted)
        }
    }
}
