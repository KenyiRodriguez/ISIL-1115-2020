//
//  LoginModelo.swift
//  VMP
//
//  Created by Kenyi Rodriguez on 7/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class LoginModelo {
    
    func doLogin(_ usuario: String, password: String, success: @escaping Success) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            success()
        }
    }
}
