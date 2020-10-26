//
//  ViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtDate      : ISILTextField!
    @IBOutlet weak var txtDocument  : ISILTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? DatePickerViewController {
            controller.delegate = self
            
        }else if let controller = segue.destination as? PickerViewController {
            controller.delegate = self
            controller.arrayItems = ["DNI", "CE", "PASS"]
        }
    }
}

extension ViewController: PickerViewControllerDelegate {
    
    func pickerViewController(_ controller: PickerViewController, didSelectItem item: String) {
        self.txtDocument.text = item
    }
}

extension ViewController: DatePickerViewControllerDelegate {
    
    func datePickerViewController(_ controller: DatePickerViewController, didDateSelect date: Date) {
        
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        dateFormatter.dateFormat = "EE dd MM yyyy"
//        dateFormatter.dateFormat = "EE dd MMM yyyy"
//        dateFormatter.dateFormat = "EE dd MMMM yyyy"
//        dateFormatter.dateFormat = "EEEE dd MMMM yyyy HH:mm"
//        dateFormatter.dateFormat = "EEEE dd MMMM yyyy hh:mm a"
        dateFormatter.dateFormat = "EEEE dd 'de' MMMM 'del' yyyy 'a las' HH:mm 'horas'"
        
        dateFormatter.locale = Locale(identifier: "es_PE")
        self.txtDate.text = dateFormatter.string(from: date)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
   
        if self.txtDate == textField {
            self.performSegue(withIdentifier: "DatePickerViewController", sender: nil)
            return false
            
        }else if self.txtDocument == textField {
            self.performSegue(withIdentifier: "PickerViewController", sender: nil)
            return false
        }
        
        return true
    }
}

