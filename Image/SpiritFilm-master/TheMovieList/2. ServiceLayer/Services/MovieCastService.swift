//
//  MovieCastService.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 16.09.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol IMovieCastService: class {
    func loadMovieCast(movieId: Int, completion: @escaping (Result<MovieCast>) -> Void)
}

class MovieCastService: IMovieCastService {
    let networkManeger: InetworkManager = NetworkManager()
    
    func loadMovieCast(movieId: Int, completion: @escaping (Result<MovieCast>) -> Void) {
        let movieCastRequest = MovieCastRequest(movieId: movieId)
        
        networkManeger.perform(with: movieCastRequest) { (result: Result<MovieCast> ) in
            switch result {
            case .succes(let movieCast):
                completion(Result.succes(movieCast))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
}
