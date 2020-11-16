//
//  RegisterPlaceViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 11/13/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

protocol RegisterPlaceViewControllerDelegate {
    func registerPlaceViewController(_ controller: RegisterPlaceViewController, didRegisterPlace place: PlaceBE)
}

class RegisterPlaceViewController: UIViewController {
    
    @IBOutlet weak var txtName                  : UITextField!
    @IBOutlet weak var txtAddress               : UITextField!
    @IBOutlet weak var txtUrlImage              : UITextField!
    @IBOutlet weak var txtCoordinates           : UITextField!
    @IBOutlet weak var mapView                  : GMSMapView!
    @IBOutlet weak var constraintBottomScroll   : NSLayoutConstraint!
    
    var delegate: RegisterPlaceViewControllerDelegate?
    var marker = GMSMarker()
    
    lazy var locationManager: CLLocationManager = {
       
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 2000//Esta en metros
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    @IBAction func clickBtnSave(_ sender: Any) {
        
        guard let name = self.txtName.text, name.count != 0 else {
            self.showAlertWithTitle("Error", message: "Ingrese un nombre", acceptButton: "Aceptar")
            return
        }
        
        guard let address = self.txtAddress.text, address.count != 0 else {
            self.showAlertWithTitle("Error", message: "Ingrese una dirección", acceptButton: "Aceptar")
            return
        }
        
        guard let urlImage = self.txtUrlImage.text, urlImage.count != 0 else {
            self.showAlertWithTitle("Error", message: "Ingrese una imagen", acceptButton: "Aceptar")
            return
        }
        
        guard let _ = self.marker.map else {
            self.showAlertWithTitle("Error", message: "Seleccione un punto en el mapa", acceptButton: "Aceptar")
            return
        }
        
        self.showAlertWithTitle("Agregar", message: "¿Deseas agregar este lugar?", acceptButton: "Aceptar", cancelButton: "Cancelar", acceptHandler: {
            
            let objPlace = PlaceBE(name: name, address: address, coordinate: self.marker.position, urlImage: urlImage)
            self.delegate?.registerPlaceViewController(self, didRegisterPlace: objPlace)
            self.navigationController?.popViewController(animated: true)
            
        })
    
    }
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: keyboardAnimationDuration) {
            self.constraintBottomScroll.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
     
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: keyboardAnimationDuration) {
            self.constraintBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.layer.cornerRadius = 10
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

extension RegisterPlaceViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        self.marker.position = coordinate
        self.marker.map = self.mapView// se agrega el pin al mapa
        
        let latitude = NSNumber(value: coordinate.latitude)
        let longitude = NSNumber(value: coordinate.longitude)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 6
        
        let stringLatitude = formatter.string(from: latitude) ?? "0"
        let stringLongitude = formatter.string(from: longitude) ?? "0"
        
        
        self.txtCoordinates.text = "\(stringLatitude), \(stringLongitude)"
    }
}
