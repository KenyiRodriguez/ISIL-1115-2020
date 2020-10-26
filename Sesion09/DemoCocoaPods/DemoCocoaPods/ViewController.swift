//
//  ViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/26/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    lazy var locationManager: CLLocationManager = {
       
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 2000
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.delegate = self
        return locationManager
    }()
    
    func addMakerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        
        marker.userData = ["district": "Miraflores",
                           "name": "Parque Kennedy"]
        
        marker.icon = UIImage(named: "ic_pin")
        marker.map = self.mapView //Se agrega el Marker en el mapa
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
        
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if let userCoordinate = self.mapView.myLocation?.coordinate {
            let camera = GMSCameraPosition(target: userCoordinate, zoom: 16)
            self.mapView.animate(to: camera)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("ENTRO XQ DETECTO CAMBIO DE COORDENADAS")
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        self.addMakerToCoordinate(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            
        marker.map = nil // Eliminas el pin del mapa
//        print(marker.userData)
        return true
    }
}

