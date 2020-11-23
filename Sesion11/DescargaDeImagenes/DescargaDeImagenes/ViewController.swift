//
//  ViewController.swift
//  DescargaDeImagenes
//
//  Created by Kenyi Rodriguez on 11/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBand: UIImageView!
    @IBOutlet weak var imgBand1: UIImageView!
    @IBOutlet weak var imgBand2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.imgBand.downloadImageInUrlString("https://townsquare.media/site/366/files/2015/06/LMF-All-That-Remains-7-NL-630x420.jpg?w=980&q=75")
        self.imgBand1.downloadImageInUrlString("https://www.resurrectionfest.es/media/Lamb-of-God-scaled.jpg")
        self.imgBand2.downloadImageInUrlString("https://cloudfront-us-east-1.images.arcpublishing.com/infobae/ECCMFW4J5ZFMJJDVJULX5OSYQI.jpg")
    }
}

