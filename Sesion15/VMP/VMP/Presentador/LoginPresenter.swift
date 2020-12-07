//
//  LoginPresenter.swift
//  VMP
//
//  Created by Kenyi Rodriguez on 7/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    private weak var controller: LoginViewController?
    
    private var modelo = LoginModelo()
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
    
    func doLogin(_ usuario: String, password: String) {
        
        if usuario.count == 0 {
            print("Ingrese usuario válido")
            
        }else if password.count == 0 {
            print("Ingrese un password válido")
            
        }else {
            self.controller?.changeLoginState(true)
            
            self.modelo.doLogin(usuario, password: password) {
                
                self.controller?.changeLoginState(false)
                self.controller?.iniciarAplicacion()
            }
        }
    }
}
