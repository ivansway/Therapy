//
//  GenreRequest.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 07.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class GenreRequest: IRequest {
    
    private let baseUrl = "https://api.themoviedb.org/3/genre/movie/list"
    private let apiKey = "535a4ec072dabffcf823f15643615b99"
    
    
    private var getParameters: [String: String] {
        return [
            "api_key": apiKey,
            "language": "ru",
        ]
    }
    
    private var urlString: String {
        let getParam = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        
        return baseUrl + "?" + getParam
    }
    
    
    var urlRequest: URLRequest? {
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }        
        return nil
    }
    
}
