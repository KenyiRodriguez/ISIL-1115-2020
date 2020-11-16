//
//  PlaceTableViewCell.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol PlaceTableViewCellDelegate {
    func placeTableViewCell(_ cell: PlaceTableViewCell, deletePlace place: PlaceBE)
}

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var imgPlace     : UIImageView!
    @IBOutlet weak private var lblName      : UILabel!
    @IBOutlet weak private var lblAddress   : UILabel!
    @IBOutlet weak private var btnDelete    : UIButton!
    
    var delegate: PlaceTableViewCellDelegate?
    
    public var objPlace: PlaceBE! {
        didSet {
            self.updateData()
        }
    }
        
    @IBAction func clickBtnDelete(_ sender: Any) {
        self.delegate?.placeTableViewCell(self, deletePlace: self.objPlace)
    }
    
    private func updateData() {
        
        self.lblName.text       = self.objPlace.place_name
        self.lblAddress.text    = self.objPlace.place_address
        
        let placeholderImage = UIImage(named: "place_placeholder")
        self.imgPlace.downloadImageInURLString(self.objPlace.place_urlImage, placeHolderImage: placeholderImage) { (image, urlString) in
            
            if self.objPlace.place_urlImage == urlString {
                self.imgPlace.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.imgPlace.layer.cornerRadius = 20
        self.btnDelete.layer.shadowColor = UIColor.black.cgColor
        self.btnDelete.layer.shadowOffset = .zero
        self.btnDelete.layer.shadowRadius = 4
        self.btnDelete.layer.shadowOpacity = 0.5
    }
}
