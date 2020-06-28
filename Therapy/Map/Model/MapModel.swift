//
//  MapModel.swift
//  Therapy
//
//  Created by Ivan Myrza on 21/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import Foundation

struct JsonBase : Codable {
    let predictions : [Predictions]?
    let status : String?
}

struct Predictions : Codable {
    let description : String?
    let id : String?
    let matched_substrings : [Matched_substrings]?
    let place_id : String?
    let reference : String?
    let structured_formatting : Structured_formatting?
    let terms : [Terms]?
    let types : [String]?
}

struct Terms : Codable {
    let offset : Int?
    let value : String?
}

struct Structured_formatting : Codable {
    let main_text : String?
    let main_text_matched_substrings : [Main_text_matched_substrings]?
    let secondary_text : String?
}

struct Main_text_matched_substrings : Codable {
    let length : Int?
    let offset : Int?
}

struct Matched_substrings : Codable {
    let length : Int?
    let offset : Int?
}


// PLACE DETAIL
struct PlaceDetail: Codable {
    let result: Result?
    let status: String?
}

struct Result: Codable {
    let formattedPhoneNumber: String?
    let geometry: Geometry?
    let name: String?
    let rating: Int?
}

struct Geometry: Codable {
    let location: Locations?
    let viewport: Viewport?
}

struct Locations: Codable {
    let lat, lng: Double?
}

struct Viewport: Codable {
    let northeast, southwest: Locations?
}



