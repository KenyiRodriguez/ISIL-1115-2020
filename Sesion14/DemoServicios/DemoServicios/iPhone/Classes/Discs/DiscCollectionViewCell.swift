//
//  DiscCollectionViewCell.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 30/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DiscCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgDisc: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var objDisc: DiscBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        //Meteora (2003)
        self.lblName.text = "\(self.objDisc.disc_name) (\(self.objDisc.disc_releaseDate))"
        
        self.imgDisc.downloadImageInURLString(self.objDisc.disc_urlImage, placeHolderImage: nil) { (image, urlString) in
            if self.objDisc.disc_urlImage == urlString {
                self.imgDisc.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.imgDisc.layer.cornerRadius = 10
        
        self.transform = CGAffineTransform(translationX: 0, y: 200).scaledBy(x: 0.8, y: 0.8)
        self.alpha = 0
        
        let duration: Double = 0.7
        let delay = Double.random(in: 0...(duration*0.8))
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
            
            self.transform = .identity
            self.alpha = 1
            
        }, completion: nil)
    }
}
