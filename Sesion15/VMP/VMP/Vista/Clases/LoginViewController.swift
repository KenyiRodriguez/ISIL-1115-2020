//
//  LoginViewController.swift
//  VMP
//
//  Created by Kenyi Rodriguez on 7/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var txtUsuario   : UITextField!
    @IBOutlet weak private var txtPassword  : UITextField!
    @IBOutlet weak private var btnLogin     : UIButton!
    @IBOutlet weak private var loadingView  : UIActivityIndicatorView!
    
    var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenter(controller: self)
    }
    
    func changeLoginState(_ isLoading: Bool) {
        
        self.btnLogin.alpha = isLoading ? 0.5 : 1
        self.btnLogin.isUserInteractionEnabled = isLoading ? false : true
        isLoading ? self.loadingView.startAnimating() : self.loadingView.stopAnimating()
    }
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        let usuario = self.txtUsuario.text ?? ""
        let password = self.txtPassword.text ?? ""
        
        self.presenter.doLogin(usuario, password: password)
    }
    
    func iniciarAplicacion() {
        //TODO: iniciar aplicación
        print("INICIAR APLICACIÓN")
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
    }

}
