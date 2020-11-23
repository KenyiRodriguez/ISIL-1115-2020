//
//  ViewController.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 23/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        DiscWS.getAllDiscs { (arrayDiscs) in
                
            print("********************************************")
            print(arrayDiscs.first?.disc_name ?? "")
        }
    }
}

