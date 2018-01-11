//
//  GetToUsViewController.swift
//  Go Dive Red Sea
//
//  Created by Osama Hosokawa on 2017/11/26.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class GetToUsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apple maps
        let initialLocation = CLLocation(latitude: 27.254723, longitude: 33.826624)
        mapView.mapType = MKMapType.satellite
        mapView.isZoomEnabled = true
        
        centerMapOnLocation(location: initialLocation)
        
        //Annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 27.254723, longitude: 33.826624)
        annotation.title = "Sara Divers"
        mapView.addAnnotation(annotation)
        
        
        view.addSubview(mapView)
        //
        
        
        
//        let camera = GMSCameraPosition.camera(withLatitude: 27.254723, longitude: 33.826624, zoom: 16.0)
//
//        centerMapView.camera = camera
//        self.centerMapView.mapType = GMSMapViewType.hybrid
//        self.centerMapView.isMyLocationEnabled = true
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 27.254723, longitude: 33.826624)
//        marker.title = "Sara Divers"
//        marker.snippet = "Hurghada"
//        marker.map = centerMapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 700
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapItem() -> MKMapItem {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 27.254723, longitude: 33.826624)
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: annotation.coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    var subtitle: String? {
        return "Sara Divers"
    }
}

