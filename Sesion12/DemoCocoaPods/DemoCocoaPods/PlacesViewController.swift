//
//  PlacesViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/30/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var tblPlaces: UITableView!
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL Miraflores",
                                        address: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.125423, longitude: -77.024843),
                                        urlImage: "https://hotelperunews.com/wp-content/uploads/2017/04/isil-2.png"))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL San Isidro",
                                        address: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.093847, longitude: -77.052979),
                                        urlImage: "https://anarixefotografia.files.wordpress.com/2013/06/sabado-1.jpg"))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL La Molina",
                                        address: "Av. la Fontana 955, La Molina 15024",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.073381, longitude: -76.948049),
                                        urlImage: "https://isil.pe/wp-content/uploads/2018/12/home-bg-isil.jpg"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let indexSet = IndexSet(integer: 0)
        self.tblPlaces.reloadSections(indexSet, with: .fade)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? MapViewController {
            controller.objPlace = sender as? PlaceBE
            
        }else if let controller = segue.destination as? RegisterPlaceViewController {
            controller.delegate = self
        }
    }
}

extension PlacesViewController: RegisterPlaceViewControllerDelegate {
    
    func registerPlaceViewController(_ controller: RegisterPlaceViewController, didRegisterPlace place: PlaceBE) {
        self.arrayPlaces.insert(place, at: 0)
    }
}

extension PlacesViewController: PlaceTableViewCellDelegate {
    
    func placeTableViewCell(_ cell: PlaceTableViewCell, deletePlace place: PlaceBE) {
        
        self.showAlertWithTitle("Eliminar", message: "¿Deseas eliminar este lugar?", acceptButton: "Aceptar", cancelButton: "Cancelar", acceptHandler: {
            
            let index = self.arrayPlaces.firstIndex(where: {
                $0.place_coordinate.latitude == place.place_coordinate.latitude && $0.place_coordinate.longitude == place.place_coordinate.longitude
            })
            
            guard let indexObject = index else { return }
            let indexPath = IndexPath(row: indexObject, section: 0)
            
            self.arrayPlaces.remove(at: indexPath.row)
            self.tblPlaces.deleteRows(at: [indexPath], with: .right)
            
        }, cancelHandler: nil)
    }
}


//Sirve para construir el contenido de la tabla
extension PlacesViewController: UITableViewDataSource { //Tiene 3 metodos principales: number, number, cellFor

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlaceTableViewCell" //Debe coincidir con el nombre del storyboard y es KeySensitive
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlaceTableViewCell
        cell.delegate = self
        cell.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell
    }

}

//Sirve para detectar eventos o acciones que da el usuario en la tabla
extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            
            self.arrayPlaces.remove(at: indexPath.row)
            self.tblPlaces.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let seeAction = UIContextualAction(style: .normal, title: "Ver Mapa") { (_, _, _) in
            
            let objPlace = self.arrayPlaces[indexPath.row]
            self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
        }
        
        let swipeActionsConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, seeAction])
        return swipeActionsConfiguration
    }
}
