//
//  DiscWS.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 23/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscWS {
    
    class func getAllDiscs(_ success: @escaping Discs) {
        
        WebServiceManager.doRequestWithMethod(.get, urlString: WebServicesURL.getDiscs) { (responseService) in
            
            let json = responseService as? WebServiceManager.JSON ?? [:]
            let products = json["productos"] as? WebServiceManager.JSON ?? [:]
            let discsWS = products["discos"] as? [WebServiceManager.JSON] ?? []
            
            var arrayDiscs = [DiscBE]()
            
            for discJSON in discsWS {
                let obj = DiscBE(json: discJSON)
                arrayDiscs.append(obj)
            }
            
            success(arrayDiscs)
        }
    }
}
