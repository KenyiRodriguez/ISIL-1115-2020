//
//  DiscWS.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 23/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Discs = (_ arrayDiscs: [DiscBE]) -> Void

class DiscWS {
    
    class func getAllDiscs(_ success: @escaping Discs) {
        
        WebServiceManager.doRequestWithMethod(.get, urlString: "http://kenyirodriguez.com/discos.json") { (responseService) in
            
            let json = responseService as? JSON ?? [:]
            let products = json["productos"] as? JSON ?? [:]
            let discsWS = products["discos"] as? [JSON] ?? []
            
            var arrayDiscs = [DiscBE]()
            
            for discJSON in discsWS {
                let obj = DiscBE(json: discJSON)
                arrayDiscs.append(obj)
            }
            
            success(arrayDiscs)
        }
    }
}
