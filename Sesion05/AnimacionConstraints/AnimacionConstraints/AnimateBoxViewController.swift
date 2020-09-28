//
//  AnimateBoxViewController.swift
//  AnimacionConstraints
//
//  Created by Kenyi Rodriguez on 9/28/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AnimateBoxViewController: UIViewController {

    @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    
    @IBAction func clickBtnAnimate(_ sender: Any) {
     
        let width = CGFloat.random(in: 40...300)
        let height = CGFloat.random(in: 40...300)
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
            
            self.constraintWidth.constant = width
            self.constraintHeight.constant = height
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}
