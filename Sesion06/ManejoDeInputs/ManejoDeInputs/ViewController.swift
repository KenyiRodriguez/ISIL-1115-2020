//
//  ViewController.swift
//  ManejoDeInputs
//
//  Created by Kenyi Rodriguez on 10/5/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDocument: UITextField!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblNombre.isHidden = true
        self.changeStyleSelected(false, toInput: self.txtName)
        self.changeStyleSelected(false, toInput: self.txtDocument)
    }
    
    func changeStyleSelected(_ isSelected: Bool, toInput input: UITextField) {
        
        input.backgroundColor = .white
        
        input.layer.borderColor = isSelected ? UIColor.blue.cgColor : UIColor.lightGray.cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 10
        
        input.layer.shadowColor = UIColor.black.cgColor
        input.layer.shadowOffset = CGSize(width: 0, height: 0)
        input.layer.shadowRadius = 3
        input.layer.shadowOpacity = 0.2
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.txtName {
            self.lblNombre.isHidden = false
        }
        
        self.changeStyleSelected(true, toInput: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.txtName {
            self.lblNombre.isHidden = true
        }
        
        self.changeStyleSelected(false, toInput: textField)
    }
}

