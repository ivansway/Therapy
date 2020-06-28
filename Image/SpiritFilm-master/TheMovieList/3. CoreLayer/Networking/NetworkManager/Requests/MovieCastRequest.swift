//
//  CastRequest.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 16.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MovieCastRequest: IRequest {
    
    private lazy var baseUrl = "https://api.themoviedb.org/3/movie/\(movieId)/credits"
    private let apiKey = "535a4ec072dabffcf823f15643615b99"
    private var movieId: Int = 0
    
    private var getParameters: [String:String] {
        return [
            "api_key": apiKey,
            "language": "ru",
            "movie_id": "\(movieId)"
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
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
}
