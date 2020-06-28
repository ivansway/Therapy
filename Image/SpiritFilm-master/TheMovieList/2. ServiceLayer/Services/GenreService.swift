//
//  GenreService.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 09.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol IGenreService: class {
    func loadGenre(completion: @escaping (Result<[Genre]>) -> Void)
}

class GenreService: IGenreService {
    let networkManager: InetworkManager = NetworkManager()
    
    func loadGenre(completion: @escaping (Result<[Genre]>) -> Void) {
        let genreRequest = GenreRequest()
        
        networkManager.perform(with: genreRequest) { (result: Result<GenreResponse<[Genre]>> ) in
            switch result {
            case .succes(let response):
                completion(Result.succes(response.genres))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }    
    
}
