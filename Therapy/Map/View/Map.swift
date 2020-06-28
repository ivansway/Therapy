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
import RxCocoa
import RxSwift

class Map: NSObject, CLLocationManagerDelegate, GMSMapViewDelegate, PlaceDetailDelegate {

    private var network: MapNetworkManager?
   
    private var superView: UIView
    
    init(superView: UIView) {
        self.superView = superView
        super.init()
        self.settings()
    }
    
    

    // DELEGATE
//    weak var mapViewDelegate: GMSMapViewDelegate?

//    var locationManager = CLLocationManager()
    var mapView: GMSMapView?
    var zoomLevel: Float = 15.0

    // SETTINGS
    func settings() {
        
        // DELEGATE
        MapNetworkManager.placeDelegate = self
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: -33.898698, longitude: 151.220688, zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: superView.bounds, camera: camera)
        superView.addSubview(mapView!)
        
        mapView?.settings.myLocationButton = true
        mapView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView?.isMyLocationEnabled = true
        
       
        
//
//        // DELEGATE
//        self.locationManager.delegate = self
//        self.mapView.delegate = self
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.requestLocation()
//            self.mapView.isMyLocationEnabled = true
//            self.mapView.settings.myLocationButton = true
//
//        } else {
//            locationManager.requestWhenInUseAuthorization()
//        }
    }
    

//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        guard status == .authorizedWhenInUse else { return }
//        locationManager.requestLocation()
//
//        self.mapView.isMyLocationEnabled = true
//        self.mapView.settings.myLocationButton = true
//    }
//
//    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
//
//    // DID UPDATE LOCATION
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
////        guard let locations = locations.first else { return }
//
//
//        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
//        longitude: defaultLocation.coordinate.longitude,
//        zoom: 1)
//
//        mapView = GMSMapView.map(withFrame: superView.bounds, camera: camera)



//        let position = CLLocationCoordinate2D(latitude: 59.90934499999999, longitude: 30.324946)
//        let marker = GMSMarker(position: position)
//        marker.title = "Hello World"
//        marker.map = self.mapView

//        reverseGeocode(coordinate: position)
//    }

//    // ERROR
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//
//    // CONVERTING COORDINATE TO ADRESS
//    func reverseGeocode(coordinate: CLLocationCoordinate2D) {
//
//
//
//        let geocoder = GMSGeocoder()
//
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//            guard let address = response?.firstResult(), let lines = address.lines else { return }
//
//            // PASS ADRESS
//            print(lines.joined(separator: "\n"))
//
//
//
//
//        }
//    }

    // CHANGING MAP POINT
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        self.reverseGeocode(coordinate: position.target)
//    }
    
    // RELOAD MAP
    func passPlaceDetail(value: PlaceDetail?) {
       
        DispatchQueue.main.async {
            
            if value != nil {
                self.mapView = GMSMapView()
                
                self.mapView?.removeFromSuperview()
                
                
                let camera = GMSCameraPosition.camera(withLatitude: (value?.result?.geometry?.location?.lat!)!, longitude: (value?.result?.geometry?.location?.lng)!, zoom: 15)
                self.mapView = GMSMapView.map(withFrame: self.superView.bounds, camera: camera)
                
                
                
                
                // MARKER
                let position = CLLocationCoordinate2D(latitude: (value?.result?.geometry?.location?.lat!)!, longitude: (value?.result?.geometry?.location?.lng)!)
                
                let marker = GMSMarker(position: position)
                marker.map = self.mapView
                
                
                self.mapView?.settings.myLocationButton = true
                self.superView.addSubview(self.mapView!)
                
                
                // RELOAD SEARCH TF
                let interface: MapInterface? = MapInterface(superView: self.superView)
                interface!.searchTextField()
            
            }
        }
    }
}



