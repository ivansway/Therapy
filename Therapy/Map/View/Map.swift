//
//  Map.swift
//  Therapy
//
//  Created by Ivan Myrza on 18/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class Map: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    // DELEGATE
//    weak var mapViewDelegate: MapViewDelegate?
    
    let locationManager = CLLocationManager()
    let mapView = GMSMapView()
    
    // MAP VIEW
    func mapView(superView: UIView) {
        mapView.backgroundColor = .cyan
        mapView.frame = CGRect(x: 0, y: 0, width: 375, height: 348)
        Constraints.heightLeadingTrailingTop(superView: superView, view: mapView, heightAnchor: 400, leadingAnchor: 0, trailingAnchor: 0, topAnchor: 290)
    }
    
    // SETTINGS
    func settings(superView: UIView) {
        
        // DELEGATE
        self.locationManager.delegate = self
        mapView.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
            self.mapView.isMyLocationEnabled = true
            self.mapView.settings.myLocationButton = true
            
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else { return }
        locationManager.requestLocation()
        
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
    }
    
    // DID UPDATE LOCATION
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locations = locations.first else { return }
        
        
        mapView.camera = GMSCameraPosition(target: locations.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        reverseGeocode(coordinate: CLLocationCoordinate2D())
    }
    
    // ERROR
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    // CONVERTING COORDINATE TO ADRESS
    func reverseGeocode(coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else { return }
            
            // PASS ADRESS
//            self.mapViewDelegate?.passAdress(adress: lines.joined(separator: "\n"))
        
        }
    }
    
    // CHANGING MAP POINT
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        self.reverseGeocode(coordinate: position.target)
    }

}
