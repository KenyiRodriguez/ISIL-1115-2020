//
//  ListDiscViewController.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 30/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ListDiscViewController: UIViewController {
    
    @IBOutlet weak var clvDisc: UICollectionView!
    
    var arrayDisc = [DiscBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllDisc()
    }
    
    func getAllDisc() {
        
        DiscBL.getAllDiscs { (arrayDisc) in
            
            self.arrayDisc = arrayDisc
            self.clvDisc.reloadData()
        }
    }
}

extension ListDiscViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayDisc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "DiscCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DiscCollectionViewCell
        cell.objDisc = self.arrayDisc[indexPath.row]
        
        return cell
    }
}

extension ListDiscViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns : CGFloat = 2
        let heightText      : CGFloat = 56
        
        let clvLayout       = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let paddging        = clvLayout?.sectionInset ?? .zero
        
        let totalWidth      = collectionView.frame.width
        let paddingLeft     : CGFloat = paddging.left
        let paddingRight    : CGFloat = paddging.right
        let horizontalSpace : CGFloat = clvLayout?.minimumInteritemSpacing ?? 0
        
        let availableWidth  = totalWidth - paddingLeft - paddingRight - (horizontalSpace * (numberOfColumns - 1))
        
        let cellWidth = availableWidth / numberOfColumns
        let cellHeight = cellWidth + heightText
        
        let newSize = CGSize(width: cellWidth, height: cellHeight)
        return newSize
    }
}

