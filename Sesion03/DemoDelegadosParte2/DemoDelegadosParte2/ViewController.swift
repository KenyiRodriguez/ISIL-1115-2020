//
//  ViewController.swift
//  DemoDelegadosParte2
//
//  Created by Kenyi Rodriguez on 9/14/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func clickBtnCreate(_ sender: Any) {
        
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let posx = CGFloat.random(in: 0...width)
        let posy = CGFloat.random(in: 0...height)
        
        let frame = CGRect(x: posx, y: posy, width: 80, height: 80)
        let boxiew = BoxView(frame: frame)
        boxiew.delegate = self
        self.view.addSubview(boxiew)
        boxiew.changeRandomBackgroundColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: BoxViewDelegate {
    
    func boxViewTapInView(_ boxView: BoxView) {
        print("LO TOCO")
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            
            boxView.changeRandomBackgroundColor()
            boxView.changeRandomCenter()
            boxView.changeAngleRotation()
            
        }) { (_) in
            
            boxView.transform = .identity
            print("TERMINO DE ANIMAR")
        }
    }
    
    func boxView(_ boxView: BoxView, didChangeCenter newCenter: CGPoint) {
        print("CAMBIO DE CENTRO: \(newCenter)")
    }
}

