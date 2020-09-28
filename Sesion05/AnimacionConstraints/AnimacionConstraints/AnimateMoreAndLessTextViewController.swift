//
//  AnimateMoreAndLessTextViewController.swift
//  AnimacionConstraints
//
//  Created by Kenyi Rodriguez on 9/28/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AnimateMoreAndLessTextViewController: UIViewController {

    @IBOutlet weak var lblDescription: UILabel!
    
    var lessText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been..."
    
    var moreText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    
    @IBAction func clickBtnViewMoreAndLess(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            
            if sender.tag == 0 {
                
                sender.tag = 1
                sender.setTitle("Ver menos", for: .normal)
                self.lblDescription.text = self.moreText
                
            }else {
                
                sender.tag = 0
                sender.setTitle("Ver más", for: .normal)
                self.lblDescription.text = self.lessText
            }
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
