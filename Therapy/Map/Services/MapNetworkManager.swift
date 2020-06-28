//
//  MapNetworkManager.swift
//  Therapy
//
//  Created by Ivan Myrza on 20/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation

class MapNetworkManager {
    
    var autoCompleteBase: JsonBase!
    var placeDetail: PlaceDetail?
    weak var delegate: MapNetworkDelegate?
    static var placeDelegate: PlaceDetailDelegate?
    private var googleApiKey: String? = "AIzaSyAfGoXv31OY7MP6l_pvvQ92dzeof7SpMS8"
    
    // PLACE ID
    func autoComplete(text: String) {
        
        // URL
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(text)&location=59.927925,30.368786&radius=2000&key=\(googleApiKey ?? "")&sessiontoken=\(UUID().uuidString)") else { return }
        
        
        // REQUEST
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, erorr) in
            guard let data = data else { return }
            
            do {
                self.autoCompleteBase = try? JSONDecoder().decode(JsonBase.self, from: data)
                
                self.delegate?.passJsonBase(value: self.autoCompleteBase)
            }
            
        }.resume()
    }
    
    // PLACE DETAIL
    func placeDetail(placeID: String) {
                
        // URL
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=\(placeID)&fields=name,geometry,rating,formatted_phone_number&key=\(googleApiKey ?? "")") else { return }
        
        // REQUEST
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                self.placeDetail = try? JSONDecoder().decode(PlaceDetail.self, from: data)

                MapNetworkManager.placeDelegate?.passPlaceDetail(value: self.placeDetail)
            }
        }.resume()
    }
}
