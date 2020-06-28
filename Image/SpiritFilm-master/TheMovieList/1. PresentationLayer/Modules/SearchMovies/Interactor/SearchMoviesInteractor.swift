//
//  SearchMoviesInteractor.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 23.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import Foundation

class SearchMoviesInteractor {
    weak var output: SearchMoviesInteractorOutput!
    var searchMoviesService: IMoviesService!
}

extension SearchMoviesInteractor: SearchMoviesInteractorInput {
    func searchMovies(page: Int, query: String) {
        searchMoviesService.searchMovies(page: page, query: query) { [weak self] (result: Result<[Movie]>) in
            switch result {
            case .succes(let movies):
                DispatchQueue.main.async {
                    self?.output.didSearchMovieSuccessfully(movies: movies)
                }
            case .error(let error):
                print("\(error) not data1")
            }
        }
    }
}
