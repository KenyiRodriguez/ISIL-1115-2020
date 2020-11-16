//
//  ViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/23/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapVIew: GMSMapView!
    
    var objPlace: PlaceBE!
    
    lazy var locationManager: CLLocationManager = {
       
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 2000//Esta en metros
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapVIew.settings.myLocationButton = true
        self.mapVIew.settings.compassButton = true
        self.mapVIew.isMyLocationEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.createMarkerAtPosition(self.objPlace.place_coordinate)
    }
    
    func createMarkerAtPosition(_ coordinatePosition: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinatePosition) //se crear el pin
        marker.map = self.mapVIew// se agrega el pin al mapa
        
        let camera = GMSCameraPosition(target: coordinatePosition, zoom: 16)
        self.mapVIew.animate(to: camera)
    }
    
}
