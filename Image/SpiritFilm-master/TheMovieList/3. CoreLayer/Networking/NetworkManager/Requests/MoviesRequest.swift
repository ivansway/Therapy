//
//  MovieRequest.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class MoviesRequest: IRequest {
    enum PathURLRequest: String {
        case moviePopupar = "/popular"
        case movieNowPlaying = "/now_playing"
        case movieTopRaiting = "/top_rated"
    }
    
    
    private let baseUrl = "https://api.themoviedb.org/3/movie"
    private let apiKey = "535a4ec072dabffcf823f15643615b99"
    private let path: String
    private var page: Int = 0
    
    private var getParameters: [String: String] {
        return ["api_key": apiKey, "per_page": "10","language": "ru", "page": "\(page)"]
    }
    
    private var urlString: String {
        let getParam = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        
        return baseUrl  + path + "?" + getParam
    }
    
    var urlRequest: URLRequest? {
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }
        return nil
    }
    
    init(page: Int, path: PathURLRequest) {
        self.page = page
        self.path = path.rawValue
    }
}
