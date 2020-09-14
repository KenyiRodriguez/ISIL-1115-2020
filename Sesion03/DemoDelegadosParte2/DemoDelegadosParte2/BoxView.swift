//
//  BoxView.swift
//  DemoDelegadosParte2
//
//  Created by Kenyi Rodriguez on 9/14/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol BoxViewDelegate {
    func boxViewTapInView(_ boxView: BoxView)
    func boxView(_ boxView: BoxView, didChangeCenter newCenter: CGPoint)
}

class BoxView: UIView {
    
    var delegate: BoxViewDelegate?
    
    override func draw(_ rect: CGRect) {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureInView))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureInView() {
        self.delegate?.boxViewTapInView(self)
    }
    
    func changeAngleRotation() {
        
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    func changeRandomCenter() {
        
        let height = self.superview?.frame.height ?? 0
        let width = self.superview?.frame.width ?? 0
        
        let posx = CGFloat.random(in: 0...width)
        let posy = CGFloat.random(in: 0...height)
        
        self.center = CGPoint(x: posx, y: posy)
        
        self.delegate?.boxView(self, didChangeCenter: self.center)
    }
    
    func changeRandomBackgroundColor() {
        
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        
        self.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
    }
}
