//
//  ViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/26/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var objPlace: PlaceBE!
    
    lazy var locationManager: CLLocationManager = {
       
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 2000
        return locationManager
    }()
    
    func addMakerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        
        marker.icon = UIImage(named: "ic_pin")
        marker.map = self.mapView //Se agrega el Marker en el mapa
        
        let camera = GMSCameraPosition(target: coordinate, zoom: 16)
        self.mapView.animate(to: camera)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
        
        self.locationManager.startUpdatingLocation()
        
        self.addMakerToCoordinate(self.objPlace.place_coordinate)
    }
}
