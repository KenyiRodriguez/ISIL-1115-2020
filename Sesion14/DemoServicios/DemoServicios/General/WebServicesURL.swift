//
//  WebServicesURL.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 30/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

struct WebServicesURL {
    
    static private let baseURL = "https://ipas-ios.s3.amazonaws.com/jsonTest/"
    
    static let getDiscs     = baseURL + "discos.json"
    static let getMovies    = baseURL + "peliculas.json"
}
