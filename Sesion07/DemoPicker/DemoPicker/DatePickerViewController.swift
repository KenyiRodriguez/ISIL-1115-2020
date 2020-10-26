//
//  DatePickerViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate {
    func datePickerViewController(_ controller: DatePickerViewController, didDateSelect date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var pickerContainer: UIView!
    
    var delegate: DatePickerViewControllerDelegate?
    
    @IBAction func tapToClose(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.view.backgroundColor = .clear
            self.pickerContainer.transform = CGAffineTransform(translationX: 0, y: self.pickerContainer.frame.height)
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }

    }
    
    @IBAction func changeDateSelect(_ datePicker: UIDatePicker) {
        self.delegate?.datePickerViewController(self, didDateSelect: datePicker.date)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.pickerContainer.transform = CGAffineTransform(translationX: 0, y: self.pickerContainer.frame.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            
            self.view.backgroundColor = UIColor(named: "Black_50")
            self.pickerContainer.transform = .identity
            
        }, completion: nil)
    }
}
