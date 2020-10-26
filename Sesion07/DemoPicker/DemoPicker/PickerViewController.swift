//
//  PickerViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol PickerViewControllerDelegate {
    func pickerViewController(_ controller: PickerViewController, didSelectItem item: String)
}

class PickerViewController: UIViewController {

    @IBOutlet weak var pickerContainer: UIView!
    
    var delegate: PickerViewControllerDelegate?
    var arrayItems = [String]()
    
    @IBAction func tapToClose(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.view.backgroundColor = .clear
            self.pickerContainer.transform = CGAffineTransform(translationX: 0, y: self.pickerContainer.frame.height)
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }

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

extension PickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayItems[row]
    }
}

extension PickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let item = self.arrayItems[row]
        self.delegate?.pickerViewController(self, didSelectItem: item)
    }
}
