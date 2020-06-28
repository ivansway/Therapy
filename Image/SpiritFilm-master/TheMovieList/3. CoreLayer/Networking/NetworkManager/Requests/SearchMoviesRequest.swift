//
//  SearchMoviesRequest.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class SearchMoviesRequest: IRequest {
    
    private let baseUrl = "https://api.themoviedb.org/3/search/movie"
    private let apiKey = "535a4ec072dabffcf823f15643615b99"
    private let query: String
    private var page: Int = 0
    
    private var getParameters: [String: String] {
        return [
            "api_key": apiKey,
            "per_page": "10",
            "query": "\(query)",
            "language": "ru",
            "page": "\(page)"
        ]
    }
    
    private var urlString: String {
        let getParam = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        
        return baseUrl + "?" + getParam
    }
    
    
    var urlRequest: URLRequest? {
        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            return URLRequest(url: url)
        }
        return nil
    }
    
    init(page: Int, query: String) {
        self.page = page
        self.query = query
    }
    
    
}
