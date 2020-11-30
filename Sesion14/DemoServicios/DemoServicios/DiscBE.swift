//
//  DiscBE.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 23/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscBE {
    
    var disc_id         : Int
    var disc_name       : String
    var disc_author     : String
    var disc_releaseDate: Int
    var disc_genre      : String
    var disc_urlImage   : String
    var disc_price      : String
    var disc_description: String
    var disc_companyName: String
    
    init(json: WebServiceManager.JSON) {
        
        self.disc_id            = json["id"]            as? Int ?? 0
        self.disc_name          = json["nombre"]        as? String ?? ""
        self.disc_author        = json["autor"]         as? String ?? ""
        self.disc_releaseDate   = json["publicacion"]   as? Int ?? 0
        self.disc_genre         = json["genero"]        as? String ?? ""
        self.disc_urlImage      = json["urlImagen"]     as? String ?? ""
        self.disc_price         = json["precio"]        as? String ?? ""
        self.disc_description   = json["descripcion"]   as? String ?? ""
        self.disc_companyName   = json["discografica"]  as? String ?? ""
    }
}
