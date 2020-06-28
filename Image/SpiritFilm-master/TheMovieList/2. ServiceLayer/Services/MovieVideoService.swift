//
//  MovieVideoService.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 10.10.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol IMovieVideoService: class {
    func loadMovieVideo(movieId: Int, completion: @escaping (Result<MovieVideo>) -> Void)
}

class MovieVideoService: IMovieVideoService {
    let networkManager: InetworkManager = NetworkManager()
    
    func loadMovieVideo(movieId: Int, completion: @escaping (Result<MovieVideo>) -> Void) {
        let movieVideoRequest = MovieVideoRequest(movieId: movieId)
        
        networkManager.perform(with: movieVideoRequest) { (result: Result<MovieVideo>) in
            switch result {
            case .succes(let video):
                completion(Result.succes(video))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }    
    
}
