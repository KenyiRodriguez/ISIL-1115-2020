//
//  PlacesViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 11/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesViewController: UIViewController {
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL Miraflores",
                                        address: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                        urlImage: "https://arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/K3DO42WB4VGLVPBGJPL4FQXOHQ.jpg",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.125425, longitude: -77.024849)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL San Isidro",
                                        address: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                        urlImage: "https://anarixefotografia.files.wordpress.com/2013/06/sabado-1.jpg",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.093862, longitude: -77.053038)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL La Molina",
                                        address: "Av. la Fontana 955, La Molina 15024",
                                        urlImage: "https://isil.pe/wp-content/uploads/2018/12/home-bg-isil.jpg",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.073360, longitude: -76.948028)))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? MapViewController {
            controller.objPlace = sender as? PlaceBE
        }
    }
}

extension PlacesViewController: UITableViewDataSource {//number, number, cellfor

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlaceTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlaceTableViewCell
        cell.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell
    }
}

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
    }
}






















//let arrayAutos = [
//   ["Corrola", "Yaris", "Rav4"],
//   ["S3", "TTRS", "R8", "RS5"]
//]

//extension PlacesViewController: UITableViewDataSource {//number, number, cellfor
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.arrayAutos.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let brandCar = self.arrayAutos[section]
//        return brandCar.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        indexPath.section // 1
//        indexPath.row //2
//    }
//}
