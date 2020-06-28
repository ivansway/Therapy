//
//  MoviesService.swift
//  TheMovieList
//
//  Created by omar on 01/08/2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

protocol IMoviesService {
    func loadMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void)
    func loadTopRatedMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void)
    func loadPopularMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void)
    func searchMovies(page: Int, query: String, completion: @escaping (Result<[Movie]>) -> Void)
}

class MoviesService: IMoviesService {
    
    let networkManager: InetworkManager = NetworkManager()
    
    func searchMovies(page: Int, query: String, completion: @escaping (Result<[Movie]>) -> Void) {
        let searchMoviesRequest = SearchMoviesRequest(page: page, query: query)
        
        networkManager.perform(with: searchMoviesRequest) { (result: Result<Response<[Movie]>>) in
            switch result {
            case .succes(let response):
                completion(Result.succes(response.results))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
    func loadMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let moviesRequest = MoviesRequest(page: page, path: .movieNowPlaying)
        
        networkManager.perform(with: moviesRequest) { (result: Result<Response<[Movie]>>) in
            switch result {
            case .succes(let response):
                completion(Result.succes(response.results))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
    func loadTopRatedMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let moviesRequest = MoviesRequest(page: page, path: .movieTopRaiting)
        
        networkManager.perform(with: moviesRequest) { (result: Result<Response<[Movie]>>) in
            switch result {
            case .succes(let response):
                completion(Result.succes(response.results))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
    func loadPopularMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let moviesRequest = MoviesRequest(page: page, path: .moviePopupar)
        
        networkManager.perform(with: moviesRequest) { (result: Result<Response<[Movie]>>) in
            switch result {
            case .succes(let response):
                completion(Result.succes(response.results))
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
}
